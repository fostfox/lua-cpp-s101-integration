-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function NavigationLine(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Curve then
		if feature.categoryOfNavigationLine == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
			featurePortrayal:AddInstructions('MoveRelativeLocal:0,3.51;TextAlignHorizontal:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
		elseif feature.categoryOfNavigationLine == 2 then
			featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
			featurePortrayal:AddInstructions('MoveRelativeLocal:0,3.51;TextAlignHorizontal:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
		else
			featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
