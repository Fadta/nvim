local norelative_events = {
  'InsertEnter',
  'WinLeave',
  'FocusLost',
  'BufNewFile',
  'BufReadPost',
}
local relative_events = {
  'VimEnter',
  'InsertLeave',
  'WinEnter',
  'FocusGained',
}

local group = Augroup('AdaptiveRNU')

local function setRnu(relative)
  if vim.bo.buftype ~= "" then
    return SIG_KILLACMD
  else
    vim.opt.relativenumber = relative
  end
end


Autocmd(norelative_events, { group = group,
desc = "No relative numbers hook",
callback = function ()
  setRnu(false)
end})

Autocmd(relative_events, {group = group,
desc = "Relative numbers hook",
callback = function ()
  setRnu(true)
end})
