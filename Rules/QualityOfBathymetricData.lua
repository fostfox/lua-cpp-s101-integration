-- QualityOfBathymetricData portrayal rules file.

-- Main entry point for feature type.
function QualityOfBathymetricData(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType ~= PrimitiveType.Surface then
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	featurePortrayal:AddInstructions('ViewingGroup:31010;DrawingPriority:4;DisplayPlane:UnderRADAR')
	featurePortrayal:AddInstructions('PenWidth:0.64;PenColor:CHGRD;PenDash')
end
