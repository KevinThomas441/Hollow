if(!place_meeting(x + move_speed, y, obj_geometry))
{
	sprite_index = spr_archer_run;
	image_xscale = 1;
	hsp = move_speed;
	x = x + hsp;
	last_direction = 1;
	climbing = false;
}
else
{
	climbing = true;
	//sprite_index = spr_archer_idle;
}