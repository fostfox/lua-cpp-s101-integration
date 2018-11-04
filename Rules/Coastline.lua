-- Converter Version: 0.99.6547.27240

-- Referenced portrayal rules.
require 'QUAPOS01'

-- Main entry point for feature type.
function Coastline(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Curve then
		if feature.categoryOfCoastline == 6 then
			featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:7;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CSTLN')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.categoryOfCoastline == 7 then
			featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:7;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CSTLN')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.categoryOfCoastline == 8 then
			featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:7;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CSTLN')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.categoryOfCoastline == 10 then
			featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:7;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CSTLN')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		else
			featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:7;DisplayPlane:OverRADAR')
			QUAPOS01(feature, featurePortrayal, contextParameters)
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
