---------------------------
-- Default awesome theme --
---------------------------

theme = {}

theme.font                = "Bebas Neue Bold 13"
theme.font_alt            = "Bebas Neue Bold 13"

--theme.bg_normal         = "#20202f"
--theme.bg_focus          = "#20202f"
--theme.bg_urgent         = "#20202f"
--theme.bg_minimize       = "#20202f"
--theme.bg_special        = "#30303a"
--theme.fg_normal         = "#FAFAFA"
--theme.fg_focus          = "#FAFAFA"
--theme.fg_urgent         = "#FAFAFA"
--theme.fg_minimize       = "#eeeeee"
--theme.fg_systray        = "#b4b4b4"
--theme.tasklist_fg_focus = "#ac8ac1"
--theme.taglist_fg_normal = "#ac8ac1"

theme.bg_normal           = "#1976D2"
theme.bg_focus            = theme.bg_normal
theme.bg_urgent           = theme.bg_normal
theme.bg_minimize         = theme.bg_normal
theme.bg_special          = "#607D8B"
theme.bg_systray          = theme.bg_normal
theme.taglist_bg_focus    = theme.bg_focus

theme.fg_normal           = "#BBDEFB"
theme.fg_focus            = "#FFFFFF"
theme.fg_urgent           = "#FF3D00"
theme.fg_minimize         = "#BDBDBD"
theme.fg_systray          = theme.fg_normal
theme.tasklist_fg_focus   = theme.fg_focus
theme.taglist_fg_normal   = theme.fg_focus

theme.border_width        = "3"
theme.border_normal       = "#607D8B"
theme.border_focus        = "#00BCD4"
theme.border_marked       = "#00E676"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Display the taglist squares
--theme.taglist_squares_sel            = os.getenv("HOME") .. "/.config/awesome/themes/benis/taglist/squarefw-g.png"
--theme.taglist_squares_unsel          = os.getenv("HOME") .. "/.config/awesome/themes/benis/taglist/squarew-g.png"

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
--theme.menu_submenu_icon              = os.getenv("HOME") .. "/.config/awesome/themes/benis/submenu3.png"
--theme.menu_height                    = 11
--theme.menu_width                     = 75
theme.menu_border_color                = theme.border_focus
theme.menu_bg_focus                    = theme.bg_focus

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
theme.bg_widget                        = theme.bg_normal

theme.useless_gap_width                = 60
theme.lower_window_height              = 124
theme.vertical_resolution              = 1080
theme.vertical_border                  = 2
theme.outer_padding                    = 12


-- Define the image to load
--theme.titlebar_close_button_normal              = os.getenv("HOME") .. "/.config/awesome/themes/benis/titlebar/close_normal.png"
--theme.titlebar_close_button_focus               = os.getenv("HOME") .. "/.config/awesome/themes/benis/titlebar/close_focus.png"

--theme.titlebar_ontop_button_normal_inactive     = os.getenv("HOME") .. "/.config/awesome/themes/benis/titlebar/ontop_normal_inactive.png"
--theme.titlebar_ontop_button_focus_inactive      = os.getenv("HOME") .. "/.config/awesome/themes/benis/titlebar/ontop_focus_inactive.png"
--theme.titlebar_ontop_button_normal_active       = os.getenv("HOME") .. "/.config/awesome/themes/benis/titlebar/ontop_normal_active.png"
--theme.titlebar_ontop_button_focus_active        = os.getenv("HOME") .. "/.config/awesome/themes/benis/titlebar/ontop_focus_active.png"

--theme.titlebar_sticky_button_normal_inactive    = os.getenv("HOME") .. "/.config/awesome/themes/benis/titlebar/sticky_normal_inactive.png"
--theme.titlebar_sticky_button_focus_inactive     = os.getenv("HOME") .. "/.config/awesome/themes/benis/titlebar/sticky_focus_inactive.png"
--theme.titlebar_sticky_button_normal_active      = os.getenv("HOME") .. "/.config/awesome/themes/benis/titlebar/sticky_normal_active.png"
--theme.titlebar_sticky_button_focus_active       = os.getenv("HOME") .. "/.config/awesome/themes/benis/titlebar/sticky_focus_active.png"

--theme.titlebar_floating_button_normal_inactive  = os.getenv("HOME") .. "/.config/awesome/themes/benis/titlebar/floating_normal_inactive.png"
--theme.titlebar_floating_button_focus_inactive   = os.getenv("HOME") .. "/.config/awesome/themes/benis/titlebar/floating_focus_inactive.png"
--theme.titlebar_floating_button_normal_active    = os.getenv("HOME") .. "/.config/awesome/themes/benis/titlebar/floating_normal_active.png"
--theme.titlebar_floating_button_focus_active     = os.getenv("HOME") .. "/.config/awesome/themes/benis/titlebar/floating_focus_active.png"

--theme.titlebar_maximized_button_normal_inactive = os.getenv("HOME") .. "/.config/awesome/themes/benis/titlebar/maximized_normal_inactive.png"
--theme.titlebar_maximized_button_focus_inactive  = os.getenv("HOME") .. "/.config/awesome/themes/benis/titlebar/maximized_focus_inactive.png"
--theme.titlebar_maximized_button_normal_active   = os.getenv("HOME") .. "/.config/awesome/themes/benis/titlebar/maximized_normal_active.png"
--theme.titlebar_maximized_button_focus_active    = os.getenv("HOME") .. "/.config/awesome/themes/benis/titlebar/maximized_focus_active.png"

--theme.wallpaper                                 = os.getenv("HOME") .. "/img/wallpapers/scenery/bokeh - winter.jpg"

-- You can use your own layout icons like this:

-- {{{ Widgets
theme.widget_mem                    = " mem "
theme.widget_cpu                    = " cpu "
theme.widget_hdd                    = " hdd "
theme.widget_vol                    = " vol "
theme.widget_vol_low                = " vol "
theme.widget_vol_no                 = " vol "
theme.widget_vol_mute               = " mute "

--theme.widget_mem                    = os.getenv("HOME") .. "/.config/awesome/themes/benis/icons/mem.png"
--theme.widget_cpu                    = os.getenv("HOME") .. "/.config/awesome/themes/benis/icons/cpu.png"
--theme.widget_hdd                    = os.getenv("HOME") .. "/.config/awesome/themes/benis/icons/"
--theme.widget_vol                    = os.getenv("HOME") .. "/.config/awesome/themes/benis/icons/maximized_focus_active.png"
--theme.widget_vol_mute                    = os.getenv("HOME") .. "/.config/awesome/themes/benis/icons/maximized_focus_active.png"
--theme.widget_vol_low                    = os.getenv("HOME") .. "/.config/awesome/themes/benis/icons/maximized_focus_active.png"
--theme.widget_vol_no                    = os.getenv("HOME") .. "/.config/awesome/themes/benis/icons/maximized_focus_active.png"

-- }}}

theme.layout = {

floating  = " ⮛ ",
tile      = " ⮘ ",
tileleft  = " ⮙ ",
dtile     = " ⮨ ",

}
-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = '/usr/share/icons/UltraFlatIconsDark'
theme.tasklist_disable_icon = true


return theme
-- vim: filetype=lua:expandtab:shiftwidth=2:tabstop=2:softtabstop=2:textwidth=80
