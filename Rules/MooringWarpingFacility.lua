-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function MooringWarpingFacility(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
		if feature.categoryOfMooringWarpingFacility == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:MORFAC03')
		elseif feature.categoryOfMooringWarpingFacility == 2 then
			featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:MORFAC04')
		elseif feature.categoryOfMooringWarpingFacility == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:32440;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:PILPNT02')
		elseif feature.categoryOfMooringWarpingFacility == 5 then
			featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:PILPNT02')
		elseif feature.categoryOfMooringWarpingFacility == 7 then
			featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BOYMOR11')
		else
			featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:MORFAC03')
		end
	elseif feature.PrimitiveType == PrimitiveType.Point then
		if feature.categoryOfMooringWarpingFacility == 7 and feature.buoyShape == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BOYMOR01')
		elseif feature.categoryOfMooringWarpingFacility == 7 and feature.buoyShape == 6 then
			featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BOYMOR03')
		elseif feature.categoryOfMooringWarpingFacility == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:MORFAC03')
		elseif feature.categoryOfMooringWarpingFacility == 2 then
			featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:MORFAC04')
		elseif feature.categoryOfMooringWarpingFacility == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:32440;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:PILPNT02')
		elseif feature.categoryOfMooringWarpingFacility == 5 then
			featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:PILPNT02')
		elseif feature.categoryOfMooringWarpingFacility == 7 then
			featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:BOYMOR11')
		else
			featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:MORFAC03')
		end
	elseif feature.PrimitiveType == PrimitiveType.Curve then
		if feature.categoryOfMooringWarpingFacility == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:0.64;PenColor:CSTLN')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.categoryOfMooringWarpingFacility == 6 then
			featurePortrayal:AddInstructions('ViewingGroup:14010;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHMGF')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		else
			featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:0.64;PenColor:CSTLN')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		-- Plain and symbolized boundaries use the same symbolization
		featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:6;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('ColorFillArea:CHBRN')
		featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHBLK')
		featurePortrayal:AddInstructions('PenSolid')
		featurePortrayal:AddInstructions('DrawLine')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
