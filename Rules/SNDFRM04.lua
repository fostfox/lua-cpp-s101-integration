-- SNDFRM04 conditional symbology rules file.

-- Main entry point for CSP.
function SNDFRM04(feature, featurePortrayal, contextParameters, soundingPoint, depthValue)
	Debug.StartPerformance('Lua Code - SNDFRM04')

	local symbols = {}

	local function addSymbol(symbol)
		symbols[#symbols + 1] = symbol
	end

	local symbolPrefix
	local color
	local fontSize

	if depthValue <= contextParameters.SAFETY_DEPTH then
		color = 'SNDG2' -- Sounding shallow
		symbolPrefix = 'SOUNDS'
		--fontSize = contextParameters._Testing_SoundingsAsText_SizeUnsafe
	else
		color = 'SNDG1' -- Sounding deep
		symbolPrefix = 'SOUNDG'
		--fontSize = contextParameters._Testing_SoundingsAsText_SizeSafe
	end

	if (depthValue > contextParameters.SAFETY_DEPTH and not contextParameters._Testing_Soundings_PortraySafe) then
		Debug.StopPerformance('Lua Code - SNDFRM04')
		return symbols
	end

	if contains(feature.techniqueOfVerticalMeasurement, { 4, 6 }) then
		addSymbol(symbolPrefix..'B1')
	end

	if feature.Code == 'DepthNoBottomFound' or contains(feature.qualityOfSoundingMeasurement, { 3, 4, 5, 8, 9 }) or contains(feature.status, { 18 }) then
		addSymbol(symbolPrefix..'C2')
	else
		local spatialQuality = feature.Spatial:GetInformationAssociation('spatialQuality')
		local qualityOfPosition = spatialQuality and spatialQuality.qualityOfPosition

		if qualityOfPosition and qualityOfPosition ~= 1 and qualityOfPosition ~= 10 and qualityOfPosition ~= 11 then
			addSymbol(symbolPrefix..'C2')
		end
	end
	
	if depthValue < 0 then
		addSymbol(symbolPrefix..'A1')
	end

	local idepth, fdepth = math.modf(math.abs(depthValue))
	fdepth = math.floor(fdepth * 10.0 + 0.05)

	if false and contextParameters._Testing_SoundingsAsText then

		if ((depthValue <= contextParameters.SAFETY_DEPTH) and contextParameters._Testing_SoundingsAsText_BoldUnsafe) then
			featurePortrayal:AddInstructions('FontWeight:Bold')
		else
			featurePortrayal:AddInstructions('FontWeight:Medium')
		end

		if (contextParameters._Testing_SoundingsAsText_Font ~= "") then
			featurePortrayal:AddInstructions('FontReference:' .. contextParameters._Testing_SoundingsAsText_Font .. ';FontColor:' .. color)
		end

		if soundingPoint then
			featurePortrayal:AddInstructions('MoveGeographic:' .. soundingPoint.X .. ',' .. soundingPoint.Y)
		end

		featurePortrayal:AddInstructions('ViewingGroup:33010')

		if depthValue < 10 then
			featurePortrayal:AddInstructions('TextAlignHorizontal:End;TextAlignVertical:Center;FontSize:' .. fontSize)
			featurePortrayal:AddInstructions('DrawText:' .. string.format('%d', idepth))
			featurePortrayal:AddInstructions('MoveRelativeLocal:0.25,0;TextAlignHorizontal:Start;TextAlignVertical:Top;FontSize:' .. fontSize * 0.75)
			featurePortrayal:AddInstructions('DrawText:' .. string.format('%d', fdepth))
		elseif depthValue < 31 and fractional ~= 0 then
			featurePortrayal:AddInstructions('TextAlignHorizontal:End;TextAlignVertical:Center;FontSize:' .. fontSize)
			featurePortrayal:AddInstructions('DrawText:' .. string.format('%d', idepth))
			featurePortrayal:AddInstructions('MoveRelativeLocal:0.25,0;TextAlignHorizontal:Start;TextAlignVertical:Top;FontSize:' .. fontSize * 0.75)
			featurePortrayal:AddInstructions('DrawText:' .. string.format('%d', fdepth))
		else
			featurePortrayal:AddInstructions('TextAlignHorizontal:End;TextAlignVertical:Center;FontSize:' .. fontSize)
			featurePortrayal:AddInstructions('DrawText:' .. string.format('%d', idepth))
		end

		--For testing...
		--addSymbol('CURSRB01')
		--featurePortrayal:AddAugmentedPoint(point, nil, nil, Text.CreateTextPoint({Text.CreateTextElement("TL - QqJjGgX.y", defaultFontCharacteristics, 10, color)}, zeroVector, nil, placementMode, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Top), nil, PortrayalModel.CreateDisplayParameters(33010))
		--featurePortrayal:AddAugmentedPoint(point, nil, nil, Text.CreateTextPoint({Text.CreateTextElement("TC - QqJjGgX.y", defaultFontCharacteristics, 10, color)}, zeroVector, nil, placementMode, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Top), nil, PortrayalModel.CreateDisplayParameters(33010))
		--featurePortrayal:AddAugmentedPoint(point, nil, nil, Text.CreateTextPoint({Text.CreateTextElement("TR - QqJjGgX.y", defaultFontCharacteristics, 10, color)}, zeroVector, nil, placementMode, Text.HorizontalAlignment.End, Text.VerticalAlignment.Top), nil, PortrayalModel.CreateDisplayParameters(33010))
		--featurePortrayal:AddAugmentedPoint(point, nil, nil, Text.CreateTextPoint({Text.CreateTextElement("CL - QqJjGgX.y", defaultFontCharacteristics, 10, color)}, zeroVector, nil, placementMode, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(33010))
		--featurePortrayal:AddAugmentedPoint(point, nil, nil, Text.CreateTextPoint({Text.CreateTextElement("CC - QqJjGgX.y", defaultFontCharacteristics, 10, color)}, zeroVector, nil, placementMode, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(33010))
		--featurePortrayal:AddAugmentedPoint(point, nil, nil, Text.CreateTextPoint({Text.CreateTextElement("CR - QqJjGgX.y", defaultFontCharacteristics, 10, color)}, zeroVector, nil, placementMode, Text.HorizontalAlignment.End, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(33010))
		--featurePortrayal:AddAugmentedPoint(point, nil, nil, Text.CreateTextPoint({Text.CreateTextElement("BL - QqJjGgX.y", defaultFontCharacteristics, 10, color)}, zeroVector, nil, placementMode, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(33010))
		--featurePortrayal:AddAugmentedPoint(point, nil, nil, Text.CreateTextPoint({Text.CreateTextElement("BC - QqJjGgX.y", defaultFontCharacteristics, 10, color)}, zeroVector, nil, placementMode, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(33010))
		--featurePortrayal:AddAugmentedPoint(point, nil, nil, Text.CreateTextPoint({Text.CreateTextElement("BR - QqJjGgX.y", defaultFontCharacteristics, 10, color)}, zeroVector, nil, placementMode, Text.HorizontalAlignment.End, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(33010))
	else
		local digits = {}

		local depth = idepth

		while depth ~= 0 do
			digits[#digits + 1] = depth % 10
			depth = math.modf(depth / 10)
		end

		if #digits == 0 then
			digits[1] = 0
		else
			-- Reverse digits
			for i = 0, #digits / 2 - 1 do
				digits[i + 1], digits[#digits - i] = digits[#digits - i], digits[i + 1]
			end
		end

		if depthValue < 10 then
			addSymbol(symbolPrefix..'1'..digits[1])
			addSymbol(symbolPrefix..'5'..fdepth)
		elseif depthValue < 31 and fractional ~= 0 then
			addSymbol(symbolPrefix..'2'..digits[1])
			addSymbol(symbolPrefix..'1'..digits[2])
			addSymbol(symbolPrefix..'5'..fdepth)
		elseif depthValue < 100 then
			addSymbol(symbolPrefix..'1'..digits[1])
			addSymbol(symbolPrefix..'0'..digits[2])
		elseif depthValue < 1000 then
			addSymbol(symbolPrefix..'2'..digits[1])
			addSymbol(symbolPrefix..'1'..digits[2])
			addSymbol(symbolPrefix..'0'..digits[3])
		elseif depthValue < 10000 then
			addSymbol(symbolPrefix..'2'..digits[1])
			addSymbol(symbolPrefix..'1'..digits[2])
			addSymbol(symbolPrefix..'0'..digits[3])
			addSymbol(symbolPrefix..'4'..digits[4])
		else
			addSymbol(symbolPrefix..'3'..digits[1])
			addSymbol(symbolPrefix..'2'..digits[2])
			addSymbol(symbolPrefix..'1'..digits[3])
			addSymbol(symbolPrefix..'0'..digits[4])
			addSymbol(symbolPrefix..'4'..digits[5])
		end
	end

	Debug.StopPerformance('Lua Code - SNDFRM04')

	return symbols
end
