return {
  'tpope/vim-sleuth', -- Detection of tabstop and shiftwidth automatically
  'nvim-tree/nvim-web-devicons', -- Icons

  -- Integrate notifications to the UI
  {
    'j-hui/fidget.nvim',
    opts = {},
    config = function ()
      vim.notify = require'fidget'.notify
    end
  },
  {
    'folke/lazydev.nvim', -- Better integration of luals for neovim configuration
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = {"vim%.uv" } },
      }
    }
  },
}
