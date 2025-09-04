return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason-org/mason.nvim", opts = {} },
    config = function()
      local ensure = {}
      local ls = require("language_services")

      local function extend_ensure(tbl)
        for _, v in pairs(tbl) do
          table.insert(ensure, v)
        end
      end

      extend_ensure(ls.get_lsp_list())
      extend_ensure(ls.get_linter_list())
      extend_ensure(ls.get_formatter_list())

      require("mason-tool-installer").setup({
        ensure_installed = ls.get_linter_list()
      })
    end
  }
}
