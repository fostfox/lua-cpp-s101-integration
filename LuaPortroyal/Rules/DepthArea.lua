-- Converter Version: 0.99
-- Feature Catalogue Version: 1.0.0 (2018/9/6)

-- Referenced portrayal rules.
require 'DEPARE03'

-- Depth area main entry point.
function DepthArea(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Curve then
		featurePortrayal:AddInstructions('NullInstruction')
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		-- Plain and symbolized boundaries use the same symbolization
		featurePortrayal:AddInstructions('ViewingGroup:13030;DrawingPriority:1;DisplayPlane:UnderRADAR')
		DEPARE03(feature, featurePortrayal, contextParameters)
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
