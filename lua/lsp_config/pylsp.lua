vim.lsp.config('pylsp', {
  settings = {
    pylsp = {
      plugins = {
        ruff = {
          enabled = true,
          formatEnabled = true,
          fixOnSave = true,
          ignore = { 'E501' },
          line_length = 88,
          format = { extended = true },
        },
      },
    },
  },
})
vim.lsp.enable('pylsp')
