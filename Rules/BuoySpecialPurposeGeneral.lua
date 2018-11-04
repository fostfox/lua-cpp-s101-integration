-- Converter Version: 0.99.6547.27240

-- Referenced portrayal rules.
require 'TOPMAR01'

-- Main entry point for feature type.
function BuoySpecialPurposeGeneral(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
		if feature.categoryOfSpecialPurposeMark[1] == 19 and feature.buoyShape == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BOYSPP15')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('by %s', feature.featureName[1].name) .. '')
			end
		elseif feature.categoryOfSpecialPurposeMark[1] == 19 and feature.buoyShape == 2 then
			featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BOYSPP25')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('by %s', feature.featureName[1].name) .. '')
			end
		elseif feature.categoryOfSpecialPurposeMark[1] == 54 and feature.buoyShape == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BOYSPP15')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('by %s', feature.featureName[1].name) .. '')
			end
		elseif feature.categoryOfSpecialPurposeMark[1] == 54 and feature.buoyShape == 2 then
			featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BOYSPP25')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('by %s', feature.featureName[1].name) .. '')
			end
		elseif feature.categoryOfSpecialPurposeMark[1] == 54 and feature.buoyShape == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BOYSPP35')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('by %s', feature.featureName[1].name) .. '')
			end
		elseif feature.categoryOfSpecialPurposeMark[1] == 54 and feature.buoyShape == 5 then
			featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BOYSPP35')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('by %s', feature.featureName[1].name) .. '')
			end
		elseif feature.categoryOfSpecialPurposeMark[1] == 9 then
			featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BOYSUP02')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('by %s', feature.featureName[1].name) .. '')
			end
		elseif feature.categoryOfSpecialPurposeMark[1] == 15 then
			featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BOYSUP02')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('by %s', feature.featureName[1].name) .. '')
			end
		elseif feature.buoyShape == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BOYSPP15')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('by %s', feature.featureName[1].name) .. '')
			end
		elseif feature.buoyShape == 2 then
			featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BOYSPP25')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('by %s', feature.featureName[1].name) .. '')
			end
		elseif feature.buoyShape == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BOYSPP11')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('by %s', feature.featureName[1].name) .. '')
			end
		elseif feature.buoyShape == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BOYSPP35')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('by %s', feature.featureName[1].name) .. '')
			end
		elseif feature.buoyShape == 5 then
			featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BOYSPP35')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('by %s', feature.featureName[1].name) .. '')
			end
		elseif feature.buoyShape == 6 then
			featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BOYSPP11')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('by %s', feature.featureName[1].name) .. '')
			end
		elseif feature.buoyShape == 7 then
			featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BOYSUP02')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('by %s', feature.featureName[1].name) .. '')
			end
		elseif feature.buoyShape == 8 then
			featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BOYSPP35')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('by %s', feature.featureName[1].name) .. '')
			end
		else
			featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BOYSPP11')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('by %s', feature.featureName[1].name) .. '')
			end
		end
	elseif feature.PrimitiveType == PrimitiveType.Point then
		if feature.categoryOfSpecialPurposeMark[1] == 9 then
			featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BOYSUP01')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-7.02,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('by %s', feature.featureName[1].name) .. '')
			end
			TOPMAR01(feature, featurePortrayal, contextParameters, true)
		elseif feature.categoryOfSpecialPurposeMark[1] == 15 then
			featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BOYSUP03')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-7.02,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('by %s', feature.featureName[1].name) .. '')
			end
			TOPMAR01(feature, featurePortrayal, contextParameters, true)
		elseif feature.buoyShape == 1 then
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
				featurePortrayal:AddInstructions('MoveRelativeLocal:-7.02,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('by %s', feature.featureName[1].name) .. '')
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
