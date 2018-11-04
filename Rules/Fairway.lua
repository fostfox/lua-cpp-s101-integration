-- Converter Version: 0.99.6547.27240

-- Referenced portrayal rules.
require 'RESTRN01'

-- Main entry point for feature type.
function Fairway(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
		if feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:26050;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:FAIRWY51')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:7.02,0;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString(feature.featureName[1]['name']) .. '')
			end
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
			RESTRN01(feature, featurePortrayal, contextParameters)
		elseif feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 2 then
			featurePortrayal:AddInstructions('ViewingGroup:26050;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:FAIRWY51')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:7.02,0;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString(feature.featureName[1]['name']) .. '')
			end
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
			RESTRN01(feature, featurePortrayal, contextParameters)
		elseif feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:26050;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:FAIRWY51')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:7.02,0;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString(feature.featureName[1]['name']) .. '')
			end
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
			RESTRN01(feature, featurePortrayal, contextParameters)
		elseif feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:26050;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:FAIRWY52')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:7.02,0;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString(feature.featureName[1]['name']) .. '')
			end
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
			RESTRN01(feature, featurePortrayal, contextParameters)
		else
			featurePortrayal:AddInstructions('ViewingGroup:26050;DrawingPriority:4;DisplayPlane:UnderRADAR')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:7.02,0;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString(feature.featureName[1]['name']) .. '')
			end
			featurePortrayal:AddInstructions('PenWidth:0.32;PenColor:CHGRD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
			RESTRN01(feature, featurePortrayal, contextParameters)
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		if feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:26050;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:FAIRWY51')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:7.02,0;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString(feature.featureName[1]['name']) .. '')
			end
			featurePortrayal:AddInstructions('DrawComplexLinestyle:NAVARE51')
			RESTRN01(feature, featurePortrayal, contextParameters)
		elseif feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 2 then
			featurePortrayal:AddInstructions('ViewingGroup:26050;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:FAIRWY51')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:7.02,0;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString(feature.featureName[1]['name']) .. '')
			end
			featurePortrayal:AddInstructions('DrawComplexLinestyle:NAVARE51')
			RESTRN01(feature, featurePortrayal, contextParameters)
		elseif feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:26050;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:FAIRWY51')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:7.02,0;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString(feature.featureName[1]['name']) .. '')
			end
			featurePortrayal:AddInstructions('DrawComplexLinestyle:NAVARE51')
			RESTRN01(feature, featurePortrayal, contextParameters)
		elseif feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:26050;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:FAIRWY52')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:7.02,0;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString(feature.featureName[1]['name']) .. '')
			end
			featurePortrayal:AddInstructions('DrawComplexLinestyle:NAVARE51')
			RESTRN01(feature, featurePortrayal, contextParameters)
		else
			featurePortrayal:AddInstructions('ViewingGroup:26050;DrawingPriority:4;DisplayPlane:UnderRADAR')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('MoveRelativeLocal:7.02,0;TextAlignVertical:Center;FontSize:10;DrawText:' .. EncodeString(feature.featureName[1]['name']) .. '')
			end
			featurePortrayal:AddInstructions('DrawComplexLinestyle:NAVARE51')
			RESTRN01(feature, featurePortrayal, contextParameters)
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
