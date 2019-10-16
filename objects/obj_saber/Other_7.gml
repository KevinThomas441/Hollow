switch(sprite_index)
{
	case spr_saber_attack_1:
	{
		sprite_index = spr_saber_idle;
	}
	case spr_saber_jump:
	{
		if(!place_meeting(x, y+1, obj_geometry))
		{
			sprite_index = spr_saber_jump;
			image_index = 4;
		}
		else
		{
			sprite_index = spr_saber_idle;
		}
	}
}