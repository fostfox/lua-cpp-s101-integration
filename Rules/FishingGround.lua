-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function FishingGround(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Surface then
		-- Plain and symbolized boundaries use the same symbolization
		featurePortrayal:AddInstructions('ViewingGroup:26210;DrawingPriority:3;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('DrawSymbol:FSHGRD01')
		featurePortrayal:AddInstructions('PenWidth:0.64;PenColor:CHGRF')
		featurePortrayal:AddInstructions('PenDash')
		featurePortrayal:AddInstructions('DrawLine')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
