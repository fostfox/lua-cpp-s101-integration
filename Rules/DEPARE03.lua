-- DEPARE03 conditional symbology rules file.

-- Referenced CSPs.
require 'RESCSP03'
require 'SAFCON01'
require 'SEABED01'

-- Main entry point for CSP.
function DEPARE03(feature, featurePortrayal, contextParameters)
	Debug.StartPerformance('Lua Code - DEPARE03')

	local depthRangeMinimumValue = feature.depthRangeMinimumValue or -1.0
	local depthRangeMaximumValue = feature.depthRangeMaximumValue or depthRangeMinimumValue + 0.01

	SEABED01(feature, featurePortrayal, contextParameters, depthRangeMinimumValue, depthRangeMaximumValue)

	if feature.Code == 'DredgedArea' then
		featurePortrayal:AddInstructions('FillArea:DRGARE01;PenDash:PenWidth:0.32;PenColor:DrawLine')

		if #feature.restriction > 0 then
			RESCSP03(feature, featurePortrayal, contextParameters)
		end
	end

	Debug.StopPerformance('Lua Code - DEPARE03')
	Debug.StartPerformance('Lua Code - DEPARE03 GetFlattenedSpatialAssociations')
	for curveAssociation in feature:GetFlattenedSpatialAssociations() do
		Debug.StopPerformance('Lua Code - DEPARE03 GetFlattenedSpatialAssociations')
		Debug.StartPerformance('Lua Code - DEPARE03')
		local associatedFeatures = curveAssociation.AssociatedFeatures

		local sharedFeatures = {}

		for _, sf in ipairs(associatedFeatures) do
			-- Don't include self.
			if sf ~= feature then
				sharedFeatures[sf.Code] = sf
			end
		end

		local function FirstShared(codeList)
			for _, code in ipairs(codeList) do
				local shared = sharedFeatures[code]

				if shared then
					return shared
				end
			end
		end

		local safe = false
		local unsafe = false
		local loc_safety = false

		if depthRangeMinimumValue < contextParameters.SAFETY_CONTOUR then
			unsafe = true
		else
			safe = true
		end

		local sharedDepthContour = sharedFeatures['DepthContour']
		local loc_valdco

		if sharedDepthContour then
			loc_valdco = sharedDepthContour.valueOfDepthContour or 0.0
		else
			loc_valdco = unknownValue
		end

		if loc_valdco == contextParameters.SAFETY_CONTOUR then
			loc_safety = true
		else
			local sharedDepthDredgedArea = sharedFeatures['DepthArea'] or sharedFeatures['DredgedArea']

			if sharedDepthDredgedArea then
				local drval1 = sharedDepthDredgedArea.depthRangeMinimumValue or -1.0

				if drval1 < contextParameters.SAFETY_CONTOUR then
					unsafe = true
				else
					safe = true
				end
			else
				local group1Shared = FirstShared{'LandArea', 'UnsurveyedArea', 'DockArea', 'LockBasin'}
				local landUnsurvedShared = FirstShared{'LandArea', 'UnsurveyedArea'}
				local inlandWaterShared = FirstShared{'River', 'Lake', 'Canal', 'DockArea', 'LockBasin'}
				local sharedLinearStructure = FirstShared{'LandArea', 'Gate', 'Dam', 'ShorelineConstruction', 'Causeway'}

				-- Only Dam and ShorelineConstruction in S-101 have waterLevelEffect.
				local waterLevelEffect = sharedLinearStructure and sharedLinearStructure['!waterLevelEffect']

				local watlev = sharedLinearStructure and (waterLevelEffect == nil or contains(waterLevelEffect, {1, 2, 6}))

				-- NOTE: S-52 PL 3.4 disagrees with PL 4.0.1 on the inlandWaterShared and watlev.
				--       Going with 3.4 since 4.0.1 doesn't apply the proper weight when safe water is
				--       next to a land area.
				if group1Shared and landUnsurvedShared and (not inlandWaterShared) and watlev then
					unsafe = true
				end
			end
		end

		if loc_safety or unsafe and safe then
			featurePortrayal:AddInstructions('ViewingGroup:13010;DrawingPriority:8;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('SpatialReferences:' .. InstructionSpatialReference(curveAssociation))
			
			local spatialQuality = curveAssociation.Spatial:GetInformationAssociation('spatialQuality')
			local qualityOfPosition = spatialQuality and spatialQuality.qualityOfPosition

			if qualityOfPosition and qualityOfPosition ~= 1 and qualityOfPosition ~= 10 and qualityOfPosition ~= 11 then
				featurePortrayal:AddInstructions('PenDash;PenWidth:0.64;PenColor:DEPSC')
			else
				featurePortrayal:AddInstructions('PenSolid;PenWidth:0.64;PenColor:DEPSC')
			end

			if loc_valdco ~= unknownValue then
				featurePortrayal:AddInstructions('ViewingGroup:33021;DrawingPriority:8;DisplayPlane:OverRADAR')

				featurePortrayal:AddInstructions('LinePlacement:Relative,0.5')

				local instructions = SAFCON01(contextParameters, loc_valdco)

				for _, instruction in ipairs(instructions) do
					featurePortrayal:AddInstructions(instruction)
				end
			end
		end
	end

	Debug.StopPerformance('Lua Code - DEPARE03')
end
