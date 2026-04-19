
draw_set_font(fnt_ui)

draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_white)

draw_text(16, 16, "HP: " + string(hp))
draw_text(16, 40, "Power: " + string(powerSwingCooldown))
draw_text(16, 64, "Ultimate: " + string(ultimateAttackCooldown))