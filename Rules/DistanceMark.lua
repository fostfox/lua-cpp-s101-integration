-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function DistanceMark(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
		if feature.categoryOfDistanceMark == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:27030;DrawingPriority:7;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:DISMAR04')
		else
			featurePortrayal:AddInstructions('ViewingGroup:27030;DrawingPriority:7;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:DISMAR03')
		end
	elseif feature.PrimitiveType == PrimitiveType.Point then
		if feature.categoryOfDistanceMark == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:27030;DrawingPriority:7;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:DISMAR04')
		else
			featurePortrayal:AddInstructions('ViewingGroup:27030;DrawingPriority:7;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:DISMAR03')
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
