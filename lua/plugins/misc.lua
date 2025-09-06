return {
  "tpope/vim-sleuth", -- Detection of tabstop and shiftwidth automatically

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      delay = 500,
      preset = "modern",
      spec = {
        { "<leader>l", group = "LSP" },
        { "<leader>s", group = "Show (UI)" },
        { "<leader>f", group = "Find" }
      }
    }
  },

  -- Integrate notifications to the UI
  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        background_colour = "#000000",
        merge_duplicates = true,
      })
      vim.notify = require("notify").notify
    end,
  },
}
