-- QUALIN02 conditional symbology rules file.

-- Main entry point for CSP.
function QUALIN02(feature, featurePortrayal, contextParameters)
	Debug.StartPerformance('Lua Code - QUALIN02')

	for curveAssociation in feature:GetFlattenedSpatialAssociations() do
		featurePortrayal:AddInstructions('SpatialReferences:' .. InstructionSpatialReference(curveAssociation))

		local spatialQuality = curveAssociation.Spatial:GetInformationAssociation('spatialQuality')
		local qualityOfPosition = spatialQuality and spatialQuality.qualityOfPosition

		if qualityOfPosition and qualityOfPosition ~=1 and qualityOfPosition ~= 10 and qualityOfPosition ~= 11 then
			featurePortrayal:AddInstructions('DrawComplexLinestyle:LOWACC21');
		elseif feature.Code == 'Coastline' then
			if feature.radarConspicuous == 1 then
				featurePortrayal:AddInstructions('PenWidth:0.96;PenColor:CHMGF;PenSolid;DrawLine');
			end

			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CSTLN;PenSolid;DrawLine');
		else
			-- Must be LandArea
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CSTLN;PenSolid;DrawLine');
		end
	end

	Debug.StopPerformance('Lua Code - QUALIN02')
end
