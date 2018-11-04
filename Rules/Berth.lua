-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function Berth(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point then
		-- Simplified and paper chart points use the same symbolization
		featurePortrayal:AddInstructions('ViewingGroup:32440;DrawingPriority:5;DisplayPlane:OverRADAR')
		featurePortrayal:AddInstructions('DrawSymbol:BRTHNO01')
		featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,0;FontSize:10;DrawText:' .. EncodeString('Nr %s', feature.featureName[1].name) .. '')
	elseif feature.PrimitiveType == PrimitiveType.Curve then
		featurePortrayal:AddInstructions('ViewingGroup:32440;DrawingPriority:5;DisplayPlane:OverRADAR')
		featurePortrayal:AddInstructions('PenWidth:0.96;PenColor:CHGRD')
		featurePortrayal:AddInstructions('PenSolid')
		featurePortrayal:AddInstructions('DrawLine')
		featurePortrayal:AddInstructions('DrawSymbol:BRTHNO01')
		featurePortrayal:AddInstructions('MoveRelativeLocal:0,0;TextAlignHorizontal:Center;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString('Nr %s', feature.featureName[1].name) .. '')
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		-- Plain and symbolized boundaries use the same symbolization
		featurePortrayal:AddInstructions('ViewingGroup:32440;DrawingPriority:3;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('DrawSymbol:BRTHNO01')
		featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,0;FontSize:10;DrawText:' .. EncodeString('Nr %s', feature.featureName[1].name) .. '')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
