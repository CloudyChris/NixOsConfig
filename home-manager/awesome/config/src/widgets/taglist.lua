--------------------------------
-- This is the taglist widget --
--------------------------------

-- Awesome Libs
local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")
local dpi = require("beautiful").xresources.apply_dpi
local color = require("src.theme.colors")
require("src.tools.icon_handler")

local function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

local list_update = function(widget, buttons, label, data, objects)
	widget:reset()

	for _, object in ipairs(objects) do
		local tag_widget = wibox.widget({
			{
				{
					{
						text = "",
						align = "center",
						valign = "center",
						visible = true,
						font = user_vars.font.extrabold,
						forced_width = dpi(25),
						id = "label",
						widget = wibox.widget.textbox,
					},
					id = "margin",
					left = dpi(5),
					right = dpi(5),
					widget = wibox.container.margin,
				},
				id = "container",
				layout = wibox.layout.fixed.horizontal,
			},
			fg = color["nord6"],
			shape = function(cr, width, height)
				gears.shape.rounded_rect(cr, width, height, 5)
			end,
			widget = wibox.container.background,
		})

		local function create_buttons(buttons, object)
			if buttons then
				local btns = {}
				for _, b in ipairs(buttons) do
					local btn = awful.button({
						modifiers = b.modifiers,
						button = b.button,
						on_press = function()
							b:emit_signal("press", object)
						end,
						on_release = function()
							b:emit_signal("release", object)
						end,
					})
					btns[#btns + 1] = btn
				end
				return btns
			end
		end

		tag_widget:buttons(create_buttons(buttons, object))

		tag_widget.container.margin.label:set_text(object.index)
		if object.urgent == true then
			tag_widget:set_bg(color["nord11"])
			tag_widget:set_fg(color["nord0"])
		elseif has_value(awful.screen.focused().selected_tags, object) then
			tag_widget:set_bg(color["nord6"])
			tag_widget:set_fg(color["nord0"])
		else
			tag_widget:set_bg(color["nord0-0"])
		end

		-- Set the icon for each client
		for _, client in ipairs(object:clients()) do
			tag_widget.container.margin:set_right(0)
			local icon = wibox.widget({
				{
					id = "icon_container",
					{
						id = "icon",
						resize = true,
						widget = wibox.widget.imagebox,
					},
					widget = wibox.container.place,
				},
				forced_width = dpi(33),
				margins = dpi(6),
				widget = wibox.container.margin,
			})
			icon.icon_container.icon:set_image(Get_icon(user_vars.icon_theme, client))
			tag_widget.container:setup({
				icon,
				strategy = "exact",
				layout = wibox.container.constraint,
			})
		end

		--#region Hover_signal
		local old_wibox, old_cursor, old_bg
		tag_widget:connect_signal("mouse::enter", function()
			old_bg = tag_widget.bg
			if object == awful.screen.focused().selected_tag then
				tag_widget.bg = color["nord4"]
			else
				tag_widget.bg = color["nord0-0"]
			end
			local w = mouse.current_wibox
			if w then
				old_cursor, old_wibox = w.cursor, w
				w.cursor = "hand1"
			end
		end)

		tag_widget:connect_signal("button::press", function()
			if object == awful.screen.focused().selected_tag then
				tag_widget.bg = color["nord40"]
			else
				tag_widget.bg = color["nord0-0"]
			end
		end)

		tag_widget:connect_signal("button::release", function()
			if object == awful.screen.focused().selected_tag then
				tag_widget.bg = color["nord4"]
			else
				tag_widget.bg = color["nord0-0"]
			end
		end)

		tag_widget:connect_signal("mouse::leave", function()
			tag_widget.bg = old_bg
			if old_wibox then
				old_wibox.cursor = old_cursor
				old_wibox = nil
			end
		end)
		--#endregion

		widget:add(tag_widget)
		widget:set_spacing(dpi(6))
	end
end

return function(s)
	return awful.widget.taglist(
		s,
		awful.widget.taglist.filter.noempty,
		gears.table.join(
			awful.button({}, 1, function(t)
				t:view_only()
			end)
		),
		{},
		list_update,
		wibox.layout.fixed.horizontal()
	)
end
