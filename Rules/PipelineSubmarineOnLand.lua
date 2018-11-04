-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function PipelineSubmarineOnLand(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point then
		-- Simplified and paper chart points use the same symbolization
		featurePortrayal:AddInstructions('Null')
	elseif feature.PrimitiveType == PrimitiveType.Curve then
		if feature.product[1] == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:34070;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:PIPSOL06')
		elseif feature.categoryOfPipelinePipe[1] == 2 then
			featurePortrayal:AddInstructions('ViewingGroup:34070;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:PIPSOL06')
		elseif feature.categoryOfPipelinePipe[1] == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:34070;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:PIPSOL06')
		elseif feature.categoryOfPipelinePipe[1] == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:34070;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:PIPSOL06')
		elseif feature.categoryOfPipelinePipe[1] == 5 then
			featurePortrayal:AddInstructions('ViewingGroup:34070;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:PIPSOL06')
		else
			featurePortrayal:AddInstructions('ViewingGroup:34070;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:PIPSOL05')
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
