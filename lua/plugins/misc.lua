return {
  'tpope/vim-sleuth', -- Detection of tabstop and shiftwidth automatically

  -- Integrate notifications to the UI
  {
    'rcarriga/nvim-notify',
    config = function ()
      require('notify').setup{
        background_colour = '#000000',
        merge_duplicates = true
      }
      vim.notify = require'notify'.notify
    end
  },
}
