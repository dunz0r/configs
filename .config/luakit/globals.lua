-- Global variables for luakit
globals = {
    homepage            = "http://luakit.org/",
 -- homepage            = "http://github.com/mason-larobina/luakit",
    scroll_step         = 40,
    zoom_step           = 0.1,
    max_cmd_history     = 100,
    max_srch_history    = 100,
 -- http_proxy          = "http://example.com:3128",
    default_window_size = "800x600",

 -- Disables loading of hostnames from /etc/hosts (for large host files)
 -- load_etc_hosts      = false,
 -- Disables checking if a filepath exists in search_open function
 -- check_filepath      = false,
}

-- Make useragent
local arch = string.match(({luakit.spawn_sync("uname -sm")})[2], "([^\n]*)")
local lkv  = string.format("luakit/%s", luakit.version)
local wkv  = string.format("WebKitGTK+/%d.%d.%d", luakit.webkit_major_version, luakit.webkit_minor_version, luakit.webkit_micro_version)
local awkv = string.format("AppleWebKit/%s.%s+", luakit.webkit_user_agent_major_version, luakit.webkit_user_agent_minor_version)
globals.useragent = string.format("Mozilla/5.0 (%s) %s %s %s", arch, awkv, wkv, lkv)

-- Search common locations for a ca file which is used for ssl connection validation.
local ca_files = {
    -- $XDG_DATA_HOME/luakit/ca-certificates.crt
    luakit.data_dir .. "/ca-certificates.crt",
    "/etc/certs/ca-certificates.crt",
    "/etc/ssl/certs/ca-certificates.crt",
}
-- Use the first ca-file found
for _, ca_file in ipairs(ca_files) do
    if os.exists(ca_file) then
        soup.set_property("ssl-ca-file", ca_file)
        break
    end
end

-- Change to stop navigation sites with invalid or expired ssl certificates
soup.set_property("ssl-strict", false)

-- Set cookie acceptance policy
cookie_policy = { always = 0, never = 1, no_third_party = 2 }
soup.set_property("accept-policy", cookie_policy.always)

-- List of search engines. Each item must contain a single %s which is
-- replaced by URI encoded search terms. All other occurances of the percent
-- character (%) may need to be escaped by placing another % before or after
-- it to avoid collisions with lua's string.format characters.
-- See: http://www.lua.org/manual/5.1/manual.html#pdf-string.format

search_engines = {
    luakit      = "http://luakit.org/search/index/luakit?q=%s",
    gg          = "http://google.com/search?q=%s",
    gi          = "http://google.com/images/search?q=%s",
    wp          = "http://en.wikipedia.org/wiki/Special:Search?search=%s",
    imdb        = "http://imdb.com/find?s=all&q=%s",
    sf          = "http://sf.net/search/?words=%s",
    aw          = "http://wiki.archlinux.org/index.php/Special:Search?search=%s",
    abs         = "http://www.archlinux.org/packages/?q=%s",
    aur         = "http://aur.archlinux.org/packages.php?K=%s",
    bbs         = "http://bbs.archlinux.org/search.php?action=search&keywords=%s&show_as=topics&sort_dir=DESC",
    gl          = "http://google.com/search?q=%s&sourceid=navclient&gfns=1",
    gm          = "http://maps.google.com/maps?q=%s",
    yt          = "http://www.youtube.com/results?search_query=%s&search_sort=video_view_count",
    gh          = "http://www.github.com/%s"
}


-- Set google as fallback search engine
search_engines.default = search_engines.google
-- Use this instead to disable auto-searching
--search_engines.default = "%s"

-- Per-domain webview properties
-- See http://webkitgtk.org/reference/webkitgtk-WebKitWebSettings.html
domain_props = {
    ["all"] = {
        ["enable-scripts"]          = true,
        ["enable-plugins"]          = true,
        ["enable-private-browsing"] = true,
        ["user-stylesheet-uri"]     = "",
--        ["user-stylesheet-uri"]     = "file://" .. luakit.data_dir .. "/styles/zenburn.css",
    },
    }

-- vim: et:sw=4:ts=8:sts=4:tw=80
