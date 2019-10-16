switch(sprite_index)
{
	case spr_archer_shoot:
	{
		instance_create_layer(x, y, "layer_player", obj_arrow);	
		sprite_index = spr_archer_idle;
	}
	break;
	case spr_archer_jump:
	{
		sprite_index = spr_archer_idle;
	}
	break;
}