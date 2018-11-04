-- FoulGround portrayal rules file.

-- UNOFFICIAL:  Rules extracted from S-52 lookup table for OBSTRN where CATOBS = 7.

-- Main entry point for feature type.
function FoulGround(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point then
		if feature.valueOfSounding then
			featurePortrayal:AddInstructions('ViewingGroup:34051;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FOULGND1')
		else
			featurePortrayal:AddInstructions('ViewingGroup:34050;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FOULGND1')
		end
	elseif feature.PrimitiveType == PrimitiveType.Curve then
		error('Not Implemented: No curve symbology defined in S-52 for FoulGround')
	elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
		if feature.valueOfSounding then
			featurePortrayal:AddInstructions('ViewingGroup:34051;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FOULGND1')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHGRD;PenDash;DrawLine')
		else
			featurePortrayal:AddInstructions('ViewingGroup:34050;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FOULGND1')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHGRD;PenDash;DrawLine')
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		if feature.valueOfSounding then
			featurePortrayal:AddInstructions('ViewingGroup:34051;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FOULGND1')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:NAVARE51')
		else
			featurePortrayal:AddInstructions('ViewingGroup:34050;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FOULGND1')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:NAVARE51')
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
