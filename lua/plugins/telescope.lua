return {
  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    event = "VimEnter",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim", -- hard dependency
      {
        "nvim-telescope/telescope-fzf-native.nvim", -- Fuzzy search
        build = "make", -- this plugin needs to be compiled
        cond = function()
          return vim.fn.executable("make") == 1
        end,
      },
      "nvim-telescope/telescope-ui-select.nvim",
    },

    config = function()
      local extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      }
      pcall(require("telescope").load_extension, "fzf")
      pcall(require("telescope").load_extension, "ui_select")
      pcall(require("telescope").load_extension, "rooter")

      local nmap = function(lhs, rhs, opts)
        vim.keymap.set("n", lhs, rhs, opts)
      end

      local builtin = require("telescope.builtin")
      nmap("<leader>ff", builtin.fd, { desc = "[F]ind [F]iles" })
      nmap("<leader><leader>", builtin.buffers)
    end,
  },
}
