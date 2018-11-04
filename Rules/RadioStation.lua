-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function RadioStation(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
		if feature.categoryOfRadioStation == 10 then
			featurePortrayal:AddInstructions('ViewingGroup:38010;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:DRFSTA01')
		else
			featurePortrayal:AddInstructions('ViewingGroup:38010;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:RDOSTA02')
		end
	elseif feature.PrimitiveType == PrimitiveType.Point then
		if feature.categoryOfRadioStation == 10 then
			featurePortrayal:AddInstructions('ViewingGroup:38010;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:DRFSTA01')
		else
			featurePortrayal:AddInstructions('ViewingGroup:38010;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:RDOSTA02')
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
