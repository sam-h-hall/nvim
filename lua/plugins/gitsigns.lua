require('gitsigns').setup{
  on_attach = function(bufnr)
    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end
  -- custom close dif action
    map('n', '<leader>ed', ':wincmd p | q<CR>', { noremap = true, silent = true})
  end
}

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
