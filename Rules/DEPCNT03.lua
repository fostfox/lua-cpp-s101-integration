-- DEPCNT03 conditional symbology rules file.

-- Referenced CSPs.
require 'SAFCON01'

-- Main entry point for CSP.
function DEPCNT03(feature, featurePortrayal, contextParameters)
	Debug.StartPerformance('Lua Code - DEPCNT03')

	local function GenerateCurves()
		Debug.StartPerformance('Lua Code - DEPCNT03 GenerateCurves')

		local dashedAssociations = {}
		local solidAssociations = {}

		for curveAssociation in feature:GetFlattenedSpatialAssociations() do
			--Debug.Break()
			Debug.StartPerformance('Lua Code - DEPCNT03 GetInformationAssociation')
			local spatialQuality = curveAssociation.Spatial:GetInformationAssociation('spatialQuality')
			Debug.StopPerformance('Lua Code - DEPCNT03 GetInformationAssociation')
			local qualityOfPosition = spatialQuality and spatialQuality.qualityOfPosition

			if qualityOfPosition and qualityOfPosition ~=1 and qualityOfPosition ~= 10 and qualityOfPosition ~= 11 then
				dashedAssociations[#dashedAssociations + 1] = curveAssociation
			else
				solidAssociations[#solidAssociations + 1] = curveAssociation
			end
		end

		if #dashedAssociations > 0 then
			featurePortrayal:AddInstructions('PenDash;PenWidth:0.32;PenColor:DEPCN')

			local associations = {}

			for _, assoc in ipairs(dashedAssociations) do
				associations[#associations + 1] = InstructionSpatialReference(assoc)
			end

			featurePortrayal:AddInstructions('SpatialReferences:' .. table.concat(associations, ','))
		end

		if #solidAssociations > 0 then
			featurePortrayal:AddInstructions('PenSolid;PenWidth:0.32;PenColor:DEPCN')

			local associations = {}

			for _, assoc in ipairs(solidAssociations) do
				associations[#associations + 1] = InstructionSpatialReference(assoc)
			end

			featurePortrayal:AddInstructions('SpatialReferences:' .. table.concat(associations, ','))
		end

		Debug.StopPerformance('Lua Code - DEPCNT03 GenerateCurves')
	end

	local function GenerateLabels()
		--TODO: Check display priority for contour labels
		featurePortrayal:AddInstructions('ViewingGroup:33022')

		featurePortrayal:AddInstructions('LinePlacement:Relative,0.5')
		local instructions = SAFCON01(contextParameters, feature.valueOfDepthContour or 0.0)
		for i, instruction in ipairs(instructions) do
			featurePortrayal:AddInstructions(instruction)
		end
	end

	if (feature.valueOfDepthContour ~= contextParameters.SAFETY_CONTOUR) then
		GenerateCurves()
		GenerateLabels()
	else
		featurePortrayal:AddInstructions('Null')
	end

	Debug.StopPerformance('Lua Code - DEPCNT03')
end
