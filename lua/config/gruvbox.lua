require("gruvbox").setup {
    transparent_mode = true,
}

vim.cmd.colorscheme("gruvbox")
vim.cmd [[ highlight SignColumn guibg=NONE ]]
vim.api.nvim_command('hi Visual term=reverse cterm=reverse guibg=#555555 guifg=#FFFFFF')
