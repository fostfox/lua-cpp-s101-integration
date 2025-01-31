-- Information area main entry point.
function InformationArea(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point then
		-- Simplified and paper chart points use the same symbolization
		if contextParameters.RADAR_OVERLAY then
			featurePortrayal:AddInstructions('ViewingGroup:26200;DrawingPriority:4;DisplayPlane:OverRADAR')
		else
			featurePortrayal:AddInstructions('ViewingGroup:26200;DrawingPriority:4;DisplayPlane:UnderRADAR')
		end
		featurePortrayal:AddInstructions('PointInstruction:testPCB')
	elseif feature.PrimitiveType == PrimitiveType.Curve then
		featurePortrayal:AddInstructions('ViewingGroup:26200;DrawingPriority:4;DisplayPlane:UnderRADAR')
		featurePortrayal:SimpleLineStyle('dash',0.64,'CHGRD')
		featurePortrayal:AddInstructions('LineInstruction:')
		--featurePortrayal:AddInstructions('LineInstruction:testPCB')
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		-- Plain and symbolized boundaries use the same symbolization
		featurePortrayal:AddInstructions('ViewingGroup:26200;DrawingPriority:4;DisplayPlane:UnderRADAR')
		featurePortrayal:SimpleLineStyle('dash',0.64,'CHGRD')
		featurePortrayal:AddInstructions('LineInstruction:')
		--featurePortrayal:AddInstructions('PointInstruction:testPCB')
		--featurePortrayal:AddInstructions('LineInstruction:testPCB')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
