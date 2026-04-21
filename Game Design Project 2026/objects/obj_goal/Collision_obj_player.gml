
if (room_exists(room_next(room))){
	room_goto_next();
	show_debug_message("moving to next room")
}else{ //end the game
	game_over = true
}