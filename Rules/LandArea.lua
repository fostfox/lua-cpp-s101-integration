-- Converter Version: 0.99.6547.27240

-- Referenced portrayal rules.
require 'QUAPOS01'

-- Main entry point for feature type.
function LandArea(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point then
		-- Simplified and paper chart points use the same symbolization
		featurePortrayal:AddInstructions('ViewingGroup:12010;DrawingPriority:4;DisplayPlane:OverRADAR')
		featurePortrayal:AddInstructions('DrawSymbol:LNDARE01')
		if feature.featureName[1] and feature.featureName[1].name then
			featurePortrayal:AddInstructions('MoveRelativeLocal:0,-3.51;TextAlignHorizontal:Center;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString(feature.featureName[1]['name']) .. '')
		end
		QUAPOS01(feature, featurePortrayal, contextParameters)
	elseif feature.PrimitiveType == PrimitiveType.Curve then
		featurePortrayal:AddInstructions('ViewingGroup:12010;DrawingPriority:8;DisplayPlane:OverRADAR')
		QUAPOS01(feature, featurePortrayal, contextParameters)
		if feature.featureName[1] and feature.featureName[1].name then
			featurePortrayal:AddInstructions('MoveRelativeLocal:0,-3.51;TextAlignHorizontal:Center;FontSize:10;DrawText:' .. EncodeString(feature.featureName[1]['name']) .. '')
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		-- Plain and symbolized boundaries use the same symbolization
		featurePortrayal:AddInstructions('ViewingGroup:12010;DrawingPriority:1;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('ColorFillArea:LANDA')
		if feature.featureName[1] and feature.featureName[1].name then
			featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:Center;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString(feature.featureName[1]['name']) .. '')
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
