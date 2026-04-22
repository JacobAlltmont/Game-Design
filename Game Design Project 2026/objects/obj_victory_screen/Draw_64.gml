// Draw the Black screen 
draw_set_alpha(0.8); 
draw_set_color(c_black);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);

draw_set_alpha(1.0);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Draw the Victory Text
var cx = display_get_gui_width() / 2;
var cy = display_get_gui_height() / 2;

draw_text_transformed(cx, cy - 40, display_text, 2, 2, 0);
draw_text(cx, cy + 20, "Total Score: " + string(global.final_score));

// Prompt for Restart
draw_text(cx, cy + 80, "Press 'R' to Restart");