--[[
This file contains the global functions that define the Lua portrayal API.
These functions are called by the host program.
--]]

-- Quick way to create small arrays.
function CreateArray(...)
	return {...}
end

-- Used to hold references to portrayalContexts
portrayalContexts = {}

function PortrayalInitializeContextParameters(datasetID, contextParameters)
	Debug.StartPerformance('Lua Code - Total')
	CheckType(datasetID, 'string')
	CheckType(contextParameters, 'array:ContextParameter')

	Debug.StartPerformance('Lua Code - PortrayalInitializeContextParameters')

	local portrayalContext = PortrayalModel.CreatePortrayalContext(datasetID)

	portrayalContexts[datasetID] = portrayalContext

	local pccp = portrayalContext.ContextParameters._underlyingTable

	local a = portrayalContext.ContextParameters

	pccp._parameterTypes = {}

	for _, cp in ipairs(contextParameters) do
		pccp[cp.Name] = cp.DefaultValue
		pccp._parameterTypes[cp.Name] = cp.ParameterType
	end

	Debug.StopPerformance('Lua Code - PortrayalInitializeContextParameters')
	Debug.StopPerformance('Lua Code - Total')
end

function PortrayalCreateContextParameter(contextParameterName, parameterType, defaultValue)
	CheckType(contextParameterName, 'string')

	return { Type = 'ContextParameter', Name = contextParameterName, ParameterType = parameterType, DefaultValue = defaultValue }
end

function PortrayalSetContextParameter(datasetID, contextParameterName, value)
	Debug.StartPerformance('Lua Code - Total')
	CheckType(datasetID, 'string')
	CheckType(contextParameterName, 'string')

	local portrayalContext = portrayalContexts[datasetID]

	if not portrayalContext then
		error('Portrayal context not initialized for dataset ' .. datasetID)
	end

	portrayalContext.ContextParameters[contextParameterName] = value
	Debug.StopPerformance('Lua Code - Total')
end

local nilAttribute = {}

