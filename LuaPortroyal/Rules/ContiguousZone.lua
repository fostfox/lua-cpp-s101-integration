-- Converter Version: 0.99
-- Feature Catalogue Version: 1.0.0 (2018/9/6)

-- Contiguous zone main entry point.
function ContiguousZone(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Surface then
		-- Plain and symbolized boundaries use the same symbolization
		featurePortrayal:AddInstructions('ViewingGroup:36050;DrawingPriority:2;DisplayPlane:UnderRADAR')
		featurePortrayal:SimpleLineStyle('dash',0.64,'CHGRF')
		featurePortrayal:AddInstructions('LineInstruction:')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
