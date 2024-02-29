vim.cmd([[
  set notimeout
  set encoding=utf-8
]])

local Plug = vim.fn['plug#']

vim.g.mapleader = " "
--plugins
vim.call("plug#begin", "~/.config/nvim/plugged")

-- wilder (autocomplete in vim ':', '/', '?', etc)
Plug ('gelguy/wilder.nvim', { ['do'] = vim.fn['UpdateRemotePlugins'] })
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

Plug "williamboman/nvim-lsp-installer"
Plug "neovim/nvim-lspconfig"
Plug "hrsh7th/cmp-nvim-lsp"
Plug "hrsh7th/cmp-buffer"
Plug "hrsh7th/nvim-cmp"
Plug('hrsh7th/cmp-path')
Plug "navarasu/onedark.nvim"
Plug "folke/tokyonight.nvim" --, { 'branch': 'main' })
Plug "xiyaowong/transparent.nvim"
Plug "onsails/lspkind.nvim"
Plug "windwp/nvim-autopairs"
Plug "windwp/nvim-ts-autotag"
Plug "lukas-reineke/indent-blankline.nvim"
Plug "HiPhish/rainbow-delimiters.nvim"
Plug "anuvyklack/pretty-fold.nvim"
Plug "github/copilot.vim"
Plug ('iamcco/markdown-preview.nvim', { ['do'] = 'cd app && yarn install' })

-- signature help
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'ray-x/lsp_signature.nvim'
-- Plug 'Issafalcon/lsp-overloads.nvim' -- doesn't work very well

-- different snippet sources --
-- lua
Plug 'L3MON4D3/LuaSnip'
Plug "saadparwaiz1/cmp_luasnip"

-- ctrlp
Plug 'ctrlpvim/ctrlp.vim'

Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'feline-nvim/feline.nvim'

Plug "nvim-lua/telescope.nvim"
Plug 'nvim-lua/plenary.nvim'
Plug 'ThePrimeagen/harpoon'

