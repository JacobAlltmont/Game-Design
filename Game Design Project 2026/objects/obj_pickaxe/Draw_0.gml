draw_self()

if (show_prompt) {
	
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_set_font(fnt_ui)
	draw_set_color(c_white)
	
	draw_text_transformed(x, y - 32, "F", 0.5, 0.5, 0)
	
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	
}