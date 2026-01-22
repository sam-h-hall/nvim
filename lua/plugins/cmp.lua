local lspkind = require('lspkind')
local cmp = require 'cmp'

cmp.setup({
  min_length = 1,
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
      require('luasnip').filetype_extend("java", { "javadoc" })
    end,
  },
  window = {
    completion = {
      winhighlight = "Normal:CmpNormal,FloatBorder:CmpBorder,Search:None",
      border = 'rounded',
      col_offset = -4,
    },
    documentation = {
      border = 'rounded',
      winhighlight = "Normal:CmpNormal,FloatBorder:CmpBorder",
    },
  },
  mapping = {
    ["<C-k>"] = cmp.mapping.select_prev_item(select_opts),
    ["<C-j>"] = cmp.mapping.select_next_item(select_opts),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },
    ["<C-Space>"] = function()
      if cmp.visible() then
        cmp.abort()    -- Close menu if it's open
      else
        cmp.complete() -- Open menu if it’s closed
      end
    end,
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, item)
      local kind = lspkind.cmp_format({
        mode = "symbol_text",
        maxwidth = { abbr = 15 },
        ellipsis_char = "...",
        show_labelDetails = false,
      })(entry, item)

      local strings = vim.split(kind.kind, "%s", { trimempty = true })
      kind.kind = "" .. (strings[1] or "") .. " "
      kind.menu = "(" .. (strings[2] or "") .. ")"

      return kind
    end,
    completion = {
      completeopt = { 'menu', 'menuone', 'noselect' }
    }
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "path" },
    { name = 'buffer',  keyword_length = 5 }
  },
  experimental = {
    ghost_text = true,
    -- native_menu = false,
  },
})

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on { 'confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }) }

-- color palette
vim.api.nvim_set_hl(
  0,
  "CmpItemAbbrDeprecated",
  { fg = "#7E8294", bg = "NONE", strikethrough = true }
)
vim.api.nvim_set_hl(
  0,
  "CmpItemAbbrMatch",
  { fg = "#a36ee0", bg = "NONE", bold = true, underline = true }
)
vim.api.nvim_set_hl(
  0,
  "CmpItemAbbrMatchFuzzy",
  { fg = "#a36ee0", bg = "NONE", bold = true, underline = true }
)
vim.api.nvim_set_hl(
  0,
  "CmpItemMenu",
  { fg = "#51afef", bg = "NONE", italic = true }
)

--
-- vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = "#EED8DA", bg = "#B5585F" })
-- vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = "#EED8DA", bg = "#B5585F" })
-- vim.api.nvim_set_hl(0, "CmpItemKindEvent", { fg = "#EED8DA", bg = "#B5585F" })
--
-- vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = "#C3E88D", bg = "#9FBD73" })
-- vim.api.nvim_set_hl(0, "CmpItemKindEnum", { fg = "#C3E88D", bg = "#9FBD73" })
-- vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#C3E88D", bg = "#9FBD73" })
--
-- vim.api.nvim_set_hl(0, "CmpItemKindConstant", { fg = "#FFE082", bg = "#D4BB6C" })
-- vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = "#FFE082", bg = "#D4BB6C" })
-- vim.api.nvim_set_hl(0, "CmpItemKindReference", { fg = "#FFE082", bg = "#D4BB6C" })
-- vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#EADFF0", bg = "#7c60c4" })
-- vim.api.nvim_set_hl(0, "CmpItemKindStruct", { fg = "#EADFF0", bg = "#7c60c4" })
-- vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = "#EADFF0", bg = "#7c60c4" })
-- vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = "#EADFF0", bg = "#7c60c4" })
-- vim.api.nvim_set_hl(0, "CmpItemKindOperator", { fg = "#EADFF0", bg = "#7c60c4" })
--
-- vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#C5CDD9", bg = "#7E8294" })
-- vim.api.nvim_set_hl(0, "CmpItemKindFile", { fg = "#C5CDD9", bg = "#7E8294" })
--
-- vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = "#F5EBD9", bg = "#D4A959" })
-- vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#F5EBD9", bg = "#D4A959" })
-- vim.api.nvim_set_hl(0, "CmpItemKindFolder", { fg = "#F5EBD9", bg = "#D4A959" })
--
-- vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = "#DDE5F5", bg = "#6C8ED4" })
-- vim.api.nvim_set_hl(0, "CmpItemKindValue", { fg = "#DDE5F5", bg = "#6C8ED4" })
-- vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { fg = "#DDE5F5", bg = "#6C8ED4" })
--
-- vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = "#D8EEEB", bg = "#58B5A8" })
-- vim.api.nvim_set_hl(0, "CmpItemKindColor", { fg = "#D8EEEB", bg = "#58B5A8" })
-- vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = "#D8EEEB", bg = "#58B5A8" })