Plug('nvim-treesitter/nvim-treesitter', { ['do'] = vim.fn[':TSUpdate'] })
Plug('nvim-treesitter/nvim-treesitter-context')
Plug('nvim-telescope/telescope-fzf-native.nvim',
  { ['do'] = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' })
Plug 'nvimdev/lspsaga.nvim'

-- Prettier
Plug 'nvimtools/none-ls.nvim'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
Plug 'MunifTanjim/prettier.nvim'

-- Format
Plug 'mhartington/formatter.nvim'

-- telescope file browser
Plug 'nvim-telescope/telescope-file-browser.nvim'

-- git signs
Plug 'lewis6991/gitsigns.nvim'

-- greeter screen
Plug 'goolord/alpha-nvim'

--comment libs
Plug 'numToStr/Comment.nvim'
Plug 'jiaoshijie/undotree'

Plug 'folke/persistence.nvim'

vim.call("plug#end")

-- TODO: fix these imports

-- when entering win, load view
vim.api.nvim_create_autocmd({ "BufWinEnter", "BufEnter" }, {
  pattern = { '*.*' },
  -- pattern = { "*.js", "*.jsx", "*.ts", "*.tsx", "*.rs", "*.json", "*.py" },
  -- command = ""
  callback = function()
    if vim.bo.filetype ~='man' then vim.cmd('silent! loadview') end
    -- return vim.cmd('silent! loadview')
  end
})


-- before save, run prettier 
vim.api.nvim_create_autocmd({ "BufWritePre"}, {
  pattern = { "*.js", "*.jsx", "*.ts", "*.tsx", "*.rs", "*.json", "*.py", "*.css", "*.scss", "*.html" },
  -- command = ""
  callback = function()
    return vim.cmd('Prettier')
  end
})

-- when leaving buffer, save view (folds, etc)
vim.api.nvim_create_autocmd({ "BufWinLeave", "BufWritePost", "BufLeave", "BufHidden", "QuitPre" }, {
  pattern = { '*.*' },
  callback = function()
    if vim.bo.filetype ~='man' then vim.cmd('mkview') end
  end
})

-- general setting
-- let javaScript_fold = 1
-- vim.opt.foldmethod = "syntax"
-- javaScript_fold = 1

-- vim.g.indentLine_setColors = 1
-- vim.g.indentLine_char = '┊'
vim.opt.termguicolors = true
vim.opt.relativenumber = true
vim.opt.nu = true
vim.opt.smarttab = true
vim.opt.cindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.incsearch = true
vim.opt.cmdheight = 2
vim.opt.signcolumn = 'yes'
vim.opt.hlsearch = false
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.swapfile = false
vim.opt.scrolloff = 8
vim.opt.viminfo = "'100,<50,s10,h"
-- remove ugly border highlight from autocomplete menu
vim.g.transparent_groups = vim.list_extend(
  vim.g.transparent_groups or {}, {
    "FloatBorder",
    "InsertFloat",
    "Normal",
    -- "FloatWindow",
    "NormalFloat",
    -- "LspFloatWinNormal",
  }
)

-- colorscheme
require('onedark').setup {
  style = "deep",
  transparent = true,
  diagnostics = {
    background = true,
    border = false,
  },
}
require('onedark').load()
-- colorscheme
--require("tokyonight").setup({
--  style = 'night',
--  transparent = true,
--})
-- require('tokyonight').load()

require('pretty-fold').setup({
  fill_char = "─",
  process_comment_signs = 'spaces',
  remove_fold_markers = false,
})

-- persistent vim sessions
-- in future, can you make it so a prompt appears asking if you want to load last session
require('persistence').setup{}
vim.api.nvim_set_keymap(
  "n",
  "<leader>lls",
  ":lua require('persistence').load()<cr>",
  { noremap = true, silent = false}
)


-- vim.g.tokyonight_transparent = true
-- vim.g.tokyonight_style = "night"
-- vim.cmd("colorscheme tokyonight")

-- wilder config
local wilder = require('wilder')
wilder.setup({modes = {':', '/', '?'}})

-- lsp
local lspkind = require('lspkind')
-- lspkind.init()

-- require('tmux-zsh-vim-titles').setup{}

-- add border so we can keep it trans ... parent
require('lspconfig.ui.windows').default_options.border = "double"
-- cssmodules_ls setup
require'lspconfig'.cssmodules_ls.setup{}
-- cssls setup
require'lspconfig'.cssls.setup{}

require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "html", "javascript", "typescript", "css", "json", "lua", "help" },
  -- auto_install = true,
  highlight = {
    enable = true,
    -- 'html',
    disable = { 'lua' },
  },
  autotag = {
    enable = true,
    enable_close_on_slash = false,
  },
  indent = {
    enable = true,
  },
}

require 'treesitter-context'.setup()

require 'nvim-autopairs'.setup ({
  ignored_next_char = "[/]"
})
-- require('feline').setup()

-- indent-blankline
local highlight = {
    "RainbowRed",
    "RainbowViolet",
    "RainbowBlue",
    "RainbowGreen",
    "RainbowCyan",
    "RainbowOrange",
    "RainbowYellow",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#F65866" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#EFBD5D" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#41A7FC" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#DD9046" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#8BCD5B" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C75AE8" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#34BFD0" })
end)

vim.g.rainbow_delimiters = { highlight = highlight }

require("ibl").setup { scope = { highlight = highlight } }
hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

-- DELETE ALL BELOW ONCE YOU CAN IMPORT

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
-- capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

--cmp

