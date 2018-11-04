-- Converter Version: 0.99.6547.27240

-- Referenced portrayal rules.
require 'RESTRN01'

-- Main entry point for feature type.
function AnchorageArea(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point then
		-- Simplified and paper chart points use the same symbolization
		featurePortrayal:AddInstructions('ViewingGroup:26220;DrawingPriority:6;DisplayPlane:OverRADAR')
		featurePortrayal:AddInstructions('DrawSymbol:ACHARE02')
		if feature.featureName[1] and feature.featureName[1].name then
			featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,-7.02;FontSize:10;DrawText:' .. EncodeString(feature.featureName[1]['name']) .. '')
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
		if feature.categoryOfAnchorage[1] == 8 then
			featurePortrayal:AddInstructions('ViewingGroup:26220;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:ACHARE02')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,7.02;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString(feature.featureName[1]['name']) .. '')
			end
			featurePortrayal:AddInstructions('PenWidth:0.64;PenColor:CHMGF')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
			RESTRN01(feature, featurePortrayal, contextParameters)
		else
			featurePortrayal:AddInstructions('ViewingGroup:26220;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:ACHARE51')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,-7.02;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString(feature.featureName[1]['name']) .. '')
			end
			featurePortrayal:AddInstructions('PenWidth:0.64;PenColor:CHMGF')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
			RESTRN01(feature, featurePortrayal, contextParameters)
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		if feature.categoryOfAnchorage[1] == 8 then
			featurePortrayal:AddInstructions('ViewingGroup:26220;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:ACHARE02')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,7.02;FontSize:10;DrawText:' .. EncodeString(feature.featureName[1]['name']) .. '')
			end
			featurePortrayal:AddInstructions('PenWidth:0.64;PenColor:CHMGF')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
			RESTRN01(feature, featurePortrayal, contextParameters)
		else
			featurePortrayal:AddInstructions('ViewingGroup:26220;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:ACHARE51')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,7.02;FontSize:10;DrawText:' .. EncodeString(feature.featureName[1]['name']) .. '')
			end
			featurePortrayal:AddInstructions('DrawComplexLinestyle:ACHARE51')
			RESTRN01(feature, featurePortrayal, contextParameters)
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
