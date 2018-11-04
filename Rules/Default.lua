-- Default portrayal rules file.  Called when rule file cannot be found.

-- Main entry point for feature type.
function Default(feature, featurePortrayal, contextParameters)
	if (feature.PrimitiveType == PrimitiveType.Point) then
		-- Simplified and paper chart points use the same symbolization
		featurePortrayal:AddInstructions('ViewingGroup:21010;DrawingPriority:5;DisplayPlane:OverRADAR')
		featurePortrayal:AddInstructions('DrawSymbol:QUESMRK1')
	elseif (feature.PrimitiveType == PrimitiveType.Curve) then
		featurePortrayal:AddInstructions('ViewingGroup:21010;DrawingPriority:5;DisplayPlane:OverRADAR')
		featurePortrayal:AddInstructions('DrawSymbol:QUESMRK1')
	elseif (feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES) then
		featurePortrayal:AddInstructions('ViewingGroup:21010;DrawingPriority:5;DisplayPlane:OverRADAR')
		featurePortrayal:AddInstructions('DrawSymbol:QUESMRK1')
		featurePortrayal:AddInstructions('PenWidth:0.64;PenColor:CHGRF;PenPattern:0,3.6,5.4;DrawLine')
	elseif (feature.PrimitiveType == PrimitiveType.Surface) then
		featurePortrayal:AddInstructions('ViewingGroup:21010;DrawingPriority:5;DisplayPlane:OverRADAR')
		featurePortrayal:AddInstructions('DrawSymbol:QUESMRK1')
		featurePortrayal:AddInstructions('DrawComplexLinestyle:QUESMRK1')
	--else
	--	error('Invalid primitive type "' .. feature.PrimitiveType.Name .. '" passed to portrayal.')
	end
end
