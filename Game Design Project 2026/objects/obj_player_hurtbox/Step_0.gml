
if instance_exists(owner) {
	
	x = owner.x
	y = owner.y
	image_xscale = owner.image_xscale
	image_yscale = owner.image_yscale
	image_angle = owner.image_angle
	
} else {
	
	instance_destroy()
	
}
	