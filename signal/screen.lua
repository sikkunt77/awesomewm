local awful     = require('awful')
local beautiful = require('beautiful')
local gears = require('gears')

--- Attach tags and widgets to all screens.
local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
    set_wallpaper(s)
   -- Create all tags and attach the layouts to each of them.
  awful.tag(require('config.user').tags, s, awful.layout.layouts[1])

   -- Attach a wibar to each screen.
   s.bar = require('ui.wibar')(s)
end)

--- Wallpaper.
-- NOTE: `awful.wallpaper` is ideal for creating a wallpaper IF YOU
-- BENEFIT FROM IT BEING A WIDGET and not just the root window
-- background. IF YOU JUST WISH TO SET THE ROOT WINDOW BACKGROUND, you
-- may want to use the deprecated `gears.wallpaper` instead. This is
-- the most common case of just wanting to set an image as wallpaper.

screen.connect_signal('request::wallpaper', function(s)
   awful.wallpaper({
      screen = s,
      widget = {
         widget = wibox.container.tile,
         valign = 'center',
         halign = 'center',
         tiled  = false,
         {
            widget    = wibox.widget.imagebox,
            image     = beautiful.wallpaper,
            upscale   = true,
            downscale = true
         }
      }
   })
end)

-- An example of what's mentioned above. For more information, see:
-- https://awesomewm.org/apidoc/utility_libraries/gears.wallpaper.html
-- gears.wallpaper.maximized(beautiful.wallpaper)
