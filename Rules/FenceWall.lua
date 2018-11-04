-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function FenceWall(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Curve then
		if feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:3;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHBLK')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		else
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:3;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:LANDF')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
