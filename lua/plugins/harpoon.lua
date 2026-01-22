-- harpoon
vim.keymap.set(
  "n",
  "<leader>ha",
  ":lua require('harpoon.mark').add_file()<cr>",
  { silent = true }
)

vim.keymap.set(
  "n",
  "<leader>hr",
  ":lua require('harpoon.mark').rm_file()<cr>",
  { silent = true }
)

vim.keymap.set(
  "n",
  "<leader>hm",
  "<cmd>mkview<cr>:lua require('harpoon.ui').toggle_quick_menu()<cr>",
  { silent = true }
)

vim.keymap.set(
  "n",
  "<leader>hn",
  "<cmd>mkview<cr>:lua require('harpoon.ui').nav_next()<cr>",
  { silent = true }
)

vim.keymap.set(
  "n",
  "<leader>hp",
  "<cmd>mkview<cr>:lua require('harpoon.ui').nav_prev()<cr>",
  { silent = true }
)

vim.g.FindHarpoonIndex = function()
  local c = vim.v.count;
  vim.cmd("lua require('harpoon.ui').nav_file(" .. c .. ")")
end

vim.keymap.set(
  "n",
  "<leader>hi",
  ":<C-U>call FindHarpoonIndex()<cr>",
  { silent = true }
)
