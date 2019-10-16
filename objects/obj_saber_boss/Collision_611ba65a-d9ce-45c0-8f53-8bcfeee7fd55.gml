if(can_attack<=0)
{
	hsp = 0;
	x_diff = obj_archer.x-x;
	sprite_index = spr_saber_attack_1;
	image_xscale = 1*sign(x_diff);
	global.archer_health-=2;
	can_attack = 70;
}