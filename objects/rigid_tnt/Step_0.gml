event_inherited()

if (freeze) {
	return
}

if (once) {
	once = false
	alarm[0] = 5
}
if (is_boom) {
	image_xscale *= 0.7
	image_yscale *= 0.7
	if (image_xscale <= 0.1) {
		instance_destroy(self)
	}
}