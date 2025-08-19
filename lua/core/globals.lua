NOTIFY_DEFAULTS = {
  title = 'Fadta',
  render = 'wrapped-compact',
  stages = 'slide',
}

Notify = {
  info = function(msg, opts)
    opts = opts or {}
    opts = vim.tbl_extend('keep', opts, NOTIFY_DEFAULTS)
    vim.notify(msg, vim.log.levels.INFO, opts)
  end,

  debug = function (msg, opts)
    opts = opts or {}
    opts = vim.tbl_extend('keep', opts, NOTIFY_DEFAULTS)
    vim.notify(msg, vim.log.levels.DEBUG, opts)
  end,


  warn = function (msg, opts)
    opts = opts or {}
    opts = vim.tbl_extend('keep', opts, NOTIFY_DEFAULTS)
    vim.notify(msg, vim.log.levels.WARN, opts)
  end,


  error = function (msg, opts)
    opts = opts or {}
    opts = vim.tbl_extend('keep', opts, NOTIFY_DEFAULTS)
    vim.notify(msg, vim.log.levels.ERROR, opts)
  end,
}
