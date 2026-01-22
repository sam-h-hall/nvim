local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config('ts_ls', {
  on_attach = function(client, bufnr)
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
    vim.keymap.set(
      { 'i', 'v', 's' },
      '<C-Space>',
      function()
        require('lsp_signature').toggle_float_win()
      end,
      { silent = true, noremap = true, buffer = bufnr, desc = 'toggle signature' }
    )
  end,
  filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "typescript.tsx", "javascript.jsx" },
  capabilities = capabilities,
})
vim.lsp.enable('ts_ls')
