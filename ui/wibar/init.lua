local awful = require('awful')
local wibox = require('wibox')

local module = require(... .. '.module')

return function(s)

    mykeyboardlayout = awful.widget.keyboardlayout()
    mytextclock = wibox.widget.textclock()

    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    --s.mylayoutbox = awful.widget.layoutbox(s)

    -- Create a taglist widget
    s.mytaglist = module.taglist(s)

    -- Create a tasklist widget
    s.mytasklist = module.tasklist(s)

    s.mylayoutbox = module.layoutbox(s)

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            module.launcher(),
            s.mytaglist,
            s.mypromptbox,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            mykeyboardlayout,
            wibox.widget.systray(),
            mytextclock,
            s.mylayoutbox,
        },
    }
end
