-- Converter Version: 0.99.6547.27240

-- Referenced portrayal rules.
require 'DEPARE03'

-- Main entry point for feature type.
function DredgedArea(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Surface then
		-- Plain and symbolized boundaries use the same symbolization
		featurePortrayal:AddInstructions('ViewingGroup:13030;DrawingPriority:1;DisplayPlane:UnderRADAR')
		DEPARE03(feature, featurePortrayal, contextParameters)
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
