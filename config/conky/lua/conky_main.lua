require 'cairo'

function conky_main()
	if conky_window == nil then 
		return 
	end

	local cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)
	cr = cairo_create(cs)

	if updates>5 then

	end

	cairo_destroy(cr)
	cairo_surface_destroy(cs)
	cr=nil
end

