-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function CurrentNonGravitational(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
		if feature.orientation and feature.orientation.orientationValue and feature.currentVelocity and feature.currentVelocity.velocityMaximum then
			featurePortrayal:AddInstructions('ViewingGroup:33060;DrawingPriority:5;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:CURENT01')
			featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,3.51;FontSize:10;DrawText:' .. EncodeString('%4.1f kn', feature.currentVelocity.velocityMaximum) .. '')
		elseif feature.orientation and feature.orientation.orientationValue then
			featurePortrayal:AddInstructions('ViewingGroup:33060;DrawingPriority:5;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:CURENT01')
		else
			featurePortrayal:AddInstructions('ViewingGroup:33060;DrawingPriority:5;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:CURDEF01')
		end
	elseif feature.PrimitiveType == PrimitiveType.Point then
		if feature.orientation and feature.orientation.orientationValue and feature.currentVelocity and feature.currentVelocity.velocityMaximum then
			featurePortrayal:AddInstructions('ViewingGroup:33060;DrawingPriority:5;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:CURENT01')
			featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,3.51;FontSize:10;DrawText:' .. EncodeString('%4.1f kn', feature.currentVelocity.velocityMaximum) .. '')
		elseif feature.orientation and feature.orientation.orientationValue then
			featurePortrayal:AddInstructions('ViewingGroup:33060;DrawingPriority:5;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:CURENT01')
		else
			featurePortrayal:AddInstructions('ViewingGroup:33060;DrawingPriority:5;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:CURDEF01')
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
