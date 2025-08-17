local excluded_filetypes = {
  -- files which shouldn't have this autocmd active
  oil = true,
}

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
  if excluded_filetypes[vim.bo.filetype] then
    return true --kill autocmd if excluded
  else
    vim.opt.relativenumber = relative
  end
end


vim.api.nvim_create_autocmd(norelative_events, { group = group,
desc = "No relative numbers hook",
callback = function ()
  setRnu(false)
end})

vim.api.nvim_create_autocmd(relative_events, {group = group,
desc = "Relative numbers hook",
callback = function ()
  setRnu(true)
end})
