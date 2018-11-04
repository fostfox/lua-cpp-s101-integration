-- Main entry point for feature type.

-- UNOFFICIAL:  Rules extracted from S-52 lookup table for BRIDGE.

function SpanOpening(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point then
		-- Simplified and paper chart points use the same symbolization
		featurePortrayal:AddInstructions('Null')
	elseif feature.PrimitiveType == PrimitiveType.Curve then
		featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:8;DisplayPlane:OverRADAR')
		featurePortrayal:AddInstructions('PenWidth:1.6;PenColor:CHGRD;PenSolid;DrawLine')
		featurePortrayal:AddInstructions('DrawSymbol:BRIDGE01')

		-- This if statement is here since the ESRI converter doesn't always emit the mandatory attribute verticalClearanceClosed.verticalClearanceValue.
		if feature.verticalClearanceClosed and feature.verticalClearanceClosed.verticalClearanceValue then
			featurePortrayal:AddInstructions('ViewingGroup:11')
			featurePortrayal:AddInstructions('LinePlacement:Relative,0.5;FontSize:10;FontColor:CHBLK')
			featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,0;DrawText:' .. EncodeString('clr cl %4.1f', feature.verticalClearanceClosed.verticalClearanceValue))
		end

		-- This if statement is here since the ESRI converter doesn't always emit the mandatory attribute verticalClearanceOpen.verticalClearanceValue.
		if feature.verticalClearanceOpen and feature.verticalClearanceOpen.verticalClearanceValue then
			featurePortrayal:AddInstructions('ViewingGroup:11')
			featurePortrayal:AddInstructions('LinePlacement:Relative,0.5;FontSize:10;FontColor:CHBLK')
			featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,-3.51;DrawText:' .. EncodeString('clr op %4.1f', feature.verticalClearanceOpen.verticalClearanceValue))
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:8;DisplayPlane:OverRADAR')
		featurePortrayal:AddInstructions('DrawSymbol:BRIDGE01')
		featurePortrayal:AddInstructions('PenWidth:1.28;PenColor:CHGRD;PenSolid;DrawLine')

		-- This if statement is here since the ESRI converter doesn't always emit the mandatory attribute verticalClearanceClosed.verticalClearanceValue.
		if feature.verticalClearanceClosed and feature.verticalClearanceClosed.verticalClearanceValue then
			featurePortrayal:AddInstructions('ViewingGroup:11')
			featurePortrayal:AddInstructions('FontSize:10;FontColor:CHBLK')
			featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,0;DrawText:' .. EncodeString('clr cl %4.1f', feature.verticalClearanceClosed.verticalClearanceValue))
		end

		-- This if statement is here since the ESRI converter doesn't always emit the mandatory attribute verticalClearanceOpen.verticalClearanceValue.
		if feature.verticalClearanceOpen and feature.verticalClearanceOpen.verticalClearanceValue then
			featurePortrayal:AddInstructions('ViewingGroup:11')
			featurePortrayal:AddInstructions('FontSize:10;FontColor:CHBLK')
			featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,-3.51;DrawText:' .. EncodeString('clr op %4.1f', feature.verticalClearanceOpen.verticalClearanceValue))
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
