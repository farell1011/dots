local awesome, client, mouse, screen, tag = awesome, client, mouse, screen, tag
local ipairs, string, os, table, tostring, tonumber, type = ipairs, string, os, table, tostring, tonumber, type

local gears = require("gears")
local awful = require("awful")
              require("awful.autofocus")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local lain = require("lain")
local hotkeys_popup = require("awful.hotkeys_popup").widget
                      require("awful.hotkeys_popup.keys")
local my_table = awful.util.table or gears.table
local dpi = require("beautiful.xresources").apply_dpi

if awesome.startup_errors then
naughty.notify
({ 
preset = naughty.config.presets.critical,
title = "Oops, there were errors during startup!",
text = awesome.startup_errors 
}) 
end
do

local in_error = false
awesome.connect_signal("debug::error",
function (err) if in_error then return end in_error = true
naughty.notify
({
preset = naughty.config.presets.critical,
title = "Oops, an error happened!",
text = tostring(err) 
})
in_error = false
end)
end

local function run_once(cmd_arr) for _, cmd in ipairs(cmd_arr) do
        awful.spawn.with_shell(string.format("pgrep -u $USER -fx '%s' > /dev/null || (%s)", cmd, cmd))
    end
end

run_once({ 
"polybar-msg cmd restart"
 }) -- entries must be separated by commas not use had add to .xinitrc

awful.spawn.with_shell("~/.config/awesome/polybarawesome")

local modkey = "Mod4"
local altkey = "Mod1"
local terminal = "urxvt"
local editor = "nano"

awful.util.terminal = terminal
awful.util.tagnames = { "", "" , "", "", "" }

awful.layout.layouts = 
{
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.magnifier
}

awful.util.taglist_buttons = my_table.join(
    awful.button({ }, 1, function(t) t:view_only() end),
    awful.button({ modkey }, 1, function(t)
        if client.focus then
            client.focus:move_to_tag(t)
        end
    end),
    awful.button({ }, 3, awful.tag.viewtoggle),
    awful.button({ modkey }, 3, function(t)
        if client.focus then
            client.focus:toggle_tag(t)
        end
    end),
    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
)

awful.util.tasklist_buttons = my_table.join(
    awful.button({ }, 1, function (c)
        if c == client.focus then
            c.minimized = true
        else
            c.minimized = false
            if not c:isvisible() and c.first_tag then
                c.first_tag:view_only()
            end
            client.focus = c
            c:raise()
        end
    end),
    awful.button({ }, 2, function (c) c:kill() end),
    awful.button({ }, 3, function ()
        local instance = nil

        return function ()
            if instance and instance.wibox.visible then
                instance:hide()
                instance = nil
            else
                instance = awful.menu.clients({theme = {width = 250}})
            end
        end
    end),
    awful.button({ }, 4, function () awful.client.focus.byidx(1) end),
    awful.button({ }, 5, function () awful.client.focus.byidx(-1) end)
)

lain.layout.termfair.nmaster           = 3
lain.layout.termfair.ncol              = 1
lain.layout.termfair.center.nmaster    = 3
lain.layout.termfair.center.ncol       = 1
lain.layout.cascade.tile.offset_x      = dpi(2)
lain.layout.cascade.tile.offset_y      = dpi(32)
lain.layout.cascade.tile.extra_padding = dpi(5)
lain.layout.cascade.tile.nmaster       = 5
lain.layout.cascade.tile.ncol          = 2

beautiful.init(os.getenv("HOME") .. "/.config/awesome/theme.lua")

local myawesomemenu = 
{
{" Restart awesome", awesome.restart},
{" Edit rc.lua", string.format("%s -e %s %s", terminal, editor, awesome.conffile)},
{" Logout", function() awesome.quit() end},
{" Reboot", "systemctl -q --no-block reboot"},
{" Poweroff", "systemctl -q --no-block poweroff"}
}

