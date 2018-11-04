-- Converter Version: 0.99.6547.27240

-- Referenced portrayal rules.
require 'OBSTRN07'

-- Main entry point for feature type.
function Obstruction(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
		if feature.categoryOfObstruction == 7 and feature.valueOfSounding then
			featurePortrayal:AddInstructions('ViewingGroup:34051;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FOULGND1')
		elseif feature.categoryOfObstruction == 8 and feature.valueOfSounding then
			featurePortrayal:AddInstructions('ViewingGroup:34051;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FLTHAZ02')
		elseif feature.categoryOfObstruction == 9 and feature.valueOfSounding then
			featurePortrayal:AddInstructions('ViewingGroup:34051;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:ACHARE02')
		elseif feature.categoryOfObstruction == 10 and feature.valueOfSounding then
			featurePortrayal:AddInstructions('ViewingGroup:34051;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FLTHAZ02')
		elseif feature.categoryOfObstruction == 7 then
			featurePortrayal:AddInstructions('ViewingGroup:34050;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FOULGND1')
		elseif feature.categoryOfObstruction == 8 then
			featurePortrayal:AddInstructions('ViewingGroup:34050;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FLTHAZ02')
		elseif feature.categoryOfObstruction == 9 then
			featurePortrayal:AddInstructions('ViewingGroup:34050;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:ACHARE02')
		elseif feature.categoryOfObstruction == 10 then
			featurePortrayal:AddInstructions('ViewingGroup:34050;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FLTHAZ02')
		elseif feature.waterLevelEffect == 7 then
			featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FLTHAZ02')
		else
			featurePortrayal:AddInstructions('ViewingGroup:34050;DrawingPriority:4;DisplayPlane:OverRADAR')
			OBSTRN07(feature, featurePortrayal, contextParameters)
		end
	elseif feature.PrimitiveType == PrimitiveType.Point then
		if feature.categoryOfObstruction == 7 and feature.valueOfSounding then
			featurePortrayal:AddInstructions('ViewingGroup:34051;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FOULGND1')
		elseif feature.categoryOfObstruction == 8 and feature.valueOfSounding then
			featurePortrayal:AddInstructions('ViewingGroup:34051;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FLTHAZ02')
		elseif feature.categoryOfObstruction == 9 and feature.valueOfSounding then
			featurePortrayal:AddInstructions('ViewingGroup:34051;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:ACHARE02')
		elseif feature.categoryOfObstruction == 10 and feature.valueOfSounding then
			featurePortrayal:AddInstructions('ViewingGroup:34051;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FLTHAZ02')
		elseif feature.categoryOfObstruction == 7 then
			featurePortrayal:AddInstructions('ViewingGroup:34050;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FOULGND1')
		elseif feature.categoryOfObstruction == 8 then
			featurePortrayal:AddInstructions('ViewingGroup:34050;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FLTHAZ02')
		elseif feature.categoryOfObstruction == 9 then
			featurePortrayal:AddInstructions('ViewingGroup:34050;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:ACHARE02')
		elseif feature.categoryOfObstruction == 10 then
			featurePortrayal:AddInstructions('ViewingGroup:34050;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FLTHAZ02')
		elseif feature.waterLevelEffect == 7 then
			featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FLTHAZ02')
		else
			featurePortrayal:AddInstructions('ViewingGroup:34050;DrawingPriority:4;DisplayPlane:OverRADAR')
			OBSTRN07(feature, featurePortrayal, contextParameters)
		end
	elseif feature.PrimitiveType == PrimitiveType.Curve then
		if feature.categoryOfObstruction == 8 then
			featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CSTLN')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.categoryOfObstruction == 9 then
			featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHMGD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.categoryOfObstruction == 10 then
			featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CSTLN')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.waterLevelEffect == 7 then
			featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:4;DisplayPlane:OverRADAR')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CSTLN')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		else
			featurePortrayal:AddInstructions('ViewingGroup:34050;DrawingPriority:4;DisplayPlane:OverRADAR')
			OBSTRN07(feature, featurePortrayal, contextParameters)
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
		if feature.categoryOfObstruction == 7 and feature.valueOfSounding then
			featurePortrayal:AddInstructions('ViewingGroup:34051;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FOULGND1')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.categoryOfObstruction == 7 then
			featurePortrayal:AddInstructions('ViewingGroup:34050;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FOULGND1')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.categoryOfObstruction == 8 then
			featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FLTHAZ02')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CSTLN')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.categoryOfObstruction == 9 then
			featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:ACHARE02')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHMGD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.categoryOfObstruction == 10 then
			featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FLTHAZ02')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CSTLN')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.waterLevelEffect == 7 then
			featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FLTHAZ02')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CSTLN')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		else
			featurePortrayal:AddInstructions('ViewingGroup:34050;DrawingPriority:4;DisplayPlane:UnderRADAR')
			OBSTRN07(feature, featurePortrayal, contextParameters)
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		if feature.categoryOfObstruction == 7 and feature.valueOfSounding then
			featurePortrayal:AddInstructions('ViewingGroup:34051;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FOULGND1')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:NAVARE51')
		elseif feature.categoryOfObstruction == 7 then
			featurePortrayal:AddInstructions('ViewingGroup:34050;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FOULGND1')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:NAVARE51')
		elseif feature.categoryOfObstruction == 8 then
			featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FLTHAZ02')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CSTLN')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.categoryOfObstruction == 9 then
			featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:ACHARE02')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHMGD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.categoryOfObstruction == 10 then
			featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FLTHAZ02')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CSTLN')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		elseif feature.waterLevelEffect == 7 then
			featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:FLTHAZ02')
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CSTLN')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
		else
			featurePortrayal:AddInstructions('ViewingGroup:34050;DrawingPriority:4;DisplayPlane:UnderRADAR')
			OBSTRN07(feature, featurePortrayal, contextParameters)
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
