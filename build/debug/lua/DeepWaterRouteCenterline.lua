-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function DeepWaterRouteCenterline(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Curve then
		if feature.categoryOfRecommendedTrack == 1 and feature.trafficFlow == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:DWRTCL08')
			featurePortrayal:AddInstructions('MoveRelativeLocal:0,3.51;TextAlignHorizontal:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
		elseif feature.categoryOfRecommendedTrack == 1 and feature.trafficFlow == 2 then
			featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:DWRTCL08')
			featurePortrayal:AddInstructions('MoveRelativeLocal:0,3.51;TextAlignHorizontal:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
		elseif feature.categoryOfRecommendedTrack == 1 and feature.trafficFlow == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:DWRTCL08')
			featurePortrayal:AddInstructions('MoveRelativeLocal:0,3.51;TextAlignHorizontal:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
		elseif feature.categoryOfRecommendedTrack == 1 and feature.trafficFlow == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:DWRTCL06')
			featurePortrayal:AddInstructions('MoveRelativeLocal:0,3.51;TextAlignHorizontal:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
		elseif feature.categoryOfRecommendedTrack == 2 and feature.trafficFlow == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:DWRTCL07')
			featurePortrayal:AddInstructions('MoveRelativeLocal:0,3.51;TextAlignHorizontal:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
		elseif feature.categoryOfRecommendedTrack == 2 and feature.trafficFlow == 2 then
			featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:DWRTCL07')
			featurePortrayal:AddInstructions('MoveRelativeLocal:0,3.51;TextAlignHorizontal:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
		elseif feature.categoryOfRecommendedTrack == 2 and feature.trafficFlow == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:DWRTCL07')
			featurePortrayal:AddInstructions('MoveRelativeLocal:0,3.51;TextAlignHorizontal:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
		elseif feature.categoryOfRecommendedTrack == 2 and feature.trafficFlow == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:DWRTCL05')
			featurePortrayal:AddInstructions('MoveRelativeLocal:0,3.51;TextAlignHorizontal:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
		elseif feature.trafficFlow == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:DWRTCL07')
			featurePortrayal:AddInstructions('MoveRelativeLocal:0,3.51;TextAlignHorizontal:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
		elseif feature.trafficFlow == 2 then
			featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:DWRTCL07')
			featurePortrayal:AddInstructions('MoveRelativeLocal:0,3.51;TextAlignHorizontal:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
		elseif feature.trafficFlow == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:DWRTCL07')
			featurePortrayal:AddInstructions('MoveRelativeLocal:0,3.51;TextAlignHorizontal:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
		elseif feature.trafficFlow == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:DWRTCL05')
			featurePortrayal:AddInstructions('MoveRelativeLocal:0,3.51;TextAlignHorizontal:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
		else
			featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:DWLDEF01')
			featurePortrayal:AddInstructions('MoveRelativeLocal:0,3.51;TextAlignHorizontal:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
