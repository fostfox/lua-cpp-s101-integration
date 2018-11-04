-- Converter Version: 0.99.6547.27240

-- Referenced portrayal rules.
require 'RESTRN01'

-- Main entry point for feature type.
function DeepWaterRoutePart(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
		if feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:TSSLPT51')
			featurePortrayal:AddInstructions('DrawSymbol:DWRTPT51')
			featurePortrayal:AddInstructions('PenWidth:0.96;PenColor:TRFCD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
			RESTRN01(feature, featurePortrayal, contextParameters)
		elseif feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 2 then
			featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:TSSLPT51')
			featurePortrayal:AddInstructions('DrawSymbol:DWRTPT51')
			featurePortrayal:AddInstructions('PenWidth:0.96;PenColor:TRFCD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
			RESTRN01(feature, featurePortrayal, contextParameters)
		elseif feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:TSSLPT51')
			featurePortrayal:AddInstructions('DrawSymbol:DWRTPT51')
			featurePortrayal:AddInstructions('PenWidth:0.96;PenColor:TRFCD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
			RESTRN01(feature, featurePortrayal, contextParameters)
		elseif feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:DWRUTE51')
			featurePortrayal:AddInstructions('DrawSymbol:DWRTPT51')
			featurePortrayal:AddInstructions('PenWidth:0.96;PenColor:TRFCD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
			RESTRN01(feature, featurePortrayal, contextParameters)
		else
			featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:TSLDEF51')
			featurePortrayal:AddInstructions('DrawSymbol:DWRTPT51')
			featurePortrayal:AddInstructions('PenWidth:0.96;PenColor:TRFCD')
			featurePortrayal:AddInstructions('PenDash')
			featurePortrayal:AddInstructions('DrawLine')
			RESTRN01(feature, featurePortrayal, contextParameters)
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		if feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 1 then
			featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:TSSLPT51')
			featurePortrayal:AddInstructions('DrawSymbol:DWRTPT51')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:DWRUTE51')
			RESTRN01(feature, featurePortrayal, contextParameters)
		elseif feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 2 then
			featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:TSSLPT51')
			featurePortrayal:AddInstructions('DrawSymbol:DWRTPT51')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:DWRUTE51')
			RESTRN01(feature, featurePortrayal, contextParameters)
		elseif feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 3 then
			featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:TSSLPT51')
			featurePortrayal:AddInstructions('DrawSymbol:DWRTPT51')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:DWRUTE51')
			RESTRN01(feature, featurePortrayal, contextParameters)
		elseif feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 4 then
			featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('RotationGeographic:' .. feature.orientation.orientationValue ..'')
			featurePortrayal:AddInstructions('DrawSymbol:DWRUTE51')
			featurePortrayal:AddInstructions('DrawSymbol:DWRTPT51')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:DWRUTE51')
			RESTRN01(feature, featurePortrayal, contextParameters)
		else
			featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:4;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('DrawSymbol:TSLDEF51')
			featurePortrayal:AddInstructions('DrawSymbol:DWRTPT51')
			featurePortrayal:AddInstructions('DrawComplexLinestyle:DWRUTE51')
			RESTRN01(feature, featurePortrayal, contextParameters)
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
