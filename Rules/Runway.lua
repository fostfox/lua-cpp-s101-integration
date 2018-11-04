-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function Runway(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point then
		-- Simplified and paper chart points use the same symbolization
		featurePortrayal:AddInstructions('Null')
	elseif feature.PrimitiveType == PrimitiveType.Curve then
		featurePortrayal:AddInstructions('ViewingGroup:32240;DrawingPriority:6;DisplayPlane:OverRADAR')
		featurePortrayal:AddInstructions('PenWidth:0.96;PenColor:LANDF')
		featurePortrayal:AddInstructions('PenSolid')
		featurePortrayal:AddInstructions('DrawLine')
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		-- Plain and symbolized boundaries use the same symbolization
		featurePortrayal:AddInstructions('ViewingGroup:32240;DrawingPriority:5;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('ColorFillArea:CHBRN')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
