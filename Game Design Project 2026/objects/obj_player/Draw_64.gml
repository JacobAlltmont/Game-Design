draw_set_font(fnt_ui)
draw_set_color(c_white)
draw_set_halign(fa_left)
draw_set_valign(fa_top)

var hud_x = 16
var hud_y = 16

var bar_scale = 0.5
var text_scale = 0.7

var bar_draw_w = sprite_get_width(spr_bar_health) * bar_scale
var bar_draw_h = sprite_get_height(spr_bar_health) * bar_scale

var bar_gap = 8
var cooldown_gap = 10

var hp_y = hud_y
var stamina_y = hp_y + bar_draw_h + bar_gap
var cooldown_y = stamina_y + bar_draw_h + cooldown_gap

var hp_frame_max = sprite_get_number(spr_bar_health) - 1
var stamina_frame_max = sprite_get_number(spr_bar_stamina) - 1

var hp_percent = clamp(hp / basehp, 0, 1)
var stamina_percent = clamp(stamina / staminaLimit, 0, 1)

var hp_frame = round(hp_percent * hp_frame_max)
var stamina_frame = round(stamina_percent * stamina_frame_max)

draw_sprite_ext(spr_bar_health, hp_frame, hud_x, hp_y, bar_scale, bar_scale, 0, c_white, 1)
draw_text_transformed(hud_x + bar_draw_w + 8, hp_y, string(hp) + "/" + string(basehp), text_scale, text_scale, 0)

draw_sprite_ext(spr_bar_stamina, stamina_frame, hud_x, stamina_y, bar_scale, bar_scale, 0, c_white, 1)
draw_text_transformed(hud_x + bar_draw_w + 8, stamina_y, string(floor(stamina)) + "/" + string(staminaLimit), text_scale, text_scale, 0)

var cooldown_scale = 0.5

var cooldown_frame_max_e = sprite_get_number(spr_cooldown_e) - 1
var cooldown_frame_max_r = sprite_get_number(spr_cooldown_r) - 1

var power_ready_percent = clamp(1 - (powerSwingCooldown / powerSwingCooldownMax), 0, 1)
var ultimate_ready_percent = clamp(1 - (ultimateAttackCooldown / ultimateAttackCooldownMax), 0, 1)

var power_frame = floor(power_ready_percent * cooldown_frame_max_e)
var ultimate_frame = floor(ultimate_ready_percent * cooldown_frame_max_r)

var cooldown_draw_w = sprite_get_width(spr_cooldown_e) * cooldown_scale
var cooldown_draw_h = sprite_get_height(spr_cooldown_e) * cooldown_scale
var cooldown_row_gap = 8

var e_x = hud_x
var e_y = cooldown_y

var r_x = hud_x
var r_y = e_y + cooldown_draw_h + cooldown_row_gap

draw_sprite_ext(spr_cooldown_e, power_frame, e_x, e_y, cooldown_scale, cooldown_scale, 0, c_white, 1)
draw_text_transformed(e_x + cooldown_draw_w + 8, e_y + 8, string(powerSwingCooldown), text_scale, text_scale, 0)

draw_sprite_ext(spr_cooldown_r, ultimate_frame, r_x, r_y, cooldown_scale, cooldown_scale, 0, c_white, 1)
draw_text_transformed(r_x + cooldown_draw_w + 8, r_y + 8, string(ultimateAttackCooldown), text_scale, text_scale, 0)

draw_set_halign(fa_right)
draw_text_transformed(display_get_gui_width() - 16, 16, "Score: " + string(max(0, global.score)), 1, 1, 0)

draw_set_halign(fa_left)
draw_set_valign(fa_top)

draw_set_alpha(0.5)
draw_set_halign(fa_left)
draw_set_valign(fa_bottom)

draw_text_transformed(16, display_get_gui_height() - 16, "ESC for Pause Menu", text_scale, text_scale, 0)

draw_set_alpha(1)
draw_set_valign(fa_top)