-- Converter Version: 0.99.6547.27240

-- Main entry point for feature type.
function Vegetation(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
		if feature.categoryOfVegetation == 7 then
			featurePortrayal:AddInstructions('ViewingGroup:32030;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:TREPNT05')
		elseif feature.categoryOfVegetation == 21 then
			featurePortrayal:AddInstructions('ViewingGroup:32030;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:TREPNT05')
		else
			featurePortrayal:AddInstructions('ViewingGroup:32030;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:TREPNT04')
		end
	elseif feature.PrimitiveType == PrimitiveType.Point then
		if feature.categoryOfVegetation == 7 then
			featurePortrayal:AddInstructions('ViewingGroup:32030;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:TREPNT05')
		elseif feature.categoryOfVegetation == 21 then
			featurePortrayal:AddInstructions('ViewingGroup:32030;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:TREPNT05')
		else
			featurePortrayal:AddInstructions('ViewingGroup:32030;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:TREPNT04')
		end
	elseif feature.PrimitiveType == PrimitiveType.Curve then
		featurePortrayal:AddInstructions('ViewingGroup:32030;DrawingPriority:3;DisplayPlane:OverRADAR')
		featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:LANDF')
		featurePortrayal:AddInstructions('PenDash')
		featurePortrayal:AddInstructions('DrawLine')
	elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
		if feature.categoryOfVegetation == 7 then
			featurePortrayal:AddInstructions('ViewingGroup:32030;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('FillArea:VEGATN04')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:LANDF')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.categoryOfVegetation == 21 then
			featurePortrayal:AddInstructions('ViewingGroup:32030;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('FillArea:VEGATN04')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:LANDF')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		else
			featurePortrayal:AddInstructions('ViewingGroup:32030;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('FillArea:VEGATN03')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:LANDF')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		if feature.categoryOfVegetation == 7 then
			featurePortrayal:AddInstructions('ViewingGroup:32030;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('FillArea:VEGATN04')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:LANDF')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.categoryOfVegetation == 21 then
			featurePortrayal:AddInstructions('ViewingGroup:32030;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('FillArea:VEGATN04')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:LANDF')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		else
			featurePortrayal:AddInstructions('ViewingGroup:32030;DrawingPriority:3;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('FillArea:VEGATN03')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:LANDF')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
