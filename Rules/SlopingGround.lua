-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function SlopingGround(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point then
		-- Simplified and paper chart points use the same symbolization
		featurePortrayal:AddInstructions('ViewingGroup:32010;DrawingPriority:3;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('DrawSymbol:HILTOP01')
	elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
		if feature.categoryOfSlope == 1 and feature.radarConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:32010;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFillArea:CHGRD')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHBLK')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.categoryOfSlope == 2 and feature.radarConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:32010;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFillArea:CHGRD')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHBLK')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.categoryOfSlope == 3 and feature.radarConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:32010;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFillArea:CHGRD')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHBLK')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.categoryOfSlope == 4 and feature.radarConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:32010;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFillArea:CHGRD')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHBLK')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.categoryOfSlope == 5 and feature.radarConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:32010;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFillArea:CHGRD')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHBLK')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.categoryOfSlope == 6 then
			featurePortrayal:AddInstructions('ViewingGroup:32010;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFillArea:CHGRD')
		elseif feature.categoryOfSlope == 7 and feature.radarConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:32010;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFillArea:CHGRD')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHBLK')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		else
			featurePortrayal:AddInstructions('Null')
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		if feature.categoryOfSlope == 1 and feature.radarConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:32010;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFillArea:CHGRD')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHBLK')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.categoryOfSlope == 2 and feature.radarConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:32010;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFillArea:CHGRD')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHBLK')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.categoryOfSlope == 3 and feature.radarConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:32010;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFillArea:CHGRD')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHBLK')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.categoryOfSlope == 4 and feature.radarConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:32010;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFillArea:CHGRD')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHBLK')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.categoryOfSlope == 5 and feature.radarConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:32010;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFillArea:CHGRD')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHBLK')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.categoryOfSlope == 6 then
			featurePortrayal:AddInstructions('ViewingGroup:32010;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFillArea:CHGRD')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHBLK')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.categoryOfSlope == 7 and feature.radarConspicuous then
			featurePortrayal:AddInstructions('ViewingGroup:32010;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFillArea:CHGRD')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHBLK')
			featurePortrayal:AddInstructions('PenSolid')
			featurePortrayal:AddInstructions('DrawLine')
		else
			featurePortrayal:AddInstructions('Null')
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
