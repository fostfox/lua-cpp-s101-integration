-- Converter Version: 0.99.6547.27240

-- Referenced portrayal rules.
require 'RESARE04'

-- Main entry point for feature type.
function RestrictedArea(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
		if feature.categoryOfRestrictedArea[1] == 27 then
			featurePortrayal:AddInstructions('ViewingGroup:26010;DrawingPriority:5;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:ESSARE01')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:ESSARE01')
		elseif feature.categoryOfRestrictedArea[1] == 28 then
			featurePortrayal:AddInstructions('ViewingGroup:26010;DrawingPriority:5;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:PSSARE01')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:ESSARE01')
		else
			featurePortrayal:AddInstructions('ViewingGroup:26010;DrawingPriority:5;DisplayPlane:UnderRADAR')
			RESARE04(feature, featurePortrayal, contextParameters)
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		if feature.categoryOfRestrictedArea[1] == 27 then
			featurePortrayal:AddInstructions('ViewingGroup:26010;DrawingPriority:5;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:ESSARE01')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:ESSARE01')
		elseif feature.categoryOfRestrictedArea[1] == 28 then
			featurePortrayal:AddInstructions('ViewingGroup:26010;DrawingPriority:5;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:PSSARE01')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:ESSARE01')
		else
			featurePortrayal:AddInstructions('ViewingGroup:26010;DrawingPriority:5;DisplayPlane:UnderRADAR')
			RESARE04(feature, featurePortrayal, contextParameters)
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
