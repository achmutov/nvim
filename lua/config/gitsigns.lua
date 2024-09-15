require("gitsigns").setup {
    on_attach = function (buffnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = buffnr
            vim.keymap.set(mode, l, r, opts)
        end

        local function gitsigns_visual_op(op)
            return function()
                return require("gitsigns")[op]({ vim.fn.line("."), vim.fn.line("v") })
            end
        end

        map("n", "<leader>tb", gs.toggle_current_line_blame)
        map("v", "<leader>hs", gitsigns_visual_op"stage_hunk")
        map("v", "<leader>hu", gitsigns_visual_op"undo_stage_hunk")
    end
}

vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
vim.api.nvim_set_hl(0, "GitSignsAdd", { bg = "NONE", fg = "#b8bb26" })
vim.api.nvim_set_hl(0, "GitSignsChange", { bg = "NONE", fg = "#83a598" })
vim.api.nvim_set_hl(0, "GitSignsDelete", { bg = "NONE", fg = "#fb4934" })
