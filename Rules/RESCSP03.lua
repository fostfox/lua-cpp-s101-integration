-- RESCSP03 conditional symbology rules file.

-- Main entry point for CSP.
function RESCSP03(feature, featurePortrayal, contextParameters)
	Debug.StartPerformance('Lua Code - RESCSP03')

	local restriction = feature.restriction

	if contains(restriction, { 7, 8, 14 }) then
		-- Entry restricted or prohibited
		if contains(restriction, { 1, 2, 3, 4, 5, 6, 13, 16, 17, 23, 24, 25, 26, 27 }) then
			featurePortrayal:AddInstructions('DrawSymbol:ENTRES61')
		elseif contains(restriction, { 9, 10, 11, 12, 15, 18, 19, 20, 21, 22 }) then
			featurePortrayal:AddInstructions('DrawSymbol:ENTRES71')
		else
			featurePortrayal:AddInstructions('DrawSymbol:ENTRES51')
		end
	elseif contains(restriction, { 1, 2 }) then
		-- Anchoring restricted or prohibited
		if contains(restriction, { 3, 4, 5, 6, 13, 16, 17, 23, 24, 25, 26, 27 }) then
			featurePortrayal:AddInstructions('DrawSymbol:ACHRES61')
		elseif contains(restriction, { 9, 10, 11, 12, 15, 18, 19, 20, 21, 22 }) then
			featurePortrayal:AddInstructions('DrawSymbol:ACHRES71')
		else
			featurePortrayal:AddInstructions('DrawSymbol:ACHRES51')
		end
	elseif contains(restriction, { 3, 4, 5, 6, 24 }) then
		-- Fishing restricted or prohibited
		if contains(restriction, { 13, 16, 17, 23, 24, 25, 26, 27 }) then
			featurePortrayal:AddInstructions('DrawSymbol:FSHRES61')
		elseif contains(restriction, { 9, 10, 11, 12, 15, 18, 19, 20, 21, 22 }) then
			featurePortrayal:AddInstructions('DrawSymbol:FSHRES71')
		else
			featurePortrayal:AddInstructions('DrawSymbol:FSHRES51')
		end
	elseif contains(restriction, { 13, 16, 17, 23, 25, 26, 27 }) then
		-- Own ship restrictions
		if contains(restriction, { 9, 10, 11, 12, 15, 18, 19, 20, 21, 22 }) then
			featurePortrayal:AddInstructions('DrawSymbol:CTYARE71')
		else
			featurePortrayal:AddInstructions('DrawSymbol:CTYARE51')
		end
	elseif contains(restriction, { 9, 10, 11, 12, 15, 18, 19, 20, 21, 22 }) then
		featurePortrayal:AddInstructions('DrawSymbol:INFARE71')
	else
		featurePortrayal:AddInstructions('DrawSymbol:RSRDEP51')
	end

	Debug.StopPerformance('Lua Code - RESCSP03')
end
