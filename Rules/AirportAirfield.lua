-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function AirportAirfield(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point then
		-- Simplified and paper chart points use the same symbolization
		featurePortrayal:AddInstructions('ViewingGroup:32240;DrawingPriority:4;DisplayPlane:OverRADAR')
		featurePortrayal:AddInstructions('DrawSymbol:AIRARE02')
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		-- Plain and symbolized boundaries use the same symbolization
		featurePortrayal:AddInstructions('ViewingGroup:32240;DrawingPriority:2;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('FillArea:AIRARE02')
		featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:LANDF')
		featurePortrayal:AddInstructions('PenSolid')
		featurePortrayal:AddInstructions('DrawLine')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
