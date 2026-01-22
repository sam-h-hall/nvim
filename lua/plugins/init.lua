vim.cmd([[
  set notimeout
  set encoding=utf-8
]])

local Plug = vim.fn['plug#']

vim.call("plug#begin", "~/.config/nvim/plugged")

Plug('gelguy/wilder.nvim', { ['do'] = vim.fn['UpdateRemotePlugins'] })

Plug "mason-org/mason.nvim"
Plug "mason-org/mason-lspconfig.nvim"


Plug "neovim/nvim-lspconfig"
Plug "hrsh7th/cmp-nvim-lsp"
Plug "hrsh7th/cmp-buffer"
Plug "hrsh7th/nvim-cmp"
Plug "hrsh7th/cmp-path"
Plug "navarasu/onedark.nvim"
Plug "folke/tokyonight.nvim" --, { 'branch': 'main' })
Plug "xiyaowong/transparent.nvim"
Plug "onsails/lspkind.nvim"
Plug "windwp/nvim-autopairs"
Plug "windwp/nvim-ts-autotag"
Plug "lukas-reineke/indent-blankline.nvim"
Plug "HiPhish/rainbow-delimiters.nvim"

Plug 'stevearc/conform.nvim'
Plug "yaocccc/nvim-foldsign"
Plug "bbjornstad/pretty-fold.nvim"
Plug "github/copilot.vim"
Plug('iamcco/markdown-preview.nvim', { ['do'] = 'cd app && yarn install' })

-- php
Plug 'jwalton512/vim-blade'

-- java
Plug 'mfussenegger/nvim-jdtls'

-- signature help
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'ray-x/lsp_signature.nvim'
-- Plug 'Issafalcon/lsp-overloads.nvim' -- doesn't work very well

-- snippet sources --
Plug('L3MON4D3/LuaSnip', { ['do'] = 'make install_jsregexp' })
Plug "saadparwaiz1/cmp_luasnip"
Plug 'rafamadriz/friendly-snippets'

Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'

-- telescope
Plug "nvim-lua/telescope.nvim"
Plug 'nvim-telescope/telescope-hop.nvim'
Plug('nvim-telescope/telescope-fzf-native.nvim',
  {
    ['do'] =
    'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  })
Plug 'nvim-telescope/telescope-file-browser.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'ThePrimeagen/harpoon'

Plug('nvim-treesitter/nvim-treesitter', { ['do'] = vim.fn[':TSUpdate'] })
Plug('nvim-treesitter/nvim-treesitter-context')

Plug 'nvimdev/lspsaga.nvim'

-- Prettier
-- null-ls replacement
Plug 'nvimtools/none-ls.nvim'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
Plug 'MunifTanjim/prettier.nvim'

-- git signs
Plug 'lewis6991/gitsigns.nvim'

--comment libs
Plug 'numToStr/Comment.nvim'
Plug 'jiaoshijie/undotree'

Plug 'folke/persistence.nvim'

vim.call("plug#end")

require("nvim-web-devicons").setup({})

return {
  require("plugins.pretty_fold"),
  require("plugins.comment"),
  require("plugins.wilder"),
  require("plugins.undotree"),
  require("plugins.lspsaga"),
  require("plugins.lsp_signature"),
  require("plugins.auto_code"),
  require("plugins.gitsigns"),
  require("plugins.mason"),
  require("plugins.theme"),
  require("plugins.luasnip"),
  require("plugins.cmp"),
  require("plugins.indent-blankline"),
  require("plugins.harpoon"),
  require("plugins.conform"),
  require("plugins.null-ls"),
  require("plugins.telescope"),
  require("plugins.lua_line"),
  require('plugins.nvim_foldsign'),
}
