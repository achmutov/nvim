require("telescope")
local builtin = require("telescope.builtin")

-- Files
vim.keymap.set("n", "<leader>pf", builtin.find_files, {})

-- Text
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>pw", function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set("n", "<leader>ps", builtin.live_grep, {})

vim.keymap.set("n", "<leader>w", builtin.grep_string, {})
vim.keymap.set("v", "<leader>w", builtin.grep_string, {})

-- LSP
vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>vrr", builtin.lsp_references, {})
vim.keymap.set("n", "<leader>vri", builtin.lsp_implementations, {})
vim.keymap.set("n", "<leader>vi", builtin.diagnostics, {})
