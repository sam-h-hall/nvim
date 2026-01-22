require('persistence').setup {}

-- load persistent session ---------------------------
vim.keymap.set(
  "n",
  "<leader>lls",
  ":lua require('persistence').load()<cr>",
  { silent = false }
)
-- ---------------------------------------------------

-- save current file ---------------------------------
vim.keymap.set(
  'n',
  "<C-s>",
  '<cmd>w<cr>',
  { silent = true }
)
-- ---------------------------------------------------

-- sometimes need to load view -----------------------
vim.keymap.set(
  'n',
  "<leader>lv",
  '<cmd>loadview<cr>',
  { silent = true }
)
-- ---------------------------------------------------

-- alt file explorer ---------------------------------
vim.keymap.set(
  "n",
  "<leader>ex",
  "<cmd>Explore<cr>",
  { silent = true }
)
-- ---------------------------------------------------