local function LookupAttributeValue(container, attributeCode, HostGetSimpleAttribute, HostGetComplexAttribute)
	local attributeMetatable =
	{
		__index = function (container, attributeCode)
			return LookupAttributeValue(container, attributeCode, HostGetSimpleAttribute, HostGetComplexAttribute)
		end
	}

	local attributeCode1 = attributeCode

	local nilIfMissing = false

	-- Is this a "nil if missing" attribute?
	if attributeCode:sub(1, 1) == '!' then
		nilIfMissing = true

		attributeCode = attributeCode:sub(2)
	end

	local attributePath = {}

	local topContainer = container

	while rawget(topContainer, 'Parent') do
		table.insert(attributePath, 1, { AttributeCode = topContainer.AttributeCode, Index = topContainer.Index })
			
		topContainer = rawget(topContainer, 'Parent')
	end

	topContainer.DatasetID = ''

	local ti = GetTypeInfo(topContainer.DatasetID)

	local containerTypeInfo

	if container.Type == 'ComplexAttributeValue' then
		containerTypeInfo = GetComplexAttributeTypeInfo(topContainer.DatasetID, container.AttributeCode)
	elseif container.Type == 'Feature' then
		containerTypeInfo = GetFeatureTypeInfo(topContainer.DatasetID, container.Code)
	elseif container.Type == 'Information' then
		containerTypeInfo = GetInformationTypeInfo(topContainer.DatasetID, container.Code)
	else
		error('Not implemented')
	end

	if not containerTypeInfo.AttributeBindings[attributeCode] then
		if nilIfMissing then
			return nil
		else
			local path = ''

			for _, attr in ipairs(attributePath) do
				path = path .. attr.AttributeCode .. '.'
			end

			path = path .. attributeCode

			error('Invalid attribute code "' .. path .. '" specified.', 3)
		end
	end

	local simpleAttributeTypeInfo
	local complexAttributeTypeInfo

	if ti.SimpleAttributeInfos[attributeCode] then
		simpleAttributeTypeInfo = GetSimpleAttributeTypeInfo(topContainer.DatasetID, attributeCode)
	else
		complexAttributeTypeInfo = GetComplexAttributeTypeInfo(topContainer.DatasetID, attributeCode)
	end

	if complexAttributeTypeInfo then
		--Debug.Break()
		Debug.StopPerformance('Lua Code - Total')
		local attributeCount = HostGetComplexAttribute(container.ID, attributePath, attributeCode)
		Debug.StartPerformance('Lua Code - Total')

		if containerTypeInfo.AttributeBindings[attributeCode].MultiplicityUpper == 1 then
			-- Single valued
			if attributeCount ~= 0 then
				local value = { Type = 'ComplexAttributeValue', Parent = container, ID = container.ID, AttributeCode = attributeCode, Index = 1 }

				setmetatable(value, attributeMetatable)

				container[attributeCode] = value
			end
		else
			-- Array
			local values = {}

			for i = 1, attributeCount do
				local value = { Type = 'ComplexAttributeValue', Parent = container, ID = container.ID, AttributeCode = attributeCode, Index = i }

				setmetatable(value, attributeMetatable)

				values[#values + 1] = value
			end

			container[attributeCode] = values
		end
	else
		Debug.StopPerformance('Lua Code - Total')
		local values = HostGetSimpleAttribute(container.ID, attributePath, attributeCode)
		Debug.StartPerformance('Lua Code - Total')

		--Debug.Break()

		if containerTypeInfo.AttributeBindings[attributeCode].MultiplicityUpper == 1 then
			-- Single valued
			container[attributeCode] = values[1]
			container['!' .. attributeCode] = values[1]
		else
			-- Array
			container[attributeCode] = values
			container['!' .. attributeCode] = values
		end
	end

	return rawget(container, attributeCode1)
end

PrimitiveType =
{
	None       = { Type = 'PrimitiveType', Value = 0, Name = 'None' },
	Point      = { Type = 'PrimitiveType', Value = 1, Name = 'Point' },
	MultiPoint = { Type = 'PrimitiveType', Value = 2, Name = 'MultiPoint' },
	Curve      = { Type = 'PrimitiveType', Value = 3, Name = 'Curve' },
	Surface    = { Type = 'PrimitiveType', Value = 4, Name = 'Surface' }
}

SpatialType =
{
	Point          = { Type = 'SpatialType', Value = 1, Name = 'Point' },
	MultiPoint     = { Type = 'SpatialType', Value = 2, Name = 'MultiPoint' },
	Curve          = { Type = 'SpatialType', Value = 3, Name = 'Curve' },
	CompositeCurve = { Type = 'SpatialType', Value = 4, Name = 'CompositeCurve' },
	Surface        = { Type = 'SpatialType', Value = 5, Name = 'Surface' }
}

Orientation =
{
	Forward = { Type = 'Orientation', Value = 1, Name = 'Forward' },
	Reverse = { Type = 'Orientation', Value = 2, Name = 'Reverse' }
}

Interpolation =
{
	None                             = { Type = 'Interpolation', value = 0, Name = 'None' },
	Linear                           = { Type = 'Interpolation', value = 1, Name = 'Linear' },
	Geodesic                         = { Type = 'Interpolation', value = 2, Name = 'Geodesic' },
	Arc3Points                       = { Type = 'Interpolation', value = 3, Name = 'Arc3Points' },
	Loxodromic                       = { Type = 'Interpolation', value = 4, Name = 'Loxodromic' },
	Elliptical                       = { Type = 'Interpolation', value = 5, Name = 'Elliptical' },
	Conic                            = { Type = 'Interpolation', value = 6, Name = 'Conic' },
	CircularArcCenterPointWithRadius = { Type = 'Interpolation', value = 7, Name = 'CircularArcCenterPointWithRadius' }
}

local featureCache = {}
local informationCache = {}
spatialCache = {}

function CreateAttributeBinding(attributeCode, multiplicityLower, multiplicityUpper, allowedValues)
	CheckType(attributeCode, 'string')
	CheckType(multiplicityLower, 'number')
	CheckTypeOrNil(multiplicityLower, 'number')
	CheckTypeOrNil(allowedValues, 'array:number')

	return { Type = 'AttributeBinding', AttributeCode = attributeCode, MultiplicityLower = multiplicityLower, MultiplicityUpper = multiplicityUpper, AllowedValues = allowedValues }
end

-- TODO: Expand to contain all FC items.
function CreateFeatureTypeInfo(featureCode, attributeBindings)
	Debug.StartPerformance('Lua Code - Total')
	CheckType(featureCode, 'string')
	CheckType(attributeBindings, 'array:AttributeBinding')

	local fti = { Type = 'FeatureTypeInfo', FeatureCode = featureCode, AttributeBindings = attributeBindings }

	for _, ab in ipairs(fti.AttributeBindings) do
		fti.AttributeBindings[ab.AttributeCode] = ab
	end

	Debug.StopPerformance('Lua Code - Total')
	return fti
end

function CreateInformationTypeInfo(informationCode, attributeBindings)
	Debug.StartPerformance('Lua Code - Total')
	CheckType(informationCode, 'string')
	CheckType(attributeBindings, 'array:AttributeBinding')

	local fti = { Type = 'InformationTypeInfo', InformationCode = informationCode, AttributeBindings = attributeBindings }

	for _, ab in ipairs(fti.AttributeBindings) do
		fti.AttributeBindings[ab.AttributeCode] = ab
	end

	Debug.StopPerformance('Lua Code - Total')
	return fti
end

-- TODO: Expand to contain all FC items.
function CreateSimpleAttributeTypeInfo(attributeCode, type)
	CheckType(attributeCode, 'string')
	CheckType(type, 'string')

	return { Type = 'SimpleAttributeTypeInfo', AttributeCode = attributeCode, AttributeType = type }
end

-- TODO: Expand to contain all FC items.
function CreateComplexAttributeTypeInfo(attributeCode, attributeBindings)
	Debug.StartPerformance('Lua Code - Total')
	CheckType(attributeCode, 'string')
	CheckType(attributeBindings, 'array:AttributeBinding')

	local ati = { Type = 'SimpleAttributeTypeInfo', AttributeCode = attributeCode, AttributeBindings = attributeBindings }

	for _, ab in ipairs(ati.AttributeBindings) do
		ati.AttributeBindings[ab.AttributeCode] = ab
	end

	Debug.StopPerformance('Lua Code - Total')
	return ati
end

function CreateFeature(datasetID, featureID, featureCode)
	Debug.StartPerformance('Lua Code - Total')
	local featureMetatable =
	{
		__index = function (t, k)
			if k == 'Spatial' or k == 'Point' or k == 'MultiPoint' or k == 'Curve' or k == 'CompositeCurve' or k == 'Surface' then
				local spatial = t:GetSpatial()

				--if spatial ~= nil then
					--t['SpatialType'] = spatial.SpatialType
				--end

				if k == 'Spatial' or spatial.SpatialType.Name == k then
					return spatial
				end
			elseif k == 'PrimitiveType' then
				local pt = PrimitiveType.None
				local sa = t:GetSpatialAssociation()

				if sa ~= nil then
					if sa.SpatialType == SpatialType.Point then
						pt = PrimitiveType.Point
					elseif sa.SpatialType == SpatialType.MultiPoint then
						pt = PrimitiveType.MultiPoint
					elseif sa.SpatialType == SpatialType.Curve or sa.SpatialType == SpatialType.CompositeCurve then
						pt = PrimitiveType.Curve
					elseif sa.SpatialType == SpatialType.Surface then
						pt = PrimitiveType.Surface
					end
				end
				
				t['PrimitiveType'] = pt

				return pt
			elseif k == 'SpatialAssociations' then
				return t:GetSpatialAssociations()
			else
				local av = LookupAttributeValue(t, k, HostFeatureGetSimpleAttribute, HostFeatureGetComplexAttribute)

				if av ~= nil then
					return av
				end
			end
		end
	}

	local feature = featureCache[featureID]

	if feature then
		return feature
	end
	
	feature = { Type = 'Feature', DatasetID = datasetID, ID = featureID, Code = featureCode }

	featureCache[featureID] = feature

	function feature:GetInformationAssociations(associationCode, roleCode)
		CheckSelf(self, 'Feature')

		-- TODO: Store results
		Debug.StopPerformance('Lua Code - Total')
		local ias = Host_Feature_GetInformationAssociations(self.ID, associationCode, roleCode)
		Debug.StartPerformance('Lua Code - Total')
		return ias
	end

	function feature:GetInformationAssociation(associationCode, roleCode)
		CheckSelf(self, 'Feature')

		local ia = self:GetInformationAssociations(associationCode, roleCode)

		if ia and #ia == 1 then
			return ia[1]
		end
	end

	function feature:GetFeatureAssociations(associationCode, roleCode)
		CheckSelf(self, 'Feature')

		-- TODO: Store results
		return Host_Feature_GetFeatureAssociations(self.ID, associationCode, roleCode)
	end

	function feature:GetSpatialAssociations()
		CheckSelf(self, 'Feature')

		local sas = rawget(self, 'SpatialAssociations')

		Debug.StopPerformance('Lua Code - Total')
		sas = sas or Host_Feature_GetSpatialAssociations(self.ID)
		Debug.StartPerformance('Lua Code - Total')

		self['SpatialAssociations'] = sas

		CheckTypeOrNil(sas, 'array:SpatialAssociation')

		return sas
	end

	function feature:GetSpatialAssociation()
		CheckSelf(self, 'Feature')

		-- TODO: Pick single association based on current scale.
		local sas = self:GetSpatialAssociations()

		if sas ~= nil then
			return sas[1]
		end
	end

	function feature:GetSpatial()
		CheckSelf(self, 'Feature')

		local sa = self:GetSpatialAssociation()

		if sa ~= nil then
			self['Spatial'] = sa.Spatial

			self[sa.SpatialType.Name] = self['Spatial']

			return self['Spatial']
		end
	end

	-- Returns an iterator that returns all spatial associations to points, multi points and curves
	-- associated to the feature.  Surface and composite curves return only their ultimate simple curves.
	-- This only works for features with a single spatial association.
	function feature:GetFlattenedSpatialAssociations()
		local spatialType = self:GetSpatial().SpatialType

		if contains(spatialType, { SpatialType.Point, SpatialType.MultiPoint, SpatialType.Curve }) then
			local first = true

			return function()
				if first then
					first = false
					return self:GetSpatialAssociation()
				end
			end
		elseif spatialType == SpatialType.CompositeCurve then
			local i = 0

			return function()
				i = i + 1
				return self.CompositeCurve.CurveAssociations[i]
			end
		elseif spatialType == SpatialType.Surface then
			-- Do this the hard way since coroutines don't play nice with C callbacks.
			local iRing = 0
			local iCurve = 0

			return function()
				local ring

				if iRing == 0 then
					ring = self.Surface.ExteriorRing
				else
					ring = self.Surface.InteriorRings[iRing]
				end

				while ring do
					if iCurve == 0 then
						if ring.SpatialType == SpatialType.Curve then
							iRing = iRing + 1
							return ring
						end
					end

					iCurve = iCurve + 1

					local ca = ring.Spatial.CurveAssociations[iCurve]

					if ca then
						return ca
					end

					iCurve = 0

					iRing = iRing + 1
					
					ring = self.Surface.InteriorRings[iRing]
				end
			end
		end
	end

	setmetatable(feature, featureMetatable)
	
	Debug.StopPerformance('Lua Code - Total')

	return feature
end

function CreateInformation(informationID, informationCode)
	Debug.StartPerformance('Lua Code - Total')

	local informationMetatable =
	{
		__index = function (t, k)
			local av = LookupAttributeValue(t, k, HostInformationGetSimpleAttribute, HostInformationGetComplexAttribute)

			if av ~= nil then
				return av
			end
		end
	}

	local information = informationCache[informationID];

	if information then
		return information
	end

	information = { Type = 'Information', ID = informationID, Code = informationCode }

	informationCache[informationID] = information

	function information:GetInformationAssociations(associationCode, roleCode)
		error('information:GetInformationAssociations not implemented.')
	end

	setmetatable(information, informationMetatable)

	Debug.StopPerformance('Lua Code - Total')

	return information
end

function CreateSpatialAssociation(spatialType, spatialID, orientation, scaleMinimum, scaleMaximum)
	Debug.StartPerformance('Lua Code - Total')

	local spatialAssociationMetatable =
	{
		__index = function (t, k)
			if k == 'Spatial' then
				Debug.StartPerformance('Lua Code - Spatial')
				local spatial = spatialCache[t.SpatialID]

				if not spatial then
					Debug.StartPerformance('Lua Code - Host_GetSpatial')
					Debug.StopPerformance('Lua Code - Total')
					spatial = Host_GetSpatial(t.SpatialID) or nilMarker
					Debug.StartPerformance('Lua Code - Total')
					Debug.StopPerformance('Lua Code - Host_GetSpatial')

					spatialCache[t.SpatialID] = spatial

					if spatial ~= nilMarker then
						CheckType(spatial, 'Spatial')
						spatial['SpatialID'] = t.SpatialID
				
						t['Spatial'] = spatial
					else
						--Debug.Break()
					end
				else
					--Debug.Break()
				end

				Debug.StopPerformance('Lua Code - Spatial')
				if spatial ~= nilMarker then
					return spatial
				end
			elseif k == 'AssociatedFeatures' then
				return t:GetAssociatedFeatures()
			end
		end
	}

	if type(spatialType) == 'string' then
		spatialType = SpatialType[spatialType]
	end

	if type(orientation) == 'string' then
		orientation = Orientation[orientation]
	end

	CheckType(spatialType, 'SpatialType')
	CheckTypeOrNil(orientation, 'Orientation')
	CheckTypeOrNil(scaleMinimum, 'number')
	CheckTypeOrNil(scaleMaximum, 'number')

	local spatialAssociation = { Type = 'SpatialAssociation', SpatialType = spatialType, SpatialID = spatialID, Orientation = orientation, ScaleMinimum = scaleMinimum, ScaleMaximum = scaleMaximum }

	function spatialAssociation:GetAssociatedFeatures()
		Debug.StopPerformance('Lua Code - Total')
		local featureIDs = HostSpatialGetAssociatedFeatureIDs(self.SpatialID)
		Debug.StartPerformance('Lua Code - Total')

		self.AssociatedFeatures = {}

		for _, featureID in ipairs(featureIDs) do
			self.AssociatedFeatures[#self.AssociatedFeatures + 1] = featureCache[featureID];

			CheckType(featureCache[featureID], 'Feature');
		end

		return self.AssociatedFeatures
	end

	setmetatable(spatialAssociation, spatialAssociationMetatable)

	Debug.StopPerformance('Lua Code - Total')

	return spatialAssociation
end

local function CreateSpatial(spatialType, spatial)
	CheckType(spatialType, 'SpatialType')

	local spatial = { Type = 'Spatial', SpatialType = spatialType, Spatial = spatial, InformationAssociations = {} }

	function spatial:GetInformationAssociations(associationCode, roleCode)
		CheckSelf(self, 'Spatial')
		CheckType(associationCode, 'string')
		CheckTypeOrNil(roleCode, 'string')

		local tuple = associationCode .. '|' .. (roleCode or '')

		local ias = self.InformationAssociations[tuple]

		if not ias then
			Debug.StopPerformance('Lua Code - Total')
			local informationIDs = HostSpatialGetAssociatedInformationIDs(self.SpatialID, associationCode, roleCode)
			Debug.StartPerformance('Lua Code - Total')

			ias = {}

			for _, informationID in ipairs(informationIDs) do
				Debug.StopPerformance('Lua Code - Total')
				local code = HostInformationGetType(informationID)
				Debug.StartPerformance('Lua Code - Total')
				ias[#ias + 1] = CreateInformation(informationID, code)
			end

			self.InformationAssociations[tuple] = ias
		end

		return ias
	end

	function spatial:GetInformationAssociation(associationCode, roleCode)
		CheckSelf(self, 'Spatial')

		local ia = self:GetInformationAssociations(associationCode, roleCode)

		if ia and #ia == 1 then
			return ia[1]
		end
	end

	return spatial
end

function CreatePoint(x, y, z)
	Debug.StartPerformance('Lua Code - Total')

	CheckType(x, 'number')
	CheckType(y, 'number')
	CheckTypeOrNil(z, 'number')

	local point = CreateSpatial(SpatialType.Point, { X = x, Y = y, Z = z })

	point.X = point.Spatial.X
	point.Y = point.Spatial.Y
	point.Z = point.Spatial.Z

	Debug.StopPerformance('Lua Code - Total')

	return point
end

function CreateMultiPoint(points)
	Debug.StartPerformance('Lua Code - Total')

	CheckType(points, 'array:Spatial')

	local multiPoint = CreateSpatial(SpatialType.MultiPoint, points)

	multiPoint.Points = multiPoint.Spatial

	Debug.StopPerformance('Lua Code - Total')

	return multiPoint
end

function CreateCurveSegment(controlPoints, interpolation)
	Debug.StartPerformance('Lua Code - Total')

	interpolation = interpolation or Interpolation.Loxodromic

	if type(interpolation) == 'string' then
		interpolation = Interpolation[interpolation]
	end

	CheckType(controlPoints, 'array:Spatial')
	CheckType(interpolation, 'Interpolation')

	Debug.StopPerformance('Lua Code - Total')

	return { Type = 'CurveSegment', ControlPoints = controlPoints, Interpolation = interpolation }
end

function CreateCurve(startPoint, endPoint, segments)
	Debug.StartPerformance('Lua Code - Total')

	CheckType(startPoint, 'Spatial')
	CheckType(endPoint, 'Spatial')
	CheckTypeOrNil(segments, 'array:CurveSegment')

	local curve = CreateSpatial(SpatialType.Curve, { StartPoint = startPoint, EndPoint = endPoint, Segments = segments })

	curve.StartPoint = curve.Spatial.StartPoint
	curve.EndPoint = curve.Spatial.EndPoint
	curve.Segments = curve.Spatial.Segments

	Debug.StopPerformance('Lua Code - Total')

	return curve
end

function CreateCompositeCurve(curveAssociations)
	Debug.StartPerformance('Lua Code - Total')

	CheckType(curveAssociations, 'array:SpatialAssociation')

	local compositeCurve = CreateSpatial(SpatialType.CompositeCurve, curveAssociations)

	compositeCurve.CurveAssociations = compositeCurve.Spatial

	Debug.StopPerformance('Lua Code - Total')

	return compositeCurve
end

function CreateSurface(exteriorRing, interiorRings)
	Debug.StartPerformance('Lua Code - Total')

	CheckType(exteriorRing, 'SpatialAssociation')
	CheckType(interiorRings, 'array:SpatialAssociation')

	local surface = CreateSpatial(SpatialType.Surface, { ExteriorRing = exteriorRing, InteriorRings = interiorRings })

	surface.ExteriorRing = surface.Spatial.ExteriorRing
	surface.InteriorRings = surface.Spatial.InteriorRings

	Debug.StopPerformance('Lua Code - Total')

	return surface
end

local function JsonAppend(jsonTable, text)
	jsonTable[#jsonTable + 1] = text	
end

local function ConvertToJSONInternal(jsonTable, data)
	if type(data) == 'table' then
		if #data ~= 0 then
			JsonAppend(jsonTable, '[')

			for i, value in ipairs(data) do
				ConvertToJSONInternal(jsonTable, value)

				if i ~= #data then
					JsonAppend(jsonTable, ', ')
				end
			end

			JsonAppend(jsonTable, ']')
		else
			JsonAppend(jsonTable, '{')

			local first = true

			for key, value in pairs(data) do
				if type(value) ~= 'function' then
					if first then
						first = false
					else
						JsonAppend(jsonTable, ', ')
					end

					JsonAppend(jsonTable, '"')
					JsonAppend(jsonTable, key)
					JsonAppend(jsonTable, '" : ')

					ConvertToJSONInternal(jsonTable, value)
				end
			end

			JsonAppend(jsonTable, '}')
		end
	elseif type(data) == 'number' then
		JsonAppend(jsonTable, tostring(data))
	elseif type(data) == 'string' then
		JsonAppend(jsonTable, '"' .. data .. '"')
	elseif type(data) == 'boolean' then
		JsonAppend(jsonTable, data and 'true' or 'false')
	elseif data == nil then
		JsonAppend(jsonTable, 'null')
	else
		error('Unexpected type "' .. type(data) .. '" encountered.')
	end
end

function ConvertToJSON(data)
	if type(data) ~= 'table' then
		error('ConvertToJSON only supports table types', 2)
	end

	local jsonTable = {}

	ConvertToJSONInternal(jsonTable, data)

	return table.concat(jsonTable)
end

local function ConvertToJSONInternal1(data)
	if type(data) == 'table' then
		if #data ~= 0 then
			JsonAppend('[')

			for i, value in ipairs(data) do
				ConvertToJSONInternal(value)

				if i ~= #data then
					JsonAppend(', ')
				end
			end

			JsonAppend(']')
		else
			JsonAppend('{')

			local first = true

			for key, value in pairs(data) do
				if type(value) ~= 'function' then
					if first then
						first = false
					else
						JsonAppend(', ')
					end

					JsonAppend('"')
					JsonAppend(key)
					JsonAppend('" : ')

					ConvertToJSONInternal(value)
				end
			end

			JsonAppend('}')
		end
	elseif type(data) == 'number' then
		JsonAppend(tostring(data))
	elseif type(data) == 'string' then
		JsonAppend('"' .. data .. '"')
	elseif type(data) == 'boolean' then
		JsonAppend(data and 'true' or 'false')
	elseif data == nil then
		JsonAppend('null')
	else
		error('Unexpected type "' .. type(data) .. '" encountered.')
	end
end

function ConvertToJSON1(data)
	if type(data) ~= 'table' then
		error('ConvertToJSON only supports table types', 2)
	end

	ConvertToJSONInternal(data)
end
