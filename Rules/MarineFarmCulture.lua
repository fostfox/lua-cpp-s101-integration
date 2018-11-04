-- Converter Version: 0.99.6547.27240

-- Referenced portrayal rules.
require 'RESTRN01'

-- Main entry point for feature type.
function MarineFarmCulture(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point then
		-- Simplified and paper chart points use the same symbolization
		featurePortrayal:AddInstructions('ViewingGroup:26210;DrawingPriority:4;DisplayPlane:OverRADAR')
		featurePortrayal:AddInstructions('DrawSymbol:MARCUL02')
	elseif feature.PrimitiveType == PrimitiveType.Curve then
		featurePortrayal:AddInstructions('ViewingGroup:26210;DrawingPriority:4;DisplayPlane:OverRADAR')
		featurePortrayal:AddInstructions('PenWidth:0.64;PenColor:CHGRF')
		featurePortrayal:AddInstructions('PenDash')
		featurePortrayal:AddInstructions('DrawLine')
	elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
		featurePortrayal:AddInstructions('ViewingGroup:26210;DrawingPriority:3;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('FillArea:MARCUL02')
		featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHGRD')
		featurePortrayal:AddInstructions('PenDash')
		featurePortrayal:AddInstructions('DrawLine')
		RESTRN01(feature, featurePortrayal, contextParameters)
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		featurePortrayal:AddInstructions('ViewingGroup:26210;DrawingPriority:3;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('FillArea:MARCUL02')
		featurePortrayal:AddInstructions('DrawComplexLinestyle:NAVARE51')
		RESTRN01(feature, featurePortrayal, contextParameters)
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
