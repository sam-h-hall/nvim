vim.g.mapleader = " "
vim.o.winborder = "rounded"

vim.g.python3_host_prog = vim.fn.expand("$HOME/.local/venv/nvim/bin/python")
vim.g.python_host_prog = vim.fn.expand("$HOME/.local/venv/nvim/bin/python")

vim.g.netrw_list_hide = '.class'
vim.g.netrw_hide = 1
vim.g.netrw_altfile = 1

vim.opt.termguicolors = true
vim.opt.relativenumber = true
vim.opt.nu = true
vim.opt.smarttab = true
vim.opt.cindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.incsearch = true
vim.opt.cmdheight = 2
vim.opt.signcolumn = 'yes'
vim.opt.hlsearch = false
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.swapfile = false
vim.opt.scrolloff = 8
vim.opt.viminfo = "'100,<50,s10,h"
-- remove ugly border highlight from autocomplete menu

vim.g.transparent_groups = vim.list_extend(
  vim.g.transparent_groups or {}, {
    "FloatBorder",
    "InsertFloat",
    "Normal",
    "NormalFloat",
    "HoverFloat",
    "HoverBorder",

    -- don't think these work
    "FloatWindow",
    "LspFloatWinNormal",
    "SagaNormal",
    "HoverNormal",
  }
)
-- window = {
--   completion = {
--     border = "rounded",
--   }
-- }


vim.g.markdown_fenced_languages = {
  "ts=typescript"
}
