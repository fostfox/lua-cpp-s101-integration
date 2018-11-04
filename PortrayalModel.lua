--[[
This file contains the global functions that define the Lua Portrayal Model classes.
These functions are intended to be called by the portrayal rules.
--]]

local CreateFeaturePortrayalItemArray, CreateDrawingInstructions

PortrayalModel = {}

function PortrayalModel.CreatePortrayalContext(datasetID)
	local portrayalContext =
	{
		DatasetID = datasetID,
		FeaturePortrayalItems = CreateFeaturePortrayalItemArray()
	}

	Debug.StartPerformance('Lua Code - HostDatasetGetFeatureIDs -  Total')
	local featureIDs = HostDatasetGetFeatureIDs(datasetID)
	Debug.Trace(#featureIDs)
	Debug.StopPerformance('Lua Code - HostDatasetGetFeatureIDs - Total')
	
	for _, featureID in ipairs(featureIDs) do
		Debug.StartPerformance('Lua Code - HostFeatureGetType - Total')
		local featureCode = HostFeatureGetType(featureID)
		Debug.StopPerformance('Lua Code - HostFeatureGetType - Total')
		local feature = CreateFeature(datasetID, featureID, featureCode)

		portrayalContext.FeaturePortrayalItems:AddFeature(feature)
	end

	return portrayalContext
end


function CreateFeaturePortrayalItemArray()
	local featurePortrayalItemArray = {}

	function featurePortrayalItemArray:AddFeature(feature)
		local featurePortrayalItem = { Feature = feature }

		function featurePortrayalItem:NewFeaturePortrayal()
            self.featurePortrayal = CreateFeaturePortrayal(self.Feature.ID)
            
			return self.featurePortrayal
		end

		self[#self + 1] = featurePortrayalItem
		self[feature.ID] = featurePortrayalItem
	end

	return featurePortrayalItemArray
end


function CreateFeaturePortrayal(featureReference)
	local featurePortrayal = {
		FeatureReference = featureReference,
		DrawingInstructions = CreateDrawingInstructions(),
	}

	function featurePortrayal:AddInstructions(instructions)
		self.DrawingInstructions:Add(instructions)
	end

	return featurePortrayal
end


function CreateDrawingInstructions(featurePortrayal)
	local drawingInstructions = {}

	function drawingInstructions:Add(instruction)
		self[#self + 1] = instruction
	end

	return drawingInstructions;
end