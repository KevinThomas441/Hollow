if(can_attack <=0)
{
	if(last_direction>0)
	{
		sprite_index = spr_saber_attack_1;
		image_xscale = 1;
	}
	else if(last_direction<1)
	{
		sprite_index = spr_saber_attack_1;
		image_xscale = -1;
	}
	with(other)
	{
		hlth -= global.saber_attack;
		flash = 3;
	}
	can_attack = 20;
}