if other.hp != 0 {
other.hp -= 1;
show_debug_message(other.hp)
} else {
	show_debug_message("enemy dead")
}
instance_destroy(id, true)