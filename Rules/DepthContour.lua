-- Converter Version: 0.99.6547.27240

-- Referenced portrayal rules.
require 'DEPCNT03'

-- Main entry point for feature type.
function DepthContour(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Curve then
		featurePortrayal:AddInstructions('ViewingGroup:33020;DrawingPriority:5;DisplayPlane:OverRADAR')
		DEPCNT03(feature, featurePortrayal, contextParameters)
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
