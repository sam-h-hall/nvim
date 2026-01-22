require('pretty-fold').setup({
  -- fill_char = "─",
  add_close_pattern = true,
  keep_indentation = true,
})
-- process_comment_signs = 'spaces',
-- remove_fold_markers = true,
-- })

-- toggle fold ---------------------------------------

vim.keymap.set(
  "n",
  "<leader>z",
  'za',
  { silent = true }
)
