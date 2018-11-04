-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function HarbourFacility(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
		if feature.categoryOfHarbourFacility[1] == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:32410;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:ROLROL01')
		elseif feature.categoryOfHarbourFacility[1] == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:32410;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:HRBFAC09')
		elseif feature.categoryOfHarbourFacility[1] == 5 then
			featurePortrayal:AddInstructions('ViewingGroup:32410;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:SMCFAC02')
		else
			featurePortrayal:AddInstructions('ViewingGroup:32410;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:CHINFO07')
		end
	elseif feature.PrimitiveType == PrimitiveType.Point then
		if feature.categoryOfHarbourFacility[1] == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:32410;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:ROLROL01')
		elseif feature.categoryOfHarbourFacility[1] == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:32410;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:HRBFAC09')
		elseif feature.categoryOfHarbourFacility[1] == 5 then
			featurePortrayal:AddInstructions('ViewingGroup:32410;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:SMCFAC02')
		else
			featurePortrayal:AddInstructions('ViewingGroup:32410;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:CHINFO07')
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
		if feature.categoryOfHarbourFacility[1] == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:32410;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:ROLROL01')
		elseif feature.categoryOfHarbourFacility[1] == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:32410;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:HRBFAC09')
		elseif feature.categoryOfHarbourFacility[1] == 5 then
			featurePortrayal:AddInstructions('ViewingGroup:32410;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:SMCFAC02')
		else
			featurePortrayal:AddInstructions('ViewingGroup:32410;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:CHINFO07')
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		if feature.categoryOfHarbourFacility[1] == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:32410;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:ROLROL01')
		elseif feature.categoryOfHarbourFacility[1] == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:32410;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:HRBFAC09')
		elseif feature.categoryOfHarbourFacility[1] == 5 then
			featurePortrayal:AddInstructions('ViewingGroup:32410;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:SMCFAC02')
		else
			featurePortrayal:AddInstructions('ViewingGroup:32410;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:CHINFO07')
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
