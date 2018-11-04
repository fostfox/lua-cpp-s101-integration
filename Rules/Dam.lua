-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function Dam(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
		if feature.categoryOfDam == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:22010;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:CHINFO06')
		else
			featurePortrayal:AddInstructions('Null')
		end
	elseif feature.PrimitiveType == PrimitiveType.Point then
		if feature.categoryOfDam == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:22010;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:CHINFO06')
		else
			featurePortrayal:AddInstructions('Null')
		end
	elseif feature.PrimitiveType == PrimitiveType.Curve then
		if feature.categoryOfDam == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:0.64;PenColor:CSTLN')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		else
			featurePortrayal:AddInstructions('ViewingGroup:22010;DrawingPriority:6;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:1.28;PenColor:LANDF')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
		if feature.categoryOfDam == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:6;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFillArea:CHBRN')
			featurePortrayal:AddInstructions('PenWidth:0.64;PenColor:CSTLN')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		else
			featurePortrayal:AddInstructions('ViewingGroup:22010;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFillArea:CHBRN')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:LANDF')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		if feature.categoryOfDam == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:6;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFillArea:CHBRN')
			featurePortrayal:AddInstructions('PenWidth:0.64;PenColor:CSTLN')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		else
			featurePortrayal:AddInstructions('ViewingGroup:22010;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFillArea:CHBRN')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:LANDF')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
