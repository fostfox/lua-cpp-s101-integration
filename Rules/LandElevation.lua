-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function LandElevation(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point then
		-- Simplified and paper chart points use the same symbolization
		featurePortrayal:AddInstructions('ViewingGroup:32010;DrawingPriority:4;DisplayPlane:OverRADAR')
		featurePortrayal:AddInstructions('DrawSymbol:POSGEN04')
		featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,0;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString('%3.0f m', feature.elevation) .. '')
	elseif feature.PrimitiveType == PrimitiveType.Curve then
		featurePortrayal:AddInstructions('ViewingGroup:32010;DrawingPriority:4;DisplayPlane:OverRADAR')
		featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:LANDF')
		featurePortrayal:AddInstructions('PenSolid')
		featurePortrayal:AddInstructions('DrawLine')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
