-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function Daymark(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
		if feature.topmarkDaymarkShape == 19 then
			featurePortrayal:AddInstructions('ViewingGroup:27025;DrawingPriority:7;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:DAYSQR01')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('bn %s', feature.featureName[1].name) .. '')
			end
		elseif feature.topmarkDaymarkShape == 20 then
			featurePortrayal:AddInstructions('ViewingGroup:27025;DrawingPriority:7;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:DAYSQR01')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('bn %s', feature.featureName[1].name) .. '')
			end
		elseif feature.topmarkDaymarkShape == 21 then
			featurePortrayal:AddInstructions('ViewingGroup:27025;DrawingPriority:7;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:DAYSQR01')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('bn %s', feature.featureName[1].name) .. '')
			end
		elseif feature.topmarkDaymarkShape == 24 then
			featurePortrayal:AddInstructions('ViewingGroup:27025;DrawingPriority:7;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:DAYTRI01')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('bn %s', feature.featureName[1].name) .. '')
			end
		elseif feature.topmarkDaymarkShape == 25 then
			featurePortrayal:AddInstructions('ViewingGroup:27025;DrawingPriority:7;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:DAYTRI05')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('bn %s', feature.featureName[1].name) .. '')
			end
		else
			featurePortrayal:AddInstructions('ViewingGroup:27025;DrawingPriority:7;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:DAYSQR01')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('bn %s', feature.featureName[1].name) .. '')
			end
		end
	elseif feature.PrimitiveType == PrimitiveType.Point then
		if feature.topmarkDaymarkShape == 19 then
			featurePortrayal:AddInstructions('ViewingGroup:27025;DrawingPriority:7;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:DAYSQR21')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('bn %s', feature.featureName[1].name) .. '')
			end
		elseif feature.topmarkDaymarkShape == 20 then
			featurePortrayal:AddInstructions('ViewingGroup:27025;DrawingPriority:7;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:DAYSQR21')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('bn %s', feature.featureName[1].name) .. '')
			end
		elseif feature.topmarkDaymarkShape == 21 then
			featurePortrayal:AddInstructions('ViewingGroup:27025;DrawingPriority:7;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:DAYSQR21')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('bn %s', feature.featureName[1].name) .. '')
			end
		elseif feature.topmarkDaymarkShape == 24 then
			featurePortrayal:AddInstructions('ViewingGroup:27025;DrawingPriority:7;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:DAYTRI21')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('bn %s', feature.featureName[1].name) .. '')
			end
		elseif feature.topmarkDaymarkShape == 25 then
			featurePortrayal:AddInstructions('ViewingGroup:27025;DrawingPriority:7;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:DAYTRI25')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('bn %s', feature.featureName[1].name) .. '')
			end
		else
			featurePortrayal:AddInstructions('ViewingGroup:27025;DrawingPriority:7;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:DAYSQR21')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('bn %s', feature.featureName[1].name) .. '')
			end
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
