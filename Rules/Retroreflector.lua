-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function Retroreflector(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
		featurePortrayal:AddInstructions('ViewingGroup:27080;DrawingPriority:6;DisplayPlane:OverRADAR')
		featurePortrayal:AddInstructions('DrawSymbol:RETRFL02')
	elseif feature.PrimitiveType == PrimitiveType.Point then
		featurePortrayal:AddInstructions('ViewingGroup:27080;DrawingPriority:6;DisplayPlane:OverRADAR')
		featurePortrayal:AddInstructions('DrawSymbol:RETRFL01')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
