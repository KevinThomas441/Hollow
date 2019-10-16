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
if(wait_order)
{
	archer_state = archer_AI_states.wait;
}

switch(archer_state)
{
	case archer_AI_states.wait:
	{
		#region wait
		grv = 0.25;
		hsp = 0;
		vsp = 0;
		if(wait_order)
		{
			sprite_index = spr_archer_crouch;
		}
		else
		{
			sprite_index = spr_archer_idle;
		}
		if (instance_exists(obj_saber)) 
		{
			if(!place_meeting(x, y+1, obj_geometry) && !place_meeting(x, y+1, obj_geometry))
			{
				if(y<obj_saber.y)
				{
					grv = 0.75;
				}
			}
			if(distance_to_object(obj_saber)>100 && !wait_order)
			{
				archer_state = archer_AI_states.follow;
			}
		}
		#endregion
	}
	break;
	case archer_AI_states.follow:
	{
		#region follow
		grv = 0.25;
		if (instance_exists(obj_saber) && !wait_order)
		{
			//(!place_meeting(x-1, y-1, obj_geometry) && !place_meeting(x+1, y-1, obj_geometry))
			hsp = sign(obj_saber.x - x)*move_speed;
			vsp = (min(7, vsp+0.05));
			sprite_index = spr_archer_run;
			image_xscale = 1*sign(obj_saber.x - x);
			if(distance_to_object(obj_saber)<50)
			{
				archer_state = archer_AI_states.wait;
			}
			if(place_meeting(x-1, y, obj_geometry) || place_meeting(x+1, y, obj_geometry))
			{
				archer_state = archer_AI_states.climb;
			}
			if(place_meeting(x, y+1, obj_geometry))
			{
				vsp = 0.25;
			}
		}
		else 
		{
			archer_state = archer_AI_states.wait;
		}
		if(distance_to_object(obj_enemy)<max_range)
		{
			archer_state = archer_AI_states.attack;
		}
		#endregion
	}
	break;
	case archer_AI_states.climb:
	{
		#region climb
		if (instance_exists(obj_saber))
		{
			if(place_meeting(x-1, y, obj_geometry) || place_meeting(x+1, y, obj_geometry))
			{
				//if(distance_to_object(obj_saber)>100)
				{
					grv = 0;
					hsp = 0;
					sprite_index = spr_archer_climb;
					if (place_meeting(x-1, y-1, obj_geometry))
					{
						image_xscale = -1;
					}
					if (place_meeting(x+1, y-1, obj_geometry))
					{
						image_xscale = 1;
					}
					ydiff = obj_saber.y-y;
					if (!place_meeting(x, y + sign(ydiff), obj_geometry)) 
					{
						y = y + sign(ydiff)*climb_height;
					}
					else
					{
						while(!place_meeting(x, y + sign(ydiff), obj_geometry))
						{
							y = y + sign(ydiff);
						}	
					}
				}
			}
			else
			{
				archer_state = archer_AI_states.follow;
			}
			/*
			if(distance_to_object(obj_saber)>300)
			{
				archer_state = archer_AI_states.follow;
			}
			if(!place_meeting(x-1, y-1, obj_geometry) && !place_meeting(x+1, y-1, obj_geometry))
			{		
				archer_state = archer_AI_states.follow;
			}*/
		}
		#endregion
	}
	break;
	case archer_AI_states.attack:
	{
		#region attack
		if(distance_to_object(obj_enemy)<max_range)
		{
			if(can_shoot <= 0)
			{
				hsp = 0;
				nearest_enemy = instance_nearest(x,y,obj_enemy);
				sprite_index = spr_archer_shoot;
				image_xscale = sign(nearest_enemy.x-x);
				can_shoot = 50;
			}
			if(distance_to_object(obj_saber)>500)
			{
				archer_state = archer_AI_states.follow;
			}		
		}
		else
		{
			archer_state = archer_AI_states.follow;
		}
		#endregion
	}
	break;
}
show_debug_message(archer_state);
can_shoot--;