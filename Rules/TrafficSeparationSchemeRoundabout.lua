-- Converter Version: 0.99.6547.27240

-- Referenced portrayal rules.
require 'RESTRN01'

-- Main entry point for feature type.
function TrafficSeparationSchemeRoundabout(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
		featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:6;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('DrawSymbol:TSSRON51')
		RESTRN01(feature, featurePortrayal, contextParameters)
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:6;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('FillArea:TSSJCT02')
		featurePortrayal:AddInstructions('DrawSymbol:TSSRON51')
		RESTRN01(feature, featurePortrayal, contextParameters)
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
