return {
  { "nvim-treesitter/nvim-treesitter", branch = "master", lazy = false, build = ":TSUpdate", opts = { auto_install = vim.fn.executable("tree-sitter") } },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      separator = '_',
      multiline_threshold = 8,
    },
  },
}
