-- Converter Version: 0.99
-- Feature Catalogue Version: 1.0.0 (2018/9/6)

-- Referenced portrayal rules.
require 'RESTRN01'

-- Cable area main entry point.
function CableArea(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
		featurePortrayal:AddInstructions('ViewingGroup:34030;DrawingPriority:3;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('PointInstruction:CBLARE51')
		featurePortrayal:SimpleLineStyle('dash',0.64,'CHMGD')
		featurePortrayal:AddInstructions('LineInstruction:')
		RESTRN01(feature, featurePortrayal, contextParameters)
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		featurePortrayal:AddInstructions('ViewingGroup:34030;DrawingPriority:3;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('PointInstruction:CBLARE51')
		featurePortrayal:AddInstructions('LineInstruction:CBLARE51')
		RESTRN01(feature, featurePortrayal, contextParameters)
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
