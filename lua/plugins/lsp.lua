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

        -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
        -- used for completion, annotations and signatures of Neovim apis
        {
            "folke/lazydev.nvim",
            ft = "lua",
            opts = {
                library = {
                    -- Load luvit types when the `vim.uv` word is found
                    { path = "luvit-meta/library", words = { "vim%.uv" } },
                },
            },
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
