return {
  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = {
      {
        "<leader>sO",
        "<cmd>Outline<CR>",
        desc = "[s]how [O]utline (symbols)"
      },
    },
    opts = {
      outline_items = {
        show_symbol_lineno = true
      },
      symbol_folding = {
        autofold_depth = 2,
      },
      symbols = {
        filter = {
          default = { 'String', exclude = true },
        },
        icons = {
          Class = { icon = '', hl = 'Type' },
          Enum = { icon = '', hl = 'Type' },
          String = { icon = '', hl = 'String' },
          Null = { icon = '󰟢', hl = 'Type' },
          Struct = { icon = '', hl = 'Structure' },
        }
      },
    },
  },
}
