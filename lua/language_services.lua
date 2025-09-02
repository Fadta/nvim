local M = {}

M.filetypes = {
  lua = {
    lsp = { "lua_ls" },
    linter = { "selene" },
    formatter = { "stylua" },
  },
}

local function get_key_by_ft(key, filetype_tbl)
  local key_table = {}

  for filetype, content in pairs(filetype_tbl) do
    if content and content[key] then
      key_table[filetype] = content[key]
    end
  end

  return key_table
end

local function get_key_list(key, filetype_tbl)
  local key_list = {}

  for _, content in pairs(filetype_tbl) do
    if content[key] ~= nil then
      vim.tbl_extend("keep", key_list, content[key])
    end
  end

  return key_list
end

function M.get_linters_by_ft()
  return get_key_by_ft("linter", M.filetypes)
end

function M.get_lsps_by_ft()
  return get_key_by_ft("lsp", M.filetypes)
end

function M.get_formatters_by_ft()
  return get_key_by_ft("formatters", M.filetypes)
end

function M.get_daps_by_ft()
  return get_key_by_ft("dap", M.filetypes)
end

function M.get_linter_list()
  return get_key_list("linter", M.filetypes)
end

function M.get_lsp_list()
  return get_key_list("lsp", M.filetypes)
end

function M.get_formatter_list()
  return get_key_list("formatters", M.filetypes)
end

function M.get_dap_list()
  return get_key_list("dap", M.filetypes)
end

return M
