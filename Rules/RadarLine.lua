-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function RadarLine(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Curve then
		featurePortrayal:AddInstructions('ViewingGroup:25040;DrawingPriority:6;DisplayPlane:OverRADAR')
		featurePortrayal:AddInstructions('PenWidth:0.64;PenColor:TRFCD')
		featurePortrayal:AddInstructions('PenDash')
		featurePortrayal:AddInstructions('DrawLine')
		featurePortrayal:AddInstructions('MoveRelativeLocal:0,3.51;TextAlignHorizontal:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
