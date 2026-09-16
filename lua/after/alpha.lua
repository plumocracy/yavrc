local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")


dashboard.section.header.val = {
  [[	██╗████████╗███████╗    ██╗     ██╗███╗   ██╗██╗   ██╗██╗  ██╗]],
  [[	██║╚══██╔══╝██╔════╝    ██║     ██║████╗  ██║██║   ██║╚██╗██╔╝]],
  [[	██║   ██║   ███████╗    ██║     ██║██╔██╗ ██║██║   ██║ ╚███╔╝ ]],
  [[	██║   ██║   ╚════██║    ██║     ██║██║╚██╗██║██║   ██║ ██╔██╗ ]],
  [[	██║   ██║   ███████║    ███████╗██║██║ ╚████║╚██████╔╝██╔╝ ██╗]],
  [[	╚═╝   ╚═╝   ╚══════╝    ╚══════╝╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝]],
  [[                                                                    ]],
  [[	██╗    ███████╗██╗    ██╗███████╗ █████╗ ██████╗    ██╗██╗██╗]],
  [[	██║    ██╔════╝██║    ██║██╔════╝██╔══██╗██╔══██╗   ██║██║██║]],
  [[	██║    ███████╗██║ █╗ ██║█████╗  ███████║██████╔╝   ██║██║██║]],
  [[	██║    ╚════██║██║███╗██║██╔══╝  ██╔══██║██╔══██╗   ╚═╝╚═╝╚═╝]],
  [[	██║    ███████║╚███╔███╔╝███████╗██║  ██║██║  ██║   ██╗██╗██╗]],
  [[	╚═╝    ╚══════╝ ╚══╝╚══╝ ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝╚═╝╚═╝]],
}

dashboard.section.buttons.val = {
  dashboard.button("f", "󰱼  Find File", ":FzfLua files<CR>"),
  dashboard.button("g", "󰱼  Grep", ":FzfLua live_grep<CR>"),
  dashboard.button("r", "󰋚  Recent", ":FzfLua oldfiles<CR>"),
  dashboard.button("n", "󰎞  New File", ":ene <BAR> startinsert<CR>"),
  dashboard.button("c", "󰒓  Config", ":e $MYVIMRC<CR>"),
  dashboard.button("q", "󰅚  Quit", ":qa<CR>"),
}

dashboard.section.footer.val = {
  "",
  "It's at least posix compatible...",
}

dashboard.config.layout = {
  { type = "padding", val = 3 },
  dashboard.section.header,
  { type = "padding", val = 2 },
  dashboard.section.buttons,
  { type = "padding", val = 2 },
  dashboard.section.footer,
}

alpha.setup(dashboard.config)
