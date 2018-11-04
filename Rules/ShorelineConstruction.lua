-- Converter Version: 0.99.6547.27240

-- Referenced portrayal rules.
require 'SLCONS04'

-- Main entry point for feature type.
function ShorelineConstruction(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point then
		-- Simplified and paper chart points use the same symbolization
		featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:8;DisplayPlane:OverRADAR')
		featurePortrayal:AddInstructions('DrawSymbol:MORFAC03')
		SLCONS04(feature, featurePortrayal, contextParameters)
	elseif feature.PrimitiveType == PrimitiveType.Curve then
		featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:7;DisplayPlane:OverRADAR')
		SLCONS04(feature, featurePortrayal, contextParameters)
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		-- Plain and symbolized boundaries use the same symbolization
		featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:7;DisplayPlane:UnderRADAR')
		SLCONS04(feature, featurePortrayal, contextParameters)
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
