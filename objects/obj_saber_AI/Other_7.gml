switch(sprite_index)
{
	case spr_saber_attack_1:
	{
		if(wait_order)
		{
			sprite_index = spr_saber_idle;
		}
		else
		{
			sprite_index = spr_saber_run;
		}
	}
	break;
}