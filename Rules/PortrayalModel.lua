--[[
This file contains the global functions that define the Lua Portrayal Model classes.
These functions are intended to be called by the portrayal rules.
--]]

local CreateContextParameters, CreateFeaturePortrayalItemArray, CreateFeaturePortrayal, CreateDrawingInstructions
local GetMergedDisplayParameters

PortrayalModel =
{
	Type = 'PortrayalModel'
}
--[[
function PortrayalModel.CreatePortrayalContext(datasetID)
	CheckNotSelf(datasetID, PortrayalModel.Type)

	local portrayalContext =
	{
		Type = 'PortrayalContext',
		DatasetID = datasetID,
		ContextParameters = CreateContextParameters(),
		FeaturePortrayalItems = CreateFeaturePortrayalItemArray()
	}

	Debug.StartPerformance('Lua Code - HostDatasetGetFeatures')
	local featureIDs, observedParameters = HostDatasetGetFeatures(datasetID)
	Debug.StopPerformance('Lua Code - HostDatasetGetFeatures')

	observedParameters = observedParameters or ""

	--Debug.Break()

	for i, featureID in ipairs(featureIDs) do
		local featureCode = HostFeatureGetType(featureID)
		local feature = CreateFeature(datasetID, featureID, featureCode)

		portrayalContext.FeaturePortrayalItems:AddFeature(feature)

		local featurePortrayalItem = portrayalContext.FeaturePortrayalItems[#portrayalContext.FeaturePortrayalItems]

		Debug.StartPerformance('Lua Code - observedParameters')

		for observedParameter in observedParameters[i]:gmatch("([^;]+)") do
			local op, value = observedParameter:match("([^,]+):([^,]+)")

			-- TODO: Handle more than bools and numbers.
			if value == 'true' then
				value = true
			elseif value == 'false' then
				value = false
			else
				value = tonumber(value)
			end

			featurePortrayalItem.InUseContextParameters = featurePortrayalItem.InUseContextParameters or {}
			featurePortrayalItem.ObservedContextParameters = featurePortrayalItem.ObservedContextParameters or {}

			featurePortrayalItem.InUseContextParameters[op] = value
			featurePortrayalItem.ObservedContextParameters[op] = true
		end

		Debug.StopPerformance('Lua Code - observedParameters')
	end

	function portrayalContext:GetFeatures(featureType)
		local features = {}

		for _, featurePortrayalItem in ipairs(self.FeaturePortrayalItems) do
			local feature = featurePortrayalItem.Feature

			if featureType == nil or feature.Code == featureType then
				features[#features + 1] = feature
			end
		end

		return features
	end

	return portrayalContext
end
--]]
function PortrayalModel.CreatePortrayalContext(datasetID)
	CheckNotSelf(datasetID, PortrayalModel.Type)

	local portrayalContext =
	{
		Type = 'PortrayalContext',
		DatasetID = datasetID,
		ContextParameters = CreateContextParameters(),
		FeaturePortrayalItems = CreateFeaturePortrayalItemArray()
	}

	Debug.StopPerformance('Lua Code - Total')
	local featureIDs = HostDatasetGetFeatureIDs(datasetID)
	Debug.StartPerformance('Lua Code - Total')

	for _, featureID in ipairs(featureIDs) do
		Debug.StopPerformance('Lua Code - Total')
		local featureCode = HostFeatureGetType(featureID)
		Debug.StartPerformance('Lua Code - Total')
		local feature = CreateFeature(datasetID, featureID, featureCode)

		portrayalContext.FeaturePortrayalItems:AddFeature(feature)
	end

	function portrayalContext:GetFeatures(featureType)
		local features = {}

		for _, featurePortrayalItem in ipairs(self.FeaturePortrayalItems) do
			local feature = featurePortrayalItem.Feature

			if featureType == nil or feature.Code == featureType then
				features[#features + 1] = feature
			end
		end

		return features
	end

	return portrayalContext
end

function PortrayalModel.CreateDisplayParameters(viewingGroup, drawingPriority, scaleMinimum, scaleMaximum, displayPlane)
	CheckNotSelf(viewingGroup, PortrayalModel.Type)
	CheckTypeOrNil(viewingGroup, 'number')
	CheckTypeOrNil(drawingPriority, 'number')
	CheckTypeOrNil(scaleMinimum, 'number')
	CheckTypeOrNil(scaleMaximum, 'number')
	CheckTypeOrNil(displayPlane, 'string')

	return
	{
		Type = 'DisplayParameters',
		ViewingGroup = viewingGroup,
		DrawingPriority = drawingPriority,
		ScaleMinimum = scaleMinimum,
		ScaleMaximum = scaleMaximum,
		DisplayPlane = overrideDisplayPlane or displayPlane
	}
end

function PortrayalModel.CreateSpatialReference(reference, forward)
	CheckNotSelf(reference, PortrayalModel.Type)

	if reference.Type == 'SpatialAssociation' then
		forward = reference.Orientation.Value == 1
		reference = reference.SpatialID
	end

	CheckType(reference, 'string')
	CheckType(forward, 'boolean')

	return
	{
		Type = 'SpatialReference',
		Reference = reference,
		Forward = forward
	}
end

function ObservedContextParametersChanged(contextParameters, featurePortrayalItem)
	local cp1 = featurePortrayalItem.InUseContextParameters

	if not cp1 then
		return true
	end

	-- Get underlying table so we don't inadvertently observe all parameters.
	local cp2 = contextParameters._underlyingTable

	for cp, _ in pairs(featurePortrayalItem.ObservedContextParameters) do
		if cp ~= "_observed" then
			if cp1[cp] ~= cp2[cp] then
				return true
			end
		end
	end

	return false
end

function ObservedContextParametersAsString(featurePortrayalItem)
	Debug.StartPerformance('Lua Code - ObservedContextParametersAsString')

	local inUse = featurePortrayalItem.InUseContextParameters

	local observedValues = {}

	for observed, _ in pairs(featurePortrayalItem.ObservedContextParameters) do
		if observed ~= "_observed" then
			local value = inUse[observed]

			if type(value) == 'boolean' then
				value = value and 'true' or 'false'
			elseif type(value) == number then
				value = tostring(value)
			end

			observedValues[#observedValues + 1] = observed .. ':' .. value;
		end
	end

	observedValues = table.concat(observedValues, ';')

	Debug.StopPerformance('Lua Code - ObservedContextParametersAsString')

	return observedValues
end

function CreateContextParameters()
	local contextParameters = { _observed = {} }
	
	local ppMetaTable =
	{
		__index = function (t, k)
			if k == '_asTable' then
				local cp = {}

				for k, v in pairs(contextParameters) do
					cp[k] = v
				end

				return cp
			elseif k == '_underlyingTable' then
				return contextParameters
			else
				local r = contextParameters[k]
			
				if r == nil then
					error('Invalid mariner setting "' .. tostring(k) .. '"', 2)
				end
			
				contextParameters._observed[k] = true

				--Debug.Trace('Portrayal paramter "' .. k .. '" observed.')

				return r;
			end
		end,
		
		__newindex = function (t, k, v)
			if contextParameters[k] == nil then
				error('Attempt to set invalid portrayal paramter "' .. tostring(k) .. '"', 2)
			end
			
			contextParameters[k] = v

			if type(v) == 'boolean' then
				-- Cannot concatenate booleans
				if v then
					Debug.Trace('Setting portrayal paramter: ' .. k .. ' = true')
				else
					Debug.Trace('Setting portrayal paramter: ' .. k .. ' = false')
				end
			elseif type(v) ~= 'table' then
				Debug.Trace('Setting portrayal paramter: ' .. k .. ' = ' .. v .. '')
			end
		end
	}
	
	local ppProxy = { Type = 'ContextParametersProxy' }
	
	setmetatable(ppProxy, ppMetaTable)
	
	return ppProxy
end

function CreateFeaturePortrayalItemArray()
	local featurePortrayalItemArray = { Type = 'array:FeaturePortrayalItem' }

	function featurePortrayalItemArray:AddFeature(feature)
		CheckType(feature, 'Feature')

		local featurePortrayalItem = { Type = 'FeaturePortrayalItem', Feature = feature, ObservedContextParameters = {} }

		function featurePortrayalItem:NewFeaturePortrayal()
			self.featurePortrayal = CreateFeaturePortrayal(self.Feature.ID)

			return self.featurePortrayal
		end

		self[#self + 1] = featurePortrayalItem
		self[feature.ID] = featurePortrayalItem
	end

	return featurePortrayalItemArray
end

function InstructionSpatialReference(spatialAssociation)
	return spatialAssociation.SpatialID .. ',' .. spatialAssociation.Orientation.Name
end

local function ConvertSpatials(spatials)
	if spatials ~= nil then
		if not spatials[1] then
			spatials = { spatials }
		end

		if #spatials > 1 then
			--Debug.Break()
			--spatials.Type = 'array:Spatial'
		else
			spatials.Type = 'Spatial'
		end

		for i = 1, #spatials do
			local spatial = spatials[i]

			if spatial.Type == 'SpatialAssociation' then
				spatials[i] = PortrayalModel.CreateSpatialReference(spatial)
			end
		end
	end

	return spatials
end

function CreateFeaturePortrayal(featureReference)
	CheckType(featureReference, 'string')

	local featurePortrayal =
	{
		Type = 'FeaturePortrayal',
		FeatureReference = featureReference,
		DrawingInstructions = CreateDrawingInstructions(),
		DisplayParameters = PortrayalModel.CreateDisplayParameters()
	}

	function featurePortrayal:_SetDisplayParameters(viewingGroup, drawingPriority, scaleMinimum, scaleMaximum, displayPlane)
		CheckSelf(self, featurePortrayal.Type)
		local overrides = PortrayalModel.CreateDisplayParameters(viewingGroup, drawingPriority, scaleMinimum, scaleMaximum, displayPlane)

		self.DisplayParameters = GetMergedDisplayParameters(self.DisplayParameters, overrides)
	end

	function featurePortrayal:_IsDefaultDisplayParameters()
		CheckSelf(self, featurePortrayal.Type)

		return not (self.DisplayParameters.ViewingGroup or
			   self.DisplayParameters.DrawingPriority or
			   self.DisplayParameters.ScaleMinimum or
			   self.DisplayParameters.ScaleMaximum or
			   self.DisplayParameters.DisplayPlane)
	end

	function featurePortrayal:AddInstructions(instructions)
		CheckSelf(self, featurePortrayal.Type)
		CheckType(instructions, 'string')

		self.DrawingInstructions:Add(instructions)
	end

	-- Null Instruction

	function featurePortrayal:_AddNullInstruction()
		CheckSelf(self, featurePortrayal.Type)

		local instruction =
		{
			Type = 'NullInstruction',
			--FeatureReference = featureReference,
		}

		--self.DrawingInstructions:Add(Parameterize(instruction))
	end

	-- Point instruction
	
	function featurePortrayal:_AddPointInstruction(symbol, spatials, displayParametersOverride)
		CheckSelf(self, featurePortrayal.Type)

		if type(symbol) == 'string' then
			symbol = Symbol.CreateSymbol(symbol)
		end

		spatials = ConvertSpatials(spatials)

		CheckType(symbol, 'Symbol')
		CheckTypeOrNil(spatials, 'array+:SpatialReference')
		CheckTypeOrNil(displayParametersOverride, 'DisplayParameters')

		local instruction =
		{
			Type = 'PointInstruction',
			--FeatureReference = featureReference,
			Symbol = symbol,
			Spatials = spatials,
			DisplayParametersOverride = displayParametersOverride
		}

		--self.DrawingInstructions:Add(Parameterize(instruction))
	end

	-- Line instruction

	function featurePortrayal:_AddLineInstruction(lineStyle, spatials, displayParametersOverride, suppression)
		CheckSelf(self, featurePortrayal.Type)

		if type(lineStyle) == 'string' then
			lineStyle = LineStyles.CreateLineStyleReference(lineStyle)
		end

		spatials = ConvertSpatials(spatials)

		suppression = suppression or true

		CheckTypeOneOf(lineStyle, 'LineStyleReference', 'LineStyle', 'CompositeLineStyle')
		CheckTypeOrNil(spatials, 'array+:SpatialReference')
		CheckTypeOrNil(displayParametersOverride, 'DisplayParameters')
		CheckType(suppression, 'boolean')

		local instruction =
		{
			Type = 'LineInstruction',
			--FeatureReference = featureReference,
			LineStyle = lineStyle,
			Spatials = spatials,
			Suppression = suppression,
			DisplayParametersOverride = displayParametersOverride
		}

		--self.DrawingInstructions:Add(Parameterize(instruction))
	end

	-- Area instruction

	function featurePortrayal:_AddAreaInstruction(areaFill, spatials, displayParametersOverride)
		CheckSelf(self, featurePortrayal.Type)

		if type(areaFill) == 'string' then
			areaFill = AreaFills.CreateAreaFillReference(areaFill)
		end

		spatials = ConvertSpatials(spatials)

		CheckTypeOneOf(areaFill, 'AreaFillReference', 'ColorFill', 'SymbolFill', 'HatchFill', 'PixmapFill')
		CheckTypeOrNil(spatials, 'array+:SpatialReference')
		CheckTypeOrNil(displayParametersOverride, 'DisplayParameters')

		local instruction =
		{
			Type = 'AreaInstruction',
			--FeatureReference = featureReference,
			AreaFill = areaFill,
			Spatials = spatials,
			DisplayParametersOverride = displayParametersOverride
		}

		--self.DrawingInstructions:Add(Parameterize(instruction))
	end

	-- Text instruction

	function featurePortrayal:_AddTextInstruction(text, spatials, displayParametersOverride)
		CheckSelf(self, featurePortrayal.Type)

		spatials = ConvertSpatials(spatials)

		CheckTypeOneOf(text, 'TextPoint', 'TextLine')
		CheckTypeOrNil(spatials, 'array+:SpatialReference')
		CheckTypeOrNil(displayParametersOverride, 'DisplayParameters')

		local instruction =
		{
			Type = 'TextInstruction',
			--FeatureReference = featureReference,
			Text = text,
			Spatials = spatials,
			DisplayParametersOverride = displayParametersOverride
		}

		--self.DrawingInstructions:Add(Parameterize(instruction))
	end

	-- Coverage Instruction

	-- TODO: Implement
	function featurePortrayal:_AddCoverageInstruction()
		CheckSelf(self, featurePortrayal.Type)

		error('Coverage instructions not implemented', 2)
	end

	-- Augmented Geometry Instructions

	function featurePortrayal:_AddAugmentedPoint(position, symbol, crs, text, spatials, displayParametersOverride)
		CheckSelf(self, featurePortrayal.Type)

		if type(symbol) == 'string' then
			symbol = Symbol.CreateSymbol(symbol)
		end

		crs = crs or Graphics.CRSType.Geographic

		CheckType(position, 'Point')
		CheckTypeOrNil(symbol, 'Symbol')
		CheckType(crs, 'CRSType')

		if text ~= nil then
			CheckTypeOneOf(text, 'TextPoint', 'TextLine')
		end

		CheckTypeOrNil(spatials, 'array:SpatialReference')
		CheckTypeOrNil(displayParametersOverride, 'DisplayParameters')

		local instruction =
		{
			Type = 'AugmentedPoint',
			--FeatureReference = featureReference,
			Position = position,
			Symbol = symbol,
			CRS = crs,
			Text = text,
			Spatials = spatials,
			DisplayParametersOverride = displayParametersOverride
		}

		--self.DrawingInstructions:Add(Parameterize(instruction))
	end

	function featurePortrayal:_AddAugmentedRay(direction, length, lineStyle, crs, text, spatials, displayParametersOverride)
		CheckSelf(self, featurePortrayal.Type)
		CheckType(direction, 'number')
		CheckType(length, 'number')
		CheckTypeOneOfOrNil(lineStyle, 'LineStyleReference', 'LineStyle', 'CompositeLineStyle')
		CheckType(crs, 'CRSType')
		CheckTypeOneOfOrNil(text, 'TextPoint', 'TextLine')
		CheckTypeOrNil(spatials, 'array:SpatialReference')
		CheckTypeOrNil(displayParametersOverride, 'DisplayParameters')

		local instruction =
		{
			Type = 'AugmentedRay',
			--FeatureReference = featureReference,
			Direction = direction,
			Length = length,
			LineStyle = lineStyle,
			CRS = crs,
			Text = text,
			Spatials = spatials,
			DisplayParametersOverride = displayParametersOverride
		}

		--self.DrawingInstructions:Add(Parameterize(instruction))
	end

	function featurePortrayal:_AddAugmentedPath(path, lineStyle, crs, text, spatials, displayParametersOverride)
		CheckSelf(self, featurePortrayal.Type)
		CheckType(path, 'Path')
		CheckTypeOneOfOrNil(lineStyle, 'LineStyleReference', 'LineStyle', 'CompositeLineStyle')
		CheckType(crs, 'CRSType')
		CheckTypeOneOfOrNil(text, 'TextPoint', 'TextLine')
		CheckTypeOrNil(spatials, 'array:SpatialReference')
		CheckTypeOrNil(displayParametersOverride, 'DisplayParameters')

		local instruction =
		{
			Type = 'AugmentedPath',
			--FeatureReference = featureReference,
			Path = path,
			LineStyle = lineStyle,
			CRS = crs,
			Text = text,
			Spatials = spatials,
			DisplayParametersOverride = displayParametersOverride
		}

		--self.DrawingInstructions:Add(Parameterize(instruction))
	end

	function featurePortrayal:_AddAugmentedArea(areaFill, path, lineStyle, crs, text, spatials, displayParametersOverride)
		CheckSelf(self, featurePortrayal.Type)
		CheckTypeOneOf(areaFillReference, 'nil', 'AreaFillReference', 'ColorFill', 'SymbolFill', 'HatchFill', 'PixmapFill')
		CheckType(path, 'path')
		CheckTypeOneOf(lineStyle, 'nil', 'LineStyleReference', 'LineStyle', 'CompositeLineStyle')
		CheckType(crs, 'CRSType')
		CheckTypeOneOf(text, 'TextPoint', 'TextLine')
		CheckTypeOrNil(spatials, 'array:SpatialReference')
		CheckTypeOrNil(displayParametersOverride, 'DisplayParameters')

		local instruction =
		{
			Type = 'AugmentedArea',
			--FeatureReference = featureReference,
			AreaFill = areaFill,
			Path = path,
			LineStyle = lineStyle,
			Crs = crs,
			Text = text,
			Spatials = spatials,
			DisplayParametersOverride = displayParametersOverride
		}

		--self.DrawingInstructions:Add(Parameterize(instruction))
	end

	return featurePortrayal
end

local parameterized = true; -- TODO: Make this user configurable.

function CreateDrawingInstructions(featurePortrayal)
	local drawingInstructions = { Type = 'array:DrawingInstruction' }

	function drawingInstructions:Add(instruction)
		self[#self + 1] = instruction
	end

	return drawingInstructions;
end

function GetMergedDisplayParameters(displayParameters, overrideParameters)
	local dp = PortrayalModel.CreateDisplayParameters(displayParameters.ViewingGroup,
													  displayParameters.DrawingPriority,
													  displayParameters.ScaleMinimum,
													  displayParameters.ScaleMaximum,
													  displayParameters.DisplayPlane)

	if (overrideParameters) then
		dp.ViewingGroup    = overrideParameters.ViewingGroup    or dp.ViewingGroup
		dp.DrawingPriority = overrideParameters.DrawingPriority or dp.DrawingPriority
		dp.ScaleMinimum    = overrideParameters.ScaleMinimum    or dp.ScaleMinimum
		dp.ScaleMaximum    = overrideParameters.ScaleMaximum    or dp.ScaleMaximum
		dp.DisplayPlane    = overrideDisplayPlane or overrideParameters.DisplayPlane or dp.DisplayPlane
	end
	
	return dp
end


--
-- Graphics Base Package
--

Graphics =
{
	Type = "Graphics",
	CRSType =
	{
		Geographic  = { Type = 'CRSType', Value = 1, Name = 'Geographic' },
		Portrayal   = { Type = 'CRSType', Value = 2, Name = 'Portrayal' },
		Local       = { Type = 'CRSType', Value = 3, Name = 'Local' },
		Line        = { Type = 'CRSType', Value = 4, Name = 'Line' }
	}
}

function Graphics.CreateAnnulus(center, innerRadius, outerRadius, sector)
	CheckNotSelf(center, Graphics.Type)
	CheckType(center, 'Point')
	CheckTypeOrNil(innerRadius, 'number')
	CheckType(outerRadius, 'number')
	CheckType(sector, 'Sector')

	return { Type = 'Annulus', Center = center, InnerRadius = innerRadius, OuterRadius = outerRadius, Sector = sector }
end

function Graphics.CreateArc3Points(startPoint, medianPoint, endPoint)
	CheckNotSelf(startPoint, Graphics.Type)
	CheckType(startPoint, 'Point')
	CheckType(medianPoint, 'Point')
	CheckType(endPoint, 'Point')

	return { Type = 'Arc3Points', StartPoint = startPoint, MedianPoint = medianPoint, EndPoint = endPoint }
end

function Graphics.CreateArcByRadius(center, radius, sector)
	CheckNotSelf(center, Graphics.Type)
	CheckType(center, 'Point')
	CheckType(radius, 'number')
	CheckTypeOrNil(sector, 'Sector')

	return { Type = 'ArcByRadius', Center = center, Radius = radius, Sector = sector }
end

function Graphics.CreateColor(token, transparency)
	CheckNotSelf(token, Graphics.Type)
	CheckType(token, 'string')

	transparency = transparency or 0.0
	CheckType(transparency, 'number')

	return { Type = 'Color', Token = token, Transparency = transparency }
end

function Graphics.CreatePath(segments)
	-- TODO:  Check type when inheritance is implemented

	CheckNotSelf(segments, Graphics.Type)
	--CheckType(segments, 'array:PathSegment')

	return { Type = 'Path', Segments = segments }
end

function Graphics.CreatePen(width, colorToken, transparency)
	CheckNotSelf(width, Graphics.Type)
	CheckType(width, 'number')
	CheckType(colorToken, 'string')
	CheckTypeOrNil(transparency, 'number')

	return { Type = 'Pen', Width = width, Color = Graphics.CreateColor(colorToken, transparency) }
end

function Graphics.CreatePoint(x, y)
	CheckNotSelf(x, Graphics.Type)
	x = x or 0.0
	y = y or 0.0

	CheckType(x, 'number')
	CheckType(y, 'number')

	return { Type = 'Point', X = x, Y = y }
end

function Graphics.CreatePolyline(points)
	CheckNotSelf(points, Graphics.Type)
	CheckType(points, 'array:Point')

	if #points < 2 then
		error('At least two points must be provided.', 2)
	end

	return { Type = 'Polyline', Points = points }
end

function Graphics.CreateSector(startAngle, angularDistance)
	CheckNotSelf(startAngle, Graphics.Type)
	CheckType(startAngle, 'number')
	CheckType(angularDistance, 'number')

	return { Type = 'Sector', StartAngle = startAngle, AngularDistance  = angularDistance }
end

function Graphics.CreateVector(x, y)
	CheckNotSelf(x, Graphics.Type)
	x = x or 0.0
	y = y or 0.0

	CheckType(x, 'number')
	CheckType(y, 'number')

	return { Type = 'Vector', X = x, Y = y }
end

--
-- Symbol Package
--

Symbol =
{
	Type = "Symbol",
	LinePlacementMode =
	{
		Relative = { Type = 'LinePlacementMode', Value = 1, Name = 'Relative' },
		Absolute = { Type = 'LinePlacementMode', Value = 2, Name = 'Absolute' }
	},
	AreaPlacementMode =
	{
		VisibleParts = { Type = 'AreaPlacementMode', Value = 1, Name = 'VisibleParts' },
		Geographic   = { Type = 'AreaPlacementMode', Value = 2, Name = 'Geographic' }
	}
}

function Symbol.CreateSymbol(reference, rotation, rotationCRS, scaleFactor, offset, linePlacement, areaPlacement, override, overrideAll)
	CheckNotSelf(reference, Symbol.Type)

	CheckType(reference, 'string')
	CheckTypeOrNil(rotation, 'number')
	CheckTypeOrNil(rotationCRS, 'CRSType')
	CheckTypeOrNil(scaleFactor, 'number')
	CheckTypeOrNil(offset, 'Vector')
	CheckTypeOrNil(linePlacement, 'LineSymbolPlacement')
	CheckTypeOrNil(areaPlacement, 'AreaSymbolPlacement')
	CheckTypeOrNil(override, 'Color')
	CheckTypeOrNil(overrideAll, 'array:Color')

	return { Type = 'Symbol', Reference = reference, Rotation = rotation, RotationCRS = rotationCRS, ScaleFactor = scaleFactor, Offset = offset,
	                      LinePlacement = linePlacement, AreaPlacement = areaPlacement, Override = override, OverrideAll = overrideAll }
end

function Symbol.CreateLineSymbolPlacement(placementMode, offset)
	CheckNotSelf(placementMode, Symbol.Type)

	placementMode = placementMode or Symbol.LinePlacementMode.Relative
	offset = offset or 0.5

	CheckType(placementMode, 'LinePlacementMode')
	CheckType(offset, 'number')

	return { Type = 'LineSymbolPlacement', PlacementMode = placementMode, Offset = offset }
end

function Symbol.CreateAreaSymbolPlacement(placementMode)
	CheckNotSelf(placementMode, Symbol.Type)

	--placementMode = placementMode or Symbol.AreaPlacementMode.VisibleParts

	CheckType(placementMode, 'AreaPlacementMode')

	return { Type = 'AreaSymbolPlacement', PlacementMode = placementMode }
end

--
-- LineStyles Package
--

LineStyles =
{
	Type = "LineStyles",
	CapStyle =
	{
		Butt   = { Type = 'CapStyle', Value = 1, Name = 'Butt' },
		Square = { Type = 'CapStyle', Value = 2, Name = 'Square' },
		Round  = { Type = 'CapStyle', Value = 3, Name = 'Round' }
	},
	JoinStyle =
	{
		Bevel = { Type = 'JoinStyle', Value = 1, Name = 'Bevel' },
		Miter = { Type = 'JoinStyle', Value = 2, Name = 'Miter' },
		Round = { Type = 'JoinStyle', Value = 3, Name = 'Round' }
	}
}

-- Constructors

function LineStyles.CreateLineStyle(pen, capStyle, joinStyle, offset, intervalLength, dashes, symbols)
	CheckNotSelf(pen, LineStyles.Type)

	CheckTypeOrNil(pen, 'Pen')
	CheckTypeOrNil(capStyle, 'CapStyle')
	CheckTypeOrNil(joinStyle, 'JoinStyle')
	CheckTypeOrNil(offset, 'number')
	CheckTypeOrNil(intervalLength, 'number')
	CheckTypeOrNil(dashes, 'array:Dash')
	CheckTypeOrNil(symbols, 'array:LineSymbol')

	return { Type = 'LineStyle', Pen = pen, CapStyle = capStyle, JoinStyle = joinStyle, Offset = offset, IntervalLength = intervalLength, Dashes = dashes, Symbols = symbols }
end

function LineStyles.CreateLineStyleReference(reference)
	CheckNotSelf(reference, LineStyles.Type)
	CheckType(reference, 'string')

	return { Type = 'LineStyleReference', Reference = reference }
end

function LineStyles.CreateLineSymbol(reference, position, rotation, scaleFactor, crsType)
	CheckNotSelf(reference, LineStyles.Type)

	CheckType(reference, 'string')
	CheckType(rotation, 'number')
	CheckType(scaleFactor, 'number')
	CheckType(crsType, 'CRSType')

	return { Type = 'LineSymbol', Reference = reference, Position = position, Rotation = rotation, ScaleFactor = scaleFactor, CRSType = crsType }
end

function LineStyles.CreateCompositeLineStyle(components)
	CheckNotSelf(components, LineStyles.Type)

	--[[ TODO: Support type inheritance
	CheckType(reference, 'array:AbstractLineStyle')
	--]]

	return { Type = 'CompositeLineStyle', Components = components }
end

function LineStyles.CreateDash(start, length)
	CheckNotSelf(start, LineStyles.Type)

	CheckType(start, 'number')
	CheckType(length, 'number')

	return { Type = 'Dash', Start = start, Length = length }
end

-- Helpers

function LineStyles.CreateLineStyleDashed(pen, intervalLength, dashes, capStyle, joinStyle, offset)
	CheckNotSelf(pen, LineStyles.Type)
	return LineStyles.CreateLineStyle(pen, capStyle, joinStyle, offset, intervalLength, dashes)
end

function LineStyles.CreateLineStyleSymbolized(intervalLength, symbols, offset)
	CheckNotSelf(intervalLength, LineStyles.Type)
	return LineStyles.CreateLineStyle(nil, nil, nil, offset, intervalLength, nil, symbols)
end

-- Creates an S-52 style solid line.
function LineStyles.CreateStandardLineStyleSolid(width, colorToken)
	CheckNotSelf(width, LineStyles.Type)
	CheckType(width, 'number')
	CheckType(colorToken, 'string')

	return LineStyles.CreateLineStyle(Graphics.CreatePen(width, colorToken))
end

-- Creates an S-52 style dashed line.
function LineStyles.CreateStandardLineStyleDash(width, colorToken)
	CheckNotSelf(width, LineStyles.Type)
	CheckType(width, 'number')
	CheckType(colorToken, 'string')

	return LineStyles.CreateLineStyleDashed(Graphics.CreatePen(width, colorToken), 5.4, { LineStyles.CreateDash(0.0, 3.6) })
end

-- Creates an S-52 style dotted line.
function LineStyles.CreateStandardLineStyleDot(width, colorToken)
	CheckNotSelf(width, LineStyles.Type)
	CheckType(width, 'number')
	CheckType(colorToken, 'string')

	return LineStyles.CreateLineStyleDashed(Graphics.CreatePen(width, colorToken), 1.8, { LineStyles.CreateDash(0.0, 0.6) })
end

--
-- Area Fills Package
--

AreaFills =
{
	Type = "AreaFills",
	AreaCRSType =
	{
		Global         = { Type = 'AreaCRSType', Value = 1, Name = 'Global' },
		LocalGeometry  = { Type = 'AreaCRSType', Value = 2, Name = 'LocalGeometry' },
		GlobalGeometry = { Type = 'AreaCRSType', Value = 3, Name = 'GlobalGeometry' }
	}
}

-- Constructors

function AreaFills.CreateAreaFillReference(reference)
	CheckNotSelf(reference, AreaFills.Type)
	CheckType(reference, 'string')

	return { Type = 'AreaFillReference', Reference = reference }
end

function AreaFills.CreateColorFill(color)
	CheckNotSelf(color, AreaFills.Type)
	if type(color) == 'string' then
		color = Graphics.CreateColor(color)
	end

	CheckType(color, 'Color')

	return { Type = 'ColorFill', Color = color }
end

function AreaFills.CreateSymbolFill(symbol, v1, v2, areaCRS, clipSymbols)
	CheckNotSelf(symbol, AreaFills.Type)

	if type(symbol) == 'string' then
		symbol = Symbol.CreateSymbol(symbol)
	end

	--areaCRS = areaCRS or AreaCRSType.GlobalGeometry
	--clipSymbols = clipSymbols or true

	CheckType(symbol, 'Symbol')
	CheckType(v1, 'Vector')
	CheckType(v2, 'Vector')
	CheckType(areaCRS, 'AreaCRSType')
	CheckType(clipSymbols, 'boolean')

	return { Type = 'SymbolFill', Symbol = symbol, V1 = v1, V2 = v2, ClipSymbols = clipSymbols }
end

function AreaFills.CreateHatch(lineStyle, direction, distance)
	CheckNotSelf(lineStyle, AreaFills.Type)

	if type(lineStyle) == 'string' then
		lineStyle = LineStyles.CreateLineStyleReference(lineStyleReference)
	end

	CheckTypeOneOf(lineStyle, 'LineStyleReference', 'LineStyle', 'CompositeLineStyle')
	CheckType(direction, 'Vector')
	CheckType(distance, 'number')

	return { Type = 'Hatch', LineStyle = lineStyle, Direction = direction, Distance = distance }
end

function AreaFills.CreateHatchFill(hatches, areaCRS)
	CheckNotSelf(hatches, AreaFills.Type)

	--areaCRS = areaCRS or AreaCRSType.GlobalGeometry

	CheckType(hatches, 'array:Hatch')
	CheckType(areaCRS, 'AreaCRSType')

	return { Type = 'HatchFill', Hatches = hatches }
end

function AreaFills.CreatePixmap(reference, override, overrideAll)
	CheckNotSelf(reference, AreaFills.Type)
	CheckType(reference, 'string')
	CheckTypeOrNil(override, 'Color')
	CheckTypeOrNil(overrideAll, 'array:Color')

	return { Type = 'Pixmap', Reference = reference, Override = override, OverrideAll = overrideAll }
end

function AreaFills.CreatePixmapFill(pixmap, areaCRS)
	CheckNotSelf(pixmap, AreaFills.Type)

	--areaCRS = areaCRS or AreaCRSType.GlobalGeometry

	if type(pixmap) == 'string' then
		pixmap = AreaFills.CreatePixmap(pixmap)
	end

	CheckType(pixmap, 'Pixmap')
	CheckType(areaCRS, 'AreaCRSType')

	return { Type = 'PixmapFill', Pixmap = pixmap, AreaCRS = areaCRS }
end

--[[
function AreaFills.CreateHatchLineStyle(lineStyle, direction, distance)
	CheckNotSelf(lineStyle, AreaFills.Type)
	return AreaFills.CreateHatch(lineStyle, nil, nil, direction, distance)
end

function AreaFills.CreateHatchLineStyleReference(lineStyleReference, direction, distance)
	CheckNotSelf(lineStyleReference, AreaFills.Type)
	return AreaFills.CreateHatch(nil, lineStyleReference, nil, direction, distance)
end

function AreaFills.CreateHatchCompositeLineStyle(compositeLineStyle, direction, distance)
	CheckNotSelf(compositeLineStyle, AreaFills.Type)
	return AreaFills.CreateHatch(nil, nil, compositeLineStyle, direction, distance)
end
==]]

--
-- Text Package
--

Text =
{
	Type = "Text",
	FontProportion =
	{
		MonoSpaced   = { Type = 'FontProportion', Value = 1, Name = 'MonoSpaced' },
		Proportional = { Type = 'FontProportion', Value = 2, Name = 'Proportional' }
	},
	FontSlant =
	{
		Upright = { Type = 'FontSlant', Value = 1, Name = 'Upright' },
		Italics = { Type = 'FontSlant', Value = 2, Name = 'Italics' }
	},
	FontWeight =
	{
		Light  = { Type = 'FontWeight', Value = 1, Name = 'Light' },
		Medium = { Type = 'FontWeight', Value = 2, Name = 'Medium' },
		Bold   = { Type = 'FontWeight', Value = 3, Name = 'Bold' }
	},
	TextFlag =
	{
		UnderLine     = { Type = 'TextFlag', Value = 1, Name = 'UnderLine' },
		StrikeThrough = { Type = 'TextFlag', Value = 2, Name = 'StrikeThrough' },
		UpperLine     = { Type = 'TextFlag', Value = 3, Name = 'UpperLine' }
	},
	HorizontalAlignment =
	{
		Start  = { Type = 'HorizontalAlignment', Value = 1, Name = 'Start' },
		End    = { Type = 'HorizontalAlignment', Value = 2, Name = 'End' },
		Center = { Type = 'HorizontalAlignment', Value = 3, Name = 'Center' }
	},
	VerticalAlignment =
	{
		Top    = { Type = 'VerticalAlignment', Value = 1, Name = 'Top' },
		Bottom = { Type = 'VerticalAlignment', Value = 2, Name = 'Bottom' },
		Center = { Type = 'VerticalAlignment', Value = 3, Name = 'Center' }
	}
}

function Text.CreateFontReference(reference, fontWeight, fontSlant)
	CheckNotSelf(reference, Text.Type)

	fontWeight = fontWeight or Text.FontWeight.Medium
	fontSlant = fontSlant or Text.FontSlant.Upright

	CheckType(reference, 'string')
	CheckType(fontWeight, 'FontWeight')
	CheckType(fontSlant, 'FontSlant')
	
	return { Type = 'FontReference', Reference = reference, Weight = fontWeight, Slant = fontSlant }
end

function Text.CreateFontCharacteristics(serifs, proportion, fontWeight, fontSlant)
	CheckNotSelf(serifs, Text.Type)

	serifs = serifs or false
	proportion = proportion or defaultFontProportion
	fontWeight = fontWeight or Text.FontWeight.Medium
	fontSlant = fontSlant or Text.FontSlant.Upright

	CheckType(serifs, 'boolean')
	CheckType(proportion, 'FontProportion')
	CheckType(fontWeight, 'FontWeight')
	CheckType(fontSlant, 'FontSlant')
	
	return { Type = 'FontCharacteristics', Serifs = serifs, Proportion = proportion, Weight = fontWeight, Slant = fontSlant }
end

function Text.CreateTextElement(text, font, bodySize, foreground, background, textFlags, verticalOffset)
	CheckNotSelf(text, Text.Type)

	if type(foreground) == 'string' then
		foreground = Graphics.CreateColor(foreground)
	end

	if type(background) == 'string' then
		background = Graphics.CreateColor(background)
	end

	CheckType(text, 'string')
	CheckTypeOneOf(font, 'FontReference', 'FontCharacteristics')
	CheckType(bodySize, 'number')
	CheckType(foreground, 'Color')
	CheckTypeOrNil(background, 'Color')
	CheckTypeOrNil(textFlags, 'array:TextFlag')
	CheckTypeOrNil(verticalOffset, 'number')

	return { Type = 'TextElement', Text = text, Font = font, BodySize = bodySize, Foreground = foreground, Background = background, TextFlags = textFlags, VerticalOffset = verticalOffset }
end

function Text.CreateTextLine(elements, startOffset, endOffset, placementMode, horizontalAlignment, verticalAlignment)
	CheckNotSelf(elements, Text.Type)

	if elements and elements.Type == 'TextElement' then
		elements = {elements}
	end

	CheckType(elements, 'array:TextElement')
	CheckType(startOffset, 'number')
	CheckTypeOrNil(endOffset, 'number')
	CheckTypeOrNil(placementMode, 'LinePlacementMode')
	CheckTypeOrNil(horizontalAlignment, 'HorizontalAlignment')
	CheckTypeOrNil(verticalAlignment, 'VerticalAlignment')

	return { Type = 'TextLine', Elements = elements, StartOffset = startOffset, EndOffset = endOffset, PlacementMode  = placementMode, HorizontalAlignment = horizontalAlignment, VerticalAlignment  = verticalAlignment }
end

function Text.CreateTextPoint(elements, offset, rotation, areaPlacement, horizontalAlignment, verticalAlignment)
	CheckNotSelf(elements, Text.Type)

	if elements and elements.Type == 'TextElement' then
		elements = {elements}
	end

	CheckType(elements, 'array:TextElement')
	CheckType(offset, 'Vector')
	CheckTypeOrNil(rotation, 'number')
	CheckTypeOrNil(areaPlacement, 'AreaSymbolPlacement')
	CheckTypeOrNil(horizontalAlignment, 'HorizontalAlignment')
	CheckTypeOrNil(verticalAlignment, 'VerticalAlignment')

	return { Type = 'TextPoint', Elements = elements, Offset = offset, Rotation = rotation, AreaPlacement = areaPlacement, HorizontalAlignment = horizontalAlignment, VerticalAlignment  = verticalAlignment }
end
