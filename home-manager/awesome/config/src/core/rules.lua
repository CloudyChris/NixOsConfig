-------------------------------------------------------------------------------------------------
-- This class contains rules for float exceptions or special themeing for certain applications --
-------------------------------------------------------------------------------------------------

-- Awesome Libs
local awful = require("awful")
local beautiful = require("beautiful")
local ruled = require("ruled")

awful.rules.rules = {
	{
		rule = {},
		properties = {
			border_width = beautiful.border_width,
			border_color = beautiful.border_normal,
			focus = awful.client.focus.filter,
			raise = true,
			keys = require("../../mappings/client_keys"),
			buttons = require("../../mappings/client_buttons"),
			screen = awful.screen.preferred,
			placement = awful.placement.no_overlap + awful.placement.no_offscreen,
		},
	},
	{
		rule_any = {
			instance = {},
			class = {
				"Arandr",
				"Lxappearance",
				"kdeconnect.app",
				"zoom",
				"file-roller",
				"File-roller",
			},
			name = {},
			role = {
				"AlarmWindow",
				"ConfigManager",
				"pop-up",
			},
		},
		properties = { floating = true, titlebars_enabled = false },
	},
	{
		id = "titlebar",
		rule_any = {
			type = { "normal", "dialog", "modal", "utility" },
		},
		properties = { titlebars_enabled = false },
	},
}
