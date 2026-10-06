local awful = require('awful')

local mod = require('binds.mod')
local modkey = mod.modkey
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")
local gears = require('gears')

local apps = require('config.apps')

--Global key bindings
globalkeys = gears.table.join(

    --General awesome keys
    awful.key({ modkey, }, 's',
        hotkeys_popup.show_help,
    {description = 'show help', group ='awesome'}),

    awful.key({ modkey, }, 'm', function()
        require('ui.menu').main:show()
    end, {description = 'show main menu', group = 'awesome'}),

    awful.key({ modkey, mod.shift}, 'r',
        awesome.restart,
        {description = 'restart awesome', group = 'awesome'}),

    awful.key({ modkey, mod.shift}, 'q',
        awesome.quit,
        {description = 'quit awesome', group = 'awesome'}),

    awful.key({ modkey }, 'x', function()
        awful.prompt.run{
            prompt       = 'Run Lua code: ',
            textbox      = awful.screen.focused().mypromptbox.widget,
            exe_callback = awful.util.eval,
            history_path = awful.util.get_cache_dir() .. '/history_eval' }
    end, { description = 'lua execute prompt', group = 'awesome' }),

    awful.key({ modkey }, 'Return', function()
        awful.spawn(apps.terminal)
    end, {description = 'launch terminal', group = 'launcher'}),

    awful.key({ modkey, }, 'r', function()
        awful.screen.focused().mypromptbox:run()
    end, {description = 'run prompt', group = 'launcher'}),

    awful.key({ modkey, }, 'p', function()
        require('menubar').show()
    end, {description = 'show menubar', group = 'launcher'}),

    --Tags related keybindings
    awful.key({ modkey, }, 'Left',
        awful.tag.viewprev,
        {description = 'view prev', group = 'tag'}),

    awful.key({ modkey, }, 'Right',
        awful.tag.viewnext,
        {description = 'view next', group = 'tag'}),

    awful.key({ modkey, }, 'Tab',
        awful.tag.history.restore,
        {description = 'back and forth', group = 'tag'}),

    -- Media related keybindings
    awful.key({ "Mod1" }, "space", function ()
 	    awful.spawn("rofi -show drun")
    end, {description = "rofi drun", group = "launcher"}),

    awful.key({}, "XF86AudioRaiseVolume", function ()
	    awful.spawn("pamixer -i 5")
    end, {description = "volume up", group = "media"}),

    awful.key({}, "XF86AudioLowerVolume", function ()
	    awful.spawn("pamixer -d 5")
    end, {description = "volume down", group = "media"}),

    awful.key({}, "XF86AudioMute", function()
	    awful.spawn("pamixer --toggle-mute")
    end, {description = "toggle mute", group ="media"}),

    awful.key({}, "XF86MonBrightnessUp", function()
	    awful.spawn("brightnessctl set +5%")
    end, {description = "up brightness", group = "media"}),

    awful.key({}, "XF86MonBrightnessDown", function()
	    awful.spawn("brightnessctl set 5%-")
    end, {description = "down brightness", group = "media"}),

    awful.key({}, "XF86LaunchA", function()
	    awful.spawn("flameshot gui --path /home/dusty/Pictures/Screenshots/")
    end, {description = "screenshot", group = "media"}),

    awful.key({}, "XF86LaunchB", function()
	    awful.spawn("rofi -show window")
    end, {description = "running apps", group = "task"}),


    --Focuse related keybindings
    awful.key({ modkey, }, 'j', function()
        awful.client.focus.byidx( 1)
    end, {description = 'focus next by index', group = 'client'}),

    awful.key({ modkey, }, 'k', function()
        awful.client.focus.byidx(-1)
    end, {description = 'focus prev by index', group = 'client'}),

    awful.key({ modkey, }, 'e', function()
        awful.client.focus.history.previous()
          if client.focus
              then
              client.focus:raise()
          end
    end, {description = 'go back', group = 'client'}),

    awful.key({ modkey, mod.ctrl }, 'j', function()
        awful.screen.focus_relative( 1)
    end, {description = 'focus the next screen', group = 'screen'}),

    awful.key({ modkey, mod.ctrl }, 'k', function()
        awful.screen.focus_relative(-1)
    end, {description = 'focus the previous screen', group = 'screen'}),


--    awful.key({ modkey, mod.ctrl }, 'n', function()
 --         local c = awful.client.restore()
          -- Focus restore client
  --        if c
    --          then
      --        c:activate {raise = true, context = 'key.unminimize'}
        --  end
   -- end, {description = 'restore minimized', group = 'client'}),

   awful.key({ modkey, mod.shift }, 'j', function()
       awful.client.swap.byidx( 1)
   end, {description = 'swap with next client by index', group = 'client'}),

   awful.key({ modkey, mod.shift }, 'k', function()
       awful.client.swap.byidx(-1)
   end, {description = 'swap with previous client by index', group = 'client'}),

   awful.key({ modkey, }, 'u',
       awful.client.urgent.jumpto,
       {description = 'jump to urgent client', group = 'client'}),

   awful.key({ modkey, }, 'l', function()
       awful.tag.incmwfact( 0.05)
   end, {description = 'increase master width factor', group = 'layout'}),

   awful.key({ modkey, }, 'h', function()
       awful.tag.incmwfact(-0.05)
   end, {description = 'decrease master width factor', group = 'layout'}),

   awful.key({ modkey, mod.shift }, 'h', function()
       awful.tag.incnmaster( 1, nil, true)
   end, {description = 'increase the number of master clients', group = 'layout'}),

   awful.key({ modkey, mod.shift }, 'l', function()
       awful.tag.incnmaster(-1, nil, true)
   end, {description = 'decrease the number of master clients', group = 'layout'}),

   awful.key({ modkey, mod.ctrl  }, 'h', function()
       awful.tag.incncol( 1, nil, true)
   end, {description = 'increase the number of columns', group = 'layout'}),

   awful.key({ modkey, mod.ctrl  }, 'l', function()
       awful.tag.incncol(-1, nil, true)
   end, {description = 'decrease the number of columns', group = 'layout'}),

   awful.key({ modkey, }, 'space', function()
       awful.layout.inc( 1)
   end, {description = 'select next', group = 'layout'}),

   awful.key({ modkey, mod.shift }, 'space', function()
       awful.layout.inc(-1)
   end, {description = 'select previous', group = 'layout'})
)

