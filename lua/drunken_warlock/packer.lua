-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- git
    use('tpope/vim-fugitive')
    use 'lewis6991/gitsigns.nvim'

    -- bottom panel
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'

    -- looks and feels
    use 'AlexvZyl/nordic.nvim'
    use 'xiyaowong/transparent.nvim'

    -- find
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- parsing
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    -- blazingly fast!!
    use 'theprimeagen/harpoon'
    use 'mbbill/undotree'

    -- LSP - Holy Grail
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    }

    -- auto things
    use "Pocco81/auto-save.nvim"
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup{} end
    }

end)
