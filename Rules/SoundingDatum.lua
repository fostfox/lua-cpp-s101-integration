-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function SoundingDatum(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Surface then
		-- Plain and symbolized boundaries use the same symbolization
		featurePortrayal:AddInstructions('ViewingGroup:31010;DrawingPriority:0;DisplayPlane:UnderRADAR')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
