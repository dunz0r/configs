-- Standard awesome library
require("awful")
require("awful.autofocus")
require("awful.rules")
-- Theme handling library
require("beautiful")
-- Notification library
require("naughty")
-- Dynamic tagging
require("shifty")
-- Modal keybindings
require("lib/keybind")
-- MPD lib
require("lib/mpd")

-- useful for debugging, marks the beginning of rc.lua exec
print("Entered rc.lua: " .. os.time())

-- {{{ Variable definitions
-- Themes define colours, icons, and wallpapers
theme_path = os.getenv("HOME") .. "/.config/awesome/theme.lua"
beautiful.init(theme_path)

-- This is used later as the default terminal and editor to run.
terminal = "urxvtc"
editor = os.getenv("EDITOR") or "vim"
editor_cmd = terminal .. " -title '- VIM' -e sh -c 'sleep 0.2s;" .. editor .. "'"
browser = "luakit"
mail = terminal .. " -name mutt -title '::mutt::' -e sh -c 'sleep 0.1s;mutt'"
musicdir = "/mnt/music/"

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
layouts =
{
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier,
    awful.layout.suit.floating
}
-- }}}

--{{{ Shifty
--{{{ Tags
shifty.config.tags = {
irc = {
    layout    = awful.layout.suit.max,
    mwfact    = 0.60,
    exclusive = true,
    name      = "1:irc",
    solitary  = true,
    position  = 1,
    init      = true,
    screen    = 1,
    slave     = true,
    spawn = terminal .. " -name SSH -title '::irssi::' -e ssh -t dunz0r@hax0r.se tmux -u attach -t irc",
},
web = {
    name      = "2:www",
    layout    = awful.layout.suit.max,
    mwfact    = 0.65,
    exclusive = false,
    solitary  = true,
    position  = 2,
    max_clients = 5,
    nopopup = true,
    spawn     = browser,
},
term = {
    name     = "3:term",
    layout   = awful.layout.suit.tile.left,
    persist  = true,
    position = 3,
},
mutt = {
    name     = "7:mutt",
    layout    = awful.layout.suit.tile,
    mwfact    = 0.55,
    exclusive = false,
    solitary  = false,
    position  = 7,
    spawn     = mail,
    slave     = true,
},
media = {
    name      = "5:media",
    layout    = awful.layout.suit.float,
    exclusive = true,
    solitary  = true,
    persist   = false,
    nopopup   = false,
    position  = 5,
    spawn     = terminal .. " -name ncmpcpp -title ncmpcpp -e ncmpcpp",
},
code = {
    name      = "6:code",
    layout    = awful.layout.suit.max.fullscreen,
    position  = 6,
    spawn     = terminal .. " -title '- VIM' -e sh -c 'sleep 0.2s;" .. editor .. "'",
    nopopup   = false,
},

img = {
    name      = "9:img",
    nopopup   = false,
    layout    = awful.layout.suit.max.fullscreen,
    position  = 9,
},
-- No fixed positions
gimp = { 
    spawn = "gimp", 
    layout = awful.layout.suit.max, 
    sweep_delay = 2, screen = 1, 
},
gimptool = { 
    layout = awful.layout.suit.tile, 
    sweep_delay = 2, 
    screen = 2,
},
wine = { 
    layout = awful.layout.suit.float 
},

}
--}}}

--{{{ Application rules
shifty.config.apps = {
{
    match = {
        "luakit",
        "Vimperator",
        "Chromium",
        "Gran Paradiso",
    },
    tag = "web",
},
{
    match = {
        "Shredder.*",
        "Thunderbird",
        "mutt",
    },
    tag = "mutt",
},
{
    match = {
        "pcmanfm",
    },
    slave = true
},
{
    match = {
        "OpenOffice.*",
        "Abiword",
        "Gnumeric",
    },
    tag = "office",
},
{
    match = {
        "Mplayer.*",
        "Mirage",
        "gimp",
        "gtkpod",
        "Ufraw",
        "easytag",
        "ncmpcpp",
    },
    tag = "media",
    nopopup = true,
},
{
    match = {
        "MPlayer",
        "Gnuplot",
        "galculator",
    },
    float = true,
},
{
    match = {
        "SSH",
    },
    tag = "irc",
    honorsizehints = false,
},
{
    match = {
        "urxvt",
    },
    honorsizehints = false,
    tag = "term",
    slave = true,
},
{
    match = {
        ".* - VIM",
    },
    tag = "code",
},
{
    match = {""},
    buttons = awful.util.table.join(
        awful.button({}, 1, function (c) client.focus = c; c:raise() end),
        awful.button({modkey}, 1, function(c)
            client.focus = c
            c:raise()
            awful.mouse.client.move(c)
            end),
        awful.button({modkey}, 3, awful.mouse.client.resize)
        )
},
}
--}}}

-- {{{ Tag defaults
shifty.config.defaults = {
layout = awful.layout.suit.tile.bottom,
ncol = 1,
mwfact = 0.60,
floatBars = true,
guess_name = true,
guess_position = true,
persist = false,
solitary = false,
remember_index = true,
nopopup = true
}
-- }}}

--}}}

