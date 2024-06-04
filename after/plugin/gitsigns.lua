require('gitsigns').setup {
    on_attach = function (buffnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = buffnr
            vim.keymap.set(mode, l, r, opts)
        end

        map('n', '<leader>tb', gs.toggle_current_line_blame)
    end
}

vim.cmd [[
    highlight GitSignsAdd guibg=NONE
]]

vim.cmd [[
    highlight GitSignsChange guibg=NONE
]]

vim.cmd [[
    highlight GitSignsDelete guibg=NONE
]]
