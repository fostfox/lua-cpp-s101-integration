-- LightAirObstruction portrayal rules file.

-- Referenced CSPs.
require 'LightFlareAndDescription'

-- Main entry point for feature type.
function LightAirObstruction(feature, featurePortrayal, contextParameters)
	featurePortrayal:AddInstructions('ViewingGroup:27070;DrawingPriority:8;DisplayPlane:OverRADAR')

	LightFlareAndDescription(feature, featurePortrayal, contextParameters, 6)
end
