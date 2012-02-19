---------------------------
-- dunz0rs awesome theme --
---------------------------

theme = {}

-- {{{ Styles
theme.font      = "Fontin Sans 9"

-- {{{ Colors
theme.fg_normal = "#333333"
theme.fg_focus  = "#000000"
theme.fg_urgent = "#87005f"
theme.bg_focus = "#aeb2c3"
theme.bg_normal  = "#aeb2c3"
theme.bg_urgent = "#121212"
-- }}}

-- {{{ Borders
theme.border_width  = "2"
theme.border_normal = "#3f3f3f"
theme.border_focus  = "#afaf5f"
theme.border_marked = "#CC9393"
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus  = "#aeb2c3"
theme.titlebar_bg_normal = "#aeb2c3"
-- }}}

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- Example:
--theme.taglist_bg_focus = "#CC9393"
-- }}}
theme.bg_unfocus    = "#606060"
theme.fg_unfocus    = "#606060"

theme.confdir = "/home/gabriel/.config/awesome"
-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- You can use your own command to set your wallpaper
theme.wallpaper_cmd = { "nitrogen --restore" }
-- {{{ Widgets
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
theme.fg_widget        = "#AECF96"
theme.fg_center_widget = "#88A175"
theme.fg_end_widget    = "#FF5656"
theme.bg_widget        = "#121212"
theme.border_widget    = "#3F3F3F"
-- widget colours
theme.wid_rl = "#89005a"
theme.wid_rh = "#ff3500"
theme.wid_gl = "#b03b31"
theme.wid_gh = "#ff6767"
theme.wid_yl = "#969176"
theme.wid_yh = "#fff8bc"
theme.wid_bl = "#4d6585"
theme.wid_bh = "#83aebe"
theme.wid_ml = "#967395"
theme.wid_mh = "#bba9cf"
theme.wid_cl = "#5f7f7b"
theme.wid_ch = "#96cccc"

theme.fg_off_widget    = "#121212"
theme.fg_netup_widget  = "#7F9F7F"
theme.fg_netdn_widget  = theme.fg_urgent
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color = "#CC9393"
-- mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

-- {{{ Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = "15"
theme.menu_width  = "100"
-- }}}

-- {{{ Icons
-- {{{ Taglist
theme.taglist_squares_sel   = "/usr/share/awesome/themes/default/taglist/squarefz.png"
theme.taglist_squares_unsel = "/usr/share/awesome/themes/default/taglist/squarez.png"
--theme.taglist_squares_resize = "false"
-- }}}

-- {{{ Misc
theme.awesome_icon           = "/usr/share/awesome/themes/default/awesome-icon.png"
theme.menu_submenu_icon      = "/usr/share/awesome/themes/default/submenu.png"
theme.tasklist_floating_icon = "/usr/share/awesome/themes/default/tasklist/floatingw.png"
-- }}}

-- {{{ Layout
theme.layout_tile       = "/usr/share/awesome/themes/default/layouts/tile.png"
theme.layout_tileleft   = "/usr/share/awesome/themes/default/layouts/tileleft.png"
theme.layout_tilebottom = "/usr/share/awesome/themes/default/layouts/tilebottom.png"
theme.layout_tiletop    = "/usr/share/awesome/themes/default/layouts/tiletop.png"
theme.layout_fairv      = "/usr/share/awesome/themes/default/layouts/fairv.png"
theme.layout_fairh      = "/usr/share/awesome/themes/default/layouts/fairh.png"
theme.layout_spiral     = "/usr/share/awesome/themes/default/layouts/spiral.png"
theme.layout_dwindle    = "/usr/share/awesome/themes/default/layouts/dwindle.png"
theme.layout_max        = "/usr/share/awesome/themes/default/layouts/max.png"
theme.layout_fullscreen = "/usr/share/awesome/themes/default/layouts/fullscreen.png"
theme.layout_magnifier  = "/usr/share/awesome/themes/default/layouts/magnifier.png"
theme.layout_floating   = "/usr/share/awesome/themes/default/layouts/floating.png"
-- }}}

-- {{{ Titlebar
theme.titlebar_close_button_focus  = "/usr/share/awesome/themes/default/titlebar/close_focus.png"
theme.titlebar_close_button_normal = "/usr/share/awesome/themes/default/titlebar/close_normal.png"

theme.titlebar_ontop_button_focus_active  = "/usr/share/awesome/themes/default/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = "/usr/share/awesome/themes/default/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive  = "/usr/share/awesome/themes/default/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active  = "/usr/share/awesome/themes/default/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = "/usr/share/awesome/themes/default/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive  = "/usr/share/awesome/themes/default/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active  = "/usr/share/awesome/themes/default/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = "/usr/share/awesome/themes/default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive  = "/usr/share/awesome/themes/default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active  = "/usr/share/awesome/themes/default/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = "/usr/share/awesome/themes/default/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = "/usr/share/awesome/themes/default/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/maximized_normal_inactive.png"

-- }}}

-- {{{ Widget icons
theme.widget_cal    = theme.confdir .. "/icons/cal.png"
theme.widget_cpu    = theme.confdir .. "/icons/cpu.png"
theme.widget_bat    = theme.confdir .. "/icons/bat.png"
theme.widget_mem    = theme.confdir .. "/icons/mem.png"
theme.widget_fs     = theme.confdir .. "/icons/disk.png"
theme.widget_net    = theme.confdir .. "/icons/down.png"
theme.widget_netup  = theme.confdir .. "/icons/up.png"
theme.widget_wifi   = theme.confdir .. "/icons/wifi.png"
theme.widget_mail   = theme.confdir .. "/icons/mail.png"
theme.widget_vol    = theme.confdir .. "/icons/vol.png"
theme.widget_org    = theme.confdir .. "/icons/cal.png"
theme.widget_date   = theme.confdir .. "/icons/time.png"
theme.widget_crypto = theme.confdir .. "/icons/crypto.png"
theme.widget_sep    = theme.confdir .. "/icons/separator.png"
theme.widget_music  = theme.confdir .. "/icons/music.png"
theme.widget_mpd    = theme.confdir .. "/icons/mpd.png"
theme.widget_task   = theme.confdir .. "/icons/task.png"
theme.widget_tasks  = theme.confdir .. "/icons/tasks.png"
theme.widget_taskdone = theme.confdir .. "/icons/taskdone.png"
theme.widget_project = theme.confdir .. "/icons/project.png"
theme.awesome_icon = "/usr/share/awesome/icons/awesome16.png"

-- }}}

-- }}}

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
