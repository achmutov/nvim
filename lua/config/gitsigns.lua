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

vim.cmd [[
    highlight GitSignsAdd guibg=NONE guifg=#b8bb26
]]

vim.cmd [[
    highlight GitSignsChange guibg=NONE guifg=#83a598
]]

vim.cmd [[
    highlight GitSignsDelete guibg=NONE guifg=#fb4934
]]