-- {{{ Wibox
-- Create a textclock widget
mytextclock = awful.widget.textclock({ align = "right" })

-- Create a systray
mysystray = widget({ type = "systray" })

-- Create a wibox for each screen and add it
mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, awful.tag.viewnext),
                    awful.button({ }, 5, awful.tag.viewprev)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
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
    mypromptbox[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(function(c)
                                              return awful.widget.tasklist.label.currenttags(c, s)
                                          end, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", screen = s })
    -- Add widgets to the wibox - order matters
    mywibox[s].widgets = {
        {
            mytaglist[s],
            mypromptbox[s],
            layout = awful.widget.layout.horizontal.leftright
        },
        mylayoutbox[s],
        mytextclock,
        s == 1 and mysystray or nil,
        mytasklist[s],
        layout = awful.widget.layout.horizontal.rightleft
    }
end
-- }}}

-- SHIFTY: initialize shifty
-- the assignment of shifty.taglist must always be after its actually
-- initialized with awful.widget.taglist.new()
shifty.taglist = mytaglist
shifty.init()

--{{{ Functions

--{{{ Get the Xdefault colours
function get_xdef(file)
    local fr = io.open(file)

    local f = fr:read("*all")

    local i=0
    while i <= 15 do
        local exp = tostring("%*color" .. i .. ": rgb:%w+/%w+/%w%w")
        m = string.match(f, exp)

        mz = string.gsub(m, "^.*:","")
        m = string.gsub(m, "/","")
        xdef_col = {}
        xdef_col[i] = "#" .. m
        --xdef_col[i] = "theme.xdef_col" .. i .. "=\"#" .. (tostring(m)) .. "\""
        i= i + 1
        --xdef_col[i] = tostring(xdef_col[i])
        --print(xdef_col[i])
        xdef_col[i] = tostring(m)
        print(xdef_col[i])
    end
    fr:close()
    return xdef_col{}
end

--}}}

--{{{ Get MPD info
function get_mpd()
    local stats = mpc:send("status")

    if stats.errormsg then
        mpd_text = "MPD error."
    else
        if stats.state == "stop" then
            now_playing = awful.util.escape("<stop>")
        else
            local zstats = mpc:send("playlistid " .. stats.songid)
            now_playing =  "<i>" .. (awful.util.escape( zstats.album or "" )) .. "</i>:" .. (awful.util.escape( zstats.artist or "NA" )) .. " <b>-</b> " .. (awful.util.escape(zstats.title or string.gsub(zstats.file, ".*/", "" ) ))
        end

        if stats.state == "pause" or stats.state == "stop" then
            now_playing = "<span color='".. beautiful.fg_unfocus .."'>" .. now_playing .. "</span>"
        end

    end

    return now_playing
end
--}}}

--{{{ Get the album image
function album_art()
    local stats = mpc:send("status")
    local zstats = mpc:send("playlistid " .. stats.songid)
    art = awful.util.pread('find "' .. musicdir .. awful.util.unescape(string.match(zstats.file, ".*/")) .. '" -regextype posix-egrep -iregex ".*(cover|front|albumart|outside|folder).*(png|jpg|gif|bmp)" | head -1')

    return string.gsub(art,"\n","")
end
--}}}

--{{{ Get playlist
function get_playlist ()
    local stats = mpc:send("status")
    local cur = stats.song
    local list = ""
    if tonumber(stats.song) < 10 then
        min = tonumber(stats.song)
    else
        min = 10
    end
    for i = stats.song - min,stats.song + 6
        do
            zstats = mpc:send("playlistinfo " .. i)
            if zstats.pos == nil then
                list = list .. "<span color=" .. beautiful.wid_rh .. "><b>::end::</b></span>"
                break
            end
            if zstats.pos == stats.song then
                list = list .. "<span color='" .. beautiful.wid_bh .. "'><b>" .. zstats.pos .. ". " .. awful.util.escape((zstats.artist or "NA") .. " - " .. (zstats.title or zstats.file)) .. "</b></span>\n"
            else
                list = list .. zstats.pos .. ". " .. awful.util.escape((zstats.artist or "NA") .. " - " .. (zstats.title or zstats.file) ) .. "\n"
            end
        end
        return list
    end
    --}}}

    --{{{ Find song in playlist and play it.
    function grep(c,q,l)
        s = ""
        x = 0 
        f = assert(io.popen(c .." " ..  q, 'r'))
        if not l then
            l = 30
        end 

        for line in f:lines() do
            if x > l then
                s = s .. "\n\nMore than "..l.." results"
                break
            end 

            s = s .. "\n" .. string.gsub(awful.util.escape(line),"^%d-%)","<span color='"..beautiful.fg_unfocus.."'>%0</span>")
            x = x + 1 
        end 

        if x == 1 then
            os.execute("mpc play " .. string.gsub(string.gsub(s,"%).*",""),".*>","") .. " &> /dev/null")
            mpdbox.text = get_mpd()

            return "One match autostart.\n" .. get_mpd()
        elseif x ~= 0 then
            s = string.gsub(s,nocase(q),"<span color='"..beautiful.fg_highlight.."'>%0</span>")
            return s
        else
            return "No matches"
        end 
    end 

    --}}}

    --{{{ Add a todo note

    function add_todo (todo)
        naughty.notify({
            text = "<b><u>devtodo: </u></b> " .. "<span color='" .. beautiful.fg_focus .. "'>" .. awful.util.pread("todo --add --priority " .. todo) .. "</span>",
            timeout = 10
        })
    end
    --}}}

    --{{{ Show todos
    function show_todo(graft)
        local todo = awful.util.escape(awful.util.pread("todo --mono"))
        todo = naughty.notify({
            text = "<b><u>devtodo</u></b>\n" .. "<span color='" .. beautiful.wid_cl .. "'>".. string.format(os.date("%a, %d %B %Y") .. "</span>" .. "\n" .. todo),
            timeout = 10
        })
    end
    --}}}

    --{{{ Shows batteryinfo for (adapter)
    function batteryinfo(adapter)

        local fcap = io.open("/sys/class/power_supply/" .. adapter .. "/energy_full")
        local fcur = io.open("/sys/class/power_supply/" .. adapter .. "/energy_now")
        local fsta = io.open("/sys/class/power_supply/" .. adapter .. "/status")
        local cur = fcur:read()
        local cap = fcap:read()
        local sta = fsta:read()
        local battery = math.floor(cur / cap * 100)
        if sta:match("Charging") then
            dir = "+ "
        elseif sta:match("Discharging") then
            dir = "- "
        else
            dir = "= "
        end
        batterybox.text = " | " .. dir
        batbar:bar_data_add("bat",tonumber(battery) )
        fcur:close()
        fcap:close()
        fsta:close()
    end
    --}}}

    --{{{ Get loadaverage and temperature
    function get_load_temp(sensor)
        local lf = io.open("/proc/loadavg")
        --	local tf = io.open("/proc/acpi/thermal_zone/" .. sensor .. "/temperature")

        local l = lf:read()
        --	local t = tf:read()

        --	local t = string.match(t, "%d+ C")
        lf:close()
        --	tf:close()

        return l
    end
    --}}}

    --{{{ Show paste
    function show_paste()
        local paste = selection()
        paste = naughty.notify({
            text = paste,
            timeout = 6,
            width = 300,
        })
    end
    --}}}

    --{{{ Get the weather
    function get_weather(ret)

        if ret == 1 then	
            local fp = io.open("/tmp/.weather")
            local forecast = fp:read("*a")
            fp:close()
            return "<span color='" .. beautiful.wid_rh .. "'>weather for enköping</span>\n"  .. forecast
        else
            os.execute("wget -q -O - " .. weatherurl .. " | sed -n '/Now/,/More Forecasts/p' | sed 's/<[^>]*>//g; s/^ [ ]*//g; s/&copy;/(c) /g; s/&amp;/and/;s/&deg;//g;s/&nbsp;//g;s/Details//g;s/|//g;s/Hourly//g;s/More Forecasts//'|uniq -u > /tmp/.weather &")
            return ""
        end
    end
    --}}}

    --{{{ Paste to (pastefile) or pastebin
    function paste (pastefile)
        local bufcon = selection()
        local pastefile = pastefile or pastebin
        local file = io.open(pastefile, "a")
        file:write(bufcon)
        file:close()
        infobox.text = "wrote X buffer content to " .. pastefile
    end
    --}}}

    --{{{ Open stuff with uzbl
    function uzbl_prompt(prompt, text, socket, command)
        if command then
            -- if a command prefix is provided
            command = command .. ' '
        end
        --  awful.prompt.run({prompt=prompt, text=text},
        --     promptbox[mouse.screen],
        --     function(input)
        -- send through unix socket
        c = assert(socket.unix())
        assert(c:connect("/tmp/" .. socket))
        --while 1 do
        --   local l = io.read()
        assert(c:send("uri google.com\n"))
        -- end
        --end)
    end
    --}}}

    --{{{ Finds string in command
    function commandfind (command, string)
        local cmd = awful.util.pread(command)
        local result = string.match(cmd,string)
        return result
    end
    --}}}

    --{{{ Find client
    function clientfind (properties)
        local clients = client.get()
        local rv = nil
        for i, c in pairs(clients) do
            if match(properties, c) then
                rv = c
            end
        end
        return rv
    end

    --}}}

    --{{{ Get ncol and nmaster
    function getnmc()
        local t = awful.tag.selected()

        local m = awful.tag.getnmaster(t)
        local c = awful.tag.getncol()

        return m .. "m " .. c "c"
    end
    --}}}

    --{{{ Returns true if all pairs in table1 are present in table2
    function match (table1, table2)
        for k, v in pairs(table1) do
            if table2[k] ~= v then
                return false
            end
        end
        return true
    end
    --}}}

    --{{{ Get pacman updates
    function get_pmupdates()
        local p = awful.util.pread("pacman -Qu|wc -l")
        return "<span color='" .. beautiful.wid_yh .. "'>pacman: </span>" .. p
    end
    --}}}

    --}}}

--{{{ Mouse bindings
root.buttons({
    awful.button({}, 3, function() mymainmenu:toggle() end),
    awful.button({}, 4, awful.tag.viewnext),
    awful.button({}, 5, awful.tag.viewprev)
})
--}}}

--{{{ Key bindings
globalkeys = awful.util.table.join(
    -- Tags
    awful.key({modkey,}, "Tab", awful.tag.viewprev),
    awful.key({modkey, "Shift"}, "Tab", awful.tag.viewnext),
    awful.key({modkey,}, "Escape", awful.tag.history.restore),
    awful.key({modkey,}, "o",    function() shifty.set(awful.tag.selected(mouse.screen), { screen = awful.util.cycle(screen.count() , mouse.screen + 1) }) end),

    -- Shifty: keybindings specific to shifty
    awful.key({modkey, "Shift"}, ".", shifty.del), -- delete a tag
    awful.key({modkey, "Shift"}, "n", shifty.send_prev), -- client to prev tag
    awful.key({modkey}, "n", shifty.send_next), -- client to next tag
    awful.key({modkey, "Control"}, "n", function()
        shifty.tagtoscr(awful.util.cycle(screen.count(), mouse.screen + 1))
    end), -- move client to next tag
    awful.key({modkey, "Shift"}, "n", shifty.add), -- creat a new tag
    awful.key({modkey, "Shift"}, "r", shifty.rename), -- rename a tag
    awful.key({modkey, "Shift"}, "a", -- nopopup new tag
    function()
        shifty.add({nopopup = true})
    end),

    awful.key({modkey,}, "j",
    function()
        awful.client.focus.byidx(1)
        if client.focus then client.focus:raise() end
    end),
    awful.key({modkey,}, "k",
    function()
        awful.client.focus.byidx(-1)
        if client.focus then client.focus:raise() end
    end),
        awful.key({modkey,}, "w", function() mymainmenu:show(true) end),

    -- {{{ Modal bindings
    --{{{ devtodo, modal bindings
    awful.key({ modkey,           }, "t", function () 
        keybind.push({
            keybind.key({}, "Escape", "cancel", function ()
                keybind.pop()
            end),
            keybind.key({}, "d", "show todos", function ()
                show_todo()
                keybind.pop()
            end),
            keybind.key({}, "a", "add a todo", function ()
                awful.prompt.run(
                { prompt = "add a todo: "},
                promptbox[mouse.screen].widget,
                function (t)
                    add_todo(t)
                end,
                awful.completion.bash
                )
                keybind.pop()
            end),
            keybind.key({}, "r", "delete a todo", function ()
                awful.prompt.run(
                { prompt = "delete todo: "},
                promptbox[mouse.screen].widget,
                function (t)
                    naughty.notify({
                        text = "<b><u>devtodo: </u></b> " .. "<span color='" .. beautiful.fg_focus .. "'>" .. "removed todo #" .. t .. "</span>",
                        timeout = 6,
                    })
                    awful.util.spawn("tdr " .. t)
                end,
                awful.completion.bash
                )
                keybind.pop()
            end),

        }, "::devtodo::")
    end),
    --}}}

    --{{{ mpd, modal bindings
    awful.key({ modkey,         }, "m", function ()
        keybind.push({
            keybind.key({}, "Escape", "cancel", function ()
                keybind.pop()
            end),
            keybind.key({}, "p", "playlist", function ()
                naughty.notify{ position = "bottom_right", title = get_mpd(), icon = album_art(), icon_size= 128,
                text = get_playlist(), timeout = 8 }
                keybind.pop()
            end),
            keybind.key({}, "l", "next track" , function ()
                mpc:next() ; mpdbox.text = get_mpd()
                keybind.pop()
            end),
            keybind.key({}, "h", "previous track" , function ()
                mpc:previous() ; mpdbox.text = get_mpd()
                keybind.pop()
            end),
            keybind.key({}, "k", "volume up" , function ()
                mpc:volume_up(5) ; mpdbox.text = get_mpd()
                keybind.pop()
            end),
            keybind.key({}, "j", "volume down" , function ()
                mpc:volume_down(5) ; mpdbox.text = get_mpd()
                keybind.pop()
            end),
            keybind.key({}, "x", "toggle play" , function ()
                mpc:toggle_play() ; mpdbox.text = get_mpd()
                keybind.pop()
            end),
            keybind.key({}, "s", "stop" , function ()
                mpc:stop() ; mpdbox.text = get_mpd()
                keybind.pop()
            end),
            keybind.key({}, "z", "toggle random" , function ()
                mpc:toggle_random()
                keybind.pop()
            end),
            keybind.key({}, "r", "toggle repeat" , function ()
                mpc:toggle_repeat()
                keybind.pop()
            end),

        }, "::mpd::")
    end),
    --}}}

    --{{{ Info, modal bindings
    awful.key({ modkey,         }, "i", function ()
        keybind.push({
            keybind.key({}, "Escape", "cancel", function ()
                keybind.pop()
            end),
            keybind.key({}, "w", "show weather", function ()
                naughty.notify{ position = "top_right", title = "::weather::",
                text = get_weather(1), timeout = 10 }
                keybind.pop()
            end),
            keybind.key({}, "c", "show tag info", function ()
                naughty.notify{ position = "top_right", title = "::tag::",
                text = getnmc(), timeout = 10 }
                keybind.pop()
            end),
            keybind.key({}, "d", "disk info", function ()
                naughty.notify{ position = "top_right", title = "::disks::",
                text = awful.util.pread("df -h|sed '/none.*$/d'"), timeout = 10 }
                keybind.pop()
            end),
            keybind.key({}, "p", "processes", function ()
                naughty.notify{ position = "top_right", title = "::processes::",
                text = awful.util.pread("ps ux"), timeout = 15 }
                keybind.pop()
            end),
            keybind.key({}, "a", "archey", function ()
                naughty.notify{ position = "top_right", title = "::processes::",
                text = awful.util.pread("archey"), timeout = 15 }
                keybind.pop()
            end),

        }, "::info::" )
    end),
    --}}}
    -- }}}

    -- Layout manipulation
    awful.key({modkey, "Shift"}, "j",
        function() awful.client.swap.byidx(1) end),
    awful.key({modkey, "Shift"}, "k",
        function() awful.client.swap.byidx(-1) end),
    awful.key({modkey, "Control"}, "j", function() awful.screen.focus(1) end),
    awful.key({modkey, "Control"}, "k", function() awful.screen.focus(-1) end),
    awful.key({modkey,}, "u", awful.client.urgent.jumpto),
    awful.key({modkey,}, "<", function () awful.screen.focus_relative( 1) end),
    -- Standard program
    awful.key({modkey,}, "Return", function() awful.util.spawn(terminal) end),
    awful.key({modkey, }, "F11", awesome.restart),
    awful.key({modkey, }, "F12", awesome.quit),

    --awful.key({modkey, "Mod2" }, "l", function() awful.tag.incmwfact(0.05) end),
   -- awful.key({modkey, "Mod2" }, "h", function() awful.tag.incmwfact(-0.05) end),
    awful.key({modkey, "Shift"}, "h", function() awful.tag.incnmaster(1) end),
    awful.key({modkey, "Shift"}, "l", function() awful.tag.incnmaster(-1) end),
    awful.key({modkey, "Control"}, "h", function() awful.tag.incncol(1) end),
    awful.key({modkey, "Control"}, "l", function() awful.tag.incncol(-1) end),
    awful.key({modkey,}, "space", function() awful.layout.inc(layouts, 1) end),
    awful.key({modkey, "Shift"}, "space",
        function() awful.layout.inc(layouts, -1) end),

    -- Prompt
    awful.key({ modkey },            "r",     function () mypromptbox[mouse.screen]:run() end),
    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end)
    )
-- Client awful tagging: this is useful to tag some clients and then do stuff
-- like move to tag on them
clientkeys =
{
    awful.key({modkey,}, "f", function(c) c.fullscreen = not c.fullscreen  end),
    awful.key({modkey, }, ".", function(c) c:kill() end),
    awful.key({modkey, "Control"}, "space", awful.client.floating.toggle),
    awful.key({modkey, "Control"}, "Return",
        function(c) c:swap(awful.client.getmaster()) end),
    awful.key({modkey, "Shift"}, "o", awful.client.movetoscreen),
    awful.key({modkey, "Shift"}, "F10", function(c) c:redraw() end),
    awful.key({modkey}, "t", awful.client.togglemarked),
    awful.key({modkey,}, "m",
        function(c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end),
}
-- SHIFTY: assign client keys to shifty for use in
-- match() function(manage hook)
shifty.config.clientkeys = clientkeys
shifty.config.modkey = modkey

-- Bind keys 123,qwe,asd,zxc to tags 1 to 12
    keys = {}
    keys[1] = "1"
    keys[2] = "2"
    keys[3] = "3"
    keys[4] = "q"
    keys[5] = "w"
    keys[6] = "e"
    keys[7] = "a"
    keys[8] = "s"
    keys[9] = "d"
    keys[10] = "z"
    keys[11] = "x"
    keys[12] = "c"
    -- Compute the maximum number of digit we need, limited to 9
    for i=1,12 do

        globalkeys = awful.util.table.join(globalkeys, awful.key({ modkey }, keys[i],
        function ()
            local t = awful.tag.viewonly(shifty.getpos(i))
        end))
        globalkeys = awful.util.table.join(globalkeys, awful.key({ modkey, "Control" }, keys[i],
        function ()
            local t = shifty.getpos(i)
            t.selected = not t.selected
        end))
        globalkeys = awful.util.table.join(globalkeys, awful.key({ modkey, "Mod1" }, keys[i],
        function ()
            if client.focus then
                awful.client.toggletag(shifty.getpos(i))
            end
        end))
        -- move clients to other tags
        globalkeys = awful.util.table.join(globalkeys, awful.key({ modkey, "Shift" }, keys[i],
        function ()
            if client.focus then
                local t = shifty.getpos(i)
                awful.client.movetotag(t)
                awful.tag.viewonly(t)
            end
        end))
    end


-- Set keys
root.keys(globalkeys)

--}}}

--[[ {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = true,
                     keys = clientkeys,
                     buttons = clientbuttons } },
    { rule = { class = "MPlayer" },
      properties = { floating = true } },
    { rule = { class = "pinentry" },
      properties = { floating = true } },
    { rule = { class = "gimp" },
      properties = { floating = true } },
    -- Set Firefox to always map on tags number 2 of screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { tag = tags[1][2] } },
}
--]]
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.add_signal("manage", function (c, startup)
    -- Add a titlebar
    -- awful.titlebar.add(c, { modkey = modkey })

    -- Enable sloppy focus
    c:add_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end
end)

client.add_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.add_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}
