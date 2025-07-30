require("neo-tree").setup({
    sources = {
        "filesystem",
        "buffers",
        "git_status",
        "document_symbols",
    },
    filesystem = {
        hijack_netrw_behavior = "disabled",
    },
    window = {
        mappings = {
            ["J"] = "toggle_node",
            ["P"] = { "toggle_preview", config = { use_float = false } },
            ["o"] = "system_open",
            ["Z"] = "expand_all_nodes",
        },
    },
    commands = {
        system_open = function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            -- Linux: open file in default application
            vim.fn.jobstart({ "xdg-open", path }, { detach = true })
        end,
    },
    document_symbols = {
        client_filters = {
            ignore = { "pylsp" },
        },
    },
})

vim.keymap.set("n", "<leader>pv", ":Neotree toggle<CR>")
vim.keymap.set("n", "<leader>pd", ":Neotree document_symbols toggle<CR>")
