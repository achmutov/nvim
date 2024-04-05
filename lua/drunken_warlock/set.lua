vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

-- Two tab indentation
vim.api.nvim_exec([[
augroup IndentationSettings
    autocmd!
    let two_tab_ext = ['r', 'js', 'html', 'css']

    for ext in two_tab_ext
        execute 'autocmd BufRead,BufNewFile *.' . ext .
                \ ' setlocal shiftwidth=2' .
                \ ' tabstop=2' .
                \ ' softtabstop=2'
    endfor
augroup END
]], false)

-- vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.list = true
vim.opt.listchars:append({ trail = "◦" })
