local status, dap = pcall(require, "dap")
if not status then
	return
end

local status, dapui = pcall(require, "dapui")
if not status then
	return
end

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
