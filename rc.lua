--[[

     Powerarrow Darker Awesome WM config 2.0
     github.com/copycat-killer

--]]

-- {{{ Required libraries
local gears     = require("gears")
-- local vain = require("vain")
local awful     = require("awful")
awful.rules     = require("awful.rules")
                  require("awful.autofocus")
--awful.screen = require("awful.screen")
local wibox     = require("wibox")
local beautiful = require("beautiful")
local naughty   = require("naughty")
local scratch   = require("scratch")
local lain      = require("lain")
local minitray  = require("minitray")
local hints = require("hints")

-- }}}
-- {{{ Error handling
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = err })
        in_error = false
    end)
end
-- }}}

-- {{{ Autostart applications
function run_once(cmd)
  findme = cmd
  firstspace = cmd:find(" ")
  if firstspace then
     findme = cmd:sub(0, firstspace-1)
  end
  awful.util.spawn_with_shell("pgrep -u $USER -x " .. findme .. " > /dev/null || (" .. cmd .. ")")
end

run_once("unclutter")
-- }}}

-- {{{ Variable definitions
-- localization
os.setlocale(os.getenv("LANG"))

-- beautiful init
beautiful.init(os.getenv("HOME") .. "/.config/awesome/themes/benis/theme.lua")
hints.init()
run_once("nitrogen --restore")

-- common
modkey     = "Mod4"
altkey     = "Mod1"
terminal   = "urxvtc"
editor     = os.getenv("EDITOR") or "nano" or "vi"
newvim     = "urxvtc -cd (pwd) -e vim"
editor_cmd = terminal .. " -e " .. editor

-- user defined
browser    = "firefox-developer"
browser2   = "chromium --show-app-list --disable-app-list-dismiss-on-blur"
graphics   = "gimp"
gui_editor = terminal .. " urxvtc -cd (pwd) --hold -e vim"
notes      = browser .. " -new-window keep.google.com "
mail       = browser .. " -new-window inbox.google.com "
iptraf     = terminal .. " -g 180x54-20+34 -e sudo iptraf-ng -i all "
musicplr   = terminal .. " -g 130x34-320+16 -e ncmpcpp "
spotify = "spotify"
colors = "gcolor3"

--naughty.config.defaults.height = 100
--naughty.config.defaults.width = 250
naughty.config.defaults.border = 1
naughty.config.padding = 30
--naughty.config.spacing = 30
--naughty.config.gap = 30
naughty.config.defaults.icon_size = 85
naughty.config.defaults.margin = 20
naughty.config.defaults.font = "lemon"

awful.layout.layouts = {
    awful.layout.suit.floating,
    lain.layout.uselesstile,
    lain.layout.uselessfair.horizontal,
    lain.layout.uselessfair,
    lain.layout.termfair,
    lain.layout.uselesspiral.dwindle,
    lain.layout.centerfair,
    awful.layout.suit.magnifier
}

-- awful.layout.suit.max

-- }}}

-- {{{ Tags
tags = {
    names = { " ⮼ ", " ⮗ ", " ⮣ ", " ⮕ " },
    layout = { awful.layout.layouts[1], awful.layout.layouts[2], awful.layout.layouts[2], awful.layout.layouts[2] }
}
for s = 1, screen.count() do
   tags[s] = awful.tag(tags.names, s, tags.layout)
--  awful.screen.padding._screen(s).top(30)
end
-- }}}

-- {{{ Wallpaper
if beautiful.wallpaper then
    for s = 1, screen.count() do
        gears.wallpaper.maximized(beautiful.wallpaper, s, true)
    end
end
-- }}}

-- {{{ Menu
mymainmenu = awful.menu.new({ items = require("menugen").build_menu(),
                              theme = { height = 20, width = 130 }})
-- }}}

