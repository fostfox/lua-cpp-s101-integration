-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function RecommendedRouteCenterline(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Curve then
		if feature.categoryOfRecommendedTrack == 1 and feature.trafficFlow == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:RCRTCL14')
			if feature.orientation and feature.orientation.orientationValue then
				featurePortrayal:AddInstructions('MoveRelativeLocal:0,3.51;TextAlignHorizontal:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
			end
		elseif feature.categoryOfRecommendedTrack == 1 and feature.trafficFlow == 2 then
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:RCRTCL14')
			if feature.orientation and feature.orientation.orientationValue then
				featurePortrayal:AddInstructions('MoveRelativeLocal:0,3.51;TextAlignHorizontal:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
			end
		elseif feature.categoryOfRecommendedTrack == 1 and feature.trafficFlow == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:RCRTCL14')
			if feature.orientation and feature.orientation.orientationValue then
				featurePortrayal:AddInstructions('MoveRelativeLocal:0,3.51;TextAlignHorizontal:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
			end
		elseif feature.categoryOfRecommendedTrack == 1 and feature.trafficFlow == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:RCRTCL13')
			if feature.orientation and feature.orientation.orientationValue then
				featurePortrayal:AddInstructions('MoveRelativeLocal:0,3.51;TextAlignHorizontal:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
			end
		elseif feature.categoryOfRecommendedTrack == 2 and feature.trafficFlow == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:RCRTCL12')
			if feature.orientation and feature.orientation.orientationValue then
				featurePortrayal:AddInstructions('MoveRelativeLocal:0,3.51;TextAlignHorizontal:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
			end
		elseif feature.categoryOfRecommendedTrack == 2 and feature.trafficFlow == 2 then
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:RCRTCL12')
			if feature.orientation and feature.orientation.orientationValue then
				featurePortrayal:AddInstructions('MoveRelativeLocal:0,3.51;TextAlignHorizontal:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
			end
		elseif feature.categoryOfRecommendedTrack == 2 and feature.trafficFlow == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:RCRTCL12')
			if feature.orientation and feature.orientation.orientationValue then
				featurePortrayal:AddInstructions('MoveRelativeLocal:0,3.51;TextAlignHorizontal:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
			end
		elseif feature.categoryOfRecommendedTrack == 2 and feature.trafficFlow == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:RCRTCL11')
			if feature.orientation and feature.orientation.orientationValue then
				featurePortrayal:AddInstructions('MoveRelativeLocal:0,3.51;TextAlignHorizontal:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
			end
		elseif feature.trafficFlow == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:RCRTCL12')
			if feature.orientation and feature.orientation.orientationValue then
				featurePortrayal:AddInstructions('MoveRelativeLocal:0,3.51;TextAlignHorizontal:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
			end
		elseif feature.trafficFlow == 2 then
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:RCRTCL12')
			if feature.orientation and feature.orientation.orientationValue then
				featurePortrayal:AddInstructions('MoveRelativeLocal:0,3.51;TextAlignHorizontal:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
			end
		elseif feature.trafficFlow == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:RCRTCL12')
			if feature.orientation and feature.orientation.orientationValue then
				featurePortrayal:AddInstructions('MoveRelativeLocal:0,3.51;TextAlignHorizontal:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
			end
		elseif feature.trafficFlow == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:RCRTCL11')
			if feature.orientation and feature.orientation.orientationValue then
				featurePortrayal:AddInstructions('MoveRelativeLocal:0,3.51;TextAlignHorizontal:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
			end
		else
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:RCRDEF11')
			if feature.orientation and feature.orientation.orientationValue then
				featurePortrayal:AddInstructions('MoveRelativeLocal:0,3.51;TextAlignHorizontal:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
			end
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
