function keymapMode(mode)
	return function(lhs, rhs, opts)
		vim.keymap.set(mode, lhs, rhs, opts)
	end
end

nmap = keymapMode 'n'
imap = keymapMode 'i'

-- Frequent keys
nmap('<Esc>', '<cmd>nohlsearch<CR>')
nmap('<leader>o', '<cmd>update<CR><cmd>source<CR>', { desc = "Save and source config" })
nmap('<leader>w', '<cmd>write<CR>', { desc = '[w]rite' })
nmap('<leader>q', '<cmd>quit<CR>', { desc = '[q]uit' })

-- Quickly return to normal mode with movement keys
imap('jk', '<Esc>')
imap('kj', '<Esc>')
