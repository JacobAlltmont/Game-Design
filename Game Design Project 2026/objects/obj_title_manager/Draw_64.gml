var gui_w = display_get_gui_width()
var gui_h = display_get_gui_height()

draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_font(fnt_ui)
draw_set_color(c_white)

draw_text_transformed(gui_w * 0.5, gui_h - 140, "Press Enter to Start", 1.0, 1.0, 0)

draw_set_halign(fa_left)
draw_set_valign(fa_top)