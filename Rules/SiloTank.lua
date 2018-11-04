-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function SiloTank(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
		if feature.categoryOfSiloTank == 1 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:SILBUI11')
		elseif feature.categoryOfSiloTank == 2 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:TNKCON12')
		elseif feature.categoryOfSiloTank == 3 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:TOWERS03')
		elseif feature.categoryOfSiloTank == 4 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:TOWERS12')
		elseif feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:TNKCON12')
		elseif feature.categoryOfSiloTank == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:SILBUI01')
		elseif feature.categoryOfSiloTank == 2 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:TNKCON02')
		elseif feature.categoryOfSiloTank == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:TOWERS01')
		elseif feature.categoryOfSiloTank == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:TOWERS02')
		else
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:TNKCON02')
		end
	elseif feature.PrimitiveType == PrimitiveType.Point then
		if feature.categoryOfSiloTank == 1 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:SILBUI11')
		elseif feature.categoryOfSiloTank == 2 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:TNKCON12')
		elseif feature.categoryOfSiloTank == 3 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:TOWERS03')
		elseif feature.categoryOfSiloTank == 4 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:TOWERS12')
		elseif feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:TNKCON12')
		elseif feature.categoryOfSiloTank == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:SILBUI01')
		elseif feature.categoryOfSiloTank == 2 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:TNKCON02')
		elseif feature.categoryOfSiloTank == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:TOWERS01')
		elseif feature.categoryOfSiloTank == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:TOWERS02')
		else
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:TNKCON02')
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
		if feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFillArea:CHBRN')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHBLK')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		else
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFillArea:CHBRN')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:LANDF')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		if feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFillArea:CHBRN')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHBLK')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		else
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFillArea:CHBRN')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:LANDF')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
