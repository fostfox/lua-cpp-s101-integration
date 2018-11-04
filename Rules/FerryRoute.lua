-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function FerryRoute(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Curve then
		if feature.categoryOfFerry[1] == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:25030;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:FERYRT01')
		elseif feature.categoryOfFerry[1] == 2 then
			featurePortrayal:AddInstructions('ViewingGroup:25030;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:FERYRT02')
		else
			featurePortrayal:AddInstructions('ViewingGroup:25030;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:FERYRT02')
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
		if feature.categoryOfFerry[1] == 2 then
			featurePortrayal:AddInstructions('ViewingGroup:25030;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FRYARE52')
			featurePortrayal:AddInstructions('PenWidth:0.64;PenColor:CHBLK')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		else
			featurePortrayal:AddInstructions('ViewingGroup:25030;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FRYARE51')
			featurePortrayal:AddInstructions('PenWidth:0.64;PenColor:CHMGD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		if feature.categoryOfFerry[1] == 2 then
			featurePortrayal:AddInstructions('ViewingGroup:25030;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FRYARE52')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:NAVARE51')
		else
			featurePortrayal:AddInstructions('ViewingGroup:25030;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FRYARE51')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:NAVARE51')
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
