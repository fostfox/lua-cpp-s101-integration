-- Converter Version: 0.99.6547.27240

-- Referenced portrayal rules.
require 'RESTRN01'

-- Main entry point for feature type.
function SubmarinePipelineArea(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point then
		-- Simplified and paper chart points use the same symbolization
		featurePortrayal:AddInstructions('ViewingGroup:34030;DrawingPriority:4;DisplayPlane:OverRADAR')
		featurePortrayal:AddInstructions('DrawSymbol:CHINFO07')
	elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
		if feature.categoryOfPipelinePipe[1] == 2 then
			featurePortrayal:AddInstructions('ViewingGroup:34030;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:INFARE51')
			featurePortrayal:AddInstructions('PenWidth:0.64;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
			RESTRN01(feature, featurePortrayal, contextParameters)
		elseif feature.categoryOfPipelinePipe[1] == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:34030;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:INFARE51')
			featurePortrayal:AddInstructions('PenWidth:0.64;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
			RESTRN01(feature, featurePortrayal, contextParameters)
		elseif feature.product[1] == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:34030;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:INFARE51')
			featurePortrayal:AddInstructions('PenWidth:0.64;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
			RESTRN01(feature, featurePortrayal, contextParameters)
		else
			featurePortrayal:AddInstructions('ViewingGroup:34030;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:INFARE51')
			featurePortrayal:AddInstructions('PenWidth:0.64;PenColor:CHMGD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
			RESTRN01(feature, featurePortrayal, contextParameters)
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		if feature.categoryOfPipelinePipe[1] == 2 then
			featurePortrayal:AddInstructions('ViewingGroup:34030;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:INFARE51')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:PIPARE61')
			RESTRN01(feature, featurePortrayal, contextParameters)
		elseif feature.categoryOfPipelinePipe[1] == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:34030;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:INFARE51')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:PIPARE61')
			RESTRN01(feature, featurePortrayal, contextParameters)
		elseif feature.product[1] == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:34030;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:INFARE51')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:PIPARE61')
			RESTRN01(feature, featurePortrayal, contextParameters)
		else
			featurePortrayal:AddInstructions('ViewingGroup:34030;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:INFARE51')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:PIPARE51')
			RESTRN01(feature, featurePortrayal, contextParameters)
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