awful.util.mymainmenu = awful.menu
({
items = 
{
    {" Terminal", terminal},
    {" Glances", "urxvt -e sh -c 'glances ; zsh'"},
    {" Music", "urxvt -e sh -c 'ncmpcpp --screen playlist ; zsh'"},
    {" Visualizer", "urxvt -e sh -c 'ncmpcpp --screen visualizer ; zsh'"},
    {" Hotkeys", function () hotkeys_popup.new{width = dpi(1100), height = dpi(600)}:show_help() end},
    {" Awesome", myawesomemenu}
}
})

screen.connect_signal("property::geometry", function(s)
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper

        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end)

awful.screen.connect_for_each_screen(function(s) beautiful.at_screen_connect(s) end)

root.buttons(my_table.join(
    awful.button({ }, 3, function () awful.util.mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))

globalkeys = my_table.join
(
--Tag
awful.key({ modkey }, "Left",
awful.tag.viewprev,
{description = "View Previous", group = "Tag"}),

awful.key({ modkey }, "Right",
awful.tag.viewnext,
{description = "View Next", group = "Tag"}),

awful.key({ modkey }, "Escape",
awful.tag.history.restore,
{description = "Go Back", group = "Tag"}),

awful.key({ altkey }, "Left",
function () lain.util.tag_view_nonempty(-1) end,
{description = "View  Previous Nonempty", group = "Tag"}),

awful.key({ altkey }, "Right",
function () lain.util.tag_view_nonempty(1) end,
{description = "View  Previous Nonempty", group = "Tag"}),

awful.key({ modkey, "Control" }, "n",
function () lain.util.add_tag() end,
{description = "Add New Tag", group = "Tag"}),

awful.key({ modkey, "Control" }, "r",
function () lain.util.rename_tag() end,
{description = "Rename Tag", group = "Tag"}),

awful.key({ modkey, "Shift" }, "Left",
function () lain.util.move_tag(-1) end,
{description = "Move Tag To The Left", group = "Tag"}),

awful.key({ modkey, "Shift" }, "Right",
function () lain.util.move_tag(1) end,
{description = "Move Tag To The Right", group = "Tag"}),

awful.key({ modkey, "Shift" }, "d",
function () lain.util.delete_tag() end,
{description = "Delete Tag", group = "Tag"}),

--Task List
awful.key({ modkey, "Shift" }, "n",
function () local c = awful.client.restore() if c then client.focus = c c:raise() end end,
{description = "Restore Task List", group = "Task List"}),

awful.key({ altkey }, "j",
function () awful.client.focus.byidx( 1) end,
{description = "Focus Next By Index", group = "Task List"}),

awful.key({ altkey }, "k",
function () awful.client.focus.byidx(-1) end,
{description = "Focus Previous By Index", group = "Task List"}),

awful.key({ modkey }, "j",
function() awful.client.focus.global_bydirection("down") if client.focus then client.focus:raise() end end,
{description = "Focus Down", group = "Task List"}),

awful.key({ modkey }, "k",
function() awful.client.focus.global_bydirection("up") if client.focus then client.focus:raise() end end,
{description = "Focus Up", group = "Task List"}),

awful.key({ modkey }, "h",
function() awful.client.focus.global_bydirection("left") if client.focus then client.focus:raise() end end,
{description = "Focus Left", group = "Task List"}),

awful.key({ modkey }, "l",
function() awful.client.focus.global_bydirection("right") if client.focus then client.focus:raise() end end,
{description = "Focus Right", group = "Task List"}),

awful.key({ modkey, "Shift" }, "j",
function () awful.client.swap.byidx(  1) end,
{description = "Swap With Next Client By Index", group = "Task List"}),

awful.key({ modkey, "Shift" }, "k",
function () awful.client.swap.byidx( -1) end,
{description = "Swap With Previous Client By Index", group = "Task List"}),

awful.key({ modkey }, "u",
awful.client.urgent.jumpto,
{description = "Jump To Urgent Client", group = "Task List"}),

awful.key({ modkey }, "Tab",
function () awful.client.focus.history.previous() if client.focus then client.focus:raise() end end,
{description = "Go Back", group = "Task List"}),

--Screen
awful.key({ modkey, "Control" }, "j",
function () awful.screen.focus_relative( 1) end,
{description = "Focus The Next Screen", group = "Screen"}),

awful.key({ modkey, "Control" }, "k",
function () awful.screen.focus_relative(-1) end,
{description = "Focus The Previous Screen", group = "Screen"}),

--Gaps
awful.key({ modkey }, "Down",
function () lain.util.useless_gaps_resize(1) end,
{description = "Increment Useless Gaps", group = "Gaps"}),

awful.key({ modkey }, "Up",
function () lain.util.useless_gaps_resize(-1) end,
{description = "Decrement Useless Gaps", group = "Gaps"}),

--Layout
awful.key({ modkey, "Control" }, "Right",
function () awful.tag.incmwfact( 0.05) end,
{description = "Increase Master Width Factor", group = "Layout"}),

awful.key({ modkey, "Control" }, "Left",
function () awful.tag.incmwfact(-0.05) end,
{description = "Decrease Master Width Factor", group = "Layout"}),

awful.key({ modkey, "Shift" }, "Left",
function () awful.tag.incnmaster( 1, nil, true) end,
{description = "Increase The Number Of Master Clients", group = "Layout"}),

awful.key({ modkey, "Shift" }, "Right",
function () awful.tag.incnmaster(-1, nil, true) end,
{description = "Decrease The Number Of Master Clients", group = "Layout"}),

awful.key({ modkey, "Shift" }, "Up",
function () awful.tag.incncol( 1, nil, true) end,
{description = "Increase The Number Of Columns", group = "Layout"}),

awful.key({ modkey, "Shift" }, "Down",
function () awful.tag.incncol(-1, nil, true) end,
{description = "Decrease The Number Of Columns", group = "Layout"}),

awful.key({ modkey }, "space",
function () awful.layout.inc( 1) end,
{description = "Select Next", group = "Layout"}),

awful.key({ modkey, "Shift" }, "space",
function () awful.layout.inc(-1) end,
{description = "Select Previous", group = "Layout"}),

--Apps 
awful.key({ modkey }, "z",
function () awful.screen.focused().quake:toggle() end,
{description = "Quake Terminal", group = "Apps"}),

--Prompt
awful.key({ modkey }, "r",
function () awful.screen.focused().mypromptbox:run() end,
{description = "Run Prompt", group = "Prompt"}),

--Launcher
awful.key({ modkey, "Control" }, "w",
function () awful.util.mymainmenu:show() end,
{description = "Show Main Menu", group = "Launcher"}),

--Awesome
awful.key({ modkey }, "s",
function () hotkeys_popup.new{width = dpi(1000), height = dpi(600)}:show_help() end,
{description = "Show Help", group="Awesome"}),

awful.key({ modkey }, "b",
function () for s in screen do s.mywibox.visible = not s.mywibox.visible if s.mybottomwibox then s.mybottomwibox.visible = not s.mybottomwibox.visible end end end,
{description = "Toggle Wibox", group = "Awesome"}),

awful.key({ modkey, "Shift" }, "r",
awesome.restart,
{description = "Reload Awesome", group = "Awesome"}),

awful.key({ modkey }, "x",
function () awful.prompt.run { prompt = "Run Lua code: ", textbox = awful.screen.focused().mypromptbox.widget, exe_callback = awful.util.eval, history_path = awful.util.get_cache_dir() .. "/history_eval" } end,
{description = "Lua Execute Prompt", group = "Awesome"})

)

clientkeys = my_table.join
(
--Client
awful.key({ modkey, }, "d",      lain.util.magnify_client,
{description = "Free Client", group = "Client"}),

awful.key({ modkey, }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
{description = "Toggle Fullscreen", group = "Client"}),

awful.key({ modkey, }, "q",      function (c) c:kill() end,
{description = "Close Client", group = "Client"}),

awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle ,
{description = "Floating Client", group = "Client"}),

awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
{description = "Client To Master", group = "Client"}),

