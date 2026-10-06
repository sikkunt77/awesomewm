local awful = require('awful')
local gears = require('gears')

local tasklist_buttons = gears.table.join(
      -- Left-clicking a client indicator minimizes it if it's unminimized, or unminimizes
      -- it if it's minimized.
     awful.button(nil, 1, function(c)
         if c == client.focus
             then c.minimized = true
         else
             c:emit_signal('request::activate', 'tasklist', {raise = true})
         end
      end),
      -- Right-clicking a client indicator shows the list of all open clients in all visible
      -- tags.
      awful.button(nil, 3, function() awful.menu.client_list({ theme = { width = 250 } }) end),
      -- Mousewheel scrolling cycles through clients.
      awful.button(nil, 4, function() awful.client.focus.byidx(-1) end),
      awful.button(nil, 5, function() awful.client.focus.byidx( 1) end)
 )

return function(s)
   -- Create a tasklist widget
   return awful.widget.tasklist({
      screen  = s,
      filter  = awful.widget.tasklist.filter.currenttags,
      buttons = tasklist_buttons
   })
end
