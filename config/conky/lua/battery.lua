require 'cairo'

function conky_main()
	if conky_window == nil then 
		return 
	end

	local cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)
	cr = cairo_create(cs)
	local updates = tonumber(conky_parse("${updates}"))

	line_width = 5
	r, g, b, a = 1, 1, 1, 1
	bottom_x = 10
	bottom_y = 40
	height = 75
	width = 150
	max_value = 100

	battery_perc = tonumber(conky_parse("${battery_percent}"))
	
	if updates>5 then
		draw_battery()
	end

	cairo_destroy(cr)
	cairo_surface_destroy(cs)
	cr=nil
end

function draw_battery()
	ind_color()
	cairo_set_line_width(cr, line_width)
	cairo_set_source_rgba(cr, r, g, b, a)
	cairo_rectangle(cr, bottom_x, bottom_y, width, height)
	cairo_stroke(cr)

	local battery_ind = battery_perc * (width / max_value)
	cairo_rectangle(cr, bottom_x + 7, bottom_y + 7, battery_ind - 14, height - 14)
	cairo_fill(cr)

	local top_bottom_x = bottom_x + width + line_width / 3
	local top_bottom_y = bottom_y + height / 3
	local height = height / 3
	local width = width / 12

	cairo_rectangle(cr, top_bottom_x, top_bottom_y, width, height)
	cairo_fill(cr)
end

function ind_color()
	if battery_perc > 90 then
		r = 0
		g = convert_color(255)
		b = 0
	elseif battery_perc > 80 then		
		r = convert_color(64)
		g = convert_color(255)
		b = 0
	elseif battery_perc > 70 then
		r = convert_color(128)
		g = convert_color(255)
		b = 0
	elseif battery_perc > 60 then
		r = convert_color(191)
		g = convert_color(255)
		b = 0
	elseif battery_perc > 50 then
		r = convert_color(255)
		g = convert_color(255)
		b = 0
	elseif battery_perc > 40 then
		r = convert_color(255)
		g = convert_color(191)
		b = 0
	elseif battery_perc > 30 then
		r = convert_color(255)
		g = convert_color(128)
		b = 0
	elseif battery_perc > 20 then
		r = convert_color(255)
		g = convert_color(64)
		b = 0
	else
		r = convert_color(255)
		g = convert_color(0)
		b = 0
	end
end
function conky_get_state()
	return string.match(conky_parse("${battery}"),"%a+")
end

function conky_get_prompt()
	if conky_get_state() == "discharging" then
		return "Time Remaining: "
	else
		return "Charge Time: "
	end
end

function convert_color(color)
	return color / 255
end
