if (!flipped) {
	if (collision_circle(x, y, radius, oPlayer, false, true)) {
		flipped = true;
		image_index = 1;
	}
} else {
	if (collision_circle(x, y, radius, oPlayer, false, true)) {
		flipped = false;
		image_index = 0;
	}
}

