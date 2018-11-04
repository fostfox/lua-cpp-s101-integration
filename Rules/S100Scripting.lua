--[[
This file contains the global functions and tables that define the S-100 Lua Scripting Model.
These functions are intended to be called by the S-100 scripts.
--]]

function EncodeString(s1, s2)
	local s = tostring(s1);

	if s2 then
		s = string.format(s1, s2)
	end
	
	s = s:gsub(';', '&s')
	s = s:gsub(':', '&c')
	s = s:gsub(',', '&m')
	s = s:gsub('&', '&&')

	return s
end

--
-- Type system support
--

local typeSystemChecksEnabled

function TypeSystemChecks(enabled)
	if typeSystemChecksEnabled == enabled then
		return false
	end

	typeSystemChecksEnabled = enabled

	if enabled then
		function CheckSelf(object, typeName, errorDepth)
			local objectType = type(object)
	
			if objectType == 'table' and object.Type == typeName then
				return
			end

			error('Function call on object of type ' .. typeName .. ' was not in the form of "object:function()"', errorDepth or 3)
		end

		function CheckNotSelf(object, typeName, errorDepth)
			local objectType = type(object)
	
			if objectType == 'table' and object.Type == typeName then
				error('Function call on object of type ' .. typeName .. ' was not in the form of "object.function()"', errorDepth or 3)
			end
		end

		function CheckType(object, typeName, errorDepth)
			local objectType = type(object)
			local colon = string.find(typeName, ':')

			if objectType == 'table' and colon then
				local highType = string.sub(typeName, 1, colon - 1)
				typeName = string.sub(typeName, colon + 1)

				if highType ~= 'array' and highType ~= 'array+' then
					error('Unrecognized high type "' .. highType '"', errorDepth or 3)
				end

				-- 'array' allows for empty arrays, 'array+' doesn't.
				if #object ~= 0 or highType == 'array+' then
					CheckType(object[1], typeName, (errorDepth or 3) + 1)
				end
			elseif objectType ~= 'table' then
				if objectType ~= typeName then
					error('Object given is of type "' .. objectType .. '" not of type "' .. typeName .. '"', errorDepth or 3)
				end
			elseif object == nil or object.Type ~= typeName then
				error('Object given is of type "' .. objectType .. '" not of type "' .. typeName .. '"', errorDepth or 3)
			end
		end

		function CheckTypeOrNil(object, typeName, errorDepth)
			if object ~= nil then
				errorDepth = errorDepth or 3

				CheckType(object, typeName, errorDepth + 1)
			end
		end

		-- Replace when inheritance is implemented.
		function CheckTypeOneOf(object, ...)
			if type(object) ~= 'table' then
				error('Object must be of table type.', 3)
			end

			for _, typeName in ipairs{...} do
				if object.Type == typeName then
					return
				end
			end

			error('Object not of any of the given types.', 3)
		end

		-- Replace when inheritance is implemented.
		function CheckTypeOneOfOrNil(object, ...)
			if object ~= nil then
				if type(object) ~= 'table' then
					error('Object must be of table type.', 3)
				end

				for _, typeName in ipairs{...} do
					if object.Type == typeName then
						return
					end
				end

				error('Object not of any of the given types.', 3)
			end
		end
	else
		function CheckSelf(...)
		end

		function CheckNotSelf(...)
		end

		function CheckType(...)
		end

		function CheckTypeOrNil(...)
		end

		function CheckTypeOneOf(...)
		end

		function CheckTypeOneOfOrNil(...)
		end
	end

	return true
end

-- Disabled by default
TypeSystemChecks(false)

typeInfo = {}

function GetTypeInfo(datasetID)
	if not typeInfo[datasetID] then
		local ti = {}
		Debug.StopPerformance('Lua Code - Total')
		local featureTypeCodes, informationTypeCodes, simpleAttributeCodes, complexAttributeCodes, roleCodes, informationAssociationCodes, featureAssociationCodes = HostTypeInfoGetCodes(datasetID)
		Debug.StartPerformance('Lua Code - Total')

		ti.FeatureTypeInfos = {}

		for _, code in ipairs(featureTypeCodes or {}) do
			ti.FeatureTypeInfos[code] = { Type = 'FeatureTypeInfo', Code = code }
		end

		ti.InformationTypeInfos = {}

		for _, code in ipairs(informationTypeCodes or {}) do
			ti.InformationTypeInfos[code] = { Type = 'InformationTypeInfo', Code = code }
		end

		ti.SimpleAttributeInfos = {}

		for _, code in ipairs(simpleAttributeCodes or {}) do
			ti.SimpleAttributeInfos[code] = { Type = 'SimpleAttributeInfo', Code = code }
		end

		ti.ComplexAttributeInfos = {}

		for _, code in ipairs(complexAttributeCodes or {}) do
			ti.ComplexAttributeInfos[code] = { Type = 'ComplexAttributeInfo', Code = code }
		end

		ti.RoleInfos = {}

		for _, code in ipairs(roleCodes or {}) do
			ti.RoleInfos[code] = { Type = 'RoleInfo', Code = code }
		end

		ti.InformationAssociationInfos = {}

		for _, code in ipairs(informationAssociationCodes or {}) do
			ti.InformationAssociationInfos[code] = { Type = 'InformationAssociationInfo', Code = code }
		end

		ti.FeatureAssociationInfos = {}

		for _, code in ipairs(featureAssociationCodes or {}) do
			ti.FeatureAssociationInfos[code] = { Type = 'FeatureAssociationInfo', Code = code }
		end

		typeInfo[datasetID] = ti
	end

	return typeInfo[datasetID]
