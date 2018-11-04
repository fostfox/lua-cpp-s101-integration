-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function SmallCraftFacility(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point then
		-- Simplified and paper chart points use the same symbolization
		featurePortrayal:AddInstructions('ViewingGroup:38210;DrawingPriority:4;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('DrawSymbol:SMCFAC02')
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		-- Plain and symbolized boundaries use the same symbolization
		featurePortrayal:AddInstructions('ViewingGroup:38210;DrawingPriority:4;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('ColorFillArea:CHBRN')
		featurePortrayal:AddInstructions('DrawSymbol:SMCFAC02')
		featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:LANDF')
		featurePortrayal:AddInstructions('PenSolid')
		featurePortrayal:AddInstructions('DrawLine')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
