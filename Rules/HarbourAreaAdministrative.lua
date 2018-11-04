-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function HarbourAreaAdministrative(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
		featurePortrayal:AddInstructions('ViewingGroup:36020;DrawingPriority:2;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('PenWidth:0.64;PenColor:CHGRD')
		featurePortrayal:AddInstructions('PenDash')
		featurePortrayal:AddInstructions('DrawLine')
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		featurePortrayal:AddInstructions('ViewingGroup:36020;DrawingPriority:2;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('DrawComplexLinestyle:NAVARE51')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
