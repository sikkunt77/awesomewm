local awful = require('awful')
local rule = require('rule')

--Rules for new client
rule.client.connect_signal('request::rules', function()
	-- All clients will match this rule
	rule.client.append_rule({
		id = 'global',
		rule = {},
		properties = {
			focus = awful.client.focus.filter,
			raise = true,
			screen = awful.screen.preferred,
			placement = awful.placement.no_overlap + awful.placement.no_offscreen
		}
	})

	-- Floating clients
	rule.client.append_rule({
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
	})

	-- Add titlebars to normal clients and dialogs
	rule.client.append_rule({
		id = 'titlebars',
		rule_any = { type = { 'normal', 'dialog' } },
		properties = { titlebars_enabled = true }
	})

	-- Set Firefox to always map on tag 2 on screen 1
	rule.client.append_rule({
		rule = { class = 'firefox' },
		properties = { screen = 1, tag = '2' }
	})
end)

