require 'cairo'

function conky_main()
	if conky_window == nil then 
		return 
	end

	local cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)
	cr = cairo_create(cs)

        line_width = 10
        max_value = 100
        d_radius = 40
        circle_start = convert_to_radians(0 - 90)
        circle_end = convert_to_radians(360 - 90)
        r, g, b, a = convert_color(169), convert_color(169), convert_color(169), convert_color(255)
	rI, gI, bI, aI = convert_color(0), convert_color(255), convert_color(0), convert_color(255)
        d_center_x = 170
        d_center_y = 120
	d_cpu_perc = 0

        local x_gap = 40
        local y_gap = 75
        local special_y = d_center_y + 120

        local settings = {
                {
                        radius = 60,
                        cpu_perc = tonumber(conky_parse("${cpu cpu0}"))
                },
                {
                        center_x = d_center_x - x_gap,
                        center_y = special_y,
                        cpu_perc = tonumber(conky_parse("${cpu cpu1}"))
                },
                {
                        center_x = d_center_x + x_gap,
                        center_y = special_y + y_gap,
                        cpu_perc = tonumber(conky_parse("${cpu cpu2}"))
                },
                {
                        center_x = d_center_x - x_gap,
                        center_y = special_y + 2 * y_gap,
                        cpu_perc = tonumber(conky_parse("${cpu cpu3}"))
                },
                {
                        center_x = d_center_x + x_gap,
                        center_y = special_y + 3 * y_gap,
                        cpu_perc = tonumber(conky_parse("${cpu cpu4}"))
                }
        }
        
	local updates = tonumber(conky_parse("${updates}"))
        
	if updates > 5 then
                for i=1,5 do
                        create_cpu_meter(settings[i])
                end
        end

	cairo_destroy(cr)
	cairo_surface_destroy(cs)
	cr=nil
end

function convert_color(color)
        return color / 255
end

function convert_to_radians(degrees)
        return degrees * (math.pi / 180)
end

function create_cpu_meter(settings)
        local radius = settings.radius
        if radius == nil then
                radius = d_radius
        end 

	local center_x = settings.center_x
	if center_x == nil then
		center_x = d_center_x
	end

	local center_y = settings.center_y
	if center_y == nil then
		center_y = d_center_y
	end

	cairo_set_line_width(cr, line_width)
	cairo_set_source_rgba(cr, r, g, b, a)
	cairo_arc(cr, center_x, center_y, radius, circle_start, circle_end)
	cairo_stroke(cr)
	
	local cpu_perc = settings.cpu_perc
	if cpu_perc == nil then
		cpu_perc = d_cpu_perc
	end

	local circle_end = convert_to_radians(cpu_perc * (360 / max_value) - 90)
	if cpu_perc > 90 then
		rI = convert_color(255)
		gI = 0
		bI = 0
	elseif cpu_perc > 80 then		
		rI = convert_color(255)
		gI = convert_color(64)
		bI = 0
	elseif cpu_perc > 70 then
		rI = convert_color(255)
		gI = convert_color(128)
		bI = 0
	elseif cpu_perc > 60 then
		rI = convert_color(255)
		gI = convert_color(191)
		bI = 0
	elseif cpu_perc > 50 then
		rI = convert_color(255)
		gI = convert_color(255)
		bI = 0
	elseif cpu_perc > 40 then
		rI = convert_color(191)
		gI = convert_color(255)
		bI = 0
	elseif cpu_perc > 30 then
		rI = convert_color(128)
		gI = convert_color(255)
		bI = 0
	elseif cpu_perc > 20 then
		rI = convert_color(64)
		gI = convert_color(255)
		bI = 0
	else
		rI = convert_color(0)
		gI = convert_color(255)
		bI = 0
	end

	cairo_set_source_rgba(cr, rI, gI, bI, aI)
	cairo_arc(cr, center_x, center_y, radius, circle_start, circle_end)
	cairo_stroke(cr)
end


