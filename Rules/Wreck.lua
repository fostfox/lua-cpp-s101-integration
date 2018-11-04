-- Converter Version: 0.99.6547.27240

-- Referenced portrayal rules.
require 'WRECKS05'

-- Main entry point for feature type.
function Wreck(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
		if feature.categoryOfWreck == 3 and feature.valueOfSounding then
			featurePortrayal:AddInstructions('ViewingGroup:34051;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FOULGND1')
		elseif feature.categoryOfWreck == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:34050;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FOULGND1')
		else
			featurePortrayal:AddInstructions('ViewingGroup:34050;DrawingPriority:4;DisplayPlane:OverRADAR')
			WRECKS05(feature, featurePortrayal, contextParameters)
		end
	elseif feature.PrimitiveType == PrimitiveType.Point then
		if feature.categoryOfWreck == 3 and feature.valueOfSounding then
			featurePortrayal:AddInstructions('ViewingGroup:34051;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FOULGND1')
		elseif feature.categoryOfWreck == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:34050;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FOULGND1')
		else
			featurePortrayal:AddInstructions('ViewingGroup:34050;DrawingPriority:4;DisplayPlane:OverRADAR')
			WRECKS05(feature, featurePortrayal, contextParameters)
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
		if feature.categoryOfWreck == 3 and feature.valueOfSounding then
			featurePortrayal:AddInstructions('ViewingGroup:34051;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHBLK')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.categoryOfWreck == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:34050;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHBLK')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		else
			featurePortrayal:AddInstructions('ViewingGroup:34050;DrawingPriority:4;DisplayPlane:UnderRADAR')
			WRECKS05(feature, featurePortrayal, contextParameters)
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		if feature.categoryOfWreck == 3 and feature.valueOfSounding then
			featurePortrayal:AddInstructions('ViewingGroup:34051;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:NAVARE51')
		elseif feature.categoryOfWreck == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:34050;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:NAVARE51')
		else
			featurePortrayal:AddInstructions('ViewingGroup:34050;DrawingPriority:4;DisplayPlane:UnderRADAR')
			WRECKS05(feature, featurePortrayal, contextParameters)
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
