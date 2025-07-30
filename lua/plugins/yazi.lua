return {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    dependencies = {
        { "nvim-lua/plenary.nvim", lazy = true },
    },
    keys = {
        {
            "<leader>-",
            mode = { "n", "v" },
            "<cmd>Yazi<cr>",
        },
        {
            "<leader>yw",
            "<cmd>Yazi cwd<cr>",
        },
        {
            "<c-up>",
            "<cmd>Yazi toggle<cr>",
        },
    },
    opts = { open_for_directories = true },
    init = function()
        -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
        -- vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
    end,
}
