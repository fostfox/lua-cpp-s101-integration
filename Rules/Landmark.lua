-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function Landmark(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
		if feature.categoryOfLandmark[1] == 15 and feature['function'][1] == 20 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUIREL13')
		elseif feature.categoryOfLandmark[1] == 15 and feature['function'][1] == 21 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUIREL13')
		elseif feature.categoryOfLandmark[1] == 17 and feature['function'][1] == 20 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUIREL13')
		elseif feature.categoryOfLandmark[1] == 17 and feature['function'][1] == 21 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUIREL13')
		elseif feature.categoryOfLandmark[1] == 17 and feature['function'][1] == 31 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:TOWERS15')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,3.51;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString(feature.featureName[1]['name']) .. '')
			end
		elseif feature.categoryOfLandmark[1] == 17 and feature['function'][1] == 33 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:TOWERS03')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,3.51;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString(feature.featureName[1]['name']) .. '')
			end
		elseif feature.categoryOfLandmark[1] == 20 and feature['function'][1] == 20 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUIREL13')
		elseif feature.categoryOfLandmark[1] == 20 and feature['function'][1] == 21 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUIREL13')
		elseif feature.categoryOfLandmark[1] == 20 and feature['function'][1] == 26 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUIREL15')
		elseif feature.categoryOfLandmark[1] == 20 and feature['function'][1] == 27 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUIREL15')
		elseif feature.categoryOfLandmark[1] == 1 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:CAIRNS11')
		elseif feature.categoryOfLandmark[1] == 3 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:CHIMNY11')
		elseif feature.categoryOfLandmark[1] == 4 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:DSHAER11')
		elseif feature.categoryOfLandmark[1] == 5 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FLGSTF01')
		elseif feature.categoryOfLandmark[1] == 6 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FLASTK11')
		elseif feature.categoryOfLandmark[1] == 7 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:MSTCON14')
		elseif feature.categoryOfLandmark[1] == 8 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:POSGEN03')
		elseif feature.categoryOfLandmark[1] == 9 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:MONUMT12')
		elseif feature.categoryOfLandmark[1] == 10 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:MONUMT12')
		elseif feature.categoryOfLandmark[1] == 12 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:MONUMT12')
		elseif feature.categoryOfLandmark[1] == 13 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:MONUMT12')
		elseif feature.categoryOfLandmark[1] == 15 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:DOMES011')
		elseif feature.categoryOfLandmark[1] == 16 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:RASCAN11')
		elseif feature.categoryOfLandmark[1] == 17 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:TOWERS03')
		elseif feature.categoryOfLandmark[1] == 18 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:WNDMIL12')
		elseif feature.categoryOfLandmark[1] == 19 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:WIMCON11')
		elseif feature.categoryOfLandmark[1] == 20 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:POSGEN03')
		elseif feature.categoryOfLandmark[1] == 15 and feature['function'][1] == 20 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUIREL01')
		elseif feature.categoryOfLandmark[1] == 17 and feature['function'][1] == 20 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUIREL01')
		elseif feature.categoryOfLandmark[1] == 17 and feature['function'][1] == 31 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:TOWERS05')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,3.51;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString(feature.featureName[1]['name']) .. '')
			end
		elseif feature.categoryOfLandmark[1] == 17 and feature['function'][1] == 33 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:TOWERS01')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,3.51;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString(feature.featureName[1]['name']) .. '')
			end
		elseif feature.categoryOfLandmark[1] == 20 and feature['function'][1] == 20 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUIREL01')
		elseif feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:POSGEN03')
		elseif feature.categoryOfLandmark[1] == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:CAIRNS01')
		elseif feature.categoryOfLandmark[1] == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:CHIMNY01')
		elseif feature.categoryOfLandmark[1] == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:DSHAER01')
		elseif feature.categoryOfLandmark[1] == 5 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FLGSTF01')
		elseif feature.categoryOfLandmark[1] == 6 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FLASTK01')
		elseif feature.categoryOfLandmark[1] == 7 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:MSTCON04')
		elseif feature.categoryOfLandmark[1] == 8 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:POSGEN03')
		elseif feature.categoryOfLandmark[1] == 9 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:MONUMT02')
		elseif feature.categoryOfLandmark[1] == 10 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:MONUMT02')
		elseif feature.categoryOfLandmark[1] == 12 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:MONUMT02')
		elseif feature.categoryOfLandmark[1] == 13 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:MONUMT02')
		elseif feature.categoryOfLandmark[1] == 15 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:DOMES001')
		elseif feature.categoryOfLandmark[1] == 16 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:RASCAN01')
		elseif feature.categoryOfLandmark[1] == 17 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:TOWERS01')
		elseif feature.categoryOfLandmark[1] == 18 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:WNDMIL02')
		elseif feature.categoryOfLandmark[1] == 19 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:WIMCON01')
		elseif feature.categoryOfLandmark[1] == 20 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:POSGEN01')
		else
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:POSGEN01')
		end
	elseif feature.PrimitiveType == PrimitiveType.Point then
		if feature.categoryOfLandmark[1] == 15 and feature['function'][1] == 20 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUIREL13')
		elseif feature.categoryOfLandmark[1] == 15 and feature['function'][1] == 21 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUIREL13')
		elseif feature.categoryOfLandmark[1] == 17 and feature['function'][1] == 20 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUIREL13')
		elseif feature.categoryOfLandmark[1] == 17 and feature['function'][1] == 21 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUIREL13')
		elseif feature.categoryOfLandmark[1] == 17 and feature['function'][1] == 31 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:TOWERS15')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,-3.51;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString(feature.featureName[1]['name']) .. '')
			end
		elseif feature.categoryOfLandmark[1] == 17 and feature['function'][1] == 33 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:TOWERS03')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,3.51;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString(feature.featureName[1]['name']) .. '')
			end
		elseif feature.categoryOfLandmark[1] == 20 and feature['function'][1] == 20 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUIREL13')
		elseif feature.categoryOfLandmark[1] == 20 and feature['function'][1] == 21 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUIREL13')
		elseif feature.categoryOfLandmark[1] == 20 and feature['function'][1] == 26 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUIREL15')
		elseif feature.categoryOfLandmark[1] == 20 and feature['function'][1] == 27 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUIREL15')
		elseif feature.categoryOfLandmark[1] == 1 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:CAIRNS11')
		elseif feature.categoryOfLandmark[1] == 3 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:CHIMNY11')
		elseif feature.categoryOfLandmark[1] == 4 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:DSHAER11')
		elseif feature.categoryOfLandmark[1] == 5 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FLGSTF01')
		elseif feature.categoryOfLandmark[1] == 6 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FLASTK11')
		elseif feature.categoryOfLandmark[1] == 7 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:MSTCON14')
		elseif feature.categoryOfLandmark[1] == 8 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:POSGEN03')
		elseif feature.categoryOfLandmark[1] == 9 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:MONUMT12')
		elseif feature.categoryOfLandmark[1] == 10 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:MONUMT12')
		elseif feature.categoryOfLandmark[1] == 12 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:MONUMT12')
		elseif feature.categoryOfLandmark[1] == 13 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:MONUMT12')
		elseif feature.categoryOfLandmark[1] == 15 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:DOMES011')
		elseif feature.categoryOfLandmark[1] == 16 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:RASCAN11')
		elseif feature.categoryOfLandmark[1] == 17 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:TOWERS03')
		elseif feature.categoryOfLandmark[1] == 18 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:WNDMIL12')
		elseif feature.categoryOfLandmark[1] == 19 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:WIMCON11')
		elseif feature.categoryOfLandmark[1] == 20 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:POSGEN03')
		elseif feature.categoryOfLandmark[1] == 15 and feature['function'][1] == 20 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUIREL01')
		elseif feature.categoryOfLandmark[1] == 17 and feature['function'][1] == 20 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUIREL01')
		elseif feature.categoryOfLandmark[1] == 17 and feature['function'][1] == 31 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:TOWERS05')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,-3.51;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString(feature.featureName[1]['name']) .. '')
			end
		elseif feature.categoryOfLandmark[1] == 17 and feature['function'][1] == 33 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:TOWERS01')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,3.51;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString(feature.featureName[1]['name']) .. '')
			end
		elseif feature.categoryOfLandmark[1] == 20 and feature['function'][1] == 20 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BUIREL01')
		elseif feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:POSGEN03')
		elseif feature.categoryOfLandmark[1] == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:CAIRNS01')
		elseif feature.categoryOfLandmark[1] == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:CHIMNY01')
		elseif feature.categoryOfLandmark[1] == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:DSHAER01')
		elseif feature.categoryOfLandmark[1] == 5 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FLGSTF01')
		elseif feature.categoryOfLandmark[1] == 6 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FLASTK01')
		elseif feature.categoryOfLandmark[1] == 7 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:MSTCON04')
		elseif feature.categoryOfLandmark[1] == 8 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:POSGEN03')
		elseif feature.categoryOfLandmark[1] == 9 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:MONUMT02')
		elseif feature.categoryOfLandmark[1] == 10 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:MONUMT02')
		elseif feature.categoryOfLandmark[1] == 12 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:MONUMT02')
		elseif feature.categoryOfLandmark[1] == 13 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:MONUMT02')
		elseif feature.categoryOfLandmark[1] == 15 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:DOMES001')
		elseif feature.categoryOfLandmark[1] == 16 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:RASCAN01')
		elseif feature.categoryOfLandmark[1] == 17 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:TOWERS01')
		elseif feature.categoryOfLandmark[1] == 18 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:WNDMIL02')
		elseif feature.categoryOfLandmark[1] == 19 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:WIMCON01')
		elseif feature.categoryOfLandmark[1] == 20 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:POSGEN01')
		else
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:POSGEN01')
		end
	elseif feature.PrimitiveType == PrimitiveType.Curve then
		if feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHBLK')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		else
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:LANDF')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
		if feature.categoryOfLandmark[1] == 17 and feature['function'][1] == 33 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFillArea:CHBRN')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:0,0;TextAlignHorizontal:Center;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString(feature.featureName[1]['name']) .. '')
			end
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHBLK')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.categoryOfLandmark[1] == 17 and feature['function'][1] == 33 then
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
		if feature.categoryOfLandmark[1] == 17 and feature['function'][1] == 33 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFillArea:CHBRN')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:0,0;TextAlignHorizontal:Center;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString(feature.featureName[1]['name']) .. '')
			end
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHBLK')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.categoryOfLandmark[1] == 17 and feature['function'][1] == 33 then
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