--cmp_autopairs.lisp[#cmp_autopairs.lisp+1] = "racket"

require'lsp_signature'.setup({
  timer_interval = 10,
  hint_enable = false,
  hint_prefix = ' ',
  floating_window = false,
  floating_window_off_x = -5,
  -- toggle_key_flip_floatwin_setting = true,
  -- toggle_key = "<A-h>", -- doesn't work
  select_signature_key = "<A-n>",
})

local cmp = require'cmp'
cmp.setup({
  min_length = 1,
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window={
    completion = cmp.config.window.bordered(),
    -- completion = {
    --   border = 'rounded'
    -- },
    documentation = cmp.config.window.bordered(),
  },
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(select_opts),
    ["<C-n>"] = cmp.mapping.select_next_item(select_opts),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(select_opts),
    ["<Tab>"] = cmp.mapping.select_next_item(select_opts),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },
  },
  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        buffer   = "[buf]",
        nvim_lsp = "[LSP]",
        path     = "[path]",
      },
    },
    -- completion = {
    -- completeopt = {'menu', 'menuone', 'noselect'}
    --}
  },

  sources = {
    { name = "nvim_lsp" },
    -- { name = "nvim_lsp_signature_help" }, -- hardly fucking works, but best option
    { name = "luasnip" },
    -- { name = "luasnip", option = { enable_autosnippets = true } },
    { name = "path" },
  },
  {
    { name = 'buffer', keyword_length = 5 }
  },
  experimental = {
    ghost_text = true,
  },
})

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on { 'confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }) }

vim.api.nvim_set_keymap(
  "i",
  "<c-space>",
  "compe#complete()",
  { expr = true }
)
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- > local cmpcapabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

require 'lspconfig'.tailwindcss.setup {}

require 'lspconfig'.lua_ls.setup {
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

require 'lspconfig'.pylsp.setup {
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = { 'E501' },
          enabled = true,
        },
        -- pydocstyle = {
        --   enabled = true,
        -- },
        -- pyflakes = {
        --   enabled = true,
        -- },
        pylint = {
          enabled = true,
        },
        yapf = {
          enabled = true,
        },
      },
    },
  },
}

require 'lspconfig'.tsserver.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
    vim.keymap.set(
      {'i', 'v', 's'},
      '<C-Space>',
      function()
        require('lsp_signature').toggle_float_win()
      end,
      { silent=true, noremap=true, buffer=bufnr, desc='toggle signature'}
    )
    --local ts_utils = require('nvim-lsp-ts-utils')
    --ts_utils.setup({})
    --ts_utils.setup_client(client)

    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', "<C-s>", '<cmd>lua vim.lsp.buf.format{ async = true }<cr>:w<cr>', {})
  end,
  filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "typescript.tsx", "javascript.jsx" },
  capabilities = capabilities;
}

require 'lspconfig'.html.setup {
  capabilities = capabilities,
  filetypes = { "javascript", "typescript", "html"}
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

--java
-- local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
-- local config = {
--   -- The command that starts the language server
--   -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
--   cmd = {
--
--     -- 💀
--     '/usr/lib/jvm/java-11-openjdk-amd64/bin/java',
--     '-Declipse.application=org.eclipse.jdt.ls.core.id1',
--     '-Dosgi.bundles.defaultStartLevel=4',
--     '-Declipse.product=org.eclipse.jdt.ls.core.product',
--     '-Dlog.protocol=true',
--     '-Dlog.level=ALL',
--     '-Xms1g',
--     '--add-modules=ALL-SYSTEM',
--     '--add-opens', 'java.base/java.util=ALL-UNNAMED',
--     '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
--
--     -- 💀
--     '-jar', '~/jdt-language-server-1.9.0-202203031534/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
--
--     -- 💀
--     --
--     '-configuration', '~/jdt-language-server-1.9.0-202203031534/config_linux',
--
--     -- 💀
--     -- See `data directory configuration` section in the README
--     '-data', vim.fn.expand('~/.cache/jdtls-workspace') .. workspace_dir,
--   },
--
--   -- 💀
--   -- This is the default if not provided, you can remove it. Or adjust as needed.
--   -- One dedicated LSP server & client will be started per unique root_dir
--   root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
--   capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities),
--
--   -- Here you can configure eclipse.jdt.ls specific settings
--   -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
--   -- for a list of options
--   settings = {
--     java = {
--     }
--   },

-- Language server `initializationOptions`
-- You need to extend the `bundles` with paths to jar files
-- if you want to use additional eclipse.jdt.ls plugins.
--
-- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
--
-- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
--   init_options = {
--     bundles = {}
--   },
-- }
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
-- require('jdtls').start_or_attach(config)
-- require('lspconfig').jdtls.setup{config}

--saga
require('lspsaga').setup{
  ui = {
    code_action = ''
  },
  finder = {
    keys = {
      shuttle = '<Tab>'
    }
  },
  hover = {
    open_browser = '!firefox'
  }
}
vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError", numhl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn", numhl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint", numhl = "DiagnosticSignHint"})
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo", numhl = "DiagnosticSignInfo"})

