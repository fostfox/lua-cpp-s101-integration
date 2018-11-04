-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function Causeway(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Curve then
		if feature.waterLevelEffect == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:22010;DrawingPriority:5;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:0.96;PenColor:LANDF')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		else
			featurePortrayal:AddInstructions('ViewingGroup:22010;DrawingPriority:5;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:0.96;PenColor:LANDF')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
		if feature.waterLevelEffect == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:22010;DrawingPriority:5;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFillArea:DEPIT')
			featurePortrayal:AddInstructions('PenWidth:0.64;PenColor:CSTLN')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		else
			featurePortrayal:AddInstructions('ViewingGroup:22010;DrawingPriority:5;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFillArea:CHBRN')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CSTLN')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		if feature.waterLevelEffect == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:22010;DrawingPriority:5;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFillArea:DEPIT')
			featurePortrayal:AddInstructions('PenWidth:0.64;PenColor:CSTLN')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		else
			featurePortrayal:AddInstructions('ViewingGroup:22010;DrawingPriority:5;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFillArea:CHBRN')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CSTLN')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
