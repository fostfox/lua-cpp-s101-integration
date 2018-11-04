-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function AnchorBerth(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point then
		-- Simplified and paper chart points use the same symbolization
		featurePortrayal:AddInstructions('ViewingGroup:26220;DrawingPriority:5;DisplayPlane:OverRADAR')
		featurePortrayal:AddInstructions('DrawSymbol:ACHBRT07')
		if feature.featureName[1] and feature.featureName[1].name then
			featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,0;FontSize:10;DrawText:' .. EncodeString('Nr %s', feature.featureName[1].name) .. '')
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		-- Plain and symbolized boundaries use the same symbolization
		featurePortrayal:AddInstructions('ViewingGroup:26220;DrawingPriority:5;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('DrawSymbol:ACHBRT07')
		if feature.featureName[1] and feature.featureName[1].name then
			featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,0;FontSize:10;DrawText:' .. EncodeString('Nr %s', feature.featureName[1].name) .. '')
		end
		featurePortrayal:AddInstructions('PenWidth:0.64;PenColor:CHMGF')
		featurePortrayal:AddInstructions('PenDash')
		featurePortrayal:AddInstructions('DrawLine')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