awful.key({ modkey, }, "o",      function (c) c:move_to_screen() end,
{description = "Client To Screen", group = "Client"}),

awful.key({ modkey, "Shift" }, "t",      function (c) c.ontop = not c.ontop end,
{description = "Client Keep On Top", group = "Client"}),

awful.key({ modkey, }, "n",
        function (c)
            c.minimized = true
        end ,
        {description = "Client Minimize", group = "Client"}),

awful.key({ modkey, }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
{description = "Client Maximize", group = "Client"})

)

for i = 1, 9 do

    local descr_view, descr_toggle, descr_move, descr_toggle_focus
    if i == 1 or i == 9 then
        descr_view = {description = "View Tag #", group = "Tag"}
        descr_toggle = {description = "Toggle Tag #", group = "Tag"}
        descr_move = {description = "Move Focused Client To Tag #", group = "Tag"}
        descr_toggle_focus = {description = "Toggle Focused Client On Tag #", group = "Tag"}
    end

globalkeys = my_table.join(globalkeys,

        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  descr_view),

        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  descr_toggle),

        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  descr_move),

        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  descr_toggle_focus)
    )
end

clientbuttons = gears.table.join
(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

root.keys(globalkeys)

awful.rules.rules = {

{ rule = { },
properties = 
{ 
	border_width = 0,
	border_color = beautiful.border_normal,
	focus = awful.client.focus.filter,
	raise = true,
	keys = clientkeys,
	buttons = clientbuttons,
	screen = awful.screen.preferred,
	placement = awful.placement.no_overlap+awful.placement.no_offscreen,
	size_hints_honor = false }
},

{ rule_any = { type = { "dialog", "normal" } },
properties = { titlebars_enabled = false } },

{ rule_any = {
          instance = {
               "plugin-container",
               "copyq",
		"Places",
            },
           class = {
              "Tor Browser",
              "Peek",
              "xpdf",
              "Rofi",
              "burp-StartBurp",
	      "Places",
              "Gimp"
            },
            name = {
               "Task Manager - Chromium",
               "Open File",
               "Save File",
               "Java",
               "Start Metasploit?",
               "Download an external file type?",
               "Progress...",
               "Armitage", 
               "Library",
               "Music",
               "Text Import",
               "Library",
               "Connect...",
		"Open File",
               "Rename",
               "File Operation Progress",
               "Find & Replace",
               "Changelog",
               "Search Results",
               "OWASP ZAP",
               "xarchiver",
               "Extract files",
               "Please select the destination directory",
               "Customize Look and Feel",
            },
            role = {
               "About",
               "GtkFileChooserDialog",
               "pop-up"
            },
           
         }, 
  properties = { floating = true, ontop= true, placement = awful.placement.centered } }
      }

client.connect_signal("manage", function (c)
    if awesome.startup and
      not c.size_hints.user_position
      and not c.size_hints.program_position then

        awful.placement.no_offscreen(c)
    end
end)

client.connect_signal("request::titlebars", function(c)

    if beautiful.titlebar_fun then
        beautiful.titlebar_fun(c)
        return
    end

    local buttons = my_table.join(
        awful.button({ }, 1, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 2, function() c:kill() end),
        awful.button({ }, 3, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.resize(c)
        end)
    )

awful.titlebar(c, {size = dpi(22)}) : setup {
        {
--            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout  = wibox.layout.fixed.horizontal
        },
        {
            {
                align  = "center",
                widget = awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        },
        {
            awful.titlebar.widget.floatingbutton (c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.stickybutton   (c),
            awful.titlebar.widget.ontopbutton    (c),
            awful.titlebar.widget.closebutton    (c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }
end)

client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = true})
end)

function border_adjust(c)
    if c.maximized then
        c.border_width = 0
    elseif #awful.screen.focused().clients > 1 then
        c.border_width = beautiful.border_width
        c.border_color = beautiful.border_focus
    end
end

client.connect_signal("property::maximized", border_adjust)
client.connect_signal("focus", border_adjust)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

collectgarbage("setpause", 110)
collectgarbage("setstepmul", 1000)
