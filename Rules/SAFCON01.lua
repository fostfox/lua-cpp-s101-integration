-- SAFCON01 conditional symbology rules file.

-- Main entry point for CSP.
function SAFCON01(contextParameters, depth)
	Debug.StartPerformance('Lua Code - SAFCON01')

	local instructions = {}

	if depth < 0 or depth > 99999 then
		Debug.StopPerformance('Lua Code - SAFCON01')
		return {} --unknownValue
	end

	local depth, fractional = math.modf(depth)

	fractional = math.floor(fractional * 10.0)

	if false and contextParameters._Testing_SoundingsAsText then

		local fontSize = contextParameters._Testing_SoundingsAsText_SizeContourLabels
		local color = 'SNDG1'

		if (depth <= contextParameters.SAFETY_DEPTH) then
			color = 'SNDG2'
		end

		if (contextParameters._Testing_SoundingsAsText_Font ~= "") then
			instructions[#instructions + 1] = 'FontReference:' .. contextParameters._Testing_SoundingsAsText_Font .. ';FontWeight:Light;FontSlant:Italics'
		else
			instructions[#instructions + 1] = 'FontProportion:Proportional;FontWeight:Light;FontSlant:Italics;FontColor:' .. color
		end

		if depth < 31 and fractional ~= 0 then
			-- Display contour label with subscript
			instructions[#instructions + 1] = 'LinePlacement:Relative,0.5;TextAlignHorizontal:End;TextAlignVertical:Center;FontSize:' .. fontSize
			instructions[#instructions + 1] = 'DrawText:' .. string.format('%d', depth)
			instructions[#instructions + 1] = 'TextAlignHorizontal:Start;TextAlignVertical:Top;FontSize:' .. fontSize * 0.75
			instructions[#instructions + 1] = 'MoveRelativeLocal:0.25,0;DrawText:' .. string.format('%d', fractional)
		else
			-- Display contour label as whole number
			instructions[#instructions + 1] = 'LinePlacement:Relative,0.5;TextAlignHorizontal:End;TextAlignVertical:Center;FontSize:' .. fontSize
			instructions[#instructions + 1] = 'DrawText:' .. string.format('%d', depth)
		end

	else

		local function add(symbol) instructions[#instructions + 1] = 'DrawSymbol:SAFCON' .. symbol end

		if depth < 10 and fractional ~= 0 then
			add(0 .. depth)
			add(6 .. fractional)
		elseif depth < 10 then
			add(0 .. depth)
		elseif depth < 31 and fractional ~= 0 then
			add(2 .. math.floor(depth / 10.0))
			depth = depth - math.floor(depth / 10.0) * 10
			add(1 .. math.floor(depth))
			add(5 .. fractional)
		elseif depth < 100 then
			add(2 .. math.floor(depth / 10.0))
			depth = depth - math.floor(depth / 10.0) * 10
			add(1 .. math.floor(depth))
		--[[ Manufacturer optional.  No SVGs available for this section
		elseif ...
		--]]
		end

	end
	Debug.StopPerformance('Lua Code - SAFCON01')
	return instructions
end
