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
			DEPTH_VALUE = 20.1
		elseif feature.waterLevelEffect == 3 or feature.waterLevelEffect == 5 then
			-- always under water/submerged OR awash
			DEPTH_VALUE = 0.0
		else
			DEPTH_VALUE = -15.0
		end
	end

	local hazardSymbol = UDWHAZ05(feature, featurePortrayal, contextParameters, DEPTH_VALUE)
	local qualitySymbol = QUAPNT02(feature, featurePortrayal, contextParameters)

	if feature.PrimitiveType == PrimitiveType.Point then
		if hazardSymbol then
			featurePortrayal:AddInstructions('DrawSymbol:' .. hazardSymbol)

			if qualitySymbol then
				featurePortrayal:AddInstructions('ViewingGroup:31011;DrawSymbol:' .. qualitySymbol)
			end
		else
			-- Continuation A
			if feature.valueOfSounding then
				if feature.valueOfSounding <= contextParameters.SAFETY_DEPTH then
					featurePortrayal:AddInstructions('DrawSymbol:DANGER01')
				else
					featurePortrayal:AddInstructions('DrawSymbol:DANGER02')
				end

				local symbols = SNDFRM04(feature, featurePortrayal, contextParameters, feature.Point, DEPTH_VALUE)

				for _, symbol in ipairs(symbols) do
					featurePortrayal:AddInstructions('DrawSymbol:' .. symbol)
				end
			else
				featurePortrayal:AddInstructions('ViewingGroup:34050;DrawingPriority:4;DisplayPlane:OverRADAR')

				if feature.categoryOfWreck then
					if feature.categoryOfWreck == 1 and feature.waterLevelEffect == 3 then
						featurePortrayal:AddInstructions('DrawSymbol:WRECKS04')
					elseif feature.categoryOfWreck == 2 and feature.waterLevelEffect == 3 then
						featurePortrayal:AddInstructions('DrawSymbol:WRECKS05')
					elseif contains(feature.categoryOfWreck, { 4, 5 }) or contains(feature.waterLevelEffect, { 1, 2, 3, 4 }) then
						featurePortrayal:AddInstructions('DrawSymbol:WRECKS01')
					else
						featurePortrayal:AddInstructions('DrawSymbol:WRECKS05')
					end
				else
					featurePortrayal:AddInstructions('DrawSymbol:WRECKS05')
				end
			end

			if qualitySymbol then
				featurePortrayal:AddInstructions('ViewingGroup:31011;DrawSymbol:' .. qualitySymbol)
			end
		end
	else
		-- Continuation B
		for curveAssociation in feature:GetFlattenedSpatialAssociations() do
			featurePortrayal:AddInstructions('SpatialReferences:' .. InstructionSpatialReference(curveAssociation))

			local spatialQuality = curveAssociation.Spatial:GetInformationAssociation('spatialQuality')
			local qualityOfPosition = spatialQuality and spatialQuality.qualityOfPosition

			if qualityOfPosition and qualityOfPosition ~= 1 and qualityOfPosition ~= 10 and qualityOfPosition ~= 11 then
				featurePortrayal:AddInstructions('DrawComplexLinestyle:LOWACC41')
			elseif hazardSymbol then
				featurePortrayal:AddInstructions('PenDot;PenWidth:0.64;PenColor:CHBLK;DrawLine')
			elseif feature.valueOfSounding then
				if feature.valueOfSounding <= contextParameters.SAFETY_DEPTH then
					featurePortrayal:AddInstructions('PenDot;PenWidth:0.64;PenColor:CHBLK;DrawLine')
				else
					featurePortrayal:AddInstructions('PenDash;PenWidth:0.64;PenColor:CHBLK;DrawLine')
				end
			else
				featurePortrayal:AddInstructions('ViewingGroup:34050;DrawingPriority:4;DisplayPlane:OverRADAR')

				if feature.waterLevelEffect == 1 or feature.waterLevelEffect == 2 then
					featurePortrayal:AddInstructions('PenSolid;PenWidth:0.64;PenColor:CSTLN;DrawLine')
				elseif feature.waterLevelEffect == 4 then
					featurePortrayal:AddInstructions('PenDash;PenWidth:0.64;PenColor:CSTLN;DrawLine')
				else
					featurePortrayal:AddInstructions('PenDot;PenWidth:0.64;PenColor:CSTLN;DrawLine')
				end
			end
		end

		if feature.valueOfSounding then
			if hazardSymbol then
				featurePortrayal:AddInstructions('DrawSymbol:' .. hazardSymbol)
			else
				local symbols = SNDFRM04(feature, featurePortrayal, contextParameters, nil, DEPTH_VALUE)

				for _, symbol in ipairs(symbols) do
					featurePortrayal:AddInstructions('DrawSymbol:' .. symbol)
				end
			end
		else
			if feature.waterLevelEffect == 1 or feature.waterLevelEffect == 2 then
				featurePortrayal:AddInstructions('ColorFillArea:CHBRN')
			elseif feature.waterLevelEffect == 4 then
				featurePortrayal:AddInstructions('ColorFillArea:DEPIT')
			else
				featurePortrayal:AddInstructions('ColorFillArea:DEPVS')
			end

			if hazardSymbol then
				featurePortrayal:AddInstructions('DrawSymbol:' .. hazardSymbol)
			end
		end

		if qualitySymbol then
			featurePortrayal:AddInstructions('ViewingGroup:31011;DrawSymbol:' .. qualitySymbol)
		end
	end

	Debug.StopPerformance('Lua Code - WRECKS05')
end
