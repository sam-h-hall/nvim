local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config('intelephense', {
  capabilities = capabilities,
  settings = {
    intelephense = {
      files = {
        maxSize = 5000000
      }
    }
  }
})
vim.lsp.enable('intelephense')
