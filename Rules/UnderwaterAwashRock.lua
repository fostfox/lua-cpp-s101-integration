-- Converter Version: 0.99.6547.27240

-- Referenced portrayal rules.
require 'OBSTRN07'

-- Main entry point for feature type.
function UnderwaterAwashRock(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point then
		-- Simplified and paper chart points use the same symbolization
		featurePortrayal:AddInstructions('ViewingGroup:34050;DrawingPriority:4;DisplayPlane:OverRADAR')
		OBSTRN07(feature, featurePortrayal, contextParameters)
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
