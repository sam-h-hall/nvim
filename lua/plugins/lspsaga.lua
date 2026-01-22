require('lspsaga').setup {
  ui = {
    code_action = '',
    border = "rounded",
  },
  finder = {
    keys = {
      shuttle = '<Tab>'
    },
    -- border = "rounded",
    right_width = 0.7,
    left_width = 0.3,
  },
  hover = {
    open_browser = '!firefox',
  },
  float_win_config = {
    width = 100,
  }
}


vim.keymap.set(
  "n",
  "<leader>gd",
  "<cmd>Lspsaga goto_definition<cr>",
  { silent = true }
)
-- replaced with telescope
-- vim.keymap.set(
--   "n",
--   "<leader>fr",
--   "<cmd>mkview<cr><cmd>Lspsaga finder<cr>",
--   { silent = true }
-- )
vim.keymap.set(
  "n",
  "<leader>dp",
  "<cmd>mkview<cr><cmd>Lspsaga peek_definition<cr>",
  { silent = true }
)
vim.keymap.set(
  "n",
  "<leader>tp",
  "<cmd>mkview<cr><cmd>Lspsaga peek_type_definition<cr>",
  { silent = true }
)
-- vim.keymap.set(
--   "n",
--   "<leader>hl",
--   "<cmd>Lspsaga hover_doc<cr>",
--   { silent = true }
-- )
vim.keymap.set(
  "n",
  "<F2>",
  "<cmd>Lspsaga rename<cr>",
  { silent = true }
)
vim.keymap.set(
  "n",
  "<leader>ld",
  "<cmd>mkview<cr><cmd>Lspsaga show_line_diagnostics<cr>",
  { silent = true }
)
vim.keymap.set(
  "n",
  "<leader>ot",
  "<cmd>Lspsaga outline<cr>",
  { silent = true }
)

-- Saga -- diagnostics travel
vim.keymap.set(
  "n",
  "<leader>gn",
  "<cmd>Lspsaga diagnostic_jump_next<cr>",
  -- vim.diagnostic.goto_next,
  { silent = true }
)
vim.keymap.set(
  "n",
  "<leader>gp",
  "<cmd>Lspsaga diagnostic_jump_prev<cr>",
  -- vim.diagnostic.goto_prev,
  { silent = true }
)
vim.keymap.set(
  "n",
  "<leader>ca",
  "<cmd>mkview<cr><cmd>Lspsaga code_action<cr>",
  { silent = true }
)

-- saga float term
vim.keymap.set(
  "n",
  "<leader>tt",
  "<cmd>mkview<cr><cmd>Lspsaga term_toggle<cr>",
  { silent = true }
)
vim.keymap.set(
  "t",
  "<leader>tt",
  "<C-\\><C-n>:Lspsaga term_toggle<cr>",
  { silent = true }
)
