-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function TrafficSeparationLine(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Curve then
		featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:8;DisplayPlane:OverRADAR')
		featurePortrayal:AddInstructions('PenWidth:1.92;PenColor:TRFCF')
		featurePortrayal:AddInstructions('PenSolid')
		featurePortrayal:AddInstructions('DrawLine')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
