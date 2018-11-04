-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function CableSubmarine(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Curve then
		if feature.categoryOfCable == 6 then
			featurePortrayal:AddInstructions('ViewingGroup:24010;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHMGD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		else
			featurePortrayal:AddInstructions('ViewingGroup:34070;DrawingPriority:3;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:CBLSUB06')
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
