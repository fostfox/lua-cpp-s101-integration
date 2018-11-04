-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function CustomZone(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Surface then
		-- Plain and symbolized boundaries use the same symbolization
		featurePortrayal:AddInstructions('ViewingGroup:36020;DrawingPriority:2;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHGRF')
		featurePortrayal:AddInstructions('PenDash')
		featurePortrayal:AddInstructions('DrawLine')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
