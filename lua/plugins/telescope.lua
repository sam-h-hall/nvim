local telescope_fb_actions = require 'telescope'.extensions.file_browser.actions
local telescope = require('telescope')
local tActions = require('telescope.actions')
local tBuiltin = require('telescope.builtin')

local function telescopeQf(pbr, actionFn)
  actionFn(pbr)
  tBuiltin.quickfix()
end
local function telescopeLf(pbr, actionFn)
  actionFn(pbr)
  tBuiltin.loclist()
end

telescope.setup {
  defaults = {
    -- don't think preview is doing anything
    preview = true,
    layout_strategy = "vertical",
    file_ignore_patterns = { "node_modules", ".git", ".class" },
    mappings = {
      i = {
        ["<C-f>"] = telescope.extensions.hop.hop,
        ["<C-space>"] = function(pbr)
          local opts = {
            callback = tActions.toggle_selection,
            loop_callback = tActions.send_selected_to_qflist,
          }
          telescope.extensions.hop._hop_loop(pbr, opts)
        end,
        ["<C-k>"] = tActions.move_selection_previous,
        ["<C-j>"] = tActions.move_selection_next,
        ["<A-l>"] = function(pbr)
          telescopeLf(pbr, tActions.send_to_loclist)
        end,
        ["<C-l>"] = function(pbr)
          telescopeLf(pbr, tActions.send_selected_to_loclist)
        end,
        ["<leader>al"] = function(pbr)
          telescopeLf(pbr, tActions.add_selected_to_loclist)
        end,
        ["<A-q>"] = function(pbr)
          telescopeQf(pbr, tActions.send_to_qflist)
        end,
        ["<C-q>"] = function(pbr)
          telescopeQf(pbr, tActions.send_selected_to_qflist)
        end,
        ["<leader>aq"] = function(pbr)
          telescopeQf(pbr, tActions.add_selected_to_qflist)
        end,
      },
    }
  },
  pickers = {
    find_files = { mappings = {} }
  },
  extensions = {
    file_browser = {
      theme = "dropdown",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          ["<C-n>"] = telescope_fb_actions.create_from_prompt,
        },
        ["n"] = {
          ["<C-n>"] = telescope_fb_actions.create_from_prompt,
          ["<C-x>"] = telescope_fb_actions.remove,
          -- ["<C-m>"] = telescope_fb_actions.move
          -- your custom normal mode mappings
        },
      },
    },
  },
}

require('telescope').load_extension "file_browser"
telescope.load_extension("harpoon")
telescope.load_extension('hop')

vim.keymap.set(
  "n",
  "<leader>qm",
  "<cmd>mkview<cr>:Telescope harpoon marks<cr>",
  { silent = true }
)

vim.keymap.set(
  "n",
  "<leader>tr",
  "<cmd>mkview<cr>:Telescope resume<cr>",
  { silent = true }
)
-- git commands
vim.keymap.set(
  "n",
  "<leader>dt",
  ":Gitsigns diffthis<cr>",
  { silent = true }
)
vim.keymap.set(
  "n",
  "<leader>jl",
  "<cmd>mkview<cr><cmd>Telescope jumplist<cr>",
  { silent = true }
)
vim.keymap.set(
  "n",
  "<leader>gs",
  ":Telescope git_status<cr>",
  { silent = true }
)
vim.keymap.set(
  "n",
  "<leader>fr",
  ":Telescope lsp_references<cr>",
  { silent = true }
)
vim.keymap.set(
  "n",
  "<leader>td",
  ":Telescope lsp_type_definitions<cr>",
  { silent = true }
)
vim.keymap.set(
  "n",
  "<leader>ts",
  ":Telescope lsp_document_symbols<cr>",
  { silent = true }
)
vim.keymap.set(
  "n",
  "<leader>dw",
  ":Telescope diagnostics<cr>",
  { silent = true }
)
vim.keymap.set(
  "n",
  "<leader>tm",
  ":Telescope marks<cr>",
  { silent = true }
)
vim.keymap.set(
  "n",
  "<leader>tq",
  ":Telescope quickfix<cr>",
  { silent = true }
)
vim.keymap.set(
  "n",
  "<leader>tl",
  "<cmd>mkview<cr>:Telescope loclist<cr>",
  { silent = true }
)
vim.keymap.set(
  "n",
  "<leader>gb",
  ":Telescope git_branches<cr>",
  { silent = true }
)
vim.keymap.set(
  "n",
  "<leader>gc",
  ":Telescope git_commits<cr>",
  { silent = true }
)
vim.keymap.set(
  "n",
  "<leader>gt",
  ":Telescope git_stash<cr>",
  { silent = true }
)

-- spell suggest
vim.keymap.set(
  "n",
  "<leader>ss",
  ":Telescope spell_suggest<cr>",
  { silent = true }
)

-- search current file for keywords
vim.keymap.set(
  "n",
  "<C-f>",
  ":Telescope current_buffer_fuzzy_find<cr>",
  { silent = true }
)

-- recent files
vim.keymap.set(
  "n",
  "<leader>fo",
  "<cmd>Telescope oldfiles<cr>",
  { silent = true }
)
-- opens folder of current buffer
vim.keymap.set(
  "n",
  "<leader>ff",
  "<cmd>Telescope find_files hidden=true path=%:p:h<cr>",
  { silent = true }
)

vim.keymap.set(
  "n",
  "<leader>ft",
  "<cmd>Telescope file_browser hidden=true path=%:p:h<cr>",
  { silent = true }
)
-- searches all files/directories from directory you open vim in
vim.keymap.set(
  "n",
  "<leader>fa",
  "<cmd>Telescope find_files<cr>",
  { silent = true }
)
vim.keymap.set(
  "n",
  "<leader>fg",
  "<cmd>Telescope live_grep<cr>",
  { silent = true }
)
vim.keymap.set(
  "n",
  "<leader>fb",
  "<cmd>Telescope buffers<cr>",
  { silent = true }
)
vim.keymap.set(
  "n",
  "<leader>fh",
  "<cmd>Telescope help_tags<cr>",
  { silent = true }
)
