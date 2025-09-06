return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = { "Telescope" },
    --event = "VimEnter",
    branch = "0.1.x",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim", -- Fuzzy search
        build = "make",                             -- this plugin needs to be compiled
        cond = function()
          return vim.fn.executable("make") == 1
        end,
      },
      "nvim-telescope/telescope-ui-select.nvim",
      "nvim-lua/plenary.nvim", -- hard dependency
    },

    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      telescope.setup({
        defaults = {
          mappings = {
            n = {
              ["d"] = actions.delete_buffer,
              ["<C-j>"] = actions.preview_scrolling_down,
              ["<C-k>"] = actions.preview_scrolling_up,
            },
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {},
          },
        },
      })

      pcall(telescope.load_extension, "fzf")
      pcall(telescope.load_extension, "ui-select")

      local nmap = function(lhs, rhs, opts)
        vim.keymap.set("n", lhs, rhs, opts)
      end

      local builtin = require("telescope.builtin")
      nmap("<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
      nmap("<leader>fg", builtin.live_grep, { desc = "[F]ind [G]rep (Workspace)" })
      nmap("<leader><leader>",
        "<cmd>Telescope buffers sort_mru=true sort_lastused=true initial_mode=normal ignore_current_buffer=true theme=ivy<CR>",
        { desc = "Show buffers" })
    end,
  },
}