for i = 1, 9, 1 do
    globalkeys = gears.table.join(globalkeys,

       -- View tag only.
       awful.key({ modkey }, "#" .. i + 9,
                 function ()
                       local screen = awful.screen.focused()
                       local tag = screen.tags[i]
                       if tag then
                          tag:view_only()
                       end
                 end,
                 {description = "view tag #"..i, group = "tag"}),

       -- Toggle tag display.
       awful.key({ modkey, mod.ctrl }, "#" .. i + 9,
                 function ()
                     local screen = awful.screen.focused()
                     local tag = screen.tags[i]
                     if tag then
                        awful.tag.viewtoggle(tag)
                     end
                 end,
                 {description = "toggle tag #" .. i, group = "tag"}),

       -- Move client to tag.
       awful.key({ modkey, mod.shift }, "#" .. i + 9,
                 function ()
                     if client.focus then
                         local tag = client.focus.screen.tags[i]
                         if tag then
                             client.focus:move_to_tag(tag)
                         end
                    end
                 end,
                 {description = "move focused client to tag #"..i, group = "tag"}),

       -- Toggle tag on focused client.
       awful.key({ modkey, mod.ctrl, mod.shift }, "#" .. i + 9,
                 function ()
                     if client.focus then
                         local tag = client.focus.screen.tags[i]
                         if tag then
                             client.focus:toggle_tag(tag)
                         end
                     end
                 end,
                 {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

return globalkeys
