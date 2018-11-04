-- OBSTRN07 conditional symbology rules file.

-- Referenced CSPs.
require 'QUAPNT02'
require 'UDWHAZ05'
require 'SNDFRM04'

-- Main entry point for CSP.
function OBSTRN07(feature, featurePortrayal, contextParameters)
	Debug.StartPerformance('Lua Code - OBSTRN07')

	local DEPTH_VALUE = feature.valueOfSounding or feature.defaultClearanceDepth

	if not DEPTH_VALUE then
		if feature['!categoryOfObstruction'] == 6 or feature.waterLevelEffect == 3 then
			DEPTH_VALUE = 0.01
		elseif feature.waterLevelEffect == 5 then
			DEPTH_VALUE = 0.0
		else
			DEPTH_VALUE = -15.0
		end
	end

	local hazardSymbol = UDWHAZ05(feature, featurePortrayal, contextParameters, DEPTH_VALUE)

	local valueOfSounding = feature.valueOfSounding

	if feature.PrimitiveType == PrimitiveType.Point then
		-- Continuation A
		local qualitySymbol = QUAPNT02(feature, featurePortrayal, contextParameters)

		if hazardSymbol then
			featurePortrayal:AddInstructions('DrawSymbol:' .. hazardSymbol)

			if qualitySymbol then
				featurePortrayal:AddInstructions('ViewingGroup:31011')
				featurePortrayal:AddInstructions('DrawSymbol:' .. qualitySymbol)
			end
		else
			local sounding = false

			if valueOfSounding then
				if valueOfSounding <= contextParameters.SAFETY_DEPTH then
					if feature.Code == 'UnderwaterAwashRock' then
						if contains(feature.waterLevelEffect, {4, 5}) then
							featurePortrayal:AddInstructions('DrawSymbol:UWTROC04')
						else
							featurePortrayal:AddInstructions('DrawSymbol:DANGER01')
							sounding = true
						end
					else
						if feature.categoryOfObstruction and feature.categoryOfObstruction == 6 then
							featurePortrayal:AddInstructions('DrawSymbol:DANGER01')
							sounding = true
						elseif contains(feature.waterLevelEffect, {1, 2}) then
							featurePortrayal:AddInstructions('DrawSymbol:OBSTRN11')
						elseif contains(feature.waterLevelEffect, {4, 5}) then
							featurePortrayal:AddInstructions('DrawSymbol:DANGER03')
							sounding = true
						else
							featurePortrayal:AddInstructions('DrawSymbol:DANGER01')
							sounding = true
						end	
					end
				else
					featurePortrayal:AddInstructions('DrawSymbol:DANGER02')
					sounding = true
				end
			else
				if feature.Code == 'UnderwaterAwashRock' then
					if feature.waterLevelEffect == 3 then
						featurePortrayal:AddInstructions('DrawSymbol:UWTROC03')
					else
						featurePortrayal:AddInstructions('DrawSymbol:UWTROC04')
					end
				else
					if feature.categoryOfObstruction and feature.categoryOfObstruction == 6 then
						featurePortrayal:AddInstructions('DrawSymbol:OBSTRN01')
					elseif contains(feature.waterLevelEffect, {1, 2}) then
						featurePortrayal:AddInstructions('DrawSymbol:OBSTRN11')
					elseif contains(feature.waterLevelEffect, {4, 5}) then
						featurePortrayal:AddInstructions('DrawSymbol:OBSTRN03')
					else
						featurePortrayal:AddInstructions('DrawSymbol:OBSTRN01')
					end
				end
			end

			if sounding then
				local symbols = SNDFRM04(feature, featurePortrayal, contextParameters, feature.Point, valueOfSounding)

				for _, symbol in ipairs(symbols) do
					featurePortrayal:AddInstructions('DrawSymbol:' .. symbol)
				end
			end

			if qualitySymbol then
				featurePortrayal:AddInstructions('ViewingGroup:31011')
				featurePortrayal:AddInstructions('DrawSymbol:' .. qualitySymbol)
			end
		end
	elseif feature.PrimitiveType == PrimitiveType.Curve then
		-- Continuation B

		for curveAssociation in feature:GetFlattenedSpatialAssociations() do
			featurePortrayal:AddInstructions('SpatialReferences:' .. InstructionSpatialReference(curveAssociation))

			local spatialQuality = curveAssociation.Spatial:GetInformationAssociation('spatialQuality')
			local qualityOfPosition = spatialQuality and spatialQuality.qualityOfPosition

			if qualityOfPosition and qualityOfPosition >= 2 and qualityOfPosition <= 9 then
				if hazardSymbol then
					featurePortrayal:AddInstructions('DrawComplexLinestyle:LOWACC41')
				else
					featurePortrayal:AddInstructions('DrawComplexLinestyle:LOWACC31')
				end
			elseif hazardSymbol or (not valueOfSounding) or (valueOfSounding and valueOfSounding <= contextParameters.SAFETY_DEPTH) then
				featurePortrayal:AddInstructions('PenDot;PenWidth:0.64;PenColor:CHBLK;DrawLine')
			else
				featurePortrayal:AddInstructions('PenDash;PenWidth:0.64;PenColor:CHBLK;DrawLine')
			end
		end

		if hazardSymbol then
			featurePortrayal:AddInstructions('LinePlacement:Relative,0.5;DrawSymbol:' .. hazardSymbol)
		end

		if valueOfSounding then
			local symbols = SNDFRM04(feature, featurePortrayal, contextParameters, nil, valueOfSounding)

			for _, symbol in ipairs(symbols) do
				featurePortrayal:AddInstructions('LinePlacement:Relative,0.5;DrawSymbol:' .. symbol)
			end
		end
	else
		-- Continuation C
		if hazardSymbol then
			featurePortrayal:AddInstructions('ColorFillArea:DEPVS;FillArea:FOULAR01')
			featurePortrayal:AddInstructions('PenDot;PenWidth:0.64;PenColor:CHBLK;DrawLine')
			featurePortrayal:AddInstructions('DrawSymbol:' .. hazardSymbol)
		elseif valueOfSounding then
			if valueOfSounding <= contextParameters.SAFETY_DEPTH then
				featurePortrayal:AddInstructions('PenDot;PenWidth:0.64;PenColor:CHBLK;DrawLine')
			else
				featurePortrayal:AddInstructions('PenDash;PenWidth:0.64;PenColor:CHBLK;DrawLine')
			end

			local symbols = SNDFRM04(feature, featurePortrayal, contextParameters, nil, valueOfSounding)

			for _, symbol in ipairs(symbols) do
				featurePortrayal:AddInstructions('DrawSymbol:' .. symbol)
			end
		else
			if feature.Code == 'Obstruction' and feature.categoryOfObstruction and feature.categoryOfObstruction == 6 then
				featurePortrayal:AddInstructions('FillArea:FOULAR01')
				featurePortrayal:AddInstructions('PenDot;PenWidth:0.64;PenColor:CHBLK;DrawLine')
			elseif contains(feature.waterLevelEffect, {1, 2}) then
				featurePortrayal:AddInstructions('ColorFillArea:CHBRN')
				featurePortrayal:AddInstructions('PenSolid;PenWidth:0.64;PenColor:CHBLK;DrawLine')
			elseif feature.waterLevelEffect == 4 then
				featurePortrayal:AddInstructions('ColorFillArea:DEPIT')
				featurePortrayal:AddInstructions('PenDash;PenWidth:0.64;PenColor:CHBLK;DrawLine')
			else
				featurePortrayal:AddInstructions('ColorFillArea:DEPVS')
				featurePortrayal:AddInstructions('PenDot;PenWidth:0.64;PenColor:CHBLK;DrawLine')
			end
		end
				
		local qualitySymbol = QUAPNT02(feature, featurePortrayal, contextParameters)

		if qualitySymbol then
			featurePortrayal:AddInstructions('ViewingGroup:31011')
			featurePortrayal:AddInstructions('DrawSymbol:' .. qualitySymbol)
		end
	end

	Debug.StopPerformance('Lua Code - OBSTRN07')
end
