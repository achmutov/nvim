require 'gruvbox' .setup {
    transparent_mode = true,
}

function ColorMyPencils(color)
    color = color or 'gruvbox'
    vim.cmd.colorscheme(color)

    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.cmd [[ highlight SignColumn guibg=NONE ]]
    vim.api.nvim_command('hi Visual term=reverse cterm=reverse guibg=#555555 guifg=#FFFFFF')

end

ColorMyPencils()
