-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function SlopeTopline(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
		if feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:HILTOP11')
		else
			featurePortrayal:AddInstructions('ViewingGroup:32010;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:HILTOP01')
		end
	elseif feature.PrimitiveType == PrimitiveType.Point then
		if feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22220;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:HILTOP11')
		else
			featurePortrayal:AddInstructions('ViewingGroup:32010;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:HILTOP01')
		end
	elseif feature.PrimitiveType == PrimitiveType.Curve then
		if feature.categoryOfSlope == 2 and feature.radarConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22210;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHBLK')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.categoryOfSlope == 6 and feature.radarConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22210;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHBLK')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.categoryOfSlope == 6 and feature.visuallyConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:22210;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHBLK')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.categoryOfSlope == 2 then
			featurePortrayal:AddInstructions('ViewingGroup:32010;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.categoryOfSlope == 6 then
			featurePortrayal:AddInstructions('ViewingGroup:32010;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		else
			featurePortrayal:AddInstructions('ViewingGroup:32010;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:LANDF')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
