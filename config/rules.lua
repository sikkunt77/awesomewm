local awful = require('awful')
local beautiful = require('beautiful')

--Rules for new client
awful.rules.rules ={
	-- All clients will match this rule
	{
	rule =  { },
	properties = {
	    border_width = beautiful.border_width,
		border_color = beautiful.border_normal,
        focus = awful.client.focus.filter,
        raise = true,
        keys = clientkeys,
        buttons = clientbuttons,
        screen = awful.screen.preferred,
        placement = awful.placement.no_overlap+awful.placement.no_offscreen
	}
	},

	-- Floating clients
	{
	id = 'floating',
	rule_any = {
		instance = { 'copyq', 'pinetry' },
		class = {
			'Arandr', 'blueman', 'gpick', 'kruler', 'sxiv', 'tor_browser', 'wpa_gui', 'veromix', 'tigervnc'
		},
		name = {
			'Event Tester' -- xev
		},
		role = {
			'AlarmWindow', -- Thunderbird's calendar
			'ConfigManager', -- Thunderbird's about:config
			'pop-up' -- e.g. gg chrome's developer tools
		}
	},
		properties = { floating = true }
	},

	-- Add titlebars to normal clients and dialogs
	{ rule_any = { type = { 'normal', 'dialog' } },
		properties = { titlebars_enabled = false }
	},

	-- Set Firefox to always map on tag 2 on screen 1
	{ rule = { class = 'firefox' },
		properties = { screen = 1, tag = '2' }
	}
}
