if(!place_meeting(x, y+1, obj_geometry) && !place_meeting(x, y-1, obj_geometry))
{
	sprite_index = spr_saber_idle;
	image_xscale = 1*sign(last_direction);
}