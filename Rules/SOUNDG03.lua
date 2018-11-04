-- SOUNDG03 conditional symbology rules file.

-- Referenced CSPs.
require 'SNDFRM04'

-- Main entry point for CSP.
function SOUNDG03(feature, featurePortrayal, contextParameters)
	Debug.StartPerformance('Lua Code - SOUNDG03')

	local points = feature.MultiPoint.Points

	for i, point in ipairs(points) do
		Debug.StopPerformance('Lua Code - SOUNDG03')
		local symbols = SNDFRM04(feature, featurePortrayal, contextParameters, point, point.Z)
		Debug.StartPerformance('Lua Code - SOUNDG03')

		featurePortrayal:AddInstructions('MoveGeographic:' .. point.X .. ',' .. point.Y)

		for j, symbol in ipairs(symbols) do
			featurePortrayal:AddInstructions('DrawSymbol:' .. symbol)
		end
	end

	Debug.StopPerformance('Lua Code - SOUNDG03')
end
