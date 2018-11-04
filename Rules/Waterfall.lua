-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function Waterfall(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point then
		-- Simplified and paper chart points use the same symbolization
		featurePortrayal:AddInstructions('Null')
	elseif feature.PrimitiveType == PrimitiveType.Curve then
		if feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:32050;DrawingPriority:3;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:0.96;PenColor:CHWHT')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		else
			featurePortrayal:AddInstructions('ViewingGroup:32050;DrawingPriority:3;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:0.96;PenColor:CHGRF')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
