-- Converter Version: 0.99.6547.27240

-- Referenced portrayal rules.
require 'TOPMAR01'

-- Main entry point for feature type.
function BeaconLateral(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
		if feature.colour[1] == 3 and feature.colour[2] == 4 and feature.colour[3] == 3 and feature.beaconShape == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BCNLAT21')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('bn %s', feature.featureName[1].name) .. '')
			end
		elseif feature.colour[1] == 3 and feature.colour[2] == 4 and feature.colour[3] == 3 and feature.beaconShape == 2 then
			featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BCNLAT21')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('bn %s', feature.featureName[1].name) .. '')
			end
		elseif feature.colour[1] == 3 and feature.colour[2] == 4 and feature.colour[3] == 3 and feature.beaconShape == 7 then
			featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BCNLAT21')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('bn %s', feature.featureName[1].name) .. '')
			end
		elseif feature.colour[1] == 4 and feature.colour[2] == 3 and feature.colour[3] == 4 and feature.beaconShape == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BCNLAT22')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('bn %s', feature.featureName[1].name) .. '')
			end
		elseif feature.colour[1] == 4 and feature.colour[2] == 3 and feature.colour[3] == 4 and feature.beaconShape == 2 then
			featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BCNLAT22')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('bn %s', feature.featureName[1].name) .. '')
			end
		elseif feature.colour[1] == 4 and feature.colour[2] == 3 and feature.colour[3] == 4 and feature.beaconShape == 7 then
			featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BCNLAT22')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('bn %s', feature.featureName[1].name) .. '')
			end
		elseif feature.colour[1] == 3 and feature.colour[2] == 4 and feature.colour[3] == 3 and feature.beaconShape == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BCNLAT15')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('bn %s', feature.featureName[1].name) .. '')
			end
		elseif feature.colour[1] == 3 and feature.colour[2] == 4 and feature.colour[3] == 3 and feature.beaconShape == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BCNLAT15')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('bn %s', feature.featureName[1].name) .. '')
			end
		elseif feature.colour[1] == 3 and feature.colour[2] == 4 and feature.colour[3] == 3 and feature.beaconShape == 5 then
			featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BCNLAT15')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('bn %s', feature.featureName[1].name) .. '')
			end
		elseif feature.colour[1] == 4 and feature.colour[2] == 3 and feature.colour[3] == 4 and feature.beaconShape == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BCNLAT16')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('bn %s', feature.featureName[1].name) .. '')
			end
		elseif feature.colour[1] == 4 and feature.colour[2] == 3 and feature.colour[3] == 4 and feature.beaconShape == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BCNLAT16')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('bn %s', feature.featureName[1].name) .. '')
			end
		elseif feature.colour[1] == 4 and feature.colour[2] == 3 and feature.colour[3] == 4 and feature.beaconShape == 5 then
			featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BCNLAT16')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('bn %s', feature.featureName[1].name) .. '')
			end
		elseif feature.colour[1] == 3 and feature.colour[2] == 4 and feature.colour[3] == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BCNLAT15')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('bn %s', feature.featureName[1].name) .. '')
			end
		elseif feature.colour[1] == 4 and feature.colour[2] == 3 and feature.colour[3] == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BCNLAT16')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('bn %s', feature.featureName[1].name) .. '')
			end
		elseif feature.colour[1] == 3 and feature.beaconShape == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BCNLAT21')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('bn %s', feature.featureName[1].name) .. '')
			end
		elseif feature.colour[1] == 3 and feature.beaconShape == 2 then
			featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BCNLAT21')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('bn %s', feature.featureName[1].name) .. '')
			end
		elseif feature.colour[1] == 3 and feature.beaconShape == 7 then
			featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BCNLAT21')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('bn %s', feature.featureName[1].name) .. '')
			end
		elseif feature.colour[1] == 4 and feature.beaconShape == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BCNLAT22')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('bn %s', feature.featureName[1].name) .. '')
			end
		elseif feature.colour[1] == 4 and feature.beaconShape == 2 then
			featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BCNLAT22')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('bn %s', feature.featureName[1].name) .. '')
			end
		elseif feature.colour[1] == 4 and feature.beaconShape == 7 then
			featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BCNLAT22')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('bn %s', feature.featureName[1].name) .. '')
			end
		elseif feature.colour[1] == 3 and feature.beaconShape == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BCNLAT15')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('bn %s', feature.featureName[1].name) .. '')
			end
		elseif feature.colour[1] == 3 and feature.beaconShape == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BCNLAT15')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('bn %s', feature.featureName[1].name) .. '')
			end
		elseif feature.colour[1] == 3 and feature.beaconShape == 5 then
			featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BCNLAT15')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('bn %s', feature.featureName[1].name) .. '')
			end
		elseif feature.colour[1] == 4 and feature.beaconShape == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BCNLAT16')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('bn %s', feature.featureName[1].name) .. '')
			end
		elseif feature.colour[1] == 4 and feature.beaconShape == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BCNLAT16')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('bn %s', feature.featureName[1].name) .. '')
			end
		elseif feature.colour[1] == 4 and feature.beaconShape == 5 then
			featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BCNLAT16')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('bn %s', feature.featureName[1].name) .. '')
			end
		elseif feature.beaconShape == 6 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:CAIRNS11')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('bn %s', feature.featureName[1].name) .. '')
			end
		elseif feature.beaconShape == 6 then
			featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:CAIRNS01')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('bn %s', feature.featureName[1].name) .. '')
			end
		elseif feature.colour[1] == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BCNLAT15')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('bn %s', feature.featureName[1].name) .. '')
			end
		elseif feature.colour[1] == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BCNLAT16')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('bn %s', feature.featureName[1].name) .. '')
			end
		else
			featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BCNDEF13')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('bn %s', feature.featureName[1].name) .. '')
			end
		end
	elseif feature.PrimitiveType == PrimitiveType.Point then
		if feature.beaconShape == 2 and feature.categoryOfLateralMark == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:PRICKE03')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('bn %s', feature.featureName[1].name) .. '')
			end
			TOPMAR01(feature, featurePortrayal, contextParameters, false)
		elseif feature.beaconShape == 2 and feature.categoryOfLateralMark == 2 then
			featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:PRICKE04')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('bn %s', feature.featureName[1].name) .. '')
			end
			TOPMAR01(feature, featurePortrayal, contextParameters, false)
		elseif feature.beaconShape == 6 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:CAIRNS11')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('bn %s', feature.featureName[1].name) .. '')
			end
			TOPMAR01(feature, featurePortrayal, contextParameters, false)
		elseif feature.beaconShape == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BCNSTK02')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('bn %s', feature.featureName[1].name) .. '')
			end
			TOPMAR01(feature, featurePortrayal, contextParameters, false)
		elseif feature.beaconShape == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BCNTOW01')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,7.02;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('bn %s', feature.featureName[1].name) .. '')
			end
			TOPMAR01(feature, featurePortrayal, contextParameters, false)
		elseif feature.beaconShape == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BCNLTC01')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,7.02;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('bn %s', feature.featureName[1].name) .. '')
			end
			TOPMAR01(feature, featurePortrayal, contextParameters, false)
		elseif feature.beaconShape == 5 then
			featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BCNGEN01')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,7.02;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('bn %s', feature.featureName[1].name) .. '')
			end
			TOPMAR01(feature, featurePortrayal, contextParameters, false)
		elseif feature.beaconShape == 6 then
			featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:CAIRNS01')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('bn %s', feature.featureName[1].name) .. '')
			end
			TOPMAR01(feature, featurePortrayal, contextParameters, false)
		elseif feature.beaconShape == 7 then
			featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BCNGEN01')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,7.02;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('bn %s', feature.featureName[1].name) .. '')
			end
			TOPMAR01(feature, featurePortrayal, contextParameters, false)
		else
			featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BCNGEN03')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('bn %s', feature.featureName[1].name) .. '')
			end
			TOPMAR01(feature, featurePortrayal, contextParameters, false)
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
