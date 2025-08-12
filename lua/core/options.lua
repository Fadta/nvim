-- INPUT OPTIONS
vim.g.mapleader = ' '
vim.opt.clipboard = 'unnamedplus' -- Shared clipboard (remember to install the system utility, like xclip for x11 or wl-clipboard for wayland

vim.opt.swapfile = false
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.wrap = false
vim.opt.cursorline = true -- Highlight cursor line
vim.opt.scrolloff = 10

-- Case sensitivity of searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = 'split'

-- Direction of new splits
vim.opt.splitright = true
vim.opt.splitbelow = true

