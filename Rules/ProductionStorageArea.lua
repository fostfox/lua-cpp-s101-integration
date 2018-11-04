-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function ProductionStorageArea(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
		if feature.categoryOfProductionArea == 5 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FLASTK11')
		elseif feature.categoryOfProductionArea == 8 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:TNKCON12')
		elseif feature.categoryOfProductionArea == 9 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:WIMCON11')
		elseif feature.categoryOfProductionArea == 5 then
			featurePortrayal:AddInstructions('ViewingGroup:32270;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FLASTK01')
		elseif feature.categoryOfProductionArea == 6 then
			featurePortrayal:AddInstructions('ViewingGroup:32270;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:TMBYRD01')
		elseif feature.categoryOfProductionArea == 8 then
			featurePortrayal:AddInstructions('ViewingGroup:32270;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:TNKCON02')
		elseif feature.categoryOfProductionArea == 9 then
			featurePortrayal:AddInstructions('ViewingGroup:32270;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:WIMCON01')
		else
			featurePortrayal:AddInstructions('ViewingGroup:32270;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:PRDINS02')
		end
	elseif feature.PrimitiveType == PrimitiveType.Point then
		if feature.categoryOfProductionArea == 5 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FLASTK11')
		elseif feature.categoryOfProductionArea == 8 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:TNKCON12')
		elseif feature.categoryOfProductionArea == 9 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:WIMCON11')
		elseif feature.categoryOfProductionArea == 5 then
			featurePortrayal:AddInstructions('ViewingGroup:32270;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FLASTK01')
		elseif feature.categoryOfProductionArea == 6 then
			featurePortrayal:AddInstructions('ViewingGroup:32270;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:TMBYRD01')
		elseif feature.categoryOfProductionArea == 8 then
			featurePortrayal:AddInstructions('ViewingGroup:32270;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:TNKCON02')
		elseif feature.categoryOfProductionArea == 9 then
			featurePortrayal:AddInstructions('ViewingGroup:32270;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:WIMCON01')
		else
			featurePortrayal:AddInstructions('ViewingGroup:32270;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:PRDINS02')
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
		if feature.categoryOfProductionArea == 5 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:RFNERY11')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHBLK')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.categoryOfProductionArea == 8 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:TNKFRM11')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHBLK')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.categoryOfProductionArea == 9 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:WNDFRM61')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHBLK')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.categoryOfProductionArea == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:32270;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:QUARRY01')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:LANDF')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.categoryOfProductionArea == 5 then
			featurePortrayal:AddInstructions('ViewingGroup:32270;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:RFNERY01')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:LANDF')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.categoryOfProductionArea == 6 then
			featurePortrayal:AddInstructions('ViewingGroup:32270;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:TMBYRD01')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:LANDF')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.categoryOfProductionArea == 8 then
			featurePortrayal:AddInstructions('ViewingGroup:32270;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:TNKFRM01')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:LANDF')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.categoryOfProductionArea == 9 then
			featurePortrayal:AddInstructions('ViewingGroup:32270;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:WNDFRM51')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:LANDF')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		else
			featurePortrayal:AddInstructions('ViewingGroup:32270;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:LANDF')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		if feature.categoryOfProductionArea == 5 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:RFNERY11')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHBLK')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.categoryOfProductionArea == 8 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:TNKFRM11')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHBLK')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.categoryOfProductionArea == 9 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:WNDFRM61')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHBLK')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.categoryOfProductionArea == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:32270;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:QUARRY01')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:LANDF')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.categoryOfProductionArea == 5 then
			featurePortrayal:AddInstructions('ViewingGroup:32270;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:RFNERY01')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:LANDF')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.categoryOfProductionArea == 6 then
			featurePortrayal:AddInstructions('ViewingGroup:32270;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:TMBYRD01')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:LANDF')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.categoryOfProductionArea == 8 then
			featurePortrayal:AddInstructions('ViewingGroup:32270;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:TNKFRM01')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:LANDF')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.categoryOfProductionArea == 9 then
			featurePortrayal:AddInstructions('ViewingGroup:32270;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:WNDFRM51')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:LANDF')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		else
			featurePortrayal:AddInstructions('ViewingGroup:32270;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:LANDF')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
