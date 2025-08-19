local shownKeymapsNotification = false
local group = Augroup('BetterHelp')
local jump_help = function (helpStr) vim.cmd.h(helpStr) end

local get_word_under_cursor = function ()
  return vim.fn.expand('<cword>')
end

local function help_word_under()
  jump_help(get_word_under_cursor())
end

vim.api.nvim_create_autocmd({'FileType', 'BufNew'}, {
  pattern = 'help',
  desc = 'Better navigation when reading neovim help',
  group = group,
  callback = function ()
    if vim.bo.buftype ~= 'help'then
      return SIG_KILLACMD
    end
    if not shownKeymapsNotification then
      shownKeymapsNotification = true
      Notify.info('<S-h>: help for word under the cursor\n<C-i>: Next entry\n<C-o>: Previous entry')
    end

    vim.keymap.set('n', 'H', help_word_under, {buffer = true})
    vim.cmd[[wincmd L]]
  end
})
