-- Converter Version: 0.99.6547.27240

-- Referenced portrayal rules.
require 'TOPMAR01'

-- Main entry point for feature type.
function BeaconIsolatedDanger(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
		featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:8;DisplayPlane:OverRADAR')
		featurePortrayal:AddInstructions('DrawSymbol:BCNISD21')
		if feature.featureName[1] and feature.featureName[1].name then
			featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('bn %s', feature.featureName[1].name) .. '')
		end
	elseif feature.PrimitiveType == PrimitiveType.Point then
		if feature.beaconShape == 1 then
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
