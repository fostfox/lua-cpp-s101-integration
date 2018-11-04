-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function OffshorePlatform(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point then
		-- Simplified and paper chart points use the same symbolization
		featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:5;DisplayPlane:OverRADAR')
		featurePortrayal:AddInstructions('DrawSymbol:OFSPLF01')
		if feature.featureName[1] and feature.featureName[1].name then
			featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,3.51;FontSize:10;DrawText:' .. EncodeString('Prod %s', feature.featureName[1].name) .. '')
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		-- Plain and symbolized boundaries use the same symbolization
		featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:5;DisplayPlane:OverRADAR')
		featurePortrayal:AddInstructions('ColorFillArea:CHBRN')
		featurePortrayal:AddInstructions('PenWidth:1.28;PenColor:CSTLN')
		featurePortrayal:AddInstructions('PenSolid')
		featurePortrayal:AddInstructions('DrawLine')
		if feature.featureName[1] and feature.featureName[1].name then
			featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,3.51;FontSize:10;DrawText:' .. EncodeString('Prod %s', feature.featureName[1].name) .. '')
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
