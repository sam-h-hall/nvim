-- navigate between vim windows ----------------------
vim.keymap.set(
  "n",
  "<C-h>",
  "<cmd>mkview<cr><cmd>wincmd h<cr>",
  { silent = true }
)
vim.keymap.set(
  "n",
  "<C-l>",
  "<cmd>mkview<cr><cmd>wincmd l<cr>",
  { silent = true }
)
vim.keymap.set(
  "n",
  "<C-j>",
  "<cmd>mkview<cr><cmd>wincmd j<cr>",
  { silent = true }
)
vim.keymap.set(
  "n",
  "<C-k>",
  "<cmd>mkview<cr><cmd>wincmd k<cr>",
  { silent = true }
)
