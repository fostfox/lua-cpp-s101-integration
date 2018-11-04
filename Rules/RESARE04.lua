-- RESARE04 conditional symbology rules file.

-- Main entry point for CSP.
function RESARE04(feature, featurePortrayal, contextParameters)
	Debug.StartPerformance('Lua Code - RESARE04')

	local restriction = feature.restriction
	local categoryOfRestrictedArea = feature.categoryOfRestrictedArea

	if restriction then
		if contains(restriction, { 7, 8, 14 }) then
			-- Continuation A.  Entry restricted or prohibited

			featurePortrayal:AddInstructions('DrawingPriority:6')

			if contains(restriction, { 1, 2, 3, 4, 5, 6, 13, 16, 17, 23, 24, 25, 26, 27 }) then
				featurePortrayal:AddInstructions('DrawSymbol:ENTRES61')
			elseif categoryOfRestrictedArea and contains(categoryOfRestrictedArea, { 1, 8, 9, 12, 14, 18, 19, 21, 24, 25, 26 }) then
				featurePortrayal:AddInstructions('DrawSymbol:ENTRES61')
			elseif contains(restriction, { 9, 10, 11, 12, 15, 18, 19, 20, 21, 22 }) then
				featurePortrayal:AddInstructions('DrawSymbol:ENTRES71')
			elseif categoryOfRestrictedArea and contains(categoryOfRestrictedArea, {4, 5, 6, 7, 10, 20, 22, 23 }) then
				featurePortrayal:AddInstructions('DrawSymbol:ENTRES71')
			else
				featurePortrayal:AddInstructions('DrawSymbol:ENTRES51')
			end

			if contextParameters.PLAIN_BOUNDARIES then
				featurePortrayal:AddInstructions('PenDash;PenWidth:0.64;PenColor:CHMGD;DrawLine')
			else
				featurePortrayal:AddInstructions('DrawComplexLinestyle:ENTRES51')
			end

		elseif contains(restriction, { 1, 2 }) then
			-- Continuation B.  Anchoring restricted or prohibited

			featurePortrayal:AddInstructions('DrawingPriority:6')

			if contains(restriction, { 3, 4, 5, 6, 13, 16, 17, 23, 24, 25, 26, 27 }) then
				featurePortrayal:AddInstructions('DrawSymbol:ACHRES61')
			elseif categoryOfRestrictedArea and contains(categoryOfRestrictedArea, { 1, 8, 9, 12, 14, 18, 19, 21, 24, 25, 26 }) then
				featurePortrayal:AddInstructions('DrawSymbol:ACHRES61')
			elseif contains(restriction, { 9, 10, 11, 12, 15, 18, 19, 20, 21, 22 }) then
				featurePortrayal:AddInstructions('DrawSymbol:ACHRES71')
			elseif categoryOfRestrictedArea and contains(categoryOfRestrictedArea, {4, 5, 6, 7, 10, 20, 22, 23 }) then
				featurePortrayal:AddInstructions('DrawSymbol:ACHRES71')
			else
				featurePortrayal:AddInstructions('DrawSymbol:ACHRES51')
			end

			if contextParameters.PLAIN_BOUNDARIES then
				featurePortrayal:AddInstructions('PenDash;PenWidth:0.64;PenColor:CHMGD;DrawLine')
			else
				featurePortrayal:AddInstructions('DrawComplexLinestyle:ACHRES51')
			end

		elseif contains(restriction, { 3, 4, 5, 6, 24 }) then
			-- Continuation C.  Fishing restricted or prohibited

			featurePortrayal:AddInstructions('DrawingPriority:6')

			if contains(restriction, { 13, 16, 17, 23, 24, 25, 26, 27 }) then
				featurePortrayal:AddInstructions('DrawSymbol:FSHRES61')
			elseif categoryOfRestrictedArea and contains(categoryOfRestrictedArea, { 1, 8, 9, 12, 14, 18, 19, 21, 24, 25, 26 }) then
				featurePortrayal:AddInstructions('DrawSymbol:FSHRES61')
			elseif contains(restriction, { 9, 10, 11, 12, 15, 18, 19, 20, 21, 22 }) then
				featurePortrayal:AddInstructions('DrawSymbol:FSHRES71')
			elseif categoryOfRestrictedArea and contains(categoryOfRestrictedArea, {4, 5, 6, 7, 10, 20, 22, 23 }) then
				featurePortrayal:AddInstructions('DrawSymbol:FSHRES71')
			else
				featurePortrayal:AddInstructions('DrawSymbol:FSHRES51')
			end

			if contextParameters.PLAIN_BOUNDARIES then
				featurePortrayal:AddInstructions('PenDash;PenWidth:0.64;PenColor:CHMGD;DrawLine')
			else
				featurePortrayal:AddInstructions('DrawComplexLinestyle:FSHRES51')
			end

		elseif contains(restriction, { 13, 16, 17, 23, 25, 26, 27 }) then
			-- Continuation D.  Own ship restrictions

			featurePortrayal:AddInstructions('DrawingPriority:6')

			if contains(restriction, { 9, 10, 11, 12, 15, 18, 19, 20, 21, 22 }) then
				featurePortrayal:AddInstructions('DrawSymbol:CTYARE71')
			elseif categoryOfRestrictedArea and contains(categoryOfRestrictedArea, { 4, 5, 6, 7, 10, 20, 22, 23 }) then
				featurePortrayal:AddInstructions('DrawSymbol:CTYARE71')
			else
				featurePortrayal:AddInstructions('DrawSymbol:CTYARE51')
			end

			if contextParameters.PLAIN_BOUNDARIES then
				featurePortrayal:AddInstructions('PenDash;PenWidth:0.64;PenColor:CHMGD;DrawLine')
			else
				featurePortrayal:AddInstructions('DrawComplexLinestyle:CTYARE51')
			end

		else
			if contains(restriction, {9, 10, 11, 12, 15, 18, 19, 20, 21, 22 }) then
				featurePortrayal:AddInstructions('DrawSymbol:INFARE51')
			else
				featurePortrayal:AddInstructions('DrawSymbol:RSRDEF51')
			end

			if contextParameters.PLAIN_BOUNDARIES then
				featurePortrayal:AddInstructions('PenDash;PenWidth:0.64;PenColor:CHMGD;DrawLine')
			else
				featurePortrayal:AddInstructions('DrawComplexLinestyle:CTYARE51')
			end
		end
	else
		-- Continuation E.  No restriction applies

		if categoryOfRestrictedArea then
			if contains(categoryOfRestrictedArea, { 1, 8, 9, 12, 14, 18, 19, 21, 24, 25, 26 }) then
				if contains(categoryOfRestrictedArea, { 4, 5, 6, 7, 10, 20, 22, 23 }) then
					featurePortrayal:AddInstructions('DrawSymbol:CTYARE71')
				else
					featurePortrayal:AddInstructions('DrawSymbol:CTYARE51')
				end
			else
				if contains(categoryOfRestrictedArea, { 4, 5, 6, 7, 10, 20, 22, 23 }) then
					featurePortrayal:AddInstructions('DrawSymbol:INFARE51')
				else
					featurePortrayal:AddInstructions('DrawSymbol:RSRDEF51')
				end
			end
		else
			featurePortrayal:AddInstructions('DrawSymbol:RSRDEF51')
		end

		if contextParameters.PLAIN_BOUNDARIES then
			featurePortrayal:AddInstructions('PenDash;PenWidth:0.64;PenColor:CHMGD;DrawLine')
		else
			featurePortrayal:AddInstructions('DrawComplexLinestyle:CTYARE51')
		end
	end

	Debug.StopPerformance('Lua Code - RESARE04')
end
