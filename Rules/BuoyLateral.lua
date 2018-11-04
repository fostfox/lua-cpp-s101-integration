-- Converter Version: 0.99.6547.27240

-- Referenced portrayal rules.
require 'TOPMAR01'

-- Main entry point for feature type.
function BuoyLateral(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
		if feature.buoyShape == 1 and feature.colour[1] == 3 and feature.colour[2] == 4 and feature.colour[3] == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BOYLAT14')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('by %s', feature.featureName[1].name) .. '')
			end
		elseif feature.buoyShape == 1 and feature.colour[1] == 4 and feature.colour[2] == 3 and feature.colour[3] == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BOYLAT13')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('by %s', feature.featureName[1].name) .. '')
			end
		elseif feature.buoyShape == 2 and feature.colour[1] == 3 and feature.colour[2] == 4 and feature.colour[3] == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BOYLAT24')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('by %s', feature.featureName[1].name) .. '')
			end
		elseif feature.buoyShape == 2 and feature.colour[1] == 4 and feature.colour[2] == 3 and feature.colour[3] == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BOYLAT23')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('by %s', feature.featureName[1].name) .. '')
			end
		elseif feature.categoryOfLateralMark == 3 and feature.colour[1] == 3 and feature.colour[2] == 4 and feature.colour[3] == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BOYLAT24')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('by %s', feature.featureName[1].name) .. '')
			end
		elseif feature.categoryOfLateralMark == 3 and feature.colour[1] == 4 and feature.colour[2] == 3 and feature.colour[3] == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BOYLAT23')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('by %s', feature.featureName[1].name) .. '')
			end
		elseif feature.categoryOfLateralMark == 4 and feature.colour[1] == 3 and feature.colour[2] == 4 and feature.colour[3] == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BOYLAT14')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('by %s', feature.featureName[1].name) .. '')
			end
		elseif feature.categoryOfLateralMark == 4 and feature.colour[1] == 4 and feature.colour[2] == 3 and feature.colour[3] == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BOYLAT13')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('by %s', feature.featureName[1].name) .. '')
			end
		elseif feature.buoyShape == 1 and feature.colour[1] == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BOYLAT14')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('by %s', feature.featureName[1].name) .. '')
			end
		elseif feature.buoyShape == 1 and feature.colour[1] == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BOYLAT13')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('by %s', feature.featureName[1].name) .. '')
			end
		elseif feature.buoyShape == 2 and feature.colour[1] == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BOYLAT24')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('by %s', feature.featureName[1].name) .. '')
			end
		elseif feature.buoyShape == 2 and feature.colour[1] == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BOYLAT23')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('by %s', feature.featureName[1].name) .. '')
			end
		elseif feature.categoryOfLateralMark == 1 and feature.colour[1] == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BOYLAT24')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('by %s', feature.featureName[1].name) .. '')
			end
		elseif feature.categoryOfLateralMark == 1 and feature.colour[1] == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BOYLAT23')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('by %s', feature.featureName[1].name) .. '')
			end
		elseif feature.categoryOfLateralMark == 2 and feature.colour[1] == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BOYLAT14')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('by %s', feature.featureName[1].name) .. '')
			end
		elseif feature.categoryOfLateralMark == 2 and feature.colour[1] == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BOYLAT13')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('by %s', feature.featureName[1].name) .. '')
			end
		else
			featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BOYDEF03')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('by %s', feature.featureName[1].name) .. '')
			end
		end
	elseif feature.PrimitiveType == PrimitiveType.Point then
		if feature.buoyShape == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BOYCON01')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('by %s', feature.featureName[1].name) .. '')
			end
			TOPMAR01(feature, featurePortrayal, contextParameters, true)
		elseif feature.buoyShape == 2 then
			featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BOYCAN01')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('by %s', feature.featureName[1].name) .. '')
			end
			TOPMAR01(feature, featurePortrayal, contextParameters, true)
		elseif feature.buoyShape == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BOYSPH01')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('by %s', feature.featureName[1].name) .. '')
			end
			TOPMAR01(feature, featurePortrayal, contextParameters, true)
		elseif feature.buoyShape == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BOYPIL01')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('by %s', feature.featureName[1].name) .. '')
			end
			TOPMAR01(feature, featurePortrayal, contextParameters, true)
		elseif feature.buoyShape == 5 then
			featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BOYSPR01')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('by %s', feature.featureName[1].name) .. '')
			end
			TOPMAR01(feature, featurePortrayal, contextParameters, true)
		elseif feature.buoyShape == 6 then
			featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BOYBAR01')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('by %s', feature.featureName[1].name) .. '')
			end
			TOPMAR01(feature, featurePortrayal, contextParameters, true)
		elseif feature.buoyShape == 7 then
			featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BOYSUP01')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-7.02,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('by %s', feature.featureName[1].name) .. '')
			end
			TOPMAR01(feature, featurePortrayal, contextParameters, true)
		elseif feature.buoyShape == 8 then
			featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BOYSPR01')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('by %s', feature.featureName[1].name) .. '')
			end
			TOPMAR01(feature, featurePortrayal, contextParameters, true)
		else
			featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BOYGEN03')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('by %s', feature.featureName[1].name) .. '')
			end
			TOPMAR01(feature, featurePortrayal, contextParameters, true)
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
