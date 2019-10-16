switch(sprite_index)
{
	case spr_enemy_archer_shoot:
	{
		sprite_index = spr_enemy_archer_idle;
		image_xscale = 1*sign(obj_player_parent.x-x);
	}
	break;
}