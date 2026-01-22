require('luasnip.loaders.from_vscode').lazy_load()

-- luasnip placeholder jump forward
vim.keymap.set(
  "n",
  "<Tab>",
  ":lua require('luasnip').jump(1)<cr>",
  { silent = true }
)
vim.keymap.set(
  { "s" },
  "<Tab>",
  function() require('luasnip').jump(1) end,
  { silent = true }
)

vim.keymap.set(
  "n",
  "<S-Tab>",
  ":lua require('luasnip').jump(-1)<cr>",
  { silent = true }
)
vim.keymap.set(
  { "s" },
  "<S-Tab>",
  function() require('luasnip').jump(-1) end,
  { silent = true }
)
