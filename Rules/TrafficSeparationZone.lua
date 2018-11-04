-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function TrafficSeparationZone(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Surface then
		-- Plain and symbolized boundaries use the same symbolization
		featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:4;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('ColorFillArea:TRFCF,0.75')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
