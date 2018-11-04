-- Converter Version: 0.99.6547.27240

-- Referenced portrayal rules.
require 'RESTRN01'

-- Main entry point for feature type.
function PrecautionaryArea(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point then
		-- Simplified and paper chart points use the same symbolization
		featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:5;DisplayPlane:OverRADAR')
		featurePortrayal:AddInstructions('DrawSymbol:PRCARE12')
	elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
		featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:4;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('DrawSymbol:PRCARE51')
		featurePortrayal:AddInstructions('PenWidth:0.64;PenColor:TRFCD')
		featurePortrayal:AddInstructions('PenDash')
		featurePortrayal:AddInstructions('DrawLine')
		RESTRN01(feature, featurePortrayal, contextParameters)
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:4;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('FillArea:TSSJCT02')
		featurePortrayal:AddInstructions('DrawSymbol:PRCARE51')
		featurePortrayal:AddInstructions('DrawComplexLinestyle:PRCARE51')
		RESTRN01(feature, featurePortrayal, contextParameters)
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
