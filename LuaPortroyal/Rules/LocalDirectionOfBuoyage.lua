-- LocalDirectionOfBuoyage portrayal rules file.

-- UNOFFICIAL:  Rules extracted from S-52 lookup table for M_NSYS.

-- Main entry point for feature type.
function LocalDirectionOfBuoyage(feature, featurePortrayal, contextParameters)
	-- TODO: Use any overlapping NavigationalSystemOfMarks.marksNavigationalSystemOf.  See S-52 lookup tables below.
	if feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
		featurePortrayal:AddInstructions('ViewingGroup:27040;DrawingPriority:4;DisplayPlane:UnderRADAR;Rotation:GeographicCRS,' .. tostring(feature.orientation.orientationValue) ..'')

		--if feature.marksNavigationalSystemOf == 1 then
		--	featurePortrayal:AddInstructions('PointInstruction:DIRBOYA1')
		--elseif feature.marksNavigationalSystemOf == 2 then
		--	featurePortrayal:AddInstructions('PointInstruction:DIRBOYB1')
		--else
		--	featurePortrayal:AddInstructions('PointInstruction:DIRBOY01')
		--end
		featurePortrayal:AddInstructions('PointInstruction:testPCB')
		featurePortrayal:SimpleLineStyle('dash',0.32,'CHGRD')
		featurePortrayal:AddInstructions('LineInstruction:')
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		featurePortrayal:AddInstructions('ViewingGroup:27040;DrawingPriority:4;DisplayPlane:UnderRADAR;Rotation:GeographicCRS,' .. tostring(feature.orientation.orientationValue) ..'')

		--if feature.marksNavigationalSystemOf == 1 then
		--	featurePortrayal:AddInstructions('PointInstruction:DIRBOYA1')
		--elseif feature.marksNavigationalSystemOf == 2 then
		--	featurePortrayal:AddInstructions('PointInstruction:DIRBOYB1')
		--else
		--	featurePortrayal:AddInstructions('PointInstruction:DIRBOY01')
		--end
		featurePortrayal:AddInstructions('PointInstruction:testPCB')
		featurePortrayal:AddInstructions('LineInstruction:NAVARE51')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
end
--[[
Plain

"M_NSYS","","LC(MARSYS51)","4","S","STANDARD","27040"
"M_NSYS","MARSYS1ORIENT","SY(DIRBOYA1,ORIENT);LS(DASH,1,CHGRD)","4","S","STANDARD","27040"
"M_NSYS","MARSYS2ORIENT","SY(DIRBOYB1,ORIENT);LS(DASH,1,CHGRD)","4","S","STANDARD","27040"
"M_NSYS","ORIENT","SY(DIRBOY01,ORIENT);LS(DASH,1,CHGRD)","4","S","STANDARD","27040"

Symoblized

"M_NSYS","","LC(MARSYS51)","4","S","STANDARD","27040"
"M_NSYS","MARSYS1ORIENT","SY(DIRBOYA1,ORIENT);LC(NAVARE51)","4","S","STANDARD","27040"
"M_NSYS","MARSYS2ORIENT","SY(DIRBOYB1,ORIENT);LC(NAVARE51)","4","S","STANDARD","27040"
"M_NSYS","ORIENT","SY(DIRBOY01,ORIENT);LC(NAVARE51)","4","S","STANDARD","27040"
--]]
