-- Converter Version: 0.99
-- Feature Catalogue Version: 1.0.0 (2018/9/6)

-- Referenced portrayal rules.
require 'RESTRN01'

-- Precautionary area main entry point.
function PrecautionaryArea(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point then
		-- Simplified and paper chart points use the same symbolization
		if contextParameters.RADAR_OVERLAY then
			featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:5;DisplayPlane:OverRADAR')
		else
			featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:5;DisplayPlane:UnderRADAR')
		end
		featurePortrayal:AddInstructions('PointInstruction:PRCARE12')
	elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
		featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:4;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('PointInstruction:PRCARE51')
		featurePortrayal:SimpleLineStyle('dash',0.64,'TRFCD')
		featurePortrayal:AddInstructions('LineInstruction:')
		RESTRN01(feature, featurePortrayal, contextParameters)
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:4;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('AreaFillReference:TSSJCT02')
		featurePortrayal:AddInstructions('PointInstruction:PRCARE51')
		featurePortrayal:AddInstructions('LineInstruction:PRCARE51')
		RESTRN01(feature, featurePortrayal, contextParameters)
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
