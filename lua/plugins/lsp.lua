return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
        -- LSP Support
        {"neovim/nvim-lspconfig"},             -- Required
        {                                      -- Optional
            "williamboman/mason.nvim",
            run = function()
                pcall(vim.cmd, "MasonUpdate")
            end,
        },
        {"williamboman/mason-lspconfig.nvim"}, -- Optional

        -- Autocompletion
        -- {"hrsh7th/nvim-cmp"},     -- Required
        -- {"hrsh7th/cmp-nvim-lsp"}, -- Required

        {"Saghen/blink.cmp"},

        {"L3MON4D3/LuaSnip", build = "make install_jsregexp"},     -- Required
        {"SmiteshP/nvim-navic"},
        {"j-hui/fidget.nvim"}
    },
    config = function()
        require("config.lsp")
    end,
}
