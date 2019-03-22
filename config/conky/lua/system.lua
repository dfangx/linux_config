require 'cairo'

function conky_main()
	if conky_window == nil then 
		return 
	end

	local cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)
	cr = cairo_create(cs)
	
	r = 1
	g = 1
	b = 1
	a = 1

	circle_start = convert_to_radians(0 - 60)
	circle_end = convert_to_radians(300 - 60)
	center_x = 205
	center_y = 200
	
	local settings = {
		{

			radius = 50,
			line_width = 5
		},
		{
			radius = 65,
			line_width = 15
		}
	}	

	local updates = tonumber(conky_parse("${updates}"))
	if updates>3 then
		for i=1,2 do
			create_circle(settings[i])
		end

		draw_branch(settings[2])
	end

	cairo_destroy(cr)
	cairo_surface_destroy(cs)
	cr=nil
end

function draw_branch(settings)
	circle_line_width = settings.line_width
	circle_radius = settings.radius
	
	branch_length = 75
	branch_line_width = 3

	branch_end_radius = circle_radius + branch_length
	branch_start_radius = circle_radius + (circle_line_width / 2)

	cairo_set_line_width(cr, branch_line_width)
	cairo_set_source_rgba(cr, r, g, b, a)

	for i=3,11 do
		radius = branch_start_radius
		point = convert_to_radians((i - 1)* 30)
		x = 0 + radius * (math.sin(point))
		y = 0 - radius * (math.cos(point))

		cairo_move_to(cr, center_x + x, center_y + y)
		
		radius = branch_end_radius
		point = convert_to_radians((i - 1) * 30)
		x = 0 + radius * (math.sin(point))
		y = 0 - radius * (math.cos(point))

		cairo_line_to(cr, center_x + x, center_y + y)
		cairo_stroke(cr)
	end
end

function create_circle(settings)
	local line_width = settings.line_width
	local radius = settings.radius

	cairo_set_line_width(cr, line_width)
	cairo_set_source_rgba(cr, r, g, b, a)
	cairo_arc(cr, center_x, center_y, radius, circle_start, circle_end)
	cairo_stroke(cr)
end

function convert_to_radians(degrees)
	return degrees * (math.pi / 180)
end
