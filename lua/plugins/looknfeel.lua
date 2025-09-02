return {
  "nvim-tree/nvim-web-devicons", -- Icons

  -- colorschemes
  { "ellisonleao/gruvbox.nvim", priority = 1000, lazy = false, config = true },
  { "vague2k/vague.nvim", priority = 1000, lazy = true },
  { "EdenEast/nightfox.nvim", priority = 1000, lazy = true },

  -- look and feel
  {
    "sphamba/smear-cursor.nvim",
    opts = {},
  },
  {
    "karb94/neoscroll.nvim",
    opts = {},
  },
  {
    "nvimdev/indentmini.nvim",
    config = function()
      require("indentmini").setup()
      -- There is no default value.
      vim.cmd.highlight("IndentLine guifg=#404040")
      -- Current indent line highlight
      vim.cmd.highlight("IndentLineCurrent guifg=#606060")
    end,
  },
}
