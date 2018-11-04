-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function TwoWayRoutePart(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
		if feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:TWRTPT53')
			featurePortrayal:AddInstructions('PenWidth:1.28;PenColor:TRFCD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 2 then
			featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:TWRTPT53')
			featurePortrayal:AddInstructions('PenWidth:1.28;PenColor:TRFCD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:TWRTPT53')
			featurePortrayal:AddInstructions('PenWidth:1.28;PenColor:TRFCD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:TWRTPT52')
			featurePortrayal:AddInstructions('PenWidth:1.28;PenColor:TRFCD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		else
			featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:TWRDEF51')
			featurePortrayal:AddInstructions('PenWidth:1.28;PenColor:TRFCD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		if feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:TWRTPT53')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:CTYARE51')
		elseif feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 2 then
			featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:TWRTPT53')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:CTYARE51')
		elseif feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:TWRTPT53')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:CTYARE51')
		elseif feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:TWRTPT52')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:CTYARE51')
		else
			featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:TWRDEF51')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:CTYARE51')
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
