-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function CableOverhead(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Curve then
		if feature.radarConspicuous and feature.verticalClearanceSafe and feature.verticalClearanceSafe.verticalClearanceValue then
			featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:1.28;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
			featurePortrayal:AddInstructions('DrawSymbol:RACNSP01')
			if feature.verticalClearanceSafe and feature.verticalClearanceSafe.verticalClearanceValue then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,0;FontSize:10;DrawText:' .. EncodeString('sfclr %4.1f', feature.verticalClearanceSafe.verticalClearanceValue) .. '')
			end
		elseif feature.radarConspicuous and feature.verticalClearanceSafe and feature.verticalClearanceSafe.verticalClearanceValue then
			featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:1.28;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
			featurePortrayal:AddInstructions('DrawSymbol:RACNSP01')
			if feature.verticalClearanceSafe and feature.verticalClearanceSafe.verticalClearanceValue then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,0;FontSize:10;DrawText:' .. EncodeString('sfclr %4.1f', feature.verticalClearanceSafe.verticalClearanceValue) .. '')
			end
		elseif feature.radarConspicuous and feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then
			featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:1.28;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
			featurePortrayal:AddInstructions('DrawSymbol:RACNSP01')
			if feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,0;FontSize:10;DrawText:' .. EncodeString('clr %4.1f', feature.verticalClearanceFixed.verticalClearanceValue) .. '')
			end
		elseif feature.radarConspicuous and feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then
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
		elseif feature.radarConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:1.28;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
			featurePortrayal:AddInstructions('DrawSymbol:RACNSP01')
		elseif feature.verticalClearanceSafe and feature.verticalClearanceSafe.verticalClearanceValue then
			featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:1.28;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
			if feature.verticalClearanceSafe and feature.verticalClearanceSafe.verticalClearanceValue then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,0;FontSize:10;DrawText:' .. EncodeString('sfclr %4.1f', feature.verticalClearanceSafe.verticalClearanceValue) .. '')
			end
		elseif feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then
			featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:1.28;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
			if feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,0;FontSize:10;DrawText:' .. EncodeString('clr %4.1f', feature.verticalClearanceFixed.verticalClearanceValue) .. '')
			end
		else
			featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:1.28;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
