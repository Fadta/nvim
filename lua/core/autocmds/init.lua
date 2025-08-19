SIG_KILLACMD = true -- Returning true from a callback kills the running autocmd
function Augroup(name)
  vim.api.nvim_create_augroup('Conf-' .. name, {clear = false})
end

function Autocmd(event, opts)
  vim.api.nvim_create_autocmd(event, opts)
end


function GetProjectRoot(source)
  vim.fs.root(source, function(name, path)
      local pattern = { ".git", "Cargo.toml", "go.mod" }
      local abspath = { vim.fn.stdpath("config") }
      local parentpath = { "~/.config", "~/projects" }

      return vim.iter(pattern):any(function(filepat)
        return filepat == name
      end)

      or vim.iter(abspath):any(function(dirpath)
        return vim.fs.normalize(dirpath) == path
      end)

      or vim.iter(parentpath):any(function(ppath)
        return vim.fs.normalize(ppath) == vim.fs.dirname(path)
      end)
    end)

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

Autocmd("BufWinEnter", {
  desc = "auto change local current directory",
  group = Augroup("auto-project-root"),
  callback = function(event)
    if vim.api.nvim_get_option_value("buftype", { buf = event.buf }) ~= "" then
      return
    end

    local root = GetProjectRoot(event.buf)

    if root then
      vim.cmd.lcd(root)
    end
  end,
})

local function enableAutocmd(module_name)
  local module_path = 'core.autocmds.'
  require(module_path .. module_name)
end

enableAutocmd 'adaptive_rnu'
enableAutocmd('help')