end

function GetFeatureTypeInfo(datasetID, code)
	local typeInfo = GetTypeInfo(datasetID)

	if not typeInfo.FeatureTypeInfos[code] then
		error('Invalid feature code')
	end

	if not typeInfo.FeatureTypeInfos[code].TypeInfo then
		Debug.StopPerformance('Lua Code - Total')
		typeInfo.FeatureTypeInfos[code].TypeInfo = HostGetFeatureTypeInfo(datasetID, code)
		Debug.StartPerformance('Lua Code - Total')
	end

	return typeInfo.FeatureTypeInfos[code].TypeInfo
end

function GetInformationTypeInfo(datasetID, code)
	local typeInfo = GetTypeInfo(datasetID)

	if not typeInfo.InformationTypeInfos[code] then
		error('Invalid information type code')
	end

	if not typeInfo.InformationTypeInfos[code].TypeInfo then
		Debug.StopPerformance('Lua Code - Total')
		typeInfo.InformationTypeInfos[code].TypeInfo = HostGetInformationTypeInfo(datasetID, code)
		Debug.StartPerformance('Lua Code - Total')
	end

	return typeInfo.InformationTypeInfos[code].TypeInfo
end

function GetSimpleAttributeTypeInfo(datasetID, code)
	local typeInfo = GetTypeInfo(datasetID)

	if not typeInfo.SimpleAttributeInfos[code] then
		error('Invalid information type code')
	end

	if not typeInfo.SimpleAttributeInfos[code].TypeInfo then
		Debug.StopPerformance('Lua Code - Total')
		typeInfo.SimpleAttributeInfos[code].TypeInfo = HostGetSimpleAttributeTypeInfo(datasetID, code)
		Debug.StartPerformance('Lua Code - Total')
	end

	return typeInfo.SimpleAttributeInfos[code].TypeInfo
end

function GetComplexAttributeTypeInfo(datasetID, code)
	local typeInfo = GetTypeInfo(datasetID)

	if not typeInfo.ComplexAttributeInfos[code] then
		error('Invalid information type code')
	end

	if not typeInfo.ComplexAttributeInfos[code].TypeInfo then
		Debug.StopPerformance('Lua Code - Total')
		typeInfo.ComplexAttributeInfos[code].TypeInfo = HostGetComplexAttributeTypeInfo(datasetID, code)
		Debug.StartPerformance('Lua Code - Total')
	end

	return typeInfo.ComplexAttributeInfos[code].TypeInfo
end

--
-- Helper functions
--

function contains(value, array)
	for i = 1, #array do
		if array[i] == value then
			return true
		end
	end
	
	if type(value) == 'table' then
		for i = 1, #array do
			for j = 1, #value do
				if array[i] == value[j] then
					return true
				end
			end
		end
	end

	return false
end

--
-- Debugging hooks back into host
--

Debug = {}

function Debug.Break()
	if Host_DebuggerEntry then
		Host_DebuggerEntry('break')
	end
end

function Debug.Trace(message)
	if Host_DebuggerEntry then
		Host_DebuggerEntry('trace', message)
	end
end

function Debug.StartProfiler()
	if Host_DebuggerEntry then
		Host_DebuggerEntry('start_profiler', message)
	end
end

function Debug.StopProfiler()
	if Host_DebuggerEntry then
		Host_DebuggerEntry('stop_profiler', message)
	end
end

function Debug.StartPerformance(name)
	if Host_DebuggerEntry then
		Host_DebuggerEntry('start_performance', name)
	end
end

function Debug.StopPerformance(name)
	if Host_DebuggerEntry then
		Host_DebuggerEntry('stop_performance', name)
	end
end

function Debug.ResetPerformance(name)
	if Host_DebuggerEntry then
		Host_DebuggerEntry('reset_performance', name)
	end
end
