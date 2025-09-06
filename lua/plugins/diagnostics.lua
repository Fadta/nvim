return {
  {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = {
      {
        "<leader>swd",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "[s]how [w]orkspace [d]iagnostics (Trouble)"
      },
      {
        "<leader>sd",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "[s]how [d]iagnostics"
      }
    }
  }
}
