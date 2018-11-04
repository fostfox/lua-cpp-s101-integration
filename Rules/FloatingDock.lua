-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function FloatingDock(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Curve then
		featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:5;DisplayPlane:OverRADAR')
		featurePortrayal:AddInstructions('PenWidth:0.96;PenColor:CSTLN')
		featurePortrayal:AddInstructions('PenSolid')
		featurePortrayal:AddInstructions('DrawLine')
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		-- Plain and symbolized boundaries use the same symbolization
		featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:2;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('ColorFillArea:CHBRN')
		featurePortrayal:AddInstructions('PenWidth:0.64;PenColor:CSTLN')
		featurePortrayal:AddInstructions('PenSolid')
		featurePortrayal:AddInstructions('DrawLine')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
