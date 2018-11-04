require 'PortrayalModel'
require 'PortrayalAPI'
require 'S100Scripting'
require 'Rules/Default'

path = 'Rules/'

-- Main entry point for portrayal
function PortrayalMain(datasetID, featureIDs)
    Debug.StartPerformance('Lua Code - PortrayalMain - Total')

    local portrayalContext = portrayalContexts[datasetID]
    
	if not portrayalContext then
		error('Host must call PortrayalInitializeContextParameters() before calling portrayal_main()')
	end

	local featurePortrayalItems = portrayalContext.FeaturePortrayalItems

    function ProcessFeaturePortrayalItem(featurePortrayalItem)
        Debug.StartPerformance('Lua Code - Dataset processing')

		local feature = featurePortrayalItem.Feature
		local featurePortrayal = featurePortrayalItem:NewFeaturePortrayal()

        local status, err = pcall(function ()
            Debug.StartPerformance('Lua Code - Rules processing')

			require(path..feature.Code)
			_G[feature.Code](feature, featurePortrayal, contextParameters)

			if #featurePortrayal.DrawingInstructions == 0 then
				error('No drawing instructions were emitted for feature ' .. feature.ID)
            end
            
            Debug.StopPerformance('Lua Code - Rules processing')
		end)

		if not status then
			Debug.Trace('Error: ' .. err .. '.  Default symbology for ' .. feature.Code .. ' ID=' .. feature.ID .. ' returned.')
			featurePortrayal = featurePortrayalItem:NewFeaturePortrayal()
			Default(feature, featurePortrayal, contextParameters)
		end
        Debug.StopPerformance('Lua Code - Dataset processing')
        Debug.StartPerformance('Lua Code - HostPortrayalEmit preparation')
        
        local drawingInstructions = table.concat(featurePortrayal.DrawingInstructions, ';')
        
        Debug.StopPerformance('Lua Code - HostPortrayalEmit preparation')

        return HostPortrayalEmit(featurePortrayal.FeatureReference, drawingInstructions)--, observed)
	end

	if featureIDs then
		for _,  featureID in ipairs(featureIDs) do
			ProcessFeaturePortrayalItem(featurePortrayalItems[featureID])
		end
	else
		for _,  featurePortrayalItem in ipairs(featurePortrayalItems) do
			ProcessFeaturePortrayalItem(featurePortrayalItem)
		end
	end
	Debug.StopPerformance('Lua Code - PortrayalMain - Total')
end