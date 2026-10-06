if (blink_count >= 15) {
	BOOM()
}
image_index++
blink_count++
alarm[0] = clamp(1 / (blink_count + 1) * 60, 5, 60)