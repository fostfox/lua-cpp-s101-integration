-- Converter Version: 0.99.6547.27240

-- Referenced portrayal rules.
require 'RESTRN01'

-- Main entry point for feature type.
function CableArea(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
		featurePortrayal:AddInstructions('ViewingGroup:34030;DrawingPriority:3;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('DrawSymbol:CBLARE51')
		featurePortrayal:AddInstructions('PenWidth:0.64;PenColor:CHMGD')
		featurePortrayal:AddInstructions('PenDash')
		featurePortrayal:AddInstructions('DrawLine')
		RESTRN01(feature, featurePortrayal, contextParameters)
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		featurePortrayal:AddInstructions('ViewingGroup:34030;DrawingPriority:3;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('DrawSymbol:CBLARE51')
		featurePortrayal:AddInstructions('DrawComplexLinestyle:CBLARE51')
		RESTRN01(feature, featurePortrayal, contextParameters)
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
