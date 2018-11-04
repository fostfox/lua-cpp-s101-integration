-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function LocalMagneticAnomaly(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point then
		-- Simplified and paper chart points use the same symbolization
		featurePortrayal:AddInstructions('ViewingGroup:31080;DrawingPriority:4;DisplayPlane:OverRADAR')
		featurePortrayal:AddInstructions('DrawSymbol:LOCMAG01')
	elseif feature.PrimitiveType == PrimitiveType.Curve then
		featurePortrayal:AddInstructions('ViewingGroup:31080;DrawingPriority:4;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHMGF')
		featurePortrayal:AddInstructions('PenDash')
		featurePortrayal:AddInstructions('DrawLine')
		featurePortrayal:AddInstructions('DrawSymbol:LOCMAG01')
	elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
		featurePortrayal:AddInstructions('ViewingGroup:31080;DrawingPriority:4;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('DrawSymbol:LOCMAG51')
		featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHGRD')
		featurePortrayal:AddInstructions('PenDash')
		featurePortrayal:AddInstructions('DrawLine')
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		featurePortrayal:AddInstructions('ViewingGroup:31080;DrawingPriority:4;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('DrawSymbol:LOCMAG51')
		featurePortrayal:AddInstructions('DrawComplexLinestyle:NAVARE51')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
