-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function Tideway(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Curve then
		featurePortrayal:AddInstructions('ViewingGroup:32070;DrawingPriority:3;DisplayPlane:OverRADAR')
		featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHGRF')
		featurePortrayal:AddInstructions('PenSolid')
		featurePortrayal:AddInstructions('DrawLine')
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		-- Plain and symbolized boundaries use the same symbolization
		featurePortrayal:AddInstructions('ViewingGroup:32070;DrawingPriority:7;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHGRF')
		featurePortrayal:AddInstructions('PenDash')
		featurePortrayal:AddInstructions('DrawLine')
		if feature.featureName[1] and feature.featureName[1].name then
			featurePortrayal:AddInstructions('MoveRelativeLocal:0,0;TextAlignHorizontal:Center;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString(feature.featureName[1]['name']) .. '')
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
