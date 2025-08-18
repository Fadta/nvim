return {
  'tpope/vim-sleuth', -- Detection of tabstop and shiftwidth automatically
  'nvim-tree/nvim-web-devicons', -- Icons

  -- Look and feel
  {
    'sphamba/smear-cursor.nvim',
    opts = {},
  },
  {
    'karb94/neoscroll.nvim',
    opts = {},
  },
  {
    'nvimdev/indentmini.nvim',
    config = function ()
      require'indentmini'.setup()
      -- There is no default value.
      vim.cmd.highlight('IndentLine guifg=#404040')
      -- Current indent line highlight
      vim.cmd.highlight('IndentLineCurrent guifg=#606060')
    end
  },

  -- Integrate notifications to the UI
  {
    'j-hui/fidget.nvim', opts = {},
    config = function ()
      vim.notify = require'fidget'.notify
    end
  },
  {
    'folke/lazydev.nvim', -- Better integration of luals for neovim configuration
    lazy = true,
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = {"vim%.uv" } },
      }
    }
  },
}
