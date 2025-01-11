require 'evergarden'.setup {
  transparent_background = true,
  variant = 'soft', -- 'hard'|'medium'|'soft'
  override_terminal = true,
  style = {
    tabline = { 'reverse' },
    search = { 'bold' },
    incsearch = { 'reverse' },
    types = { 'italic' },
    keyword = { 'italic' },
    comment = { 'italic' },
    sign = { highlight = false },
  },
  integrations = {
    blink_cmp = true,
    cmp = true,
    gitsigns = true,
    indent_blankline = { enable = true, scope_color = 'green' },
    nvimtree = true,
    rainbow_delimiters = true,
    symbols_outline = true,
    telescope = true,
    which_key = true,
  },
  overrides = { }, -- add custom overrides
}

vim.cmd.colorscheme("evergarden")
