local wilder = require('wilder')
wilder.setup({
  modes = { ':', '/', '?' },
  highlighter = wilder.basic_highlighter()
})

wilder.set_option('renderer', wilder.wildmenu_renderer({
  -- highlighter applies highlighting to the candidates
  highlighter = wilder.basic_highlighter(),
}))
