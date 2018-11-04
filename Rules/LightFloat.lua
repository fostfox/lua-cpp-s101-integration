-- Converter Version: 0.99.6547.27240

-- Referenced portrayal rules.
require 'TOPMAR01'

-- Main entry point for feature type.
function LightFloat(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
		featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:8;DisplayPlane:OverRADAR')
		featurePortrayal:AddInstructions('DrawSymbol:LITFLT02')
		if feature.featureName[1] and feature.featureName[1].name then
			featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('by %s', feature.featureName[1].name) .. '')
		end
	elseif feature.PrimitiveType == PrimitiveType.Point then
		featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:8;DisplayPlane:OverRADAR')
		featurePortrayal:AddInstructions('DrawSymbol:LITFLT01')
		if feature.featureName[1] and feature.featureName[1].name then
			featurePortrayal:AddInstructions('MoveRelativeLocal:-3.51,3.51;TextAlignHorizontal:End;FontSize:10;DrawText:' .. EncodeString('by %s', feature.featureName[1].name) .. '')
		end
		TOPMAR01(feature, featurePortrayal, contextParameters, true)
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
