-- fixes folds being ruined on format
-- fallback is just vim.lsp.buf.format()
require("conform").setup({
  default_format_opts = {
    lsp_format = "fallback"
  }
})
