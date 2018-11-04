-- SLCONS04 conditional symbology rules file.

-- Referenced CSPs.
require 'QUAPNT02'

-- Main entry point for CSP.
function SLCONS04(feature, featurePortrayal, contextParameters)
	Debug.StartPerformance('Lua Code - SLCONS04')

	if feature.PrimitiveType == PrimitiveType.Point then
		Debug.StopPerformance('Lua Code - SLCONS04')
		local symbol = QUAPNT02(feature, featurePortrayal, contextParameters)
		Debug.StartPerformance('Lua Code - SLCONS04')

		if symbol then
			--Debug.Break()
			featurePortrayal:AddInstructions('ViewingGroup:31011;DrawSymbol:' .. symbol)
		end
	else
		Debug.StopPerformance('Lua Code - SLCONS04')
		Debug.StartPerformance('Lua Code - SLCONS04 GetFlattenedSpatialAssociations')
		for curveAssociation in feature:GetFlattenedSpatialAssociations() do
			Debug.StopPerformance('Lua Code - SLCONS04 GetFlattenedSpatialAssociations')
			Debug.StartPerformance('Lua Code - SLCONS04')
			featurePortrayal:AddInstructions('SpatialReferences:' .. InstructionSpatialReference(curveAssociation))

			local spatialQuality = curveAssociation.Spatial:GetInformationAssociation('spatialQuality')
			local qualityOfPosition = spatialQuality and spatialQuality.qualityOfPosition

			if qualityOfPosition and qualityOfPosition ~=1 and qualityOfPosition ~= 10 and qualityOfPosition ~= 11 then
				featurePortrayal:AddInstructions('DrawComplexLinestyle:LOWACC21')
			else
				local condition = feature.condition
				local categoryOfShorelineConstruction = feature.categoryOfShorelineConstruction
				local waterLevelEffect = feature.waterLevelEffect

				if condition == 1 and contains(condition, {1, 2}) then
					featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CSTLN;PenDash;DrawLine')
				elseif contains(categoryOfShorelineConstruction, {6, 15, 16}) then
					featurePortrayal:AddInstructions('PenWidth:1.28;PenColor:CSTLN;PenSolid;DrawLine')
				elseif contains(waterLevelEffect, {3, 4}) then
					featurePortrayal:AddInstructions('PenWidth:0.64;PenColor:CSTLN;PenDash;DrawLine')
				else
					featurePortrayal:AddInstructions('PenWidth:0.64;PenColor:CSTLN;PenSolid;DrawLine')
				end
			end
		end
	end

	Debug.StopPerformance('Lua Code - SLCONS04')
end
