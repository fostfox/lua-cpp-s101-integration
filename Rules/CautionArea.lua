-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function CautionArea(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point then
		-- Simplified and paper chart points use the same symbolization
		featurePortrayal:AddInstructions('ViewingGroup:26150;DrawingPriority:4;DisplayPlane:OverRADAR')
		featurePortrayal:AddInstructions('DrawSymbol:CHINFO06')
	elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
		featurePortrayal:AddInstructions('ViewingGroup:26150;DrawingPriority:3;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('DrawSymbol:CTNARE51')
		featurePortrayal:AddInstructions('PenWidth:0.64;PenColor:TRFCD')
		featurePortrayal:AddInstructions('PenDash')
		featurePortrayal:AddInstructions('DrawLine')
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		featurePortrayal:AddInstructions('ViewingGroup:26150;DrawingPriority:3;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('DrawSymbol:CTNARE51')
		featurePortrayal:AddInstructions('DrawComplexLinestyle:CTNARE51')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