require('undotree').setup({})
-- undo tree
vim.api.nvim_set_keymap(
  "n",
  "<leader>ut",
  ":lua require('undotree').toggle()<cr>",
  { noremap = true, silent = true }
)

-- harpoon
vim.api.nvim_set_keymap(
  "n",
  "<leader>ha",
  ":lua require('harpoon.mark').add_file()<cr>",
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  "n",
  "<leader>hr",
  ":lua require('harpoon.mark').rm_file()<cr>",
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  "n",
  "<leader>hm",
  "<cmd>mkview<cr>:lua require('harpoon.ui').toggle_quick_menu()<cr>",
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  "n",
  "<leader>qm",
  "<cmd>mkview<cr>:Telescope harpoon marks<cr>",
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  "n",
  "<leader>hn",
  "<cmd>mkview<cr>:lua require('harpoon.ui').nav_next()<cr>",
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  "n",
  "<leader>hp",
  "<cmd>mkview<cr>:lua require('harpoon.ui').nav_prev()<cr>",
  { noremap = true, silent = true }
)

vim.g.FindHarpoonIndex = function ()
  local c = vim.v.count;
  vim.cmd("lua require('harpoon.ui').nav_file("..c..")")
end

vim.api.nvim_set_keymap(
  "n",
  "<leader>hi",
  ":<C-U>call FindHarpoonIndex()<cr>",
  { noremap = true, silent = true }
)

-- find ref/def
vim.api.nvim_set_keymap(
  "n",
  "<leader>fr",
  "<cmd>mkview<cr><cmd>Lspsaga finder<cr>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>dp",
  "<cmd>mkview<cr><cmd>Lspsaga peek_definition<cr>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>tp",
  "<cmd>mkview<cr><cmd>Lspsaga peek_type_definition<cr>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>hl",
  "<cmd>Lspsaga hover_doc<cr>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<F2>",
  "<cmd>Lspsaga rename<cr>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>ld",
  "<cmd>mkview<cr><cmd>Lspsaga show_line_diagnostics<cr>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>ot",
  "<cmd>Lspsaga outline<cr>",
  { noremap = true, silent = true }
)

-- Saga -- diagnostics travel
vim.keymap.set(
  "n",
  "<leader>gn",
  "<cmd>Lspsaga diagnostic_jump_next<cr>",
  -- vim.diagnostic.goto_next,
  { noremap = true, silent = true }
)
vim.keymap.set(
  "n",
  "<leader>gp",
  "<cmd>Lspsaga diagnostic_jump_prev<cr>",
  -- vim.diagnostic.goto_prev,
  { noremap = true, silent = true }
)
vim.keymap.set(
  "n",
  "<leader>ca",
  "<cmd>mkview<cr><cmd>Lspsaga code_action<cr>",
  { noremap = true, silent = true }
)

-- saga float term
vim.api.nvim_set_keymap(
  "n",
  "<leader>to",
  "<cmd>mkview<cr><cmd>Lspsaga term_toggle<cr>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "t",
  "<leader>tc",
  "<C-\\><C-n>:Lspsaga term_toggle<cr>",
  { noremap = true, silent = true }
)

require("prettier").setup()

