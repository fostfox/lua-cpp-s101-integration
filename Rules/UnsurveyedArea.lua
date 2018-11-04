-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function UnsurveyedArea(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Surface then
		-- Plain and symbolized boundaries use the same symbolization
		featurePortrayal:AddInstructions('ViewingGroup:11050;DrawingPriority:1;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('ColorFillArea:NODTA')
		featurePortrayal:AddInstructions('FillArea:NODATA03')
		featurePortrayal:AddInstructions('PenWidth:0.64;PenColor:CHGRD')
		featurePortrayal:AddInstructions('PenSolid')
		featurePortrayal:AddInstructions('DrawLine')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
