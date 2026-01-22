require'lsp_signature'.setup({
  timer_interval = 10,
  hint_enable = false,
  hint_prefix = ' ',
  floating_window = false,
  floating_window_off_x = -5,
  -- toggle_key_flip_floatwin_setting = true,
  -- toggle_key = "<A-h>", -- doesn't work
  select_signature_key = "<A-n>",
})
