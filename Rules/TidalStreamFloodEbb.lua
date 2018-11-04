-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function TidalStreamFloodEbb(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
		if feature.categoryOfTidalStream == 1 and feature.orientation and feature.orientation.orientationValue then
			featurePortrayal:AddInstructions('ViewingGroup:33060;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:FLDSTR01')
			featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,3.51;FontSize:10;DrawText:' .. EncodeString('%4.1f kn', feature.currentVelocity.velocityMaximum) .. '')
		elseif feature.categoryOfTidalStream == 2 and feature.orientation and feature.orientation.orientationValue then
			featurePortrayal:AddInstructions('ViewingGroup:33060;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:EBBSTR01')
			featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,3.51;FontSize:10;DrawText:' .. EncodeString('%4.1f kn', feature.currentVelocity.velocityMaximum) .. '')
		elseif feature.categoryOfTidalStream == 3 and feature.orientation and feature.orientation.orientationValue then
			featurePortrayal:AddInstructions('ViewingGroup:33060;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:CURENT01')
			featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,3.51;FontSize:10;DrawText:' .. EncodeString('%4.1f kn', feature.currentVelocity.velocityMaximum) .. '')
		else
			featurePortrayal:AddInstructions('ViewingGroup:33060;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:CURDEF01')
		end
	elseif feature.PrimitiveType == PrimitiveType.Point then
		if feature.categoryOfTidalStream == 1 and feature.orientation and feature.orientation.orientationValue then
			featurePortrayal:AddInstructions('ViewingGroup:33060;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:FLDSTR01')
			featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,3.51;FontSize:10;DrawText:' .. EncodeString('%4.1f kn', feature.currentVelocity.velocityMaximum) .. '')
		elseif feature.categoryOfTidalStream == 2 and feature.orientation and feature.orientation.orientationValue then
			featurePortrayal:AddInstructions('ViewingGroup:33060;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:EBBSTR01')
			featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,3.51;FontSize:10;DrawText:' .. EncodeString('%4.1f kn', feature.currentVelocity.velocityMaximum) .. '')
		elseif feature.categoryOfTidalStream == 3 and feature.orientation and feature.orientation.orientationValue then
			featurePortrayal:AddInstructions('ViewingGroup:33060;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:CURENT01')
			featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,3.51;FontSize:10;DrawText:' .. EncodeString('%4.1f kn', feature.currentVelocity.velocityMaximum) .. '')
		else
			featurePortrayal:AddInstructions('ViewingGroup:33060;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:CURDEF01')
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
		if feature.categoryOfTidalStream == 1 and feature.orientation and feature.orientation.orientationValue then
			featurePortrayal:AddInstructions('ViewingGroup:33060;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:FLDSTR01')
			featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,3.51;FontSize:10;DrawText:' .. EncodeString('%4.1f kn', feature.currentVelocity.velocityMaximum) .. '')
		elseif feature.categoryOfTidalStream == 2 and feature.orientation and feature.orientation.orientationValue then
			featurePortrayal:AddInstructions('ViewingGroup:33060;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:EBBSTR01')
			featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,3.51;FontSize:10;DrawText:' .. EncodeString('%4.1f kn', feature.currentVelocity.velocityMaximum) .. '')
		elseif feature.categoryOfTidalStream == 3 and feature.orientation and feature.orientation.orientationValue then
			featurePortrayal:AddInstructions('ViewingGroup:33060;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:CURENT01')
			featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,3.51;FontSize:10;DrawText:' .. EncodeString('%4.1f kn', feature.currentVelocity.velocityMaximum) .. '')
		else
			featurePortrayal:AddInstructions('ViewingGroup:33060;DrawingPriority:2;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:CURDEF01')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		if feature.categoryOfTidalStream == 1 and feature.orientation and feature.orientation.orientationValue then
			featurePortrayal:AddInstructions('ViewingGroup:33060;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:FLDSTR01')
			featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,3.51;FontSize:10;DrawText:' .. EncodeString('%4.1f kn', feature.currentVelocity.velocityMaximum) .. '')
		elseif feature.categoryOfTidalStream == 2 and feature.orientation and feature.orientation.orientationValue then
			featurePortrayal:AddInstructions('ViewingGroup:33060;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:EBBSTR01')
			featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,3.51;FontSize:10;DrawText:' .. EncodeString('%4.1f kn', feature.currentVelocity.velocityMaximum) .. '')
		elseif feature.categoryOfTidalStream == 3 and feature.orientation and feature.orientation.orientationValue then
			featurePortrayal:AddInstructions('ViewingGroup:33060;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:CURENT01')
			featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,3.51;FontSize:10;DrawText:' .. EncodeString('%4.1f kn', feature.currentVelocity.velocityMaximum) .. '')
		else
			featurePortrayal:AddInstructions('ViewingGroup:33060;DrawingPriority:2;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:CURDEF01')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:TIDINF51')
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
