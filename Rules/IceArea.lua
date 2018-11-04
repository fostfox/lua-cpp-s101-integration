-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function IceArea(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Surface then
		-- Plain and symbolized boundaries use the same symbolization
		featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:3;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('ColorFillArea:NODTA')
		featurePortrayal:AddInstructions('FillArea:ICEARE04')
		featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHGRD')
		featurePortrayal:AddInstructions('PenDash')
		featurePortrayal:AddInstructions('DrawLine')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
