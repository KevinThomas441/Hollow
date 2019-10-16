/*
if(last_direction>0)
{
	sprite_index = spr_archer_shoot;
}
else if(last_direction<1)
{
	sprite_index = spr_archer_attack_left;
}
*/
if(can_shoot <= 0)
{
	if(mouse_x > x)
	{
		sprite_index = spr_archer_shoot;
		image_xscale = 1;
		//instance_create_layer(x+5, y-5, "layer_player", obj_arrow);	
	}
	else
	{
		sprite_index = spr_archer_shoot;
		image_xscale = -1;
		//instance_create_layer(x-5, y-5, "layer_player", obj_arrow);
	}
	can_shoot = 50;
}