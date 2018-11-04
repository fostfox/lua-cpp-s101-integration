-- Converter Version: 0.99.6547.27240

-- Referenced portrayal rules.
require 'SOUNDG03'

-- Main entry point for feature type.
function Sounding(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.MultiPoint then
		-- Simplified and paper chart points use the same symbolization
		featurePortrayal:AddInstructions('ViewingGroup:33010;DrawingPriority:6;DisplayPlane:OverRADAR')
		SOUNDG03(feature, featurePortrayal, contextParameters)
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
