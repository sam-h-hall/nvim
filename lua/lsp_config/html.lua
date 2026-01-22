local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config('html', {
  capabilities = capabilities,
  filetypes = { "javascript", "typescript", "html", "blade" }
})
vim.lsp.enable('html')
