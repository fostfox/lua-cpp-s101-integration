-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function Dyke(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Curve then
		if feature.radarConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22210;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:0.64;PenColor:CHBLK')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		else
			featurePortrayal:AddInstructions('ViewingGroup:22010;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:0.96;PenColor:LANDF')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		-- Plain and symbolized boundaries use the same symbolization
		featurePortrayal:AddInstructions('ViewingGroup:22010;DrawingPriority:3;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('ColorFillArea:CHBRN')
		featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:LANDF')
		featurePortrayal:AddInstructions('PenSolid')
		featurePortrayal:AddInstructions('DrawLine')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
