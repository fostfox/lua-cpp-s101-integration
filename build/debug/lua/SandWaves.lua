-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function SandWaves(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point then
		-- Simplified and paper chart points use the same symbolization
		featurePortrayal:AddInstructions('ViewingGroup:24010;DrawingPriority:4;DisplayPlane:OverRADAR')
		featurePortrayal:AddInstructions('DrawSymbol:SNDWAV02')
	elseif feature.PrimitiveType == PrimitiveType.Curve then
		featurePortrayal:AddInstructions('ViewingGroup:24010;DrawingPriority:4;DisplayPlane:OverRADAR')
		featurePortrayal:AddInstructions('PenWidth:0.64;PenColor:CHGRD')
		featurePortrayal:AddInstructions('PenDash')
		featurePortrayal:AddInstructions('DrawLine')
		featurePortrayal:AddInstructions('DrawSymbol:SNDWAV02')
	elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
		featurePortrayal:AddInstructions('ViewingGroup:24010;DrawingPriority:4;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('FillArea:SNDWAV01')
		featurePortrayal:AddInstructions('PenWidth:0.64;PenColor:CHGRD')
		featurePortrayal:AddInstructions('PenDash')
		featurePortrayal:AddInstructions('DrawLine')
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		featurePortrayal:AddInstructions('ViewingGroup:24010;DrawingPriority:4;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('FillArea:SNDWAV01')
		featurePortrayal:AddInstructions('DrawComplexLinestyle:NAVARE51')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
