-- WRECKS05 conditional symbology rules file.

-- Referenced CSPs.
require 'QUAPNT02'
require 'SNDFRM04'
require 'UDWHAZ05'

-- Main entry point for CSP.
function WRECKS05(feature, featurePortrayal, contextParameters)
	Debug.StartPerformance('Lua Code - WRECKS05')

	local DEPTH_VALUE = feature.valueOfSounding or feature.defaultClearanceDepth

	if not DEPTH_VALUE then
		if feature.categoryOfWreck == 1 then
			-- non-dangerous wreck
			DEPTH_VALUE = CreateScaledDecimal(201, 1)
		elseif feature.waterLevelEffect == 3 or feature.waterLevelEffect == 5 then
			-- always under water/submerged OR awash
			DEPTH_VALUE = scaledDecimalZero
		else
			DEPTH_VALUE = CreateScaledDecimal(-150, 1)
		end
	end

	local hazardSymbol = UDWHAZ05(feature, featurePortrayal, contextParameters, DEPTH_VALUE)
	local qualitySymbol = QUAPNT02(feature, featurePortrayal, contextParameters)

	if feature.PrimitiveType == PrimitiveType.Point then
		if hazardSymbol then
			featurePortrayal:AddInstructions('PointInstruction:' .. hazardSymbol)

			if qualitySymbol then
				featurePortrayal:AddInstructions('ViewingGroup:31011;PointInstruction:' .. qualitySymbol)
			end
		else
			-- Continuation A
			if feature.valueOfSounding then
				if feature.valueOfSounding <= contextParameters.SAFETY_DEPTH then
					featurePortrayal:AddInstructions('PointInstruction:DANGER01')
				else
					featurePortrayal:AddInstructions('PointInstruction:DANGER02')
				end

				local symbols = SNDFRM04(feature, featurePortrayal, contextParameters, feature.Point, DEPTH_VALUE)

				for _, symbol in ipairs(symbols) do
					featurePortrayal:AddInstructions('PointInstruction:' .. symbol)
				end
			else
				if contextParameters.RADAR_OVERLAY then
					featurePortrayal:AddInstructions('ViewingGroup:34050;DrawingPriority:4;DisplayPlane:OverRADAR')
				else
					featurePortrayal:AddInstructions('ViewingGroup:34050;DrawingPriority:4;DisplayPlane:UnderRADAR')
				end

				if feature.categoryOfWreck then
					if feature.categoryOfWreck == 1 and feature.waterLevelEffect == 3 then
						featurePortrayal:AddInstructions('PointInstruction:WRECKS04')
					elseif feature.categoryOfWreck == 2 and feature.waterLevelEffect == 3 then
						featurePortrayal:AddInstructions('PointInstruction:WRECKS05')
					elseif contains(feature.categoryOfWreck, { 4, 5 }) or contains(feature.waterLevelEffect, { 1, 2, 3, 4 }) then
						featurePortrayal:AddInstructions('PointInstruction:WRECKS01')
					else
						featurePortrayal:AddInstructions('PointInstruction:WRECKS05')
					end
				else
					featurePortrayal:AddInstructions('PointInstruction:WRECKS05')
				end
			end

			if qualitySymbol then
				featurePortrayal:AddInstructions('ViewingGroup:31011;PointInstruction:' .. qualitySymbol)
			end
		end
	else
		-- Continuation B
		for curveAssociation in feature:GetFlattenedSpatialAssociations() do
			featurePortrayal:AddSpatialReference(curveAssociation)

			local spatialQuality = curveAssociation:GetInformationAssociation(unpack(sqParams))
			local qualityOfPosition = spatialQuality and spatialQuality.qualityOfHorizontalMeasurement

			if qualityOfPosition and qualityOfPosition ~= 1 and qualityOfPosition ~= 10 and qualityOfPosition ~= 11 then
				featurePortrayal:AddInstructions('LineInstruction:LOWACC41')
			elseif hazardSymbol then
				featurePortrayal:SimpleLineStyle('dot',0.64,'CHBLK')
				featurePortrayal:AddInstructions('LineInstruction:')
			elseif feature.valueOfSounding then
				if feature.valueOfSounding <= contextParameters.SAFETY_DEPTH then
					featurePortrayal:SimpleLineStyle('dot',0.64,'CHBLK')
					featurePortrayal:AddInstructions('LineInstruction:')
				else
					featurePortrayal:SimpleLineStyle('dash',0.64,'CHBLK')
					featurePortrayal:AddInstructions('LineInstruction:')
				end
			else
				if contextParameters.RADAR_OVERLAY then
					featurePortrayal:AddInstructions('ViewingGroup:34050;DrawingPriority:4;DisplayPlane:OverRADAR')
				else
					featurePortrayal:AddInstructions('ViewingGroup:34050;DrawingPriority:4;DisplayPlane:UnderRADAR')
				end

				if feature.waterLevelEffect == 1 or feature.waterLevelEffect == 2 then
					featurePortrayal:SimpleLineStyle('solid',0.64,'CSTLN')
					featurePortrayal:AddInstructions('LineInstruction:')
				elseif feature.waterLevelEffect == 4 then
					featurePortrayal:SimpleLineStyle('dash',0.64,'CSTLN')
					featurePortrayal:AddInstructions('LineInstruction:')
				else
					featurePortrayal:SimpleLineStyle('dot',0.64,'CSTLN')
					featurePortrayal:AddInstructions('LineInstruction:')
				end
			end

			featurePortrayal:AddInstructions('ClearGeometry')
		end

		if feature.valueOfSounding then
			if hazardSymbol then
				featurePortrayal:AddInstructions('PointInstruction:' .. hazardSymbol)
			else
				local symbols = SNDFRM04(feature, featurePortrayal, contextParameters, nil, DEPTH_VALUE)

				for _, symbol in ipairs(symbols) do
					featurePortrayal:AddInstructions('PointInstruction:' .. symbol)
				end
			end
		else
			if feature.waterLevelEffect == 1 or feature.waterLevelEffect == 2 then
				featurePortrayal:AddInstructions('ColorFill:CHBRN')
			elseif feature.waterLevelEffect == 4 then
				featurePortrayal:AddInstructions('ColorFill:DEPIT')
			else
				featurePortrayal:AddInstructions('ColorFill:DEPVS')
			end

			if hazardSymbol then
				featurePortrayal:AddInstructions('PointInstruction:' .. hazardSymbol)
			end
		end

		if qualitySymbol then
			featurePortrayal:AddInstructions('ViewingGroup:31011;PointInstruction:' .. qualitySymbol)
		end
	end

	Debug.StopPerformance('Lua Code - WRECKS05')
end
