-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function Gate(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
		if feature.categoryOfGate == 2 then
			featurePortrayal:AddInstructions('ViewingGroup:22010;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:GATCON04')
		elseif feature.categoryOfGate == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:32440;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:GATCON04')
		elseif feature.categoryOfGate == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:32440;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:GATCON03')
		else
			featurePortrayal:AddInstructions('ViewingGroup:22010;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:GATCON04')
		end
	elseif feature.PrimitiveType == PrimitiveType.Point then
		if feature.categoryOfGate == 2 then
			featurePortrayal:AddInstructions('ViewingGroup:22010;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:GATCON04')
		elseif feature.categoryOfGate == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:32440;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:GATCON04')
		elseif feature.categoryOfGate == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:32440;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:GATCON03')
		else
			featurePortrayal:AddInstructions('ViewingGroup:22010;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:GATCON04')
		end
	elseif feature.PrimitiveType == PrimitiveType.Curve then
		if feature.categoryOfGate == 2 then
			featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:0.64;PenColor:CSTLN')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.categoryOfGate == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:0.64;PenColor:CSTLN')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
			featurePortrayal:AddInstructions('DrawSymbol:GATCON04')
		elseif feature.categoryOfGate == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:0.64;PenColor:CSTLN')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
			featurePortrayal:AddInstructions('DrawSymbol:GATCON03')
		elseif feature.categoryOfGate == 5 then
			featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:0.64;PenColor:CSTLN')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		else
			featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:0.64;PenColor:CSTLN')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		-- Plain and symbolized boundaries use the same symbolization
		featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:8;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('ColorFillArea:CHBRN')
		featurePortrayal:AddInstructions('PenWidth:0.64;PenColor:CSTLN')
		featurePortrayal:AddInstructions('PenSolid')
		featurePortrayal:AddInstructions('DrawLine')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