-- {{{ Wibox
markup = lain.util.markup

-- Textclock
clockicon = wibox.widget.textbox(beautiful.widget_clock)
mytextclock = awful.widget.textclock(" %a %d %b  %H:%M")

-- calendar
lain.widgets.calendar:attach(mytextclock, { font_size = 10 })

-- Mail IMAP check
mailicon = wibox.widget.textbox(beautiful.widget_mail)
mailicon:buttons(awful.util.table.join(awful.button({ }, 1, function () awful.util.spawn(mail) end)))
--[[ commented because it needs to be set before use
mailwidget = wibox.widget.background(lain.widgets.imap({
    timeout  = 180,
    server   = "server",
    mail     = "mail",
    password = "keyring get mail",
    settings = function()
        if mailcount > 0 then
            widget:set_text(" " .. mailcount .. " ")
            mailicon:set_image(beautiful.widget_mail_on)
        else
            widget:set_text("")
            mailicon:set_image(beautiful.widget_mail)
        end
    end
}), "#0A0F14")
]]

-- MPD
-- mpdicon = wibox.widget.imagebox(beautiful.widget_music)
-- mpdicon:buttons(awful.util.table.join(awful.button({ }, 1, function () awful.util.spawn_with_shell(musicplr) end)))
-- mpdwidget = lain.widgets.mpd({
--     settings = function()
--         if mpd_now.state == "play" then
--             artist = " " .. mpd_now.artist .. " "
--             title  = mpd_now.title  .. " "
--             mpdicon:set_image(beautiful.widget_music_on)
--         elseif mpd_now.state == "pause" then
--             artist = " mpd "
--             title  = "paused "
--         else
--             artist = ""
--             title  = ""
--             mpdicon:set_image(beautiful.widget_music)
--         end

--         widget:set_markup(markup("#EA6F81", artist) .. title)
--     end
-- })
-- mpdwidgetbg = wibox.widget.background(mpdwidget, "#0E151B")

-- MEM
memicon = wibox.widget.textbox(beautiful.widget_mem)
memwidget = lain.widgets.mem({
    settings = function()
        widget:set_text(" " .. mem_now.used .. "% ")
    end
})

-- CPU
cpuicon = wibox.widget.textbox(beautiful.widget_cpu)
cpuwidget = wibox.widget.background(lain.widgets.cpu({
    settings = function()
        widget:set_text(" " .. cpu_now.usage .. "% ")
    end
}), "#20202F")

-- Coretemp
tempicon = wibox.widget.textbox(beautiful.widget_temp)
tempwidget = lain.widgets.temp({
    settings = function()
        widget:set_text(" " .. coretemp_now .. "°C ")
    end
})

-- / fs
fsicon = wibox.widget.textbox(beautiful.widget_hdd)
fswidget = lain.widgets.fs({
    settings  = function()
        widget:set_text(" " .. fs_now.used .. "% ")
    end
})
fswidgetbg = wibox.widget.background(fswidget, "#20202F")

-- Battery
-- baticon = wibox.widget.textbox(beautiful.widget_battery)
-- batwidget = lain.widgets.bat({
--     settings = function()
--         if bat_now.perc == "N/A" then
--             widget:set_markup(" AC ")
--             baticon:set_image(beautiful.widget_ac)
--             return
--         elseif tonumber(bat_now.perc) <= 5 then
--             baticon:set_image(beautiful.widget_battery_empty)
--         elseif tonumber(bat_now.perc) <= 15 then
--             baticon:set_image(beautiful.widget_battery_low)
--         else
--             baticon:set_image(beautiful.widget_battery)
--         end
--         widget:set_markup(" " .. bat_now.perc .. "% ")
--     end
-- })

-- ALSA volume
volicon = wibox.widget.textbox(beautiful.widget_vol)
volumewidget = lain.widgets.alsa({
    settings = function()
        if volume_now.status == "off" then
            volicon:set_text(beautiful.widget_vol_mute)
        elseif tonumber(volume_now.level) == 0 then
            volicon:set_text(beautiful.widget_vol_no)
        elseif tonumber(volume_now.level) <= 50 then
            volicon:set_text(beautiful.widget_vol_low)
        else
            volicon:set_text(beautiful.widget_vol)
        end

        widget:set_text(" " .. volume_now.level .. "% ")
    end
})

-- Net
neticon = wibox.widget.textbox(beautiful.widget_net)
neticon:buttons(awful.util.table.join(awful.button({ }, 1, function () awful.util.spawn_with_shell(iptraf) end)))
netwidget = wibox.widget.background(lain.widgets.net({
    settings = function()
        widget:set_markup(markup("#20202F", " " .. net_now.received)
                          .. " " ..
                          markup("#20202F", " " .. net_now.sent .. " "))
    end
}), "#20202F")

-- Separators
spr = wibox.widget.textbox(' ')
arrl = wibox.widget.imagebox()
arrl:set_image(beautiful.arrl)
arrl_dl = wibox.widget.imagebox()
arrl_dl:set_image(beautiful.arrl_dl)
arrl_ld = wibox.widget.imagebox()
arrl_ld:set_image(beautiful.arrl_ld)

-- Create a wibox for each screen and add it
mywiboxleft = {}
mywiboxright = {}
mywiboxcenter = {}
mywiboxcenter2 = {}
mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(awful.tag.getscreen(t)) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(awful.tag.getscreen(t)) end)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  -- Without this, the following
                                                  -- :isvisible() makes no sense
                                                  c.minimized = false
                                                  if not c:isvisible() then
                                                      awful.tag.viewonly(c:tags()[1])
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({ width=250 })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

for s = 1, screen.count() do

    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt()

    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                            awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                            awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                            awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                            awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))

    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)

    -- Create the wibox
    mywiboxleft[s] = awful.wibox({ position = 'top', screen = s, height = 18, width =  "15%", align = "left", border_width = 10, border_color = "#20202F" })
		mywiboxright[s] = awful.wibox({ position = 'top', screen = s, height = 18, width = "15%", align = "right", border_width = 10, border_color = "#20202F" })
		mywiboxcenter[s] = awful.wibox({ position = 'top', screen = 1, height = 18, width = "15%", align = "center", border_width = 10, border_color = "#20202F" })
		mywiboxcenter2[s] = awful.wibox({ position = 'top', screen = 2, height = 18, width = "15%", align = "center", border_width = 10, border_color = "#20202F" })
    -- Widgets that are aligned to the upper left
    local left_layout = wibox.layout.fixed.horizontal()
    left_layout:add(spr)
    left_layout:add(mytaglist[s])
    left_layout:add(spr)
    left_layout:add(mypromptbox[s])
    left_layout:add(spr)

    -- Widgets that are aligned to the upper right
    -- If you are moving widgets from a section with light grey background to dark grey or vice versa,
    -- use a replacement icon as appropriate from themes/powerarrow-darker/alticons so your icons match the bg.
    local right_layout = wibox.layout.fixed.horizontal()
    -- if s == 1 then right_layout:add(wibox.widget.systray()) end
    right_layout:add(spr)
    -- right_layout:add(arrl)
    -- right_layout:add(arrl_ld)
    -- right_layout:add(arrl_dl)
    right_layout:add(volicon)
    right_layout:add(volumewidget)
    right_layout:add(spr)
    -- right_layout:add(arrl_ld)
    -- right_layout:add(mailicon)
    --right_layout:add(mailwidget)
    -- right_layout:add(arrl_dl)
    right_layout:add(memicon)
    right_layout:add(memwidget)
    right_layout:add(spr)
    -- right_layout:add(arrl_ld)
    right_layout:add(cpuicon)
    right_layout:add(cpuwidget)
    right_layout:add(spr)
    -- right_layout:add(arrl_dl)
    -- right_layout:add(tempicon)
    -- right_layout:add(tempwidget)
    -- right_layout:add(arrl_ld)
    right_layout:add(fsicon)
    right_layout:add(fswidgetbg)
    right_layout:add(spr)
    -- right_layout:add(arrl_dl)
    right_layout:add(mytextclock)
    right_layout:add(spr)
    -- right_layout:add(spr)
    -- right_layout:add(arrl_ld)
    right_layout:add(mylayoutbox[s])

		local center_layout2 = wibox.layout.fixed.horizontal()
		center_layout2:add(mytextclock)
    -- Now bring it all together (with the tasklist in the middle)
    local layout = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    layout:set_middle(mytasklist[s])
    layout:set_right(right_layout)
    mywiboxleft[s]:set_widget(left_layout)
		mywiboxright[s]:set_widget(right_layout)
		mywiboxcenter[s]:set_widget(mytasklist[1])
		mywiboxcenter2[s]:set_widget(center_layout2)

