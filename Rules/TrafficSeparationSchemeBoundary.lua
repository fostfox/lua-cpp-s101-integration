-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function TrafficSeparationSchemeBoundary(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Curve then
		featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:7;DisplayPlane:OverRADAR')
		featurePortrayal:AddInstructions('PenWidth:1.28;PenColor:TRFCD')
		featurePortrayal:AddInstructions('PenDash')
		featurePortrayal:AddInstructions('DrawLine')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
