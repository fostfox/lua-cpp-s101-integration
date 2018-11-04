-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function SweptArea(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
		featurePortrayal:AddInstructions('ViewingGroup:23030;DrawingPriority:4;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('DrawSymbol:SWPARE51')
		featurePortrayal:AddInstructions('MoveRelativeLocal:0,-3.51;TextAlignHorizontal:Center;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString('swept to %5.1f', feature.depthRangeMinimumValue) .. '')
		featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHGRD')
		featurePortrayal:AddInstructions('PenDash')
		featurePortrayal:AddInstructions('DrawLine')
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		featurePortrayal:AddInstructions('ViewingGroup:23030;DrawingPriority:4;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('DrawSymbol:SWPARE51')
		featurePortrayal:AddInstructions('MoveRelativeLocal:0,-3.51;TextAlignHorizontal:Center;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString('swept to %5.1f', feature.depthRangeMinimumValue) .. '')
		featurePortrayal:AddInstructions('DrawComplexLinestyle:NAVARE51')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
