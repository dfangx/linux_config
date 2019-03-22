require 'cairo'

function conky_main()
	if conky_window == nil then 
		return 
	end

	local cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)
	cr = cairo_create(cs)
	
	local updates = tonumber(conky_parse("${updates}"))
	
	def_start_angle = convert_to_radians(0 - 135)
	def_end_angle = convert_to_radians(0 - 45)
	def_center_x = 330
	def_center_y = 100
	r = convert_color(169)
	g = convert_color(169)
	b = convert_color(169)
	a = convert_color(255)
	line_width = 10
	
	wifi_qual = tonumber(conky_parse("${wireless_link_qual_perc wlp2s0}"))
	settings = {
		{
			start_angle = convert_to_radians(0 - 90),
			end_angle = convert_to_radians(360 - 90),
			radius = 10
		},
		{
			radius = 30
		},
		{
			radius = 50
		},
		{
			radius = 70
		}
	}

	if updates>5 then
		for i=1,4 do
			create_wifi_meter(settings[i], i)
		end

		if wifi_qual >= 75 then
			r, g, b = 0, 1, 0
			for i=1,4 do
				create_wifi_meter(settings[i], i)
			end
		elseif wifi_qual >= 50 then
			r = convert_color(168)
			g = convert_color(255)
			b = convert_color(0)
			for i=1,3 do
				create_wifi_meter(settings[i], i)
			end
		elseif wifi_qual >= 25 then
			r, g, b = 1, 1, 0
			for i=1,2 do
				create_wifi_meter(settings[i], i)
			end
		else
			r, g, b = 1, 0, 0
			create_wifi_meter(settings[1], 1)
		end
	end

	cairo_destroy(cr)
	cairo_surface_destroy(cs)
	cr=nil
end

function create_wifi_meter(settings, i)
	local start_angle = settings.start_angle
	if start_angle == nil then
		start_angle = def_start_angle
	end

	local end_angle = settings.end_angle
	if end_angle == nil then
		end_angle = def_end_angle
	end

	cairo_set_line_width(cr, line_width)
	cairo_set_source_rgba(cr, r, g, b, a)
	cairo_arc(cr, def_center_x, def_center_y, settings.radius, start_angle, end_angle)

	if i == 1 then
		cairo_fill(cr)
	else
		cairo_stroke(cr)
	end
end

function convert_to_radians(degrees)
	return degrees * (math.pi / 180)
end

function convert_color(color)
	return color / 255
end
