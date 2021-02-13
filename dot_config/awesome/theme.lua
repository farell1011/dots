local gears = require("gears")
local lain = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local xrdb = xresources.get_current_theme()
local os = os
local my_table = awful.util.table or gears.table

local theme = {}
theme.dir = os.getenv("HOME") .. "/.config/awesome"
theme.wallpaper = theme.dir .. "/wallpaper/bluranime.jpg"
theme.icon_theme = "Hybrid"
theme.font = "DejaVu Sans Mono 8"

theme.bg_normal = "#00000000"
theme.bg_focus = theme.bg_normal
theme.bg_urgent = theme.bg_normal
theme.bg_wibox = theme.bg_normal

theme.fg_normal = xrdb.color7
theme.fg_focus = xrdb.color15
theme.fg_urgent = xrdb.color10
theme.fg_wbox = xrdb.color7

theme.useless_gap = dpi(2)
theme.corner_radius = dpi(0)
theme.border_width = dpi(0)
theme.border_normal = xrdb.background
theme.border_focus = xrdb.color14
theme.border_marked = xrdb.color15
theme.tasklist_font = theme.font
theme.tasklist_align = left
theme.tasklist_bg_normal = theme.bg_wibox
theme.tasklist_bg_urgent = theme.bg_wibox
theme.tasklist_bg_minimize = theme.bg_wibox
theme.tasklist_bg_focus = theme.bg_wibox

theme.tasklist_fg_normal = xrdb.color7
theme.tasklist_fg_urgent = xrdb.color1
theme.tasklist_fg_minimize = xrdb.color10
theme.tasklist_fg_focus = xrdb.color4
theme.tasklist_disable_icon = true
theme.tasklist_disable_task_name = false

theme.titlebar_bg_normal = xrdb.background
theme.titlebar_bg_focus = xrdb.background
theme.titlebar_fg_normal = xrdb.color7
theme.titlebar_fg_focus = xrdb.color15

theme.prompt_bg_cursor = xrdb.color10
theme.prompt_bg = theme.bg_normal
theme.prompt_fg_cursor = xrdb.color7
theme.prompt_fg = xrdb.foreground
theme.prompt_font = theme.font

theme.notification_font = theme.font
theme.notification_bg = xrdb.background
theme.notification_fg = xrdb.color7
theme.notification_border_color = xrdb.background
theme.notification_border_width = dpi(1)
theme.notification_margin = dpi(10)
theme.notification_spacing = dpi(10)

theme.hotkeys_bg = xrdb.background
theme.hotkeys_label_bg = xrdb.color8
theme.hotkeys_fg = xrdb.color15
theme.hotkeys_label_fg = xrdb.background
theme.hotkeys_modifiers_fg = xrdb.color2
theme.hotkeys_border_color = xrdb.background
theme.hotkeys_description_font = theme.font
theme.hotkeys_font = theme.font
theme.hotkeys_group_margin = dpi(6)
theme.hotkeys_border_width = dpi(1)

theme.menu_bg_normal = xrdb.background
theme.menu_bg_focus = xrdb.color10
theme.menu_fg_normal = xrdb.foreground
theme.menu_fg_focus = xrdb.background
theme.menu_height = dpi(20)
theme.menu_width = dpi(250)
theme.menu_font = "MesloLGS NF 8"

theme.awesome_icon = theme.dir .. "/icons/awesome.png"
theme.menu_submenu_icon = theme.dir .. "/icons/submenu.png"
theme.titlebar_close_button_focus = theme.dir .. "/icons/titlebar/close_focus.png"
theme.titlebar_close_button_normal = theme.dir .. "/icons/titlebar/close_normal.png"
theme.titlebar_ontop_button_focus_active = theme.dir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = theme.dir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive = theme.dir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = theme.dir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active = theme.dir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = theme.dir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive = theme.dir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = theme.dir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active = theme.dir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = theme.dir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive = theme.dir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = theme.dir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_maximized_button_focus_active = theme.dir .. "/icons/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = theme.dir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive = theme.dir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons/titlebar/maximized_normal_inactive.png"
theme.layout_tile = theme.dir .. "/icons/layout/tile.png"
theme.layout_tileleft = theme.dir .. "/icons/layout/tileleft.png"
theme.layout_tilebottom = theme.dir .. "/icons/layout/tilebottom.png"
theme.layout_tiletop = theme.dir .. "/icons/layout/tiletop.png"
theme.layout_fairv = theme.dir .. "/icons/layout/fairv.png"
theme.layout_fairh = theme.dir .. "/icons/layout/fairh.png"
theme.layout_spiral = theme.dir .. "/icons/layout/spiral.png"
theme.layout_dwindle = theme.dir .. "/icons/layout/dwindle.png"
theme.layout_max = theme.dir .. "/icons/layout/max.png"
theme.layout_fullscreen = theme.dir .. "/icons/layout/fullscreen.png"
theme.layout_magnifier = theme.dir .. "/icons/layout/magnifier.png"
theme.layout_floating = theme.dir .. "/icons/layout/floating.png"

local spr = wibox.widget.textbox(' ')

function theme.at_screen_connect(s)
s.quake = lain.util.quake({ app = awful.util.terminal })

local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
end
    gears.wallpaper.maximized(wallpaper, s, true)

awful.tag(awful.util.tagnames, s, awful.layout.layouts)
s.mypromptbox = awful.widget.prompt()
s.mylayoutbox = awful.widget.layoutbox(s)
s.mylayoutbox:buttons(my_table.join(
                           awful.button({}, 1, function () awful.layout.inc( 1) end),
                           awful.button({}, 2, function () awful.layout.set( awful.layout.layouts[1] ) end),
                           awful.button({}, 3, function () awful.layout.inc(-1) end),
                           awful.button({}, 4, function () awful.layout.inc( 1) end),
                           awful.button({}, 5, function () awful.layout.inc(-1) end)))

s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)

s.mywibox = awful.wibar(
{
position = "top",
screen = s,
height = dpi(18),
bg = theme.bg_wibox,
fg = theme.fg_wbox 
}
)
    
s.mywibox:setup 
{
	layout = wibox.layout.align.horizontal,
     	   { -- Left widgets
		layout = wibox.layout.fixed.horizontal,
		bg = theme.bg_wibox,
		spr,
		s.mypromptbox,
		spr,
        },
	s.mytasklist, -- Middle widget        
	{ -- Right widgets
		layout = wibox.layout.fixed.horizontal,
		spr,
		s.mylayoutbox,
		spr,
        },
    }
end

return theme