-- null-ls
local null_ls = require("null-ls")
null_ls.register({
  sources = {
    null_ls.builtins.diagnostics.ruff,
    null_ls.builtins.code_actions.gitsigns,
    null_ls.builtins.diagnostics.eslint.with({
      validate = "on"
      -- dynamic_command = function(utils)
      --   local local_path = "./node_modules/.bin/eslint"
      --   return utils.root_has_file(local_path) or "~/eslintrc.json"
      -- end,
    }),
    null_ls.builtins.formatting.prettier.with({
      -- prettier config
      filetypes = {
        "html",
        "json",
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact"
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
    --vim.api.nvim_buf_set_keymap(bufnr, 'n', "<C-s>", '<cmd>lua vim.lsp.buf.format{ async = true }<cr>:w<cr>', {})
  end
})

-- gitsigns
vim.api.nvim_set_keymap(
  "n",
  "<leader>uc",
  ":Gitsigns reset_hunk<cr>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>sc",
  ":Gitsigns preview_hunk_inline<cr>",
  { noremap = true, silent = true }
)
vim.keymap.set(
  "n",
  "<leader>nc",
  ":Gitsigns next_hunk<cr>",
  { noremap = true, silent = true }
)

-- copilot
vim.api.nvim_set_keymap(
  "i",
  "<C-Tab>",
  "copilot#Accept()",
  { expr = true, silent = true }
)

-- save current file
vim.api.nvim_set_keymap(
  'n',
  "<C-s>",
  -- '<cmd>lua vim.lsp.buf.format{ async = false }<cr><cmd>mkview<cr><cmd>w<cr>',
  -- '<cmd>mkview<cr><cmd>w<cr>',
  '<cmd>w<cr>',
  { noremap = true, silent = true }
)

-- toggle fold
vim.api.nvim_set_keymap(
  'n',
  "<leader>z",
  'za',
  { noremap = true, silent = true }
)

-- sometimes need to load view
vim.api.nvim_set_keymap(
  'n',
  "<leader>lv",
  '<cmd>loadview<cr>',
  { noremap = true, silent = true }
)

--navigate between windows
vim.api.nvim_set_keymap(
  "n",
  "<C-h>",
  "<cmd>mkview<cr><cmd>wincmd h<cr>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<C-l>",
  "<cmd>mkview<cr><cmd>wincmd l<cr>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<C-j>",
  "<cmd>mkview<cr><cmd>wincmd j<cr>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<C-k>",
  "<cmd>mkview<cr><cmd>wincmd k<cr>",
  { noremap = true, silent = true }
)

-- buffer controls
vim.api.nvim_set_keymap(
  "n",
  "<C-q>",
  ":bdelete<cr>",
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>bn",
  ":bnext<cr>",
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>bp",
  ":bprevious<cr>",
  { noremap = true }
)

-- Telescope
local telescope_fb_actions = require 'telescope'.extensions.file_browser.actions
-- local telescope_proj_actions = require("telescope._extensions.project.actions")
-- require'telescope'.extensions.project.project{}
require('telescope').setup {
  extensions = {
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          ["<C-n>"] = telescope_fb_actions.create_from_prompt,
          ["<C-x>"] = telescope_fb_actions.remove,
          -- ["<C-m>"] = telescope_fb_actions.move
          -- your custom normal mode mappings
        },
      },
    },
  },
  defaults = { file_ignore_patterns = { "node_modules" } }
}

require('telescope').load_extension "file_browser"
require('telescope').load_extension("harpoon")

-- git commands
vim.api.nvim_set_keymap(
  "n",
  "<leader>gd",
  ":Gitsigns diffthis<cr>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>jl",
  "<cmd>mkview<cr><cmd>Telescope jumplist<cr>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>gs",
  ":Telescope git_status<cr>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>tr",
  ":Telescope lsp_references<cr>",
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>tt",
  ":Telescope lsp_type_definitions<cr>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>ts",
  ":Telescope lsp_document_symbols<cr>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>td",
  ":Telescope diagnostics<cr>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>th",
  ":Telescope marks<cr>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>qf",
  ":Telescope quickfix<cr>",
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  "n",
  "<leader>gb",
  ":Telescope git_branches<cr>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>gc",
  ":Telescope git_commits<cr>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>gt",
  ":Telescope git_stash<cr>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "v",
  "<leader>sw",
  "y<ESC>:Telescope live_grep default_text=<c-r>0<CR>",
  { noremap = true, silent = true }
)

-- spell suggest
vim.api.nvim_set_keymap(
  "n",
  "<leader>ss",
  ":Telescope spell_suggest<cr>",
  { noremap = true, silent = true }
)

-- search current file for keywords
vim.api.nvim_set_keymap(
  "n",
  "<C-f>",
  ":Telescope current_buffer_fuzzy_find<cr>",
  { noremap = true, silent = true }
)

-- recent files
vim.api.nvim_set_keymap(
  "n",
  "<leader>fo",
  "<cmd>Telescope oldfiles<cr>",
  { noremap = true, silent = true }
)
-- opens folder of current buffer
vim.api.nvim_set_keymap(
  "n",
  "<leader>ff",
  "<cmd>Telescope file_browser hidden=true path=%:p:h<cr>",
  { noremap = true, silent = true }
)
-- searches all files/directories from directory you open vim in
vim.api.nvim_set_keymap(
  "n",
  "<leader>fa",
  "<cmd>Telescope find_files<cr>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>fg",
  "<cmd>Telescope live_grep<cr>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>fb",
  "<cmd>Telescope buffers<cr>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>fh",
  "<cmd>Telescope help_tags<cr>",
  { noremap = true, silent = true }
)

-- comment
require("Comment").setup()

-- gitsigns
require('gitsigns').setup{
  on_attach = function(bufnr)
    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end
  -- custom close dif action
    map('n', '<leader>cd', ':wincmd p | q<CR>', { noremap = true, silent = true})
  end
}

-- Alpha start screen
--
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
  [[                                                 .h.                ]],
  [[            :h-                                  Nhy`               ]],
  [[           -mh.                           h.    `Ndho               ]],
  [[           hmh+                          oNm.   oNdhh               ]],
  [[          `Nmhd`                        /NNmd  /NNhhd               ]],
  [[          -NNhhy                      `hMNmmm`+NNdhhh               ]],
  [[          .NNmhhs              ```....`..-:/./mNdhhh+               ]],
  [[           mNNdhhh-     `.-::///+++////++//:--.`-/sd`               ]],
  [[           oNNNdhhdo..://++//++++++/+++//++///++/-.`                ]],
  [[      y.   `mNNNmhhhdy+/++++//+/////++//+++///++////-` `/oos:       ]],
  [[ .    Nmy:  :NNNNmhhhhdy+/++/+++///:.....--:////+++///:.`:s+        ]],
  [[ h-   dNmNmy oNNNNNdhhhhy:/+/+++/-         ---:/+++//++//.`         ]],
  [[ hd+` -NNNy`./dNNNNNhhhh+-://///    -+oo:`  ::-:+////++///:`        ]],
  [[ /Nmhs+oss-:++/dNNNmhho:--::///    /mmmmmo  ../-///++///////.       ]],
  [[  oNNdhhhhhhhs//osso/:---:::///    /yyyyso  ..o+-//////////:/.      ]],
  [[   /mNNNmdhhhh/://+///::://////     -:::- ..+sy+:////////::/:/.     ]],
  [[     /hNNNdhhs--:/+++////++/////.      ..-/yhhs-/////////::/::/`    ]],
  [[       .ooo+/-::::/+///////++++//-/ossyyhhhhs/:///////:::/::::/:    ]],
  [[       -///:::::::////++///+++/////:/+ooo+/::///////.::://::---+`   ]],
  [[       /////+//++++/////+////-..//////////::-:::--`.:///:---:::/:   ]],
  [[       //+++//++++++////+++///::--                 .::::-------::   ]],
  [[       :/++++///////////++++//////.                -:/:----::../-   ]],
  [[       -/++++//++///+//////////////               .::::---:::-.+`   ]],
  [[       `////////////////////////////:.            --::-----...-/.   ]],
  [[        -///://////////////////////::::-..      :-:-:-..-::.`./+\   ]],
  [[         :/://///:///::://::://::::::/:::::::-:---::-.-....``/NNN\  ]],
  [[           ::::://::://::::::::::::::----------..-:....`.../- -+o$\ ]],
  [[            -/:::-:::::---://:-::-::::----::---.-.......`-/.      ``]],
  [[           s-`::--:::------:////----:---.-:::...-.....`./:          ]],
  [[          yMNy.`::-.--::..-dmmhhhs-..-.-.......`.....-/:`           ]],
  [[         oMNNNh. `-::--...:NNNdhhh/.--.`..``.......:/-              ]],
  [[        :dy+:`      .-::-..NNNhhd+``..`...````.-::-`                ]],
  [[                        .-:mNdhh:.......--::::-`                    ]],
  [[                           yNh/..------..`                          ]],
  [[                            $/            __                        ]],
  [[             ___     ___    ___   __  __ /\_\    ___ ___            ]],
  [[            / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\          ]],
  [[           /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \         ]],
  [[           \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\        ]],
  [[            \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/        ]],
}
dashboard.section.buttons.val = {
  dashboard.button("f", "󰱽  Find file", ":Telescope find_files <CR>"),
  dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("p", "󰥨  Find project", ":Telescope projects <CR>"),
  dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
  dashboard.button("t", "󱎸  Find text", ":Telescope live_grep <CR>"),
  dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
  dashboard.button("q", "󰒲  Quit Neovim", ":qa<CR>"),
}

local function footer()
  -- NOTE: requires the fortune-mod package to work
  -- local handle = io.popen("fortune")
  -- local fortune = handle:read("*a")
  -- handle:close()
  -- return fortune
  return "Earn your comfort."
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)


-- vim statusline
local lualine = require('lualine')

local colors = {
  bg       = '#202328',
  fg       = '#bbc2cf',
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#98be65',
  orange   = '#FF8800',
  violet   = '#874db2',
  magenta  = '#c678dd',
  blue     = '#51afef',
  red      = '#ec5f67',
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- Config
local config = {
  options = {
    -- Disable sections and component separators
    component_separators = '',
    section_separators = '',
    theme = {
      -- We are going to use lualine_c an lualine_x as left and
      -- right section. Both are highlighted by c theme .  So we
      -- are just setting default looks o statusline
      normal = { c = { fg = colors.fg, bg = colors.bg } },
      inactive = { c = { fg = colors.fg, bg = colors.bg } },
    },
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left {
  function()
    return '▊'
  end,
  color = { fg = colors.violet }, -- Sets highlighting of component
  padding = { left = 0, right = 1 }, -- We don't need space before this
}

ins_left {
  -- mode component
  function()
    -- return '♞'
    -- return '🦙'
    -- return '♔'
    -- return ' '
    return ''
    --☻
    --
  end,
  color = function()
    -- auto change color according to neovims mode
    local mode_color = {
      n = colors.red,
      i = colors.green,
      v = colors.blue,
      ['␖'] = colors.blue,
      V = colors.blue,
      c = colors.magenta,
      no = colors.red,
      s = colors.orange,
      S = colors.orange,
      ['␓'] = colors.orange,
      ic = colors.yellow,
      R = colors.violet,
      Rv = colors.violet,
      cv = colors.red,
      ce = colors.red,
      r = colors.cyan,
      rm = colors.cyan,
      ['r?'] = colors.cyan,
      ['!'] = colors.red,
      t = colors.red,
    }
    return { fg = mode_color[vim.fn.mode()] }
  end,
  padding = { right = 1 },
}

ins_left {
  -- filesize component
  'filesize',
  cond = conditions.buffer_not_empty,
}

ins_left {
  'filename',
  cond = conditions.buffer_not_empty,
  color = { fg = colors.magenta, gui = 'bold' },
}

-- ins_left { 'location' }

ins_left { 'progress', color = { fg = colors.fg, gui = 'bold' } }

-- hint='  '
ins_left {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  symbols = { error = '  ', warn = '  ', info = '  ', hint='  '  },
  diagnostics_color = {
    color_error = { fg = colors.red },
    color_warn = { fg = colors.yellow },
    color_info = { fg = colors.cyan },
    color_hint = {colors.darkblue}
  },
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {
  function()
    return '%='
  end,
}

ins_left {
  -- Lsp server name .
  function()
    local msg = 'No Active Lsp'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = ' LSP:',
  color = { fg = '#ffffff', gui = 'bold' },
}

ins_right {
  'branch',
  icon = '',
  color = { fg = colors.violet, gui = 'bold' },
}

ins_right {
  'diff',
  -- Is it me or the symbol for modified us really weird
  -- 柳
  symbols = { added = ' ', modified = '~ ', removed = ' ' },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.orange },
    removed = { fg = colors.red },
  },
  cond = conditions.hide_in_width,
}

ins_right {
  function()
    return '▊'
  end,
  color = { fg = colors.violet },
  padding = { left = 1 },
}

-- Now don't forget to initialize lualine
lualine.setup(config)
