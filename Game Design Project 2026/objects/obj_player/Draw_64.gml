
draw_set_font(fnt_ui)

draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_white)

draw_text(16, 16, "Power Swing Cooldown: " + string(powerSwingCooldown))
draw_text(16, 45, "Ultimate Cooldown: " + string(ultimateAttackCooldown))
draw_text(16, 74, "HP: " + string(hp))

draw_set_halign(fa_right)
draw_text(display_get_gui_width() - 16, 16, "Score: " + string(max(0,global.score)))

draw_set_halign(fa_left)