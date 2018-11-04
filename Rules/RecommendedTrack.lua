-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function RecommendedTrack(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Curve then
		if feature.categoryOfRecommendedTrack == 1 and feature.trafficFlow == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:RECTRC12')
			featurePortrayal:AddInstructions('MoveRelativeLocal:0,3.51;TextAlignHorizontal:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
		elseif feature.categoryOfRecommendedTrack == 1 and feature.trafficFlow == 2 then
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:RECTRC12')
			featurePortrayal:AddInstructions('MoveRelativeLocal:0,3.51;TextAlignHorizontal:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
		elseif feature.categoryOfRecommendedTrack == 1 and feature.trafficFlow == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:RECTRC12')
			featurePortrayal:AddInstructions('MoveRelativeLocal:0,3.51;TextAlignHorizontal:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
		elseif feature.categoryOfRecommendedTrack == 1 and feature.trafficFlow == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:RECTRC10')
			featurePortrayal:AddInstructions('MoveRelativeLocal:0,3.51;TextAlignHorizontal:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
		elseif feature.categoryOfRecommendedTrack == 2 and feature.trafficFlow == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:RECTRC11')
			featurePortrayal:AddInstructions('MoveRelativeLocal:0,3.51;TextAlignHorizontal:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
		elseif feature.categoryOfRecommendedTrack == 2 and feature.trafficFlow == 2 then
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:RECTRC11')
			featurePortrayal:AddInstructions('MoveRelativeLocal:0,3.51;TextAlignHorizontal:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
		elseif feature.categoryOfRecommendedTrack == 2 and feature.trafficFlow == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:RECTRC11')
			featurePortrayal:AddInstructions('MoveRelativeLocal:0,3.51;TextAlignHorizontal:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
		elseif feature.categoryOfRecommendedTrack == 2 and feature.trafficFlow == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:RECTRC09')
			featurePortrayal:AddInstructions('MoveRelativeLocal:0,3.51;TextAlignHorizontal:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
		elseif feature.trafficFlow == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:RECTRC11')
			featurePortrayal:AddInstructions('MoveRelativeLocal:0,3.51;TextAlignHorizontal:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
		elseif feature.trafficFlow == 2 then
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:RECTRC11')
			featurePortrayal:AddInstructions('MoveRelativeLocal:0,3.51;TextAlignHorizontal:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
		elseif feature.trafficFlow == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:RECTRC11')
			featurePortrayal:AddInstructions('MoveRelativeLocal:0,3.51;TextAlignHorizontal:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
		elseif feature.trafficFlow == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:RECTRC09')
			featurePortrayal:AddInstructions('MoveRelativeLocal:0,3.51;TextAlignHorizontal:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
		else
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:RECDEF02')
			featurePortrayal:AddInstructions('MoveRelativeLocal:0,3.51;TextAlignHorizontal:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
		if feature.orientation and feature.orientation.orientationValue and feature.categoryOfRecommendedTrack == 1 and feature.trafficFlow == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:6;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:RECTRC58')
			featurePortrayal:AddInstructions('MoveRelativeLocal:14.04,0;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.orientation and feature.orientation.orientationValue and feature.categoryOfRecommendedTrack == 1 and feature.trafficFlow == 2 then
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:6;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:RECTRC58')
			featurePortrayal:AddInstructions('MoveRelativeLocal:14.04,0;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.orientation and feature.orientation.orientationValue and feature.categoryOfRecommendedTrack == 1 and feature.trafficFlow == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:6;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:RECTRC58')
			featurePortrayal:AddInstructions('MoveRelativeLocal:14.04,0;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.orientation and feature.orientation.orientationValue and feature.categoryOfRecommendedTrack == 1 and feature.trafficFlow == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:6;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:RECTRC56')
			featurePortrayal:AddInstructions('MoveRelativeLocal:14.04,0;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.orientation and feature.orientation.orientationValue and feature.categoryOfRecommendedTrack == 2 and feature.trafficFlow == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:6;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:RECTRC57')
			featurePortrayal:AddInstructions('MoveRelativeLocal:14.04,0;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.orientation and feature.orientation.orientationValue and feature.categoryOfRecommendedTrack == 2 and feature.trafficFlow == 2 then
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:6;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:RECTRC57')
			featurePortrayal:AddInstructions('MoveRelativeLocal:14.04,0;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.orientation and feature.orientation.orientationValue and feature.categoryOfRecommendedTrack == 2 and feature.trafficFlow == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:6;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:RECTRC57')
			featurePortrayal:AddInstructions('MoveRelativeLocal:14.04,0;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.orientation and feature.orientation.orientationValue and feature.categoryOfRecommendedTrack == 2 and feature.trafficFlow == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:6;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:RECTRC55')
			featurePortrayal:AddInstructions('MoveRelativeLocal:14.04,0;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:6;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:RECTRC57')
			featurePortrayal:AddInstructions('MoveRelativeLocal:14.04,0;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 2 then
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:6;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:RECTRC57')
			featurePortrayal:AddInstructions('MoveRelativeLocal:14.04,0;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:6;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:RECTRC57')
			featurePortrayal:AddInstructions('MoveRelativeLocal:14.04,0;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:6;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:RECTRC55')
			featurePortrayal:AddInstructions('MoveRelativeLocal:14.04,0;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		else
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:6;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:RECDEF51')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		if feature.orientation and feature.orientation.orientationValue and feature.categoryOfRecommendedTrack == 1 and feature.trafficFlow == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:6;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:RECTRC58')
			featurePortrayal:AddInstructions('MoveRelativeLocal:14.04,0;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString('%03.0fdeg', feature.orientation.orientationValue) .. '')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:NAVARE51')
		elseif feature.orientation and feature.orientation.orientationValue and feature.categoryOfRecommendedTrack == 1 and feature.trafficFlow == 2 then
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:6;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:RECTRC58')
			featurePortrayal:AddInstructions('MoveRelativeLocal:14.04,0;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:NAVARE51')
		elseif feature.orientation and feature.orientation.orientationValue and feature.categoryOfRecommendedTrack == 1 and feature.trafficFlow == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:6;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:RECTRC58')
			featurePortrayal:AddInstructions('MoveRelativeLocal:14.04,0;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:NAVARE51')
		elseif feature.orientation and feature.orientation.orientationValue and feature.categoryOfRecommendedTrack == 1 and feature.trafficFlow == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:6;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:RECTRC56')
			featurePortrayal:AddInstructions('MoveRelativeLocal:14.04,0;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:NAVARE51')
		elseif feature.orientation and feature.orientation.orientationValue and feature.categoryOfRecommendedTrack == 2 and feature.trafficFlow == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:6;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:RECTRC57')
			featurePortrayal:AddInstructions('MoveRelativeLocal:14.04,0;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:NAVARE51')
		elseif feature.orientation and feature.orientation.orientationValue and feature.categoryOfRecommendedTrack == 2 and feature.trafficFlow == 2 then
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:6;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:RECTRC57')
			featurePortrayal:AddInstructions('MoveRelativeLocal:14.04,0;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:NAVARE51')
		elseif feature.orientation and feature.orientation.orientationValue and feature.categoryOfRecommendedTrack == 2 and feature.trafficFlow == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:6;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:RECTRC57')
			featurePortrayal:AddInstructions('MoveRelativeLocal:14.04,0;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:NAVARE51')
		elseif feature.orientation and feature.orientation.orientationValue and feature.categoryOfRecommendedTrack == 2 and feature.trafficFlow == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:6;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:RECTRC55')
			featurePortrayal:AddInstructions('MoveRelativeLocal:14.04,0;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:NAVARE51')
		elseif feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:6;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:RECTRC57')
			featurePortrayal:AddInstructions('MoveRelativeLocal:14.04,0;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:NAVARE51')
		elseif feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 2 then
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:6;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:RECTRC57')
			featurePortrayal:AddInstructions('MoveRelativeLocal:14.04,0;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:NAVARE51')
		elseif feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:6;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:RECTRC57')
			featurePortrayal:AddInstructions('MoveRelativeLocal:14.04,0;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:NAVARE51')
		elseif feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:6;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:RECTRC55')
			featurePortrayal:AddInstructions('MoveRelativeLocal:14.04,0;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString('%03.0f deg', feature.orientation.orientationValue) .. '')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:NAVARE51')
		else
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:6;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:RECDEF51')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:NAVARE51')
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
