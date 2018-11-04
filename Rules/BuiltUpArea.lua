-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function BuiltUpArea(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point then
		-- Simplified and paper chart points use the same symbolization
		featurePortrayal:AddInstructions('ViewingGroup:22240;DrawingPriority:3;DisplayPlane:OverRADAR')
		featurePortrayal:AddInstructions('DrawSymbol:BUAARE02')
		if feature.featureName[1] and feature.featureName[1].name then
			featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,0;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString(feature.featureName[1]['name']) .. '')
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		-- Plain and symbolized boundaries use the same symbolization
		featurePortrayal:AddInstructions('ViewingGroup:22240;DrawingPriority:3;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('ColorFillArea:CHBRN')
		if feature.featureName[1] and feature.featureName[1].name then
			featurePortrayal:AddInstructions('MoveRelativeLocal:0,0;TextAlignHorizontal:Center;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString(feature.featureName[1]['name']) .. '')
		end
		featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:LANDF')
		featurePortrayal:AddInstructions('PenSolid')
		featurePortrayal:AddInstructions('DrawLine')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
