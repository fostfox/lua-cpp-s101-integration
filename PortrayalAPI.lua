--[[
This file contains the global functions that define the Lua portrayal API.
These functions are called by the host program.
--]]

-- Used to hold references to portrayalContexts
portrayalContexts = {}

function PortrayalInitializeContextParameters(datasetID, contextParameters)
	Debug.StartPerformance('Lua Code - Total')
	Debug.StartPerformance('Lua Code - PortrayalInitializeContextParameters')

	local portrayalContext = PortrayalModel.CreatePortrayalContext(datasetID)

	portrayalContexts[datasetID] = portrayalContext

	Debug.StopPerformance('Lua Code - PortrayalInitializeContextParameters')
	Debug.StopPerformance('Lua Code - Total')
end

PrimitiveType =
{
	None       = { Value = 0, Name = 'None' },
	Point      = { Value = 1, Name = 'Point' },
	MultiPoint = { Value = 2, Name = 'MultiPoint' },
	Curve      = { Value = 3, Name = 'Curve' },
	Surface    = { Value = 4, Name = 'Surface' }
}

SpatialType =
{
	Point          = { Value = 1, Name = 'Point' },
	MultiPoint     = { Value = 2, Name = 'MultiPoint' },
	Curve          = { Value = 3, Name = 'Curve' },
	CompositeCurve = { Value = 4, Name = 'CompositeCurve' },
	Surface        = { Value = 5, Name = 'Surface' }
}

local featureCache = {}

function CreateFeature(datasetID, featureID, featureCode)
	Debug.StartPerformance('Lua Code - CreateFeature - Total')
	local featureMetatable =
	{
		__index = function (t, k)
			if k == 'Spatial' or k == 'Point' or k == 'MultiPoint' or k == 'Curve' or k == 'CompositeCurve' or k == 'Surface' then
				local spatial = t:GetSpatial()

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
				--[[ local av = LookupAttributeValue(t, k, HostFeatureGetSimpleAttribute, HostFeatureGetComplexAttribute)

				if av ~= nil then
				    return av
                end]]
                Debug.Trace('Warning! Feature was indexing unsupported value')
			end
		end
	}

	local feature = featureCache[featureID]

	if feature then
		return feature
	end
	
	feature = { Type = 'Feature', DatasetID = datasetID, ID = featureID, Code = featureCode }

	featureCache[featureID] = feature

	function feature:GetSpatialAssociations()
		local sas = rawget(self, 'SpatialAssociations')

		Debug.StopPerformance('Lua Code - feature:GetSpatialAssociations - Total')
		sas = sas or Host_Feature_GetSpatialAssociations(self.ID)
		Debug.StartPerformance('Lua Code - feature:GetSpatialAssociations - Total')

		self['SpatialAssociations'] = sas

		return sas
	end

	function feature:GetSpatialAssociation()   
		local sas = self:GetSpatialAssociations()

		if sas ~= nil then
			return sas[1]
		end
	end

	function feature:GetSpatial()
		local sa = self:GetSpatialAssociation()

		if sa ~= nil then
			self['Spatial'] = sa.Spatial

			self[sa.SpatialType.Name] = self['Spatial']

			return self['Spatial']
		end
	end

	setmetatable(feature, featureMetatable)
	
	Debug.StopPerformance('Lua Code - CreateFeature - Total')

	return feature
end


function CreateSpatialAssociation(spatialType, spatialID, orientation, scaleMinimum, scaleMaximum)
	Debug.StartPerformance('Lua Code - CreateSpatialAssociation - Total')

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
						spatial['SpatialID'] = t.SpatialID
				
						t['Spatial'] = spatial
					else
						Debug.Break()
					end
				else
					Debug.Break()
				end

				Debug.StopPerformance('Lua Code - Spatial')
				if spatial ~= nilMarker then
					return spatial
				end
			end
		end
	}

	if type(spatialType) == 'string' then
		spatialType = SpatialType[spatialType]
	end

	local spatialAssociation = { SpatialType = spatialType, SpatialID = spatialID }

	setmetatable(spatialAssociation, spatialAssociationMetatable)

	Debug.StopPerformance('Lua Code - CreateSpatialAssociation - Total')

	return spatialAssociation
end


local function CreateSpatial(spatialType, spatial)
	local spatial = { SpatialType = spatialType, Spatial = spatial, InformationAssociations = {} }

	return spatial
end


function CreatePoint(x, y, z)
	Debug.StartPerformance('Lua Code - Total')

	local point = CreateSpatial(SpatialType.Point, { X = x, Y = y, Z = z })

	point.X = point.Spatial.X
	point.Y = point.Spatial.Y
	point.Z = point.Spatial.Z

	Debug.StopPerformance('Lua Code - Total')

	return point
end

function CreateMultiPoint(points)
	Debug.StartPerformance('Lua Code - Total')

	local multiPoint = CreateSpatial(SpatialType.MultiPoint, points)

	multiPoint.Points = multiPoint.Spatial

	Debug.StopPerformance('Lua Code - Total')

	return multiPoint
end

function CreateCurve(startPoint, endPoint, segments)
	Debug.StartPerformance('Lua Code - Total')

	local curve = CreateSpatial(SpatialType.Curve, { StartPoint = startPoint, EndPoint = endPoint, Segments = segments })

	curve.StartPoint = curve.Spatial.StartPoint
	curve.EndPoint = curve.Spatial.EndPoint
	curve.Segments = curve.Spatial.Segments

	Debug.StopPerformance('Lua Code - Total')

	return curve
end

function CreateCompositeCurve(curveAssociations)
	Debug.StartPerformance('Lua Code - Total')

	local compositeCurve = CreateSpatial(SpatialType.CompositeCurve, curveAssociations)

	compositeCurve.CurveAssociations = compositeCurve.Spatial

	Debug.StopPerformance('Lua Code - Total')

	return compositeCurve
end

function CreateSurface(exteriorRing, interiorRings)
	Debug.StartPerformance('Lua Code - Total')

	local surface = CreateSpatial(SpatialType.Surface, { ExteriorRing = exteriorRing, InteriorRings = interiorRings })

	surface.ExteriorRing = surface.Spatial.ExteriorRing
	surface.InteriorRings = surface.Spatial.InteriorRings

	Debug.StopPerformance('Lua Code - Total')

	return surface
end
