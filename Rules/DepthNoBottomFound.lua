-- DepthNoBottomFound conditional symbology rules file.

-- UNOFFICIAL:  Rules extracted from S-52 rules for soundings with a qualityOfSoundingMeasurement of 5 - no bottom found at value shown.

-- Referenced CSPs.
require 'SNDFRM04'

-- Main entry point for CSP.
function DepthNoBottomFound(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.MultiPoint then
		featurePortrayal:AddInstructions('ViewingGroup:33010;DrawingPriority:6;DisplayPlane:OverRADAR')
		local points = feature.MultiPoint.Points

		for i, point in ipairs(points) do
			local symbols = SNDFRM04(feature, featurePortrayal, contextParameters, point, point.Z)

			featurePortrayal:AddInstructions('MoveGeographic:' .. point.X .. ',' .. point.Y)

			for j, symbol in ipairs(symbols) do
				featurePortrayal:AddInstructions('DrawSymbol:' .. symbol)
			end
		end
	elseif feature.PrimitiveType == PrimitiveType.Point then
		featurePortrayal:AddInstructions('ViewingGroup:33010;DrawingPriority:6;DisplayPlane:OverRADAR')
		local point = feature.Point

		local symbols = SNDFRM04(feature, featurePortrayal, contextParameters, point, point.Z)

		featurePortrayal:AddInstructions('MoveGeographic:' .. point.X .. ',' .. point.Y)

		for j, symbol in ipairs(symbols) do
			featurePortrayal:AddInstructions('DrawSymbol:' .. symbol)
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
