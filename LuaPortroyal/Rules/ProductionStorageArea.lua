-- Converter Version: 0.99
-- Feature Catalogue Version: 1.0.0 (2018/9/6)

-- Production/storage area main entry point.
function ProductionStorageArea(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
		if feature.categoryOfProductionArea == 5 and feature.visuallyConspicuous == 1 then
			if contextParameters.RADAR_OVERLAY then
				featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:FLASTK11')
		elseif feature.categoryOfProductionArea == 8 and feature.visuallyConspicuous == 1 then
			if contextParameters.RADAR_OVERLAY then
				featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:TNKCON12')
		elseif feature.categoryOfProductionArea == 9 and feature.visuallyConspicuous == 1 then
			if contextParameters.RADAR_OVERLAY then
				featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:WIMCON11')
		elseif feature.categoryOfProductionArea == 5 then
			if contextParameters.RADAR_OVERLAY then
				featurePortrayal:AddInstructions('ViewingGroup:32270;DrawingPriority:4;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:32270;DrawingPriority:4;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:FLASTK01')
		elseif feature.categoryOfProductionArea == 6 then
			if contextParameters.RADAR_OVERLAY then
				featurePortrayal:AddInstructions('ViewingGroup:32270;DrawingPriority:4;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:32270;DrawingPriority:4;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:TMBYRD01')
		elseif feature.categoryOfProductionArea == 8 then
			if contextParameters.RADAR_OVERLAY then
				featurePortrayal:AddInstructions('ViewingGroup:32270;DrawingPriority:4;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:32270;DrawingPriority:4;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:TNKCON02')
		elseif feature.categoryOfProductionArea == 9 then
			if contextParameters.RADAR_OVERLAY then
				featurePortrayal:AddInstructions('ViewingGroup:32270;DrawingPriority:4;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:32270;DrawingPriority:4;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:WIMCON01')
		else
			if contextParameters.RADAR_OVERLAY then
				featurePortrayal:AddInstructions('ViewingGroup:32270;DrawingPriority:4;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:32270;DrawingPriority:4;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:PRDINS02')
		end
	elseif feature.PrimitiveType == PrimitiveType.Point then
		if feature.categoryOfProductionArea == 5 and feature.visuallyConspicuous == 1 then
			if contextParameters.RADAR_OVERLAY then
				featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:FLASTK11')
		elseif feature.categoryOfProductionArea == 8 and feature.visuallyConspicuous == 1 then
			if contextParameters.RADAR_OVERLAY then
				featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:TNKCON12')
		elseif feature.categoryOfProductionArea == 9 and feature.visuallyConspicuous == 1 then
			if contextParameters.RADAR_OVERLAY then
				featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:WIMCON11')
		elseif feature.categoryOfProductionArea == 5 then
			if contextParameters.RADAR_OVERLAY then
				featurePortrayal:AddInstructions('ViewingGroup:32270;DrawingPriority:4;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:32270;DrawingPriority:4;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:FLASTK01')
		elseif feature.categoryOfProductionArea == 6 then
			if contextParameters.RADAR_OVERLAY then
				featurePortrayal:AddInstructions('ViewingGroup:32270;DrawingPriority:4;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:32270;DrawingPriority:4;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:TMBYRD01')
		elseif feature.categoryOfProductionArea == 8 then
			if contextParameters.RADAR_OVERLAY then
				featurePortrayal:AddInstructions('ViewingGroup:32270;DrawingPriority:4;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:32270;DrawingPriority:4;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:TNKCON02')
		elseif feature.categoryOfProductionArea == 9 then
			if contextParameters.RADAR_OVERLAY then
				featurePortrayal:AddInstructions('ViewingGroup:32270;DrawingPriority:4;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:32270;DrawingPriority:4;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:WIMCON01')
		else
			if contextParameters.RADAR_OVERLAY then
				featurePortrayal:AddInstructions('ViewingGroup:32270;DrawingPriority:4;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:32270;DrawingPriority:4;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:PRDINS02')
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
		if feature.categoryOfProductionArea == 5 and feature.visuallyConspicuous == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('PointInstruction:RFNERY11')
			featurePortrayal:SimpleLineStyle('dash',0.32,'CHBLK')
			featurePortrayal:AddInstructions('LineInstruction:')
		elseif feature.categoryOfProductionArea == 8 and feature.visuallyConspicuous == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('PointInstruction:TNKFRM11')
			featurePortrayal:SimpleLineStyle('dash',0.32,'CHBLK')
			featurePortrayal:AddInstructions('LineInstruction:')
		elseif feature.categoryOfProductionArea == 9 and feature.visuallyConspicuous == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('PointInstruction:WNDFRM61')
			featurePortrayal:SimpleLineStyle('dash',0.32,'CHBLK')
			featurePortrayal:AddInstructions('LineInstruction:')
		elseif feature.categoryOfProductionArea == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:32270;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('PointInstruction:QUARRY01')
			featurePortrayal:SimpleLineStyle('dash',0.32,'LANDF')
			featurePortrayal:AddInstructions('LineInstruction:')
		elseif feature.categoryOfProductionArea == 5 then
			featurePortrayal:AddInstructions('ViewingGroup:32270;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('PointInstruction:RFNERY01')
			featurePortrayal:SimpleLineStyle('dash',0.32,'LANDF')
			featurePortrayal:AddInstructions('LineInstruction:')
		elseif feature.categoryOfProductionArea == 6 then
			featurePortrayal:AddInstructions('ViewingGroup:32270;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('PointInstruction:TMBYRD01')
			featurePortrayal:SimpleLineStyle('dash',0.32,'LANDF')
			featurePortrayal:AddInstructions('LineInstruction:')
		elseif feature.categoryOfProductionArea == 8 then
			featurePortrayal:AddInstructions('ViewingGroup:32270;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('PointInstruction:TNKFRM01')
			featurePortrayal:SimpleLineStyle('dash',0.32,'LANDF')
			featurePortrayal:AddInstructions('LineInstruction:')
		elseif feature.categoryOfProductionArea == 9 then
			featurePortrayal:AddInstructions('ViewingGroup:32270;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('PointInstruction:WNDFRM51')
			featurePortrayal:SimpleLineStyle('dash',0.32,'LANDF')
			featurePortrayal:AddInstructions('LineInstruction:')
		else
			featurePortrayal:AddInstructions('ViewingGroup:32270;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:SimpleLineStyle('dash',0.32,'LANDF')
			featurePortrayal:AddInstructions('LineInstruction:')
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		if feature.categoryOfProductionArea == 5 and feature.visuallyConspicuous == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('PointInstruction:RFNERY11')
			featurePortrayal:SimpleLineStyle('dash',0.32,'CHBLK')
			featurePortrayal:AddInstructions('LineInstruction:')
		elseif feature.categoryOfProductionArea == 8 and feature.visuallyConspicuous == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('PointInstruction:TNKFRM11')
			featurePortrayal:SimpleLineStyle('dash',0.32,'CHBLK')
			featurePortrayal:AddInstructions('LineInstruction:')
		elseif feature.categoryOfProductionArea == 9 and feature.visuallyConspicuous == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('PointInstruction:WNDFRM61')
			featurePortrayal:SimpleLineStyle('dash',0.32,'CHBLK')
			featurePortrayal:AddInstructions('LineInstruction:')
		elseif feature.categoryOfProductionArea == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:32270;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('PointInstruction:QUARRY01')
			featurePortrayal:SimpleLineStyle('dash',0.32,'LANDF')
			featurePortrayal:AddInstructions('LineInstruction:')
		elseif feature.categoryOfProductionArea == 5 then
			featurePortrayal:AddInstructions('ViewingGroup:32270;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('PointInstruction:RFNERY01')
			featurePortrayal:SimpleLineStyle('dash',0.32,'LANDF')
			featurePortrayal:AddInstructions('LineInstruction:')
		elseif feature.categoryOfProductionArea == 6 then
			featurePortrayal:AddInstructions('ViewingGroup:32270;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('PointInstruction:TMBYRD01')
			featurePortrayal:SimpleLineStyle('dash',0.32,'LANDF')
			featurePortrayal:AddInstructions('LineInstruction:')
		elseif feature.categoryOfProductionArea == 8 then
			featurePortrayal:AddInstructions('ViewingGroup:32270;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('PointInstruction:TNKFRM01')
			featurePortrayal:SimpleLineStyle('dash',0.32,'LANDF')
			featurePortrayal:AddInstructions('LineInstruction:')
		elseif feature.categoryOfProductionArea == 9 then
			featurePortrayal:AddInstructions('ViewingGroup:32270;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('PointInstruction:WNDFRM51')
			featurePortrayal:SimpleLineStyle('dash',0.32,'LANDF')
			featurePortrayal:AddInstructions('LineInstruction:')
		else
			featurePortrayal:AddInstructions('ViewingGroup:32270;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:SimpleLineStyle('dash',0.32,'LANDF')
			featurePortrayal:AddInstructions('LineInstruction:')
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
