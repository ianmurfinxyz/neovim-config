-- Whitespace
vim.opt.expandtab = false
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.smartindent = true

-- File encoding
vim.opt.fileencoding = 'utf-8'
vim.opt.encoding = 'utf-8'

-- Whitespace rendering using 'list' mode
vim.opt.list = true
vim.opt.listchars='tab:-->,space:.,eol:\u{23f5}'

-- Disable enforement of space styles in languages
vim.g.python_recommended_style = 0
vim.g.rust_recommended_style = 0

-- Rendering
vim.opt.cursorline = true
vim.opt.colorcolumn = "101"
vim.opt.wrap = false
vim.opt.textwidth = 0
vim.opt.showmode = true
vim.opt.showtabline = 2
vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 0
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.guifont = "monospace:h17"
vim.opt.number = true
vim.opt.relativenumber = false

-- Search options
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Miscellaneous
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.updatetime = 300
vim.opt.writebackup = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.opt.shortmess:append "c"
