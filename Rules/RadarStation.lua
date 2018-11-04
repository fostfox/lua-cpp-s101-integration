-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function RadarStation(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
		if feature.categoryOfRadarStation[1] == 2 then
			featurePortrayal:AddInstructions('ViewingGroup:38010;DrawingPriority:5;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:RDOSTA02')
			if feature.communicationChannel[1] then
				featurePortrayal:AddInstructions('MoveRelativeLocal:0,0;FontSize:10;DrawText:' .. EncodeString('ch %s', feature.communicationChannel[1]) .. '')
			end
		else
			featurePortrayal:AddInstructions('ViewingGroup:38010;DrawingPriority:5;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:POSGEN01')
		end
	elseif feature.PrimitiveType == PrimitiveType.Point then
		if feature.categoryOfRadarStation[1] == 2 then
			featurePortrayal:AddInstructions('ViewingGroup:38010;DrawingPriority:5;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:RDOSTA02')
			if feature.communicationChannel[1] then
				featurePortrayal:AddInstructions('MoveRelativeLocal:0,0;FontSize:10;DrawText:' .. EncodeString('ch %s', feature.communicationChannel[1]) .. '')
			end
		else
			featurePortrayal:AddInstructions('ViewingGroup:38010;DrawingPriority:5;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:POSGEN01')
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
