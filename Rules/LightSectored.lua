-- LightSectored portrayal rules file.

local function nmi2metres(nmi)
	return nmi * 1852.0
end

-- Sector values are given from seaward, this function flips them.
local function flipSector(sector)
	if sector < 180.0 then
		return sector + 180.0
	else
		return sector - 180.0
	end
end

-- Main entry point for feature type.
function LightSectored(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType ~= PrimitiveType.Point then
		error('LightSectored must be of spatial type point')
	end

	featurePortrayal:AddInstructions('ViewingGroup:27070;DrawingPriority:8;DisplayPlane:OverRADAR')

	for isc, sectorCharacteristic in ipairs(feature.sectorCharacteristic) do
		for ils, lightSector in ipairs(sectorCharacteristic.lightSector) do
			local valueOfNominalRange = lightSector.valueOfNominalRange or 9.0

			local colour = lightSector.colour
			local sectorColourToken
			local sectorLightSymbol

			if colour[1] == 1 and colour[2] == 3 then -- white and red
				sectorColourToken = 'LITRD'
				sectorLightSymbol = 'LIGHTS11'
			elseif colour[1] == 3 then -- red
				sectorColourToken = 'LITRD'
				sectorLightSymbol = 'LIGHTS11'
			elseif colour[1] == 1 and colour[2] == 4 then -- white and green
				sectorColourToken = 'LITGN'
				sectorLightSymbol = 'LIGHTS12'
			elseif colour[1] == 4 then -- green
				sectorColourToken = 'LITGN'
				sectorLightSymbol = 'LIGHTS12'
			elseif colour[1] == 11 or colour[1] == 6 or colour[1] == 1 then -- orange or yellow or white
				sectorColourToken = 'LITYW'
				sectorLightSymbol = 'LIGHTS13'
			else
				sectorColourToken = 'CHMGD'
				sectorLightSymbol = 'LITDEF11'
			end

			if lightSector.sectorLimit then
				-- Sectored light.
				local sectorLimit1 = flipSector(lightSector.sectorLimit.sectorLimitOne)
				local sectorLimit2 = flipSector(lightSector.sectorLimit.sectorLimitTwo)

				if sectorLimit2 < sectorLimit1 then
					sectorLimit2 = sectorLimit2 + 360.0
				end

				-- Draw leg lines

				local leglen
				local crs

				if contextParameters.FULL_SECTORS then
					leglen = nmi2metres(valueOfNominalRange)
					crs = 'Geographic'
				else
					leglen = 25.0
					crs = 'Local'
				end

				featurePortrayal:AddInstructions('PenDash;PenWidth:0.32;PenColor:CHBLK')
				featurePortrayal:AddInstructions('DrawRay:' .. crs .. ',' .. sectorLimit1 .. ',' .. leglen)
				featurePortrayal:AddInstructions('DrawRay:' .. crs .. ',' .. sectorLimit2 .. ',' .. leglen)

				-- Draw sector arcs

				local drawArc = 'DrawArc:Local,' .. (lightSector.sectorExtension or 20.0) .. ',' .. sectorLimit1 .. ',' .. sectorLimit2 - sectorLimit1

				if contains(lightSector.lightVisibility, { 7, 6, 3 }) then
					featurePortrayal:AddInstructions('PenDash;PenWidth:0.32;PenColor:CHBLK') -- Redundant?
					featurePortrayal:AddInstructions(drawArc)
				else
					featurePortrayal:AddInstructions('PenSolid;PenWidth:1.28;PenColor:OUTLW')
					featurePortrayal:AddInstructions(drawArc)

					featurePortrayal:AddInstructions('PenSolid;PenWidth:0.64;PenColor:' .. sectorColourToken)
					featurePortrayal:AddInstructions(drawArc)
				end
			elseif lightSector.directionalCharacter then
				-- Directional light.
				local orientation = flipSector(lightSector.directionalCharacter.orientation.orientationValue)
				local leglen = nmi2metres(valueOfNominalRange)

				featurePortrayal:AddInstructions('PenDash;PenWidth:0.32;PenColor:CHBLK')
				featurePortrayal:AddInstructions('DrawRay:Geographic' .. ',' .. orientation .. ',' .. leglen)

				local categoryOfLight = feature.categoryOfLight

				if valueOfNominalRange >= 10.0 and not contains(feature.categoryOfLight, { 5 }) and sectorCharacteristic.lightCharacteristic ~= 12 then
					local drawCircle = 'DrawArc:Local,25,0,360'

					featurePortrayal:AddInstructions('PenSolid;PenWidth:1.28;PenColor:OUTLW')
					featurePortrayal:AddInstructions(drawCircle)
					
					featurePortrayal:AddInstructions('PenSolid;PenWidth:0.64;PenColor:' .. sectorColourToken)
					featurePortrayal:AddInstructions(drawCircle)
				else
					featurePortrayal:AddInstructions('Rotation:Geographic,' .. orientation)
					featurePortrayal:AddInstructions('DrawSymbol:' .. sectorLightSymbol)
				end

				featurePortrayal:AddInstructions('ViewingGroup:23;DrawingPriority:8;MoveRelativeLocal:10.53,-3.51;TextAlignVertical:Bottom;FontSize:10;FontColor:CHBLK')
				featurePortrayal:AddInstructions('DrawText:' .. string.format('%03.0f deg', lightSector.directionalCharacter.orientation.orientationValue))

				local description = LITDSN02(feature.categoryOfLight[1], sectorCharacteristic, colour, feature.height, lightSector.valueOfNominalRange, feature.status)

				featurePortrayal:AddInstructions('TextAlignVertical:Center')
				featurePortrayal:AddInstructions('DrawText:' .. EncodeString(description))
			else
				error('Neither sectorLimit nor directionalCharacter was found for lightSector.')
			end
		end
	end
end
