#region collision
vsp = vsp + grv;
//Horizontal Collision
if(place_meeting(x+hsp, y, obj_geometry))
{
	while(!place_meeting(x+sign(hsp), y, obj_geometry))
	{
		x = x + sign(hsp);
	}
}
else
{
	x = x + hsp;
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
#endregion

//setting the sprites
#region sprites
sprite_index = spr_saber_run;
if(hsp!=0)
{
	image_xscale = sign(hsp);
}
else
{
	image_xscale = 1;
}
#endregion

switch(saber_state)
{
	case saber_AI_states.wait:
	{
		grv = 0.25;
		hsp = 0;
		vsp = 0;
		sprite_index = spr_saber_crouch;
		if(!wait_order)
		{
			saber_state = saber_AI_states.run;
			//show_debug_message("Not Here");
		}
	}
	break;
	case saber_AI_states.run:
	{
		#region run
		//hsp = move_speed;
		if(place_meeting(x+1, y, obj_geometry) || place_meeting(x-1, y, obj_geometry))
		{
			saber_state = saber_AI_states.climb;
		}
		else
		{
			hsp = move_speed;
			vsp = (min(7, vsp+0.05));
			//x = x + move_speed;
		}
		if(distance_to_object(obj_enemy) < 100)
		{
			saber_state = saber_AI_states.attack;
		}
		if(wait_order)
		{
			saber_state = saber_AI_states.wait;
			//show_debug_message("Here");
		}
		#endregion
	}
	break;
	case saber_AI_states.climb:
	{
		#region climb
		sprite_index = spr_saber_climb;
		if place_meeting(x+1, y, obj_geometry)
		{
			image_xscale = 1;
		}
		if place_meeting(x-1, y, obj_geometry)
		{
			image_xscale = -1;
		}
		y = y - climb_height;
		if(!place_meeting(x+1, y, obj_geometry) && !place_meeting(x-1, y, obj_geometry))
		{
			saber_state = saber_AI_states.run;
		}
		#endregion
	}
	break;
	case saber_AI_states.attack:
	{
		#region attack
		if(distance_to_object(obj_enemy) < 100)
		{
			hsp = move_speed + 1;
			if(place_meeting(x+1, y, obj_enemy) || place_meeting(x-1, y, obj_enemy))
			{
				hsp = 0;
			}
			else
			{
				hsp = move_speed + 1;
			}
		}
		else
		{
			saber_state = saber_AI_states.run;
		}
		#endregion
	}
	break;
}

can_attack--;