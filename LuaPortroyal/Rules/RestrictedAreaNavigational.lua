-- Converter Version: 0.99
-- Feature Catalogue Version: 1.0.0 (2018/9/6)

-- Referenced portrayal rules.
require 'RESARE04'

-- Restricted Area Navigational main entry point.
function RestrictedAreaNavigational(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
		if feature.categoryOfRestrictedArea[1] == 27 then
			featurePortrayal:AddInstructions('ViewingGroup:26010;DrawingPriority:5;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('PointInstruction:ESSARE01')
			featurePortrayal:AddInstructions('LineInstruction:ESSARE01')
		elseif feature.categoryOfRestrictedArea[1] == 28 then
			featurePortrayal:AddInstructions('ViewingGroup:26010;DrawingPriority:5;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('PointInstruction:PSSARE01')
			featurePortrayal:AddInstructions('LineInstruction:ESSARE01')
		else
			featurePortrayal:AddInstructions('ViewingGroup:26010;DrawingPriority:5;DisplayPlane:UnderRADAR')
			RESARE04(feature, featurePortrayal, contextParameters)
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		if feature.categoryOfRestrictedArea[1] == 27 then
			featurePortrayal:AddInstructions('ViewingGroup:26010;DrawingPriority:5;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('PointInstruction:ESSARE01')
			featurePortrayal:AddInstructions('LineInstruction:ESSARE01')
		elseif feature.categoryOfRestrictedArea[1] == 28 then
			featurePortrayal:AddInstructions('ViewingGroup:26010;DrawingPriority:5;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('PointInstruction:PSSARE01')
			featurePortrayal:AddInstructions('LineInstruction:ESSARE01')
		else
			featurePortrayal:AddInstructions('ViewingGroup:26010;DrawingPriority:5;DisplayPlane:UnderRADAR')
			RESARE04(feature, featurePortrayal, contextParameters)
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
