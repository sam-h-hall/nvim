require('undotree').setup({})

vim.keymap.set(
  "n",
  "<leader>ut",
  ":lua require('undotree').toggle()<cr>",
  { silent = true }
)
