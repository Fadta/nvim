function Augroup(name)
  vim.api.nvim_create_augroup('Conf-' .. name, {clear = false})
end

function Autocmd(event, opts)
  vim.api.nvim_create_autocmd(event, opts)
end

Autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = Augroup('HighlightYank'),
  callback = function()
    vim.highlight.on_yank()
  end,
})

Autocmd("BufReadPost", {
  desc = "Restore cursor to file position in previous editing session",
  group = Augroup('CursorMemory'),
  callback = function(event)
    local mark = vim.api.nvim_buf_get_mark(event.buf, '"')
    local line_count = vim.api.nvim_buf_line_count(event.buf)
    if mark[1] > 0 and mark[1] <= line_count then
      vim.cmd('normal! g`"zz')
    end
  end,
})

require('core.autocmds.adaptive_rnu')
