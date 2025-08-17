-- INPUT OPTIONS
vim.g.mapleader = ' '
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.clipboard = 'unnamedplus' -- Shared clipboard (remember to install the system utility, like xclip for x11 or wl-clipboard for wayland

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.swapfile = false
vim.opt.showmode = false

-- Folds
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.wo.foldlevel = 4

vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.wrap = false
vim.opt.scrolloff = 10

-- Case sensitivity of searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = 'split'

-- Direction of new splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Appearance
vim.opt.winborder = 'rounded'
vim.opt.signcolumn = 'yes'
vim.opt.cursorline = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.wo.fillchars = 'eob: ' -- removes tildes '~' replacing numbers in nonlines
vim.opt.termguicolors = true
vim.o.laststatus = 3
