-- LightFogDetector portrayal rules file.

-- Referenced CSPs.
require 'LightFlareAndDescription'

-- Main entry point for feature type.
function LightFogDetector(feature, featurePortrayal, contextParameters)
	featurePortrayal:AddInstructions('ViewingGroup:27070;DrawingPriority:8;DisplayPlane:OverRADAR')

	LightFlareAndDescription(feature, featurePortrayal, contextParameters, 7)
end
