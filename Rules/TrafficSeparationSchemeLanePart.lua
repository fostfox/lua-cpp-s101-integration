-- Converter Version: 0.99.6547.27240

-- Referenced portrayal rules.
require 'RESTRN01'

-- Main entry point for feature type.
function TrafficSeparationSchemeLanePart(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
		if feature.orientation and feature.orientation.orientationValue then
			featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:6;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:TSSLPT51')
			RESTRN01(feature, featurePortrayal, contextParameters)
		else
			featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:6;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:CTNARE51')
			RESTRN01(feature, featurePortrayal, contextParameters)
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		if feature.orientation and feature.orientation.orientationValue then
			featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:6;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:TSSLPT51')
			RESTRN01(feature, featurePortrayal, contextParameters)
		else
			featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:6;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('FillArea:TSSJCT02')
			featurePortrayal:AddInstructions('DrawSymbol:CTNARE51')
			RESTRN01(feature, featurePortrayal, contextParameters)
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
