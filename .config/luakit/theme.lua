--------------------------
-- Default luakit theme --
--------------------------

local theme = {}

-- Default settings
theme.font = "Montecarlo 9"
theme.fg   = "#ccc"
theme.bg   = "#3e3e3e"

-- Genaral colours
theme.success_fg = "#0f0"
theme.loaded_fg  = "#33AADD"
theme.error_fg = "#FFF"
theme.error_bg = "#F00"

-- Warning colours
theme.warning_fg = "#F00"
theme.warning_bg = "#FFF"

-- Notification colours
theme.notif_fg = "#444"
theme.notif_bg = "#FFF"

-- Menu colours
theme.menu_fg                   = "#ccc"
theme.menu_bg                   = "#121212"
theme.menu_selected_fg          = "#000"
theme.menu_selected_bg          = "#FF0"
theme.menu_title_bg             = "#fff"
theme.menu_primary_title_fg     = "#f00"
theme.menu_secondary_title_fg   = "#666"

-- Proxy manager
theme.proxy_active_menu_fg      = '#000'
theme.proxy_active_menu_bg      = '#FFF'
theme.proxy_inactive_menu_fg    = '#888'
theme.proxy_inactive_menu_bg    = '#FFF'

-- Statusbar specific
theme.sbar_fg         = "#aaa"
theme.sbar_bg         = "#444"

-- Downloadbar specific
theme.dbar_fg         = "#fff"
theme.dbar_bg         = "#000"
theme.dbar_error_fg   = "#F00"

-- Input bar specific
theme.ibar_fg           = "#aaa"
theme.ibar_bg           = "#444"

-- Tab label
theme.tab_fg            = "#888"
theme.tab_bg            = "#222"
theme.tab_ntheme        = "#ddd"
theme.selected_fg       = "#fff"
theme.selected_bg       = "#000"
theme.selected_ntheme   = "#ddd"
theme.loading_fg        = "#33AADD"
theme.loading_bg        = "#000"

-- Trusted/untrusted ssl colours
theme.trust_fg          = "#0F0"
theme.notrust_fg        = "#F00"

-- Hint styling

follow_theme = {
    focus_bg     = "#ff0000";
    normal_bg    = "#FCE70D";
    opacity      = 0.3;
    border       = "1px solid #000000";
    tick_fg      = "#141414";
    tick_bg      = "#9FBC00";
    tick_border  = "1px solid #000000";
    tick_opacity = 0.8;
    tick_font    = "11px monospace bold";
    vert_offset  = 0;
    horiz_offset = -10;
}

theme.follow = follow_theme


return theme
-- vim: et:sw=4:ts=8:sts=4:tw=80
