-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function River(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Curve then
		featurePortrayal:AddInstructions('ViewingGroup:12420;DrawingPriority:2;DisplayPlane:OverRADAR')
		featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHBLK')
		featurePortrayal:AddInstructions('PenSolid')
		featurePortrayal:AddInstructions('DrawLine')
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		-- Plain and symbolized boundaries use the same symbolization
		featurePortrayal:AddInstructions('ViewingGroup:12420;DrawingPriority:2;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('ColorFillArea:DEPVS')
		featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHBLK')
		featurePortrayal:AddInstructions('PenSolid')
		featurePortrayal:AddInstructions('DrawLine')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
