-- Converter Version: 0.99
-- Feature Catalogue Version: 1.0.0 (2018/9/6)

-- Silo/tank main entry point.
function SiloTank(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
		if feature.categoryOfSiloTank == 1 and feature.visuallyConspicuous == 1 then
			if contextParameters.RADAR_OVERLAY then
				featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:SILBUI11')
		elseif feature.categoryOfSiloTank == 2 and feature.visuallyConspicuous == 1 then
			if contextParameters.RADAR_OVERLAY then
				featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:TNKCON12')
		elseif feature.categoryOfSiloTank == 3 and feature.visuallyConspicuous == 1 then
			if contextParameters.RADAR_OVERLAY then
				featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:TOWERS03')
		elseif feature.categoryOfSiloTank == 4 and feature.visuallyConspicuous == 1 then
			if contextParameters.RADAR_OVERLAY then
				featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:TOWERS12')
		elseif feature.visuallyConspicuous == 1 then
			if contextParameters.RADAR_OVERLAY then
				featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:TNKCON12')
		elseif feature.categoryOfSiloTank == 1 then
			if contextParameters.RADAR_OVERLAY then
				featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:SILBUI01')
		elseif feature.categoryOfSiloTank == 2 then
			if contextParameters.RADAR_OVERLAY then
				featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:TNKCON02')
		elseif feature.categoryOfSiloTank == 3 then
			if contextParameters.RADAR_OVERLAY then
				featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:TOWERS01')
		elseif feature.categoryOfSiloTank == 4 then
			if contextParameters.RADAR_OVERLAY then
				featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:TOWERS02')
		else
			if contextParameters.RADAR_OVERLAY then
				featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:TNKCON02')
		end
	elseif feature.PrimitiveType == PrimitiveType.Point then
		if feature.categoryOfSiloTank == 1 and feature.visuallyConspicuous == 1 then
			if contextParameters.RADAR_OVERLAY then
				featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:SILBUI11')
		elseif feature.categoryOfSiloTank == 2 and feature.visuallyConspicuous == 1 then
			if contextParameters.RADAR_OVERLAY then
				featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:TNKCON12')
		elseif feature.categoryOfSiloTank == 3 and feature.visuallyConspicuous == 1 then
			if contextParameters.RADAR_OVERLAY then
				featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:TOWERS03')
		elseif feature.categoryOfSiloTank == 4 and feature.visuallyConspicuous == 1 then
			if contextParameters.RADAR_OVERLAY then
				featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:TOWERS12')
		elseif feature.visuallyConspicuous == 1 then
			if contextParameters.RADAR_OVERLAY then
				featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:TNKCON12')
		elseif feature.categoryOfSiloTank == 1 then
			if contextParameters.RADAR_OVERLAY then
				featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:SILBUI01')
		elseif feature.categoryOfSiloTank == 2 then
			if contextParameters.RADAR_OVERLAY then
				featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:TNKCON02')
		elseif feature.categoryOfSiloTank == 3 then
			if contextParameters.RADAR_OVERLAY then
				featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:TOWERS01')
		elseif feature.categoryOfSiloTank == 4 then
			if contextParameters.RADAR_OVERLAY then
				featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:TOWERS02')
		else
			if contextParameters.RADAR_OVERLAY then
				featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:TNKCON02')
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
		if feature.visuallyConspicuous == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFill:CHBRN')
			featurePortrayal:SimpleLineStyle('solid',0.32,'CHBLK')
			featurePortrayal:AddInstructions('LineInstruction:')
		else
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFill:CHBRN')
			featurePortrayal:SimpleLineStyle('solid',0.32,'LANDF')
			featurePortrayal:AddInstructions('LineInstruction:')
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		if feature.visuallyConspicuous == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFill:CHBRN')
			featurePortrayal:SimpleLineStyle('solid',0.32,'CHBLK')
			featurePortrayal:AddInstructions('LineInstruction:')
		else
			featurePortrayal:AddInstructions('ViewingGroup:32220;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFill:CHBRN')
			featurePortrayal:SimpleLineStyle('solid',0.32,'LANDF')
			featurePortrayal:AddInstructions('LineInstruction:')
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
