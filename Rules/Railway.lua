-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function Railway(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Curve then
		featurePortrayal:AddInstructions('ViewingGroup:32250;DrawingPriority:4;DisplayPlane:OverRADAR')
		featurePortrayal:AddInstructions('PenWidth:0.64;PenColor:LANDF')
		featurePortrayal:AddInstructions('PenSolid')
		featurePortrayal:AddInstructions('DrawLine')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
