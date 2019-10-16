if(!place_meeting(x + move_speed, y, obj_geometry))
{
	hsp = move_speed;
	x = x + hsp;
	last_direction = 1;
	sprite_index = spr_saber_run;
	image_xscale = 1;
	climbing = false;
}
else
{
	climbing = true;
}