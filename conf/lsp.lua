local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
------ > local cmpcapabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

require 'lspconfig'.tailwindcss.setup {}

require 'lspconfig'.sumneko_lua.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

require 'lspconfig'.pylsp.setup {}

require 'lspconfig'.tsserver.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false

    --local ts_utils = require('nvim-lsp-ts-utils')
    --ts_utils.setup({})
    --ts_utils.setup_client(client)

    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', "<C-s>", '<cmd>lua vim.lsp.buf.format{ async = true }<cr>:w<cr>', {})
  end,
  filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "typescript.tsx", "javascript.jsx" },
  capabilities = capabilities;

  root_dir = function() return vim.loop.cwd() end
}

require 'lspconfig'.html.setup {
  capabilities = capabilities,
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
require 'lspconfig'.cssls.setup {
  capabilities = capabilities,
}

require 'lspconfig'.angularls.setup {}

local rust_capabilities = vim.lsp.protocol.make_client_capabilities()
rust_capabilities = require('cmp_nvim_lsp').default_capabilities(rust_capabilities)

-- require'lspconfig'.gopls.setup{}

require 'lspconfig'.rust_analyzer.setup {}
-- capabilities = rust_capabilities,
--[[ on_attach = function(client)
    require'completion'.on_attach(client)
  end, ]]
--[[ settings = {
        ["rust-analyzer"] = {
            assist = {
                importGranularity = "module",
                importPrefix = "self",
            },
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = true
            },
        }
    } ]]
-- }
require("nvim-lsp-installer").setup {
  automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
}
