local awful = require('awful')
local gears = require('gears')

--Global mouse bindings
globalmouse = root.buttons(gears.table.join(
    awful.button(nil, 3, function() require('ui.menu').main:toggle() end),
    awful.button(nil, 4, awful.viewprev),
    awful.button(nil, 5, awful.viewnext)
))

return globalmouse
