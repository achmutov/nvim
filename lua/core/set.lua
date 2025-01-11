vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

-- Two tab indentation
local two_space_filetypes = { 'r', 'javascript', "ts", "typescriptreact", 'html', 'css', 'rmd' }
local indent_group = vim.api.nvim_create_augroup('IndentationSettings', { clear = true })

-- Apply indentation settings based on filetypes
vim.api.nvim_create_autocmd({ 'FileType' }, {
    group = indent_group,
    pattern = two_space_filetypes,
    callback = function()
        -- Use vim.opt_local to ensure settings are buffer-local
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop = 2
        vim.opt_local.softtabstop = 2
        vim.opt_local.expandtab = true  -- Ensure tabs are converted to spaces
    end
})

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

-- vim.opt.colorcolumn = "80"

vim.opt.list = true
vim.opt.listchars:append({ trail = "◦" })

vim.opt.guicursor = ""

vim.g.netrw_liststyle = 3

vim.opt.showtabline = 0

---@diagnostic disable-next-line: lowercase-global
function trail()
    vim.api.nvim_buf_call(0, function()
        vim.cmd('%s/ *$//')
        vim.cmd('noh')
    end)
end
