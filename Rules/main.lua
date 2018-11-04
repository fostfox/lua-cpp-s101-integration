require 'S100Scripting'
require 'PortrayalModel'
require 'PortrayalAPI'
require 'Default'

-- Main entry point for portrayal
function PortrayalMain(datasetID, featureIDs)
	Debug.StartPerformance('Lua Code - Total')
	local portrayalContext = portrayalContexts[datasetID]

	if not portrayalContext then
		error('Host must call PortrayalInitializeContextParameters() before calling portrayal_main()')
	end

	local contextParameters = portrayalContext.ContextParameters

	local featurePortrayalItems = portrayalContext.FeaturePortrayalItems

	-- For curves and surfaces, perform line symbology on self and adjacent features so that
	-- higher priority edges suppress lower priority edges.

	function ProcessFeaturePortrayalItem(featurePortrayalItem)
		Debug.StartPerformance('Lua Code - Dataset processing')

		local feature = featurePortrayalItem.Feature

		--Debug.Break()

		local featurePortrayal = featurePortrayalItem:NewFeaturePortrayal()

		contextParameters._observed = {}
		
		local status, err = pcall(function ()
			Debug.StartPerformance('Lua Code - Rules processing')

			local scaMin = feature['!scaleMinimum']
			local scaMax = feature['!scaleMaximum']

			if scaMin then
				featurePortrayal:AddInstructions('ScaleMinimum:' .. scaMin)
			end

			if scaMax then
				featurePortrayal:AddInstructions('ScaleMax:' .. scaMax)
			end

			if not contextParameters.RADAR_OVERLAY then
				featurePortrayal:AddInstructions('DisplayPlaneOverride:UnderRADAR')
			end

			featurePortrayal.DisplayParameters.ScaleMinimum = feature['!scaleMinimum']
			featurePortrayal.DisplayParameters.ScaleMaximum = feature['!scaleMaximum']

			require(feature.Code)
			_G[feature.Code](feature, featurePortrayal, contextParameters)

			if #featurePortrayal.DrawingInstructions == 0 then
				error('No drawing instructions were emitted for feature ' .. feature.ID)
			--elseif featurePortrayal:IsDefaultDisplayParameters() and featurePortrayal.DrawingInstructions[1].Type ~= 'NullInstruction' then
				--error('SetDisplayParameters() not called by portrayal rules for feature ' .. feature.ID)
			end
			Debug.StopPerformance('Lua Code - Rules processing')
		end)

		if not status then
			Debug.Trace('Error: ' .. err .. '.  Default symbology for ' .. feature.Code .. ' ID=' .. feature.ID .. ' returned.')

			-- Clear any drawing instructions created up to this point.
			featurePortrayal = featurePortrayalItem:NewFeaturePortrayal()

			Default(feature, featurePortrayal, contextParameters)
		end

		Debug.StopPerformance('Lua Code - Dataset processing')

		Debug.StartPerformance('Lua Code - HostPortrayalEmit preparation')

		featurePortrayalItem.ObservedContextParameters = contextParameters._observed
		featurePortrayalItem.InUseContextParameters = contextParameters._asTable

		--Debug.Break()

		local observed = ObservedContextParametersAsString(featurePortrayalItem)

		local drawingInstructions = table.concat(featurePortrayal.DrawingInstructions, ';')

		Debug.StopPerformance('Lua Code - HostPortrayalEmit preparation')

		return HostPortrayalEmit(featurePortrayal.FeatureReference, drawingInstructions, observed)
	end

	--Debug.Break()

	if featureIDs then
		for _,  featureID in ipairs(featureIDs) do
			ProcessFeaturePortrayalItem(featurePortrayalItems[featureID])
		end
	else
		for _,  featurePortrayalItem in ipairs(featurePortrayalItems) do
			ProcessFeaturePortrayalItem(featurePortrayalItem)
		end
	end
	Debug.StopPerformance('Lua Code - Total')
end

-- Unknown value

local unknownValueMetatable =
{
	__eq = function (o1, o2)
		-- Never called when o1 and o2 are the same table.
		return false
	end,

	__lt = function (o1, o2)
		return false
	end,

	__le = function (o1, o2)
		return o1 == o2
	end
}

unknownValue = { Type = 'UnknownValue' }

setmetatable(unknownValue, unknownValueMetatable)

nilMarker = {}

scaminInfinite = 2147483647
--

defaultFontProportion = Text.FontProportion.Proportional
defaultFontCharacteristics = Text.CreateFontCharacteristics()
overrideDisplayPlane = nil

-- TODO.  Locate to S-101 specific helper file
SkinOfTheEarthFeatures =
{
	'DepthArea',
	'DredgedArea',
	'LandArea',
	'UnsurveyedArea',
	'DockArea',
	'LockBasin'
}

-- Always portray features that extend beyond their geometry.
AlwaysVisibleFeatures =
{
	'LightSectored'
}
