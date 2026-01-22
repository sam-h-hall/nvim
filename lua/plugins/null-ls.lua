require("prettier").setup({
  bin = 'prettierd'
})

local null_ls = require("null-ls")
null_ls.register({
  debug = true,
  sources = {
    null_ls.builtins.code_actions.gitsigns,
    null_ls.builtins.formatting.prettier.with({
      filetypes = {
        "html",
        "json",
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
        "java",
      },
      arrow_parens = "always",
      bracket_spacing = true,
      embedded_language_formatting = "auto",
      end_of_line = "lf",
      html_whitespace_sensitivity = "css",
      jsx_bracket_same_line = false,
      jsx_single_quote = false,
      print_width = 80,
      prose_wrap = "preserve",
      quote_props = "as-needed",
      semi = true,
      single_quote = false,
      tab_width = 2,
      trailing_comma = "es5",
      use_tabs = false,
    })
  },
  on_attach = function(client, bufnr)
  end
})
