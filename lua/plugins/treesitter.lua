require 'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "html",
    "javascript",
    "typescript",
    "css",
    "json",
    "lua",
    "java",
    "php",
    "tsx"
  },
  -- auto_install = true,
  highlight = {
    enable = true,
    -- 'html',
    -- disable = { 'lua' },
  },
  indent = {
    enable = true,
  },
}

require 'treesitter-context'.setup({
  enable = false
})
