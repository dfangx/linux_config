require 'cairo'

function conky_main()
	if conky_window == nil then 
		return 
	end

	local cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)
	cr = cairo_create(cs)
	
	local updates = tonumber(conky_parse("${updates}"))
	
	line_width = 10
	center_x = 250
	center_y = 215
	def_radius = 65
	max_value = 100
	ram_total = conky_get_mem_amount("${memmax}")
	def_start_angle = convert_to_radians(0 - 90)
	def_end_angle = convert_to_radians(360 - 90)

	def_r = convert_color(0)
	def_g = convert_color(255)
	def_b = convert_color(0)
	def_a = convert_color(255)

	ram_used_perc = tonumber(conky_parse("${memperc}"))
--	print(ram_used_perc)
	ram_buffer_perc = (conky_get_mem_amount("${buffers}") / ram_total) * 100
--	print(ram_buffer_perc)
	ram_cache_perc = (conky_get_mem_amount("${cached}") / ram_total) * 100
--	print(ram_cache_perc)
	swp_used_perc = tonumber(conky_parse("${swapperc}"))

	end_u_deg = ram_used_perc * (360 / max_value)
--	print(end_u_deg)
	end_b_deg = ram_buffer_perc * (360 / max_value) + end_u_deg
--	print(end_b_deg)
	end_c_deg = ram_cache_perc * (360 / max_value) + end_b_deg

	end_angles = {
		end_u = convert_to_radians(end_u_deg - 90),
		end_b = convert_to_radians(end_b_deg - 90),
		end_c = convert_to_radians(end_c_deg - 90)
	}

	settings = {
		{
			start_angle = def_start_angle
		},
		{
			r = convert_color(255),
			g = convert_color(0),
			b = convert_color(0),
			start_angle = def_start_angle,
			end_angle = end_angles.end_u
		},
		{
			r = convert_color(0),
			g = convert_color(255),
			b = convert_color(255),
			start_angle = end_angles.end_u,
			end_angle = end_angles.end_b
		},
		{
			r = convert_color(255),
			g = convert_color(255),
			b = convert_color(0),
			start_angle = end_angles.end_b,
			end_angle = end_angles.end_c
		},
		{
			radius = 52
		},
		{
			r = convert_color(0),
			g = convert_color(0),
			b = convert_color(255),
			radius = 52,
			end_angle = convert_to_radians(swp_used_perc * (360 / max_value) - 90)
		}
	}

	if updates>5 then	
		for i = 1,6 do
			create_mem_meter(settings[i])
		end
	end

	cairo_destroy(cr)
	cairo_surface_destroy(cs)
	cr=nil
end

function conky_get_buffer_perc()
	return string.format("%.2f", (conky_get_mem_amount("${buffers}") / ram_total) * 100)
end

function conky_get_cache_perc()
	return string.format("%.2f", (conky_get_mem_amount("${cached}") / ram_total) * 100)
end

function create_mem_meter(settings)
	local end_angle = settings.end_angle
	if end_angle == nil then
		end_angle = def_end_angle
	end

	local start_angle = settings.start_angle
	if start_angle == nil then
		start_angle = def_start_angle
	end

	local r = settings.r
	if r == nil then
		r = def_r
	end

	local g = settings.g
	if g == nil then
		g = def_g
	end

	local b = settings.b
	if b == nil then
		b = def_b
	end

	local radius = settings.radius
	if radius == nil then
		radius = def_radius
	end

	cairo_set_line_width(cr, line_width)
	cairo_set_source_rgba(cr, r, g, b, def_a)
	cairo_arc(cr, center_x, center_y, radius, start_angle, end_angle)
	cairo_stroke(cr)
end

function conky_get_mem_amount(command)
	unit = string.match(conky_parse(command), "%a+")
	amount = tonumber(string.match(conky_parse(command), "%d+"))

	if unit == "GiB" then
		amount = amount * 1024
	elseif unit == "KiB" then
		amount = amount / 1024
	elseif amount == "B" then
		amount = amount / 1024 / 1024
	end

	return amount
end

function convert_color(color)
	return color / 255
end

function convert_to_radians(degrees)
	return degrees * (math.pi / 180)
end
