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