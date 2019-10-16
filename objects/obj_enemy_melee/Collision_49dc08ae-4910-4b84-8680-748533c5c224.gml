if(can_attack<=0)
{
	global.archer_health-=1;
	other.flash = 3;
	xdiff = x - obj_archer_parent.x;
	sprite_index = spr_enemy_sword_attack;
	image_xscale = 1*sign(xdiff);
	can_attack=40;
}


/*switch(sprite_index)
{
	case spr_enemy_sword_attack:
	{
		//sprite_index = spr_enemy_sword;
	}
}*/