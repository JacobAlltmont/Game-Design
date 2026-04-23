global.boss_death = true
global.score += 50
obj_control.calculate_score();
instance_create_depth(0, 0, -9999, obj_victory_screen);