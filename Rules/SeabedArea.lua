-- Main entry point for feature type.
function SeabedArea(feature, featurePortrayal, contextParameters)
	local function AddNatureOfSurfaceText()
		local natureOfSurfaceAbbrev =
		{
			[1] = 'M',
			[2] = 'Cy',
			[3] = 'Si',
			[4] = 'S',
			[5] = 'St',
			[6] = 'G',
			[7] = 'P',
			[8] = 'Cb',
			[9] = 'R',
			[11] = 'R',
			[14] = 'Co',
			[17] = 'Sh',
			[18] = 'R'
		}

		if feature.surfaceCharacteristics then
			local text

			for _, surfaceCharacteristic in ipairs(feature.surfaceCharacteristics) do
				if surfaceCharacteristic.natureOfSurface then
					if text then
						text = text .. ' ' .. natureOfSurfaceAbbrev[surfaceCharacteristic.natureOfSurface]
					else
						text = natureOfSurfaceAbbrev[surfaceCharacteristic.natureOfSurface]
					end
				end
			end

			if text then
				featurePortrayal:AddInstructions('ViewingGroup:25;DrawingPriority:8;FontSize:10;FontColor:CHBLK;TextAlignHorizontal:Center;TextAlignVertical:Center')
				featurePortrayal:AddInstructions('DrawText:' .. text)
			end
		end
	end

	if feature.PrimitiveType == PrimitiveType.Point then
		-- Simplified and paper chart points use the same symbolization
		featurePortrayal:AddInstructions('ViewingGroup:34010;DrawingPriority:4;DisplayPlane:OverRADAR')
		AddNatureOfSurfaceText()
	elseif feature.PrimitiveType == PrimitiveType.Curve then
		featurePortrayal:AddInstructions('ViewingGroup:34010;DrawingPriority:4;DisplayPlane:OverRADAR')
		featurePortrayal:AddInstructions('PenSolid;PenWidth:0.32;PenColor:CHGRD;DrawLine')
		AddNatureOfSurfaceText()
	elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
		if feature.waterLevelEffect == 3 and feature.surfaceCharacteristics[1] and feature.surfaceCharacteristics[1].natureOfSurface then
			featurePortrayal:AddInstructions('ViewingGroup:34010;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('PenDash;PenWidth:0.32;PenColor:CHGRD;DrawLine')
			AddNatureOfSurfaceText()
		elseif feature.waterLevelEffect == 4 and feature.surfaceCharacteristics[1] and feature.surfaceCharacteristics[1].natureOfSurface == 9 then
			featurePortrayal:AddInstructions('ViewingGroup:34010;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('FillArea:RCKLDG01')
			featurePortrayal:AddInstructions('PenDash;PenWidth:0.32;PenColor:CHGRD;DrawLine')
		elseif feature.waterLevelEffect == 4 and feature.surfaceCharacteristics[1] and feature.surfaceCharacteristics[1].natureOfSurface == 11 then
			featurePortrayal:AddInstructions('ViewingGroup:34010;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('FillArea:RCKLDG01')
			featurePortrayal:AddInstructions('PenDash;PenWidth:0.32;PenColor:CHGRD;DrawLine')
		elseif feature.waterLevelEffect == 4 and feature.surfaceCharacteristics[1] and feature.surfaceCharacteristics[1].natureOfSurface == 14 then
			featurePortrayal:AddInstructions('ViewingGroup:34010;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('FillArea:RCKLDG01')
			featurePortrayal:AddInstructions('PenDash;PenWidth:0.32;PenColor:CHGRD;DrawLine')
		elseif feature.waterLevelEffect == 4 and feature.surfaceCharacteristics[1] and feature.surfaceCharacteristics[1].natureOfSurface then
			featurePortrayal:AddInstructions('ViewingGroup:34010;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('PenDash;PenWidth:0.32;PenColor:CHGRD;DrawLine')
			AddNatureOfSurfaceText()
		else
			featurePortrayal:AddInstructions('ViewingGroup:34010;DrawingPriority:3;DisplayPlane:OverRADAR')
			AddNatureOfSurfaceText()
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		if feature.waterLevelEffect == 3 and feature.surfaceCharacteristics[1] and feature.surfaceCharacteristics[1].natureOfSurface then
			featurePortrayal:AddInstructions('ViewingGroup:34010;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('PenDash;PenWidth:0.32;PenColor:CHGRD;DrawLine')
			AddNatureOfSurfaceText()
		elseif feature.waterLevelEffect == 4 and feature.surfaceCharacteristics[1] and feature.surfaceCharacteristics[1].natureOfSurface == 9 then
			featurePortrayal:AddInstructions('ViewingGroup:34010;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('FillArea:RCKLDG01')
			featurePortrayal:AddInstructions('PenDash;PenWidth:0.32;PenColor:CHGRD;DrawLine')
		elseif feature.waterLevelEffect == 4 and feature.surfaceCharacteristics[1] and feature.surfaceCharacteristics[1].natureOfSurface == 11 then
			featurePortrayal:AddInstructions('ViewingGroup:34010;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('FillArea:RCKLDG01')
			featurePortrayal:AddInstructions('PenDash;PenWidth:0.32;PenColor:CHGRD;DrawLine')
		elseif feature.waterLevelEffect == 4 and feature.surfaceCharacteristics[1] and feature.surfaceCharacteristics[1].natureOfSurface == 14 then
			featurePortrayal:AddInstructions('ViewingGroup:34010;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('FillArea:RCKLDG01')
			featurePortrayal:AddInstructions('PenDash;PenWidth:0.32;PenColor:CHGRD;DrawLine')
		elseif feature.waterLevelEffect == 4 and feature.surfaceCharacteristics[1] and feature.surfaceCharacteristics[1].natureOfSurface then
			featurePortrayal:AddInstructions('ViewingGroup:34010;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('PenDash;PenWidth:0.32;PenColor:CHGRD;DrawLine')
			AddNatureOfSurfaceText()
		else
			featurePortrayal:AddInstructions('ViewingGroup:34010;DrawingPriority:3;DisplayPlane:OverRADAR')
			AddNatureOfSurfaceText()
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	if #featurePortrayal.DrawingInstructions == 0 then
		featurePortrayal:AddInstructions('Null')
	end
end
