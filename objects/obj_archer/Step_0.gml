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
	climbing = true;
	grv = 0;
}
*/
if(climbing)
{
	grv = 0;
	sprite_index = spr_archer_climb;
	if(place_meeting(x-1, y-1, obj_geometry))
	{
		image_xscale = -1;
	}
	if(place_meeting(x+1, y-1, obj_geometry))
	{
		image_xscale = 1;
	}	
}

vsp = vsp + grv;
//Horizontal Collision
if(place_meeting(x+hsp, y, obj_geometry))
{
	while(!place_meeting(x+sign(hsp), y, obj_geometry))
	{
		x = x + sign(hsp);
	}
}

//Vertical Collision
if(place_meeting(x, y+vsp, obj_geometry))
{
	while(!place_meeting(x, y+sign(vsp), obj_geometry))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;

if(global.archer_health<=0)
{
	instance_destroy();
	instance_destroy(obj_saber_AI);
	room_goto(rm_end_screen);
}

can_shoot--;
can_order--;
can_switch--;