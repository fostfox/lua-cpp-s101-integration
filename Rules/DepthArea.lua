-- Converter Version: 0.99.6547.27240

-- Referenced portrayal rules.
require 'DEPARE03'

-- Main entry point for feature type.
function DepthArea(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Curve then
		featurePortrayal:AddInstructions('Null')
	elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
		if feature.depthRangeMinimumValue == unknownValue and feature.depthRangeMaximumValue == unknownValue then
			featurePortrayal:AddInstructions('ViewingGroup:13030;DrawingPriority:1;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFillArea:NODTA')
			featurePortrayal:AddInstructions('FillArea:PRTSUR01')
			featurePortrayal:AddInstructions('PenWidth:0.64;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		else
			featurePortrayal:AddInstructions('ViewingGroup:13030;DrawingPriority:1;DisplayPlane:UnderRADAR')
			DEPARE03(feature, featurePortrayal, contextParameters)
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		if feature.depthRangeMinimumValue == unknownValue and feature.depthRangeMaximumValue == unknownValue then
			featurePortrayal:AddInstructions('ViewingGroup:13030;DrawingPriority:1;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFillArea:NODTA')
			featurePortrayal:AddInstructions('FillArea:PRTSUR01')
			featurePortrayal:AddInstructions('PenWidth:0.64;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		else
			featurePortrayal:AddInstructions('ViewingGroup:13030;DrawingPriority:1;DisplayPlane:UnderRADAR')
			DEPARE03(feature, featurePortrayal, contextParameters)
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
