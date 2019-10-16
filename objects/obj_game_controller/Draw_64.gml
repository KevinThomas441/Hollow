sh = (global.saber_health/global.saber_max_health)*100;
ah = (global.archer_health/global.archer_max_health)*100;
draw_set_font(font0);

//draws health and attack for Saber
temp = global.saber_health;
draw_text_transformed(12, 85, "Saber", 0.6, 0.6, 0);
for (var i = 0; i < global.saber_max_health; i++) {
	if (temp > 0) {
		draw_sprite(spr_health_section, 0, -40 +(16 * i), 4);
		temp--;
	}
	else {
		draw_sprite(spr_health_section, 1, -40 +(16 * i), 4);
	}
}


for (var i = 0; i < global.saber_attack; i++) {
	draw_sprite(spr_attack_section, 0, -40 + (16 * i), 20);
}

//draws health bar for Archer, darkening lost hp

temp = global.archer_health;
draw_text_transformed(11, 135, "Archer", 0.5, 0.5, 0);
for (var i = 0; i < global.archer_max_health; i++) {
	if (temp > 0) {
		draw_sprite(spr_health_section, 0, -40 +(16 * i), 50);
		temp--;
	}
	else {
		draw_sprite(spr_health_section, 1, -40 +(16 * i), 50);
	}
}


//draws attack bar for Archer
for (var i = 0; i < global.archer_attack; i++) {
	draw_sprite(spr_attack_section, 0, -40 + (16 * i), 66);
}

//draws experience and level

draw_text_transformed(85, 55, "Level: ", 0.5, 0.5, 0);
draw_text_transformed(145, 55, global.player_level, 0.5, 0.5, 0);