end
-- }}}

-- {{{ Mouse Bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end)
    -- awful.button({ }, 4, awful.tag.viewnext),
    -- awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(
    -- Take a screenshot
    -- https://github.com/copycat-killer/dots/blob/master/bin/screenshot
    awful.key({ modkey }, "e", function() minitray.toggle({ x = 1700, y = 60 }) end),
    --awful.key({ altkey }, "p", function() os.execute("screenshot") end),

    -- Tag browsing
    -- awful.key({ modkey }, "Left",   awful.tag.viewprev       ),
    -- awful.key({ modkey }, "Right",  awful.tag.viewnext       ),
    -- awful.key({ modkey }, "Escape", awful.tag.history.restore),

    -- Non-empty tag browsing
    -- awful.key({ altkey }, "Left", function () lain.util.tag_view_nonempty(-1) end),
    -- awful.key({ altkey }, "Right", function () lain.util.tag_view_nonempty(1) end),

    -- On the fly useless gaps change
    awful.key({ modkey }, "]", function () lain.util.useless_gaps_resize(1) end),
    awful.key({ modkey }, "[", function () lain.util.useless_gaps_resize(-1) end),

    -- Default client focus
    -- awful.key({ altkey }, "k",
       --function ()
           --awful.client.focus.byidx( 1)
            --if client.focus then client.focus:raise() end
        --end),
    -- awful.key({ altkey }, "j",
      --  function ()
       --     awful.client.focus.byidx(-1)
        --    if client.focus then client.focus:raise() end
        --end),

    -- By direction client focus
    awful.key({ modkey }, "j",
    -- awful.key({ modkey }, "Down",
       function()
          awful.client.focus.bydirection("down")
           if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey }, "k",
    -- awful.key({ modkey }, "Up",
        function()
            awful.client.focus.bydirection("up")
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey }, "h",
    -- awful.key({ modkey }, "Left",
        function()
            awful.client.focus.bydirection("left")
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey }, "l",
    -- awful.key({ modkey }, "Right",
        function()
            awful.client.focus.bydirection("right")
            if client.focus then client.focus:raise() end
        end),

    -- Show Menu
    awful.key({ modkey }, "w",
        function ()
            mymainmenu:show({ keygrabber = true })
        end),

    -- Show/Hide Wibox
    awful.key({ modkey }, "b", function ()
        mywiboxleft[mouse.screen].visible = not mywiboxleft[mouse.screen].visible
        mywiboxcenter[mouse.screen].visible = not mywiboxcenter[mouse.screen].visible
        mywiboxcenter2[mouse.screen].visible = not mywiboxcenter2[mouse.screen].visible
        mywiboxright[mouse.screen].visible = not mywiboxright[mouse.screen].visible
    end),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "l", function () awful.client.swap.bydirection("right")    end),
    awful.key({ modkey, "Shift"   }, "h", function () awful.client.swap.bydirection("left")    end),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.bydirection("up")    end),
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.bydirection("down")    end),
    awful.key({ modkey, "Control" }, "h", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "l", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),
    awful.key({ altkey, "Shift"   }, "l",      function () awful.tag.incmwfact( 0.05)     end),
    awful.key({ altkey, "Shift"   }, "h",      function () awful.tag.incmwfact(-0.05)     end),
		awful.key({ altkey, "Shift"   }, "j",      function () awful.client.incwfact(-.1)     end),
    awful.key({ altkey, "Shift"   }, "k",      function () awful.client.incwfact( .1)     end),
    awful.key({ modkey, altkey   }, "k",      function () awful.tag.incnmaster(-1)       end),
    awful.key({ modkey, altkey   }, "j",      function () awful.tag.incnmaster( 1)       end),
    awful.key({ modkey, "Control" }, "l",      function () awful.tag.incncol(-1)          end),
    awful.key({ modkey, "Control" }, "h",      function () awful.tag.incncol( 1)          end),
    awful.key({ modkey,           }, "space",  function () awful.layout.inc(1)  end),
    awful.key({ modkey, "Shift"   }, "space",  function () awful.layout.inc(-1)  end),
    awful.key({ modkey, "Control" }, "n",      awful.client.restore),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
    awful.key({ modkey, "Control" }, "r",      awesome.restart),
    awful.key({ modkey, "Shift"   }, "q",      awesome.quit),

    -- Dropdown terminal && Editor
    -- scratchdrop(prog, vert, horiz, width, height, sticky, screen)
    awful.key({ modkey,           }, "z",      function () scratch.drop(terminal) end),
    awful.key({ modkey,           }, "i",      function () scratch.drop(mail, "center", "center", .7, .75) end),
    awful.key({ modkey,           }, "g",      function () scratch.drop(notes, "center", "left", .2, .7) end),
    awful.key({ modkey,           }, "d",      function () scratch.drop(colors, "bottom") end),
    awful.key({ modkey,           }, "x",      function () scratch.pad.toggle() end),

    -- Hints
    awful.key({ altkey,           }, "f",      function() hints.focus() end),

    -- Widgets popups
    --awful.key({ altkey,           }, "c",      function () lain.widgets.calendar:show(7) end),
    --awful.key({ altkey,           }, "h",      function () fswidget.show(7) end),

    -- ALSA volume control
    awful.key({}, "XF86AudioRaiseVolume",
        function ()
            awful.util.spawn("amixer -q set Master 1%+")
            volumewidget.update()
        end),
    awful.key({}, "XF86AudioLowerVolume",
        function ()
            awful.util.spawn("amixer -q set Master 1%-")
            volumewidget.update()
        end),
    awful.key({}, "XF86AudioMute",
        function ()
            awful.util.spawn("amixer -q set Master playback toggle")
            volumewidget.update()
        end),
    awful.key({ altkey, "Control" }, "m",
        function ()
            awful.util.spawn("amixer -q set Master playback 100%")
            volumewidget.update()
        end),

    -- User programs
    awful.key({ modkey }, "q", function () awful.util.spawn(browser) end),
    awful.key({ modkey }, "a", function () awful.util.spawn(browser2) end),
    awful.key({ modkey }, "s", function () awful.util.spawn(gui_editor) end),
    awful.key({ modkey }, "m", function () awful.util.spawn(spotify) end),
    -- awful.key({ modkey }, "g", function () awful.util.spawn(graphics) end),

    -- Prompt
    awful.key({ modkey }, "r", function () mypromptbox[mouse.screen]:run() end),
    awful.key({ modkey, "Shift"   }, "r",
              function ()
                  awful.prompt.run({ prompt = "Run in terminal: " },
                      mypromptbox[mouse.screen].widget,
                      function (...) awful.util.spawn(terminal .. " -e " .. ...) end,
                      awful.completion.shell,
                      awful.util.getdir("cache") .. "/history")
              end)
    -- awful.key({ modkey }, "x",
    --           function ()
    --               awful.prompt.run({ prompt = "Run Lua code: " },
    --               mypromptbox[mouse.screen].widget,
    --               awful.util.eval, nil,
    --               awful.util.getdir("cache") .. "/history_eval")
    --           end)
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey,           }, "c",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "v",      function (c) scratch.pad.set(c, 400, 500, false) end),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        local tag = awful.tag.gettags(screen)[i]
                        if tag then
                           awful.tag.viewonly(tag)
                        end
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      local tag = awful.tag.gettags(screen)[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      local tag = awful.tag.gettags(client.focus.screen)[i]
                      if client.focus and tag then
                          awful.client.movetotag(tag)
                     end
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      local tag = awful.tag.gettags(client.focus.screen)[i]
                      if client.focus and tag then
                          awful.client.toggletag(tag)
                      end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
	                   size_hints_honor = false } },
    { rule = { class = "roxterm" },
          properties = { opacity = 0.99 } },

    { rule = { class = "MPlayer" },
          properties = { floating = true } },

    {rule = { class = "Skype" },
          properties = { floating = true } },

          { rule = { class = "Odeskteam-qt4"},
            properties = { floating = true } },

    { rule = { instance = "chrome_app_list"},
  properties = { floating = true } },

  { rule = { instance = "crx_hmjkmjkepdijhoojdojkdfohbdgmmhki" },
    properties = { floating = true } },

