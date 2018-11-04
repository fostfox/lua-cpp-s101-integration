-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function Conveyor(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Curve then
		if feature.categoryOfConveyor == 1 and feature.radarConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:1.28;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
			featurePortrayal:AddInstructions('DrawSymbol:RACNSP01')
			if feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,0;FontSize:10;DrawText:' .. EncodeString('clr %4.1f', feature.verticalClearanceFixed.verticalClearanceValue) .. '')
			end
		elseif feature.categoryOfConveyor == 1 and feature.radarConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:1.28;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
			featurePortrayal:AddInstructions('DrawSymbol:RACNSP01')
			if feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,0;FontSize:10;DrawText:' .. EncodeString('clr %4.1f', feature.verticalClearanceFixed.verticalClearanceValue) .. '')
			end
		elseif feature.categoryOfConveyor == 2 and feature.radarConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:0.96;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
			featurePortrayal:AddInstructions('DrawSymbol:RACNSP01')
			if feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,0;FontSize:10;DrawText:' .. EncodeString('clr %4.1f', feature.verticalClearanceFixed.verticalClearanceValue) .. '')
			end
		elseif feature.categoryOfConveyor == 2 and feature.radarConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:0.96;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
			featurePortrayal:AddInstructions('DrawSymbol:RACNSP01')
			if feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,0;FontSize:10;DrawText:' .. EncodeString('clr %4.1f', feature.verticalClearanceFixed.verticalClearanceValue) .. '')
			end
		elseif feature.categoryOfConveyor == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:1.28;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
			if feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,0;FontSize:10;DrawText:' .. EncodeString('clr %4.1f', feature.verticalClearanceFixed.verticalClearanceValue) .. '')
			end
		elseif feature.categoryOfConveyor == 2 then
			featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:0.96;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
			if feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,0;FontSize:10;DrawText:' .. EncodeString('clr %4.1f', feature.verticalClearanceFixed.verticalClearanceValue) .. '')
			end
		elseif feature.radarConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:1.28;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
			featurePortrayal:AddInstructions('DrawSymbol:RACNSP01')
			if feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,0;FontSize:10;DrawText:' .. EncodeString('clr %4.1f', feature.verticalClearanceFixed.verticalClearanceValue) .. '')
			end
		elseif feature.radarConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:1.28;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
			featurePortrayal:AddInstructions('DrawSymbol:RACNSP01')
			if feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,0;FontSize:10;DrawText:' .. EncodeString('clr %4.1f', feature.verticalClearanceFixed.verticalClearanceValue) .. '')
			end
		else
			featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:1.28;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
			if feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,0;FontSize:10;DrawText:' .. EncodeString('clr %4.1f', feature.verticalClearanceFixed.verticalClearanceValue) .. '')
			end
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
		if feature.radarConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:RACNSP01')
			if feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,0;FontSize:10;DrawText:' .. EncodeString('clr %4.1f', feature.verticalClearanceFixed.verticalClearanceValue) .. '')
			end
			featurePortrayal:AddInstructions('PenWidth:0.96;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.radarConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:RACNSP01')
			if feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,0;FontSize:10;DrawText:' .. EncodeString('clr %4.1f', feature.verticalClearanceFixed.verticalClearanceValue) .. '')
			end
			featurePortrayal:AddInstructions('PenWidth:0.96;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		else
			featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:8;DisplayPlane:OverRADAR')
			if feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,0;FontSize:10;DrawText:' .. EncodeString('clr %4.1f', feature.verticalClearanceFixed.verticalClearanceValue) .. '')
			end
			featurePortrayal:AddInstructions('PenWidth:0.96;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		if feature.radarConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:RACNSP01')
			if feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,0;FontSize:10;DrawText:' .. EncodeString('clr %4.1f', feature.verticalClearanceFixed.verticalClearanceValue) .. '')
			end
			featurePortrayal:AddInstructions('PenWidth:0.96;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.radarConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:RACNSP01')
			if feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,0;FontSize:10;DrawText:' .. EncodeString('clr %4.1f', feature.verticalClearanceFixed.verticalClearanceValue) .. '')
			end
			featurePortrayal:AddInstructions('PenWidth:0.96;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		else
			featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:8;DisplayPlane:OverRADAR')
			if feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,0;FontSize:10;DrawText:' .. EncodeString('clr %4.1f', feature.verticalClearanceFixed.verticalClearanceValue) .. '')
			end
			featurePortrayal:AddInstructions('PenWidth:0.96;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
