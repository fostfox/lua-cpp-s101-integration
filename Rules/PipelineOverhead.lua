-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function PipelineOverhead(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Curve then
		if feature.radarConspicuous[1] then
			featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:0.96;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
			featurePortrayal:AddInstructions('DrawSymbol:RACNSP01')
			if feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,3.51;FontSize:10;DrawText:' .. EncodeString('clr %4.1f', feature.verticalClearanceFixed.verticalClearanceValue) .. '')
			end
		elseif feature.radarConspicuous[1] then
			featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:0.96;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
			featurePortrayal:AddInstructions('DrawSymbol:RACNSP01')
			if feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,3.51;FontSize:10;DrawText:' .. EncodeString('clr %4.1f', feature.verticalClearanceFixed.verticalClearanceValue) .. '')
			end
		else
			featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:0.96;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
			if feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then
				featurePortrayal:AddInstructions('MoveRelativeLocal:3.51,3.51;FontSize:10;DrawText:' .. EncodeString('clr %4.1f', feature.verticalClearanceFixed.verticalClearanceValue) .. '')
			end
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
