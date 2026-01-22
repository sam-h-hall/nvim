-- ALPHA IS NOT INSTALLED ANYMORE


local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
  [[                                                 .h.                ]],
  [[            :h-                                  Nhy`               ]],
  [[           -mh.                           h.    `Ndho               ]],
  [[           hmh+                          oNm.   oNdhh               ]],
  [[          `Nmhd`                        /NNmd  /NNhhd               ]],
  [[          -NNhhy                      `hMNmmm`+NNdhhh               ]],
  [[          .NNmhhs              ```....`..-:/./mNdhhh+               ]],
  [[           mNNdhhh-     `.-::///+++////++//:--.`-/sd`               ]],
  [[           oNNNdhhdo..://++//++++++/+++//++///++/-.`                ]],
  [[      y.   `mNNNmhhhdy+/++++//+/////++//+++///++////-` `/oos:       ]],
  [[ .    Nmy:  :NNNNmhhhhdy+/++/+++///:.....--:////+++///:.`:s+        ]],
  [[ h-   dNmNmy oNNNNNdhhhhy:/+/+++/-         ---:/+++//++//.`         ]],
  [[ hd+` -NNNy`./dNNNNNhhhh+-://///    -+oo:`  ::-:+////++///:`        ]],
  [[ /Nmhs+oss-:++/dNNNmhho:--::///    /mmmmmo  ../-///++///////.       ]],
  [[  oNNdhhhhhhhs//osso/:---:::///    /yyyyso  ..o+-//////////:/.      ]],
  [[   /mNNNmdhhhh/://+///::://////     -:::- ..+sy+:////////::/:/.     ]],
  [[     /hNNNdhhs--:/+++////++/////.      ..-/yhhs-/////////::/::/`    ]],
  [[       .ooo+/-::::/+///////++++//-/ossyyhhhhs/:///////:::/::::/:    ]],
  [[       -///:::::::////++///+++/////:/+ooo+/::///////.::://::---+`   ]],
  [[       /////+//++++/////+////-..//////////::-:::--`.:///:---:::/:   ]],
  [[       //+++//++++++////+++///::--                 .::::-------::   ]],
  [[       :/++++///////////++++//////.                -:/:----::../-   ]],
  [[       -/++++//++///+//////////////               .::::---:::-.+`   ]],
  [[       `////////////////////////////:.            --::-----...-/.   ]],
  [[        -///://////////////////////::::-..      :-:-:-..-::.`./+\   ]],
  [[         :/://///:///::://::://::::::/:::::::-:---::-.-....``/NNN\  ]],
  [[           ::::://::://::::::::::::::----------..-:....`.../- -+o$\ ]],
  [[            -/:::-:::::---://:-::-::::----::---.-.......`-/.      ``]],
  [[           s-`::--:::------:////----:---.-:::...-.....`./:          ]],
  [[          yMNy.`::-.--::..-dmmhhhs-..-.-.......`.....-/:`           ]],
  [[         oMNNNh. `-::--...:NNNdhhh/.--.`..``.......:/-              ]],
  [[        :dy+:`      .-::-..NNNhhd+``..`...````.-::-`                ]],
  [[                        .-:mNdhh:.......--::::-`                    ]],
  [[                           yNh/..------..`                          ]],
  [[                            $/            __                        ]],
  [[             ___     ___    ___   __  __ /\_\    ___ ___            ]],
  [[            / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\          ]],
  [[           /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \         ]],
  [[           \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\        ]],
  [[            \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/        ]],
}
dashboard.section.buttons.val = {
  dashboard.button("f", "󰱽  Find file", ":Telescope find_files <CR>"),
  dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("p", "󰥨  Find project", ":Telescope projects <CR>"),
  dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
  dashboard.button("t", "󱎸  Find text", ":Telescope live_grep <CR>"),
  dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
  dashboard.button("q", "󰒲  Quit Neovim", ":qa<CR>"),
}

local function footer()
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)
