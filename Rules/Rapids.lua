-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function Rapids(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point then
		-- Simplified and paper chart points use the same symbolization
		featurePortrayal:AddInstructions('Null')
	elseif feature.PrimitiveType == PrimitiveType.Curve then
		featurePortrayal:AddInstructions('ViewingGroup:32050;DrawingPriority:3;DisplayPlane:OverRADAR')
		featurePortrayal:AddInstructions('PenWidth:0.96;PenColor:CHGRD')
		featurePortrayal:AddInstructions('PenSolid')
		featurePortrayal:AddInstructions('DrawLine')
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		-- Plain and symbolized boundaries use the same symbolization
		featurePortrayal:AddInstructions('ViewingGroup:32050;DrawingPriority:3;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('ColorFillArea:CHGRD')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
