-- can use these for any keymap, guaranteed unique leader
local Hyper = 'C-S-A-D'
local Meh = 'C-S-A'

-- import configs
require("options")
require("auto")
require("plugins")
require("lsp_config")
require("keymap")

-- only way I have gotten these to work is here (previously in options)
-- this is to fix lspsaga float windows to be transparent with border
vim.api.nvim_set_hl(0, "CmpBorder", { bg = "NONE", fg = "#6587CE" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE", fg = "#6587CE" })

-- fg is color of text in float
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE", fg = "#6587CE" })
