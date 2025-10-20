local dap = require("dap")
local dapui = require("dapui")

dap.adapters.codelldb = {
    type = "executable",
    command = vim.fn.expand("$MASON/packages/codelldb/codelldb"),
}

dapui.setup({
    layouts = {
        {
            elements = {
                -- Elements can be strings or table with id and size keys.
                "console",
                "breakpoints",
                "stacks",
                { id = "scopes", size = 0.5 },
            },
            size = 48, -- 40 columns
            position = "left",
        },
    },
})

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end
