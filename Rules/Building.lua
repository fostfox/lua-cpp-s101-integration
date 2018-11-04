-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function Building(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
		if feature['function'][1] == 33 and feature.visuallyConspicuous and feature.featureName[1] and feature.featureName[1].name then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:POSGEN03')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,0;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString(feature.featureName[1]['name']) .. '')
			end
		elseif feature['function'][1] == 20 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUIREL13')
		elseif feature['function'][1] == 21 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUIREL13')
		elseif feature['function'][1] == 22 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUIREL14')
		elseif feature['function'][1] == 23 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUIREL14')
		elseif feature['function'][1] == 24 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUIREL14')
		elseif feature['function'][1] == 25 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUIREL14')
		elseif feature['function'][1] == 26 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUIREL15')
		elseif feature['function'][1] == 27 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUIREL15')
		elseif feature['function'][1] == 33 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:POSGEN03')
		elseif feature['function'][1] == 35 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:TNKCON12')
		elseif feature['function'][1] == 33 and feature.featureName[1] and feature.featureName[1].name then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:POSGEN03')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,0;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString(feature.featureName[1]['name']) .. '')
			end
		elseif feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUISGL11')
		elseif feature['function'][1] == 20 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUIREL01')
		elseif feature['function'][1] == 21 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUIREL01')
		elseif feature['function'][1] == 22 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUIREL04')
		elseif feature['function'][1] == 23 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUIREL04')
		elseif feature['function'][1] == 24 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUIREL04')
		elseif feature['function'][1] == 25 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUIREL04')
		elseif feature['function'][1] == 26 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUIREL05')
		elseif feature['function'][1] == 27 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUIREL05')
		elseif feature['function'][1] == 33 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:POSGEN03')
		elseif feature['function'][1] == 35 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:TNKCON02')
		else
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUISGL01')
		end
	elseif feature.PrimitiveType == PrimitiveType.Point then
		if feature['function'][1] == 33 and feature.visuallyConspicuous and feature.featureName[1] and feature.featureName[1].name then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:POSGEN03')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,0;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString(feature.featureName[1]['name']) .. '')
			end
		elseif feature['function'][1] == 20 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUIREL13')
		elseif feature['function'][1] == 21 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUIREL13')
		elseif feature['function'][1] == 22 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUIREL14')
		elseif feature['function'][1] == 23 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUIREL14')
		elseif feature['function'][1] == 24 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUIREL14')
		elseif feature['function'][1] == 25 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUIREL14')
		elseif feature['function'][1] == 26 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUIREL15')
		elseif feature['function'][1] == 27 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUIREL15')
		elseif feature['function'][1] == 33 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:POSGEN03')
		elseif feature['function'][1] == 35 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:TNKCON12')
		elseif feature['function'][1] == 33 and feature.featureName[1] and feature.featureName[1].name then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:POSGEN03')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,0;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString(feature.featureName[1]['name']) .. '')
			end
		elseif feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUISGL11')
		elseif feature['function'][1] == 20 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUIREL01')
		elseif feature['function'][1] == 21 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUIREL01')
		elseif feature['function'][1] == 22 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUIREL04')
		elseif feature['function'][1] == 23 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUIREL04')
		elseif feature['function'][1] == 24 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUIREL04')
		elseif feature['function'][1] == 25 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUIREL04')
		elseif feature['function'][1] == 26 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUIREL05')
		elseif feature['function'][1] == 27 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUIREL05')
		elseif feature['function'][1] == 33 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:POSGEN03')
		elseif feature['function'][1] == 35 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:TNKCON02')
		else
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUISGL01')
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
		if feature['function'][1] == 33 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFillArea:CHBRN')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:0,0;TextAlignHorizontal:Center;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString(feature.featureName[1]['name']) .. '')
			end
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHBLK')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature['function'][1] == 33 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFillArea:CHBRN')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:0,0;TextAlignHorizontal:Center;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString(feature.featureName[1]['name']) .. '')
			end
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:LANDF')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFillArea:CHBRN')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHBLK')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		else
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFillArea:CHBRN')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:LANDF')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		if feature['function'][1] == 33 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFillArea:CHBRN')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:0,0;TextAlignHorizontal:Center;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString(feature.featureName[1]['name']) .. '')
			end
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHBLK')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature['function'][1] == 33 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFillArea:CHBRN')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:0,0;TextAlignHorizontal:Center;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString(feature.featureName[1]['name']) .. '')
			end
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:LANDF')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFillArea:CHBRN')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHBLK')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		else
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFillArea:CHBRN')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:LANDF')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