{rule = {class = "Spotify"},
    properties = {tag = tags[1][4] } },
    -- { rule = { class = "Dwb" },
          -- properties = { tag = tags[1][1] } },

    -- { rule = { class = "Iron" },
          -- properties = { tag = tags[1][1] } },

    -- { rule = { instance = "plugin-container" },
          -- properties = { tag = tags[1][1] } },

	  -- { rule = { class = "Gimp" },
     	    -- properties = { tag = tags[1][4] } },

    { rule = { class = "Gimp", role = "gimp-image-window" },
          properties = { maximized_horizontal = true,
                         maximized_vertical = true } },
}
-- }}}

-- {{{ Signals
-- signal function to execute when a new client appears.
client.connect_signal("manage", function (c, startup)
    -- enable sloppy focus
    c:connect_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup and not c.size_hints.user_position
       and not c.size_hints.program_position then
				--awful.placement.no_overlap(c)
        awful.placement.no_offscreen(c)
				awful.placement.under_mouse(c)
    end

    local titlebars_enabled = false
    if titlebars_enabled and (c.type == "normal" or c.type == "dialog") then
        -- buttons for the titlebar
        local buttons = awful.util.table.join(
                awful.button({ }, 1, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.move(c)
                end),
                awful.button({ }, 3, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.resize(c)
                end)
                )

        -- widgets that are aligned to the right
        local right_layout = wibox.layout.fixed.horizontal()
        right_layout:add(awful.titlebar.widget.floatingbutton(c))
        right_layout:add(awful.titlebar.widget.maximizedbutton(c))
        right_layout:add(awful.titlebar.widget.stickybutton(c))
        right_layout:add(awful.titlebar.widget.ontopbutton(c))
        right_layout:add(awful.titlebar.widget.closebutton(c))

        -- the title goes in the middle
        local middle_layout = wibox.layout.flex.horizontal()
        local title = awful.titlebar.widget.titlewidget(c)
        title:set_align("center")
        middle_layout:add(title)
        middle_layout:buttons(buttons)

        -- now bring it all together
        local layout = wibox.layout.align.horizontal()
        layout:set_right(right_layout)
        layout:set_middle(middle_layout)

        awful.titlebar(c,{size=16}):set_widget(layout)
    end
end)

client.disconnect_signal("request::activate", awful.ewmh.activate)
function awful.ewmh.activate(c)
    if awful.client.focus.filter(c) then
        c:raise()
        client.focus = c
    end
end
client.connect_signal("request::activate", awful.ewmh.activate)

-- No border for maximized clients
client.connect_signal("focus",
    function(c)
        if c.maximized_horizontal == true and c.maximized_vertical == true then
            c.border_color = beautiful.border_normal
        else
            c.border_color = beautiful.border_focus
        end
    end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

-- {{{ Arrange signal handler

for s = 1, screen.count() do screen[s]:connect_signal("arrange", function ()
        local clients = awful.client.visible(s)
        local layout  = awful.layout.getname(awful.layout.get(s))

        if #clients > 0 then -- Fine grained borders and floaters control
            for _, c in pairs(clients) do -- Floaters always have borders
                if awful.client.floating.get(c) or layout == "floating" then
                    c.border_width = beautiful.border_width

                -- No borders with only one visible client
                -- elseif #clients == 0 or layout == "max" then
                --     clients[0].border_width = 0
                -- else
                --     c.border_width = beautiful.border_width
                end
            end
        end
      end)
end

-- }}}
