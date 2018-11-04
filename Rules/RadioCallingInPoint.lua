-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function RadioCallingInPoint(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
		if feature.trafficFlow == 1 and feature.orientation[1] and feature.orientation[1].orientationValue then
			featurePortrayal:AddInstructions('ViewingGroup:25060;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation[1].orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:RDOCAL02')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,3.51;FontSize:10;DrawText:' .. EncodeString('Nr %s', feature.featureName[1].name) .. '')
			end
			if feature.communicationChannel[1] then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,-3.51;FontSize:10;DrawText:' .. EncodeString('ch %s', feature.communicationChannel[1]) .. '')
			end
		elseif feature.trafficFlow == 2 and feature.orientation[1] and feature.orientation[1].orientationValue then
			featurePortrayal:AddInstructions('ViewingGroup:25060;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation[1].orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:RDOCAL02')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,3.51;FontSize:10;DrawText:' .. EncodeString('Nr %s', feature.featureName[1].name) .. '')
			end
			if feature.communicationChannel[1] then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,-3.51;FontSize:10;DrawText:' .. EncodeString('ch %s', feature.communicationChannel[1]) .. '')
			end
		elseif feature.trafficFlow == 3 and feature.orientation[1] and feature.orientation[1].orientationValue then
			featurePortrayal:AddInstructions('ViewingGroup:25060;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation[1].orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:RDOCAL02')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,3.51;FontSize:10;DrawText:' .. EncodeString('Nr %s', feature.featureName[1].name) .. '')
			end
			if feature.communicationChannel[1] then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,-3.51;FontSize:10;DrawText:' .. EncodeString('ch %s', feature.communicationChannel[1]) .. '')
			end
		elseif feature.trafficFlow == 4 and feature.orientation[1] and feature.orientation[1].orientationValue then
			featurePortrayal:AddInstructions('ViewingGroup:25060;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation[1].orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:RDOCAL03')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,3.51;FontSize:10;DrawText:' .. EncodeString('Nr %s', feature.featureName[1].name) .. '')
			end
			if feature.communicationChannel[1] then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,-3.51;FontSize:10;DrawText:' .. EncodeString('ch %s', feature.communicationChannel[1]) .. '')
			end
		else
			featurePortrayal:AddInstructions('ViewingGroup:25060;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:RCLDEF01')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,3.51;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString('Nr %s', feature.featureName[1].name) .. '')
			end
		end
	elseif feature.PrimitiveType == PrimitiveType.Point then
		if feature.trafficFlow == 1 and feature.orientation[1] and feature.orientation[1].orientationValue then
			featurePortrayal:AddInstructions('ViewingGroup:25060;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation[1].orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:RDOCAL02')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,3.51;FontSize:10;DrawText:' .. EncodeString('Nr %s', feature.featureName[1].name) .. '')
			end
			if feature.communicationChannel[1] then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,-3.51;FontSize:10;DrawText:' .. EncodeString('ch %s', feature.communicationChannel[1]) .. '')
			end
		elseif feature.trafficFlow == 2 and feature.orientation[1] and feature.orientation[1].orientationValue then
			featurePortrayal:AddInstructions('ViewingGroup:25060;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation[1].orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:RDOCAL02')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,3.51;FontSize:10;DrawText:' .. EncodeString('Nr %s', feature.featureName[1].name) .. '')
			end
			if feature.communicationChannel[1] then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,-3.51;FontSize:10;DrawText:' .. EncodeString('ch %s', feature.communicationChannel[1]) .. '')
			end
		elseif feature.trafficFlow == 3 and feature.orientation[1] and feature.orientation[1].orientationValue then
			featurePortrayal:AddInstructions('ViewingGroup:25060;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation[1].orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:RDOCAL02')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,3.51;FontSize:10;DrawText:' .. EncodeString('Nr %s', feature.featureName[1].name) .. '')
			end
			if feature.communicationChannel[1] then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,-3.51;FontSize:10;DrawText:' .. EncodeString('ch %s', feature.communicationChannel[1]) .. '')
			end
		elseif feature.trafficFlow == 4 and feature.orientation[1] and feature.orientation[1].orientationValue then
			featurePortrayal:AddInstructions('ViewingGroup:25060;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation[1].orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:RDOCAL03')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,3.51;FontSize:10;DrawText:' .. EncodeString('Nr %s', feature.featureName[1].name) .. '')
			end
			if feature.communicationChannel[1] then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,-3.51;FontSize:10;DrawText:' .. EncodeString('ch %s', feature.communicationChannel[1]) .. '')
			end
		else
			featurePortrayal:AddInstructions('ViewingGroup:25060;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:RCLDEF01')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,3.51;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString('Nr %s', feature.featureName[1].name) .. '')
			end
		end
	elseif feature.PrimitiveType == PrimitiveType.Curve then
		if feature.trafficFlow == 1 and feature.orientation[1] and feature.orientation[1].orientationValue then
			featurePortrayal:AddInstructions('ViewingGroup:25060;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:TRFCD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation[1].orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:RDOCAL02')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,3.51;FontSize:10;DrawText:' .. EncodeString('Nr %s', feature.featureName[1].name) .. '')
			end
			if feature.communicationChannel[1] then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,-3.51;FontSize:10;DrawText:' .. EncodeString('ch %s', feature.communicationChannel[1]) .. '')
			end
		elseif feature.trafficFlow == 2 and feature.orientation[1] and feature.orientation[1].orientationValue then
			featurePortrayal:AddInstructions('ViewingGroup:25060;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:TRFCD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation[1].orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:RDOCAL02')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,3.51;FontSize:10;DrawText:' .. EncodeString('Nr %s', feature.featureName[1].name) .. '')
			end
			if feature.communicationChannel[1] then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,-3.51;FontSize:10;DrawText:' .. EncodeString('ch %s', feature.communicationChannel[1]) .. '')
			end
		elseif feature.trafficFlow == 3 and feature.orientation[1] and feature.orientation[1].orientationValue then
			featurePortrayal:AddInstructions('ViewingGroup:25060;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:TRFCD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation[1].orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:RDOCAL02')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,3.51;FontSize:10;DrawText:' .. EncodeString('Nr %s', feature.featureName[1].name) .. '')
			end
			if feature.communicationChannel[1] then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,-3.51;FontSize:10;DrawText:' .. EncodeString('ch %s', feature.communicationChannel[1]) .. '')
			end
		elseif feature.trafficFlow == 4 and feature.orientation[1] and feature.orientation[1].orientationValue then
			featurePortrayal:AddInstructions('ViewingGroup:25060;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:TRFCD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation[1].orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:RDOCAL03')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,3.51;FontSize:10;DrawText:' .. EncodeString('Nr %s', feature.featureName[1].name) .. '')
			end
			if feature.communicationChannel[1] then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,-3.51;FontSize:10;DrawText:' .. EncodeString('ch %s', feature.communicationChannel[1]) .. '')
			end
		else
			featurePortrayal:AddInstructions('ViewingGroup:25060;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:TRFCD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
			featurePortrayal:AddInstructions('DrawSymbol:RCLDEF01')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,3.51;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString('Nr %s', feature.featureName[1].name) .. '')
			end
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
