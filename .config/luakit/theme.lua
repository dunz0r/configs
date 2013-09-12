--------------------------
-- Default luakit theme --
--------------------------

local theme = {}

-- Default settings
theme.font = "ProggyCleanTTSZ 11"
theme.fg   = "#99e438"
theme.bg   = "#222"

-- Genaral colours
theme.success_fg = "#090"
theme.loaded_fg  = "#aaa"
theme.error_fg = "#999"
theme.error_bg = "#900"

-- Warning colours
theme.warning_fg = "#900"
theme.warning_bg = "#999"

-- Notification colours
theme.notif_fg = "#444"
theme.notif_bg = "#999"

-- Menu colours
theme.menu_fg                   = "#aaa"
theme.menu_bg                   = "#111"
theme.menu_selected_fg          = "#000"
theme.menu_selected_bg          = "#aa0"
theme.menu_title_bg             = "#aaa"
theme.menu_primary_title_fg     = "#a00"
theme.menu_secondary_title_fg   = "#666"

-- Proxy manager
theme.proxy_active_menu_fg      = '#000'
theme.proxy_active_menu_bg      = '#FFF'
theme.proxy_inactive_menu_fg    = '#888'
theme.proxy_inactive_menu_bg    = '#FFF'

-- Statusbar specific
theme.sbar_fg         = "#aaa"
theme.sbar_bg         = "#222"

-- Downloadbar specific
theme.dbar_fg         = "#aaa"
theme.dbar_bg         = "#222"
theme.dbar_error_fg   = "#900"

-- Input bar specific
theme.ibar_fg           = "#aaa"
theme.ibar_bg           = "#333"

-- Tab label
theme.tab_fg            = "#888"
theme.tab_bg            = "#222"
theme.tab_ntheme        = "#ddd"
theme.selected_fg       = "#aaa"
theme.selected_bg       = "#000"
theme.selected_ntheme   = "#ddd"
theme.loading_fg        = "#aaa"
theme.loading_bg        = "#111"

-- Trusted/untrusted ssl colours
theme.trust_fg          = "#0F0"
theme.notrust_fg        = "#F00"

return theme
-- vim: et:sw=4:ts=8:sts=4:tw=80
