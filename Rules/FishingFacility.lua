-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function FishingFacility(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
		if feature.categoryOfFishingFacility == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:26210;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FSHFAC03')
		elseif feature.categoryOfFishingFacility == 2 then
			featurePortrayal:AddInstructions('ViewingGroup:26210;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FSHFAC02')
		elseif feature.categoryOfFishingFacility == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:26210;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FSHFAC02')
		elseif feature.categoryOfFishingFacility == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:26210;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FSHFAC02')
		else
			featurePortrayal:AddInstructions('ViewingGroup:26210;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FSHHAV01')
		end
	elseif feature.PrimitiveType == PrimitiveType.Point then
		if feature.categoryOfFishingFacility == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:26210;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FSHFAC03')
		elseif feature.categoryOfFishingFacility == 2 then
			featurePortrayal:AddInstructions('ViewingGroup:26210;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FSHFAC02')
		elseif feature.categoryOfFishingFacility == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:26210;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FSHFAC02')
		elseif feature.categoryOfFishingFacility == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:26210;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FSHFAC02')
		else
			featurePortrayal:AddInstructions('ViewingGroup:26210;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FSHHAV01')
		end
	elseif feature.PrimitiveType == PrimitiveType.Curve then
		if feature.categoryOfFishingFacility == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:26210;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:FSHFAC02')
		else
			featurePortrayal:AddInstructions('ViewingGroup:26210;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:0.64;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
		if feature.categoryOfFishingFacility == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:26210;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('FillArea:FSHFAC03')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.categoryOfFishingFacility == 2 then
			featurePortrayal:AddInstructions('ViewingGroup:26210;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('FillArea:FSHFAC04')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.categoryOfFishingFacility == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:26210;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('FillArea:FSHFAC04')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.categoryOfFishingFacility == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:26210;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('FillArea:FSHFAC04')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		else
			featurePortrayal:AddInstructions('ViewingGroup:26210;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('FillArea:FSHHAV02')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		if feature.categoryOfFishingFacility == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:26210;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FSHFAC03')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:NAVARE51')
		elseif feature.categoryOfFishingFacility == 2 then
			featurePortrayal:AddInstructions('ViewingGroup:26210;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FSHFAC02')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:NAVARE51')
		elseif feature.categoryOfFishingFacility == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:26210;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FSHFAC02')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:NAVARE51')
		elseif feature.categoryOfFishingFacility == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:26210;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FSHFAC02')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:NAVARE51')
		else
			featurePortrayal:AddInstructions('ViewingGroup:26210;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FSHFAC02')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:NAVARE51')
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
