return {
  ---@type LazySpec
  {
    "mikavilpas/yazi.nvim",
    version = "*", -- use the latest stable version
    --lazy = true,
    dependencies = {
      { "nvim-lua/plenary.nvim", lazy = true },
    },
    keys = {
      -- 👇 in this section, choose your own keymappings!
      {
        "<leader>sy",
        "<cmd>Yazi toggle<cr>",
        mode = { "n", "v" },
        desc = "[s]how [y]azi",
      },
      {
        -- Open in the current working directory
        "<leader>cw",
        "<cmd>Yazi cwd<cr>",
        desc = "Open the file manager in nvim's working directory",
      },
    },
    ---@type YaziConfig | {}
    opts = {
      -- if you want to open yazi instead of netrw, see below for more info
      open_for_directories = false,
      keymaps = {
        show_help = "<f1>",
      },
    },
    -- 👇 if you use `open_for_directories=true`, this is recommended
    init = function()
      -- mark netrw as loaded so it's not loaded at all.
      --
      -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
      vim.g.loaded_netrwPlugin = 1
    end,
  },

  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>so", "<cmd>Oil --float<CR>", desc = "[s]how [o]il" }
    }
  },

  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },

    keys = {
      { "<leader>st", "<cmd>NvimTreeToggle<CR>", desc = "[s]how [t]ree" },
    },

    config = function()
      local tree = require("nvim-tree")
      tree.setup({
        renderer = {
          group_empty = true,
          -- search for glyphs on nvim-tree docs
          icons = {
            glyphs = {
              git = {
                unstaged = "󰛑",
                staged = "󰛐",
                unmerged = "",
                renamed = "󰬳",
                untracked = "",
                deleted = "",
                ignored = "󱀣",
              },
            },
          },
        },

        sort = {
          sorter = "case_sensitive",
        },
        view = {
          signcolumn = "auto",
          width = 30,
        },
        filters = {
          dotfiles = true,
        },
      })
    end,
  },
}
