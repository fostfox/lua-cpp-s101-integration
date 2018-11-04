-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function RecommendedTrafficLanePart(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
		if feature.orientation and feature.orientation.orientationValue then
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:RCTLPT52')
		else
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:RTLDEF51')
		end
	elseif feature.PrimitiveType == PrimitiveType.Point then
		if feature.orientation and feature.orientation.orientationValue then
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:RCTLPT52')
		else
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:RTLDEF51')
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
		if feature.orientation and feature.orientation.orientationValue then
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:RCTLPT52')
		else
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:RTLDEF51')
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		if feature.orientation and feature.orientation.orientationValue then
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:RCTLPT52')
		else
			featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:RTLDEF51')
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
