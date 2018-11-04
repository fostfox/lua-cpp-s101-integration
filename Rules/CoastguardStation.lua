-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function CoastguardStation(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point then
		-- Simplified and paper chart points use the same symbolization
		featurePortrayal:AddInstructions('ViewingGroup:38030;DrawingPriority:7;DisplayPlane:OverRADAR')
		featurePortrayal:AddInstructions('DrawSymbol:CGUSTA02')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
