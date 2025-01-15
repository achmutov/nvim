local dap = require "dap"
local ui = require "dapui"

require("nvim-dap-virtual-text").setup({})
require("dapui").setup()

vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>?", function()
    package.loaded.dapui.eval(nil, { enter = true })
end)
vim.keymap.set("n", "<leader><F1>", dap.continue)
vim.keymap.set("n", "<leader><F2>", dap.step_into)
vim.keymap.set("n", "<leader><F3>", dap.step_over)
vim.keymap.set("n", "<leader><F4>", dap.step_out)
vim.keymap.set("n", "<leader><F5>", dap.step_back)
vim.keymap.set("n", "<leader><F11>", dap.terminate)
vim.keymap.set("n", "<leader><F12>", dap.restart)

dap.adapters.python = {
    type = "executable",
    command = "python",
    args = { "-m", "debugpy.adapter" },
}

dap.adapters.lldb = {
    type = "executable",
    command = "/usr/bin/lldb-dap",
}

dap.configurations.python = {
    {
        type = "python",
        request = "launch",
        console = "integratedTerminal",
        name = "Launch the file",
        program = "${file}",
    },
    -- {
    --     type = "python",
    --     request = "launch",
    --     name = "Launch the module",
    --     module = "tesmod",
    --     console = "integratedTerminal",
    -- }
}

-- dap.configurations.c = {
--     {
--         type = "lldb",
--         request = "launch",
--         name = "Launch the file",
--         -- program = function()
--         --     local path = vim.fn.input({
--         --         prompt = "Path to executable: ",
--         --         default = vim.fn.getcwd() .. "/",
--         --         completion = "file",
--         --     })
--         --     return (path and path ~= "") and path or dap.ABORT
--         -- end,
--         program = "target/debug/cursrs",
--         -- initCommands = {
--         --     "settings set target.input-path ${workspaceFolder}/input.txt",
--         -- },
--         args = {
--             "100", "pln", "uah"
--         }
--     },
-- }

-- dap.configurations.cpp = dap.configurations.c
-- dap.configurations.rust = dap.configurations.c

dap.listeners.before.attach.dapui_config = function()
    ui.open()
end
dap.listeners.before.launch.dapui_config = function()
    ui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    ui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    ui.close()
end

local cwd = vim.fn.getcwd() .. "/dap.lua"
if vim.fn.filereadable(cwd) == 1 then
    dofile(cwd)
end
