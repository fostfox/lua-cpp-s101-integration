-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function LandRegion(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point then
		-- Simplified and paper chart points use the same symbolization
		featurePortrayal:AddInstructions('ViewingGroup:21060;DrawingPriority:4;DisplayPlane:OverRADAR')
		featurePortrayal:AddInstructions('DrawSymbol:POSGEN04')
		if feature.featureName[1] and feature.featureName[1].name then
			featurePortrayal:AddInstructions('MoveRelativeLocal:0,3.51;TextAlignHorizontal:Center;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString(feature.featureName[1]['name']) .. '')
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
		if feature.categoryOfLandRegion[1] == 2 then
			featurePortrayal:AddInstructions('ViewingGroup:21060;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('FillArea:MARSHES1')
		elseif feature.categoryOfLandRegion[1] == 12 then
			featurePortrayal:AddInstructions('ViewingGroup:21060;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('FillArea:MARSHES1')
		else
			featurePortrayal:AddInstructions('ViewingGroup:21060;DrawingPriority:3;DisplayPlane:UnderRADAR')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:0,0;TextAlignHorizontal:Center;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString(feature.featureName[1]['name']) .. '')
			end
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		if feature.categoryOfLandRegion[1] == 2 then
			featurePortrayal:AddInstructions('ViewingGroup:21060;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('FillArea:MARSHES1')
		elseif feature.categoryOfLandRegion[1] == 12 then
			featurePortrayal:AddInstructions('ViewingGroup:21060;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('FillArea:MARSHES1')
		else
			featurePortrayal:AddInstructions('ViewingGroup:21060;DrawingPriority:3;DisplayPlane:UnderRADAR')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:0,0;TextAlignHorizontal:Center;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString(feature.featureName[1]['name']) .. '')
			end
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
