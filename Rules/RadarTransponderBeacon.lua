-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function RadarTransponderBeacon(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point then
		-- Simplified and paper chart points use the same symbolization
		featurePortrayal:AddInstructions('ViewingGroup:27210;DrawingPriority:6;DisplayPlane:OverRADAR')
		featurePortrayal:AddInstructions('DrawSymbol:RTPBCN02')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
