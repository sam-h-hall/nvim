local highlight = {
    "RainbowRed",
    "RainbowViolet",
    "RainbowBlue",
    "RainbowGreen",
    "RainbowCyan",
    "RainbowOrange",
    "RainbowYellow",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#F65866" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#EFBD5D" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#41A7FC" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#DD9046" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#8BCD5B" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C75AE8" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#34BFD0" })
end)

vim.g.rainbow_delimiters = { highlight = highlight }

require("ibl").setup { scope = { highlight = highlight } }
hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
