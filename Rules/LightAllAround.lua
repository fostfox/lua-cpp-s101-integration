-- LightAllAround portrayal rules file.

-- Referenced CSPs.
require 'LightFlareAndDescription'

-- Main entry point for feature type.
function LightAllAround(feature, featurePortrayal, contextParameters)
	featurePortrayal:AddInstructions('ViewingGroup:27070;DrawingPriority:7;DisplayPlane:OverRADAR')

	local valueOfNominalRange = feature.valueOfNominalRange or 9.0

	local categoryOfLight = feature.categoryOfLight[1]

	if contains(categoryOfLight, { 8, 11 }) then
		-- Flood or spot light
		featurePortrayal:AddInstructions('DrawSymbol:LIGHTS82')
	elseif categoryOfLight == 9 then
		-- Strip light
		featurePortrayal:AddInstructions('DrawSymbol:LIGHTS81')
	else
		LightFlareAndDescription(feature, featurePortrayal, contextParameters, feature.categoryOfLight[1])
	end
end
