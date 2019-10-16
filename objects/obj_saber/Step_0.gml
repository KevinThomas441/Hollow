if(!place_meeting(x, y+1, obj_geometry))
{
	jumping = true;
}
else
{
	jumping = false;
}
//Climbing Code
//climbing = false;
grv = 0.25;
/*
if(place_meeting(x-1, y-1, obj_geometry) || place_meeting(x+1, y-1, obj_geometry))
{
	grv = 0;
	if (place_meeting(x-1, y, obj_geometry))
	{
		sprite_index = spr_saber_climb;
		image_xscale = -1;
	}
	if (place_meeting(x+1, y, obj_geometry))
	{
		sprite_index = spr_saber_climb;
		image_xscale = 1;
	}
}


*/

if(climbing)
{
	grv = 0;
	if (place_meeting(x-1, y, obj_geometry))
	{
		sprite_index = spr_saber_climb;
		image_xscale = -1;
	}
	if (place_meeting(x+1, y, obj_geometry))
	{
		sprite_index = spr_saber_climb;
		image_xscale = 1;
	}
}
vsp = vsp + grv;
//Horizontal Collision
if(place_meeting(x+hsp, y, obj_geometry) || place_meeting(x+hsp, y, obj_geometry_no_climb))
{
	while(!place_meeting(x+sign(hsp), y, obj_geometry) && !place_meeting(x+sign(hsp), y, obj_geometry))
	{
		x = x + sign(hsp);
	}
}

//Vertical Collision
if(place_meeting(x, y+vsp, obj_geometry) || place_meeting(x, y+vsp, obj_geometry_no_climb))
{
	while(!place_meeting(x, y+sign(vsp), obj_geometry) && !place_meeting(x, y+sign(vsp), obj_geometry_no_climb))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;



if(place_meeting(x+1, y, obj_saber_puzzle))
{
	x = x+1;
}
else if(place_meeting(x-1, y, obj_saber_puzzle))
{
	x = x-1;
}
can_switch--;
can_order--;

if(global.saber_health<=0)
{
	instance_destroy();
	instance_destroy(obj_archer_AI);
	room_goto(rm_end_screen);
}
