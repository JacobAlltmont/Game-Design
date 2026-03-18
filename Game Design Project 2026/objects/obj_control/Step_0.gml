/// @description TEST CODE

test = true //usually want this to be false

if test {
	if keyboard_check(ord("I")){ // sets gravity to down
		gravityDirection = new Vector2(0,-1)
	}else if keyboard_check(ord("K")){ // sets gravity to up
		gravityDirection = new Vector2(0,1)
	}else if keyboard_check(ord("J")){ //sets gravity to left
		gravityDirection = new Vector2(-1,0)
	}else if keyboard_check(ord("L")){ //sets gravity to right
		gravityDirection = new Vector2(1,0)
	}else if keyboard_check(ord("O")){ // sets gravityt to zero
		gravityDirection = new Vector2(0,0)
	}
}