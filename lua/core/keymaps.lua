local function keymapMode(mode)
  return function(lhs, rhs, opts)
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

local nmap = keymapMode("n")
local imap = keymapMode("i")
local vmap = keymapMode("v")

-- Frequent keys
nmap("<Esc>", "<cmd>nohlsearch<CR>")
nmap("<leader>o", "<cmd>update<CR><cmd>source<CR>", { desc = "Save and source config" })
nmap("<leader>w", "<cmd>write<CR>", { desc = "[w]rite" })
nmap("<leader>q", "<cmd>quit<CR>", { desc = "[q]uit" })

-- Better block indentation by reapplying selection
vmap("<", "<gv")
vmap(">", ">gv")

-- Easier buffer jumps
nmap("<C-h>", "<C-w>h")
nmap("<C-j>", "<C-w>j")
nmap("<C-k>", "<C-w>k")
nmap("<C-l>", "<C-w>l")

-- Movement
nmap("<C-Up>", "<C-u>")
nmap("<C-Down>", "<C-d>")

-- Quickly return to normal mode with movement keys
imap("jk", "<Esc>")
imap("kj", "<Esc>")
