-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function MagneticVariation(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point then
		-- Simplified and paper chart points use the same symbolization
		featurePortrayal:AddInstructions('ViewingGroup:31080;DrawingPriority:4;DisplayPlane:OverRADAR')
		featurePortrayal:AddInstructions('DrawSymbol:MAGVAR01')
		featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,3.51;FontSize:10;DrawText:' .. EncodeString(feature['valueOfMagneticVariation']) .. '')
	elseif feature.PrimitiveType == PrimitiveType.Curve then
		featurePortrayal:AddInstructions('ViewingGroup:31080;DrawingPriority:4;DisplayPlane:OverRADAR')
		featurePortrayal:AddInstructions('PenWidth:0.64;PenColor:CHMGF')
		featurePortrayal:AddInstructions('PenSolid')
		featurePortrayal:AddInstructions('DrawLine')
		featurePortrayal:AddInstructions('DrawSymbol:MAGVAR51')
		featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,3.51;FontSize:10;DrawText:' .. EncodeString('varn %3.2f', feature.valueOfMagneticVariation) .. '')
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		-- Plain and symbolized boundaries use the same symbolization
		featurePortrayal:AddInstructions('ViewingGroup:31080;DrawingPriority:4;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('DrawSymbol:MAGVAR51')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
