-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function Gridiron(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point then
		-- Simplified and paper chart points use the same symbolization
		featurePortrayal:AddInstructions('Null')
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		-- Plain and symbolized boundaries use the same symbolization
		featurePortrayal:AddInstructions('ViewingGroup:27060;DrawingPriority:5;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHGRD')
		featurePortrayal:AddInstructions('PenDash')
		featurePortrayal:AddInstructions('DrawLine')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
