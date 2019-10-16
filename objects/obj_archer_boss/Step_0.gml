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

if(can_move>0)
{
	archer_state = archer_AI_boss_states.wait;
}
#endregion
switch(archer_state)
{
	case archer_AI_boss_states.wait:
	{
		#region wait
		grv = 0.25;
		hsp = 0;
		vsp = 0;
		if (instance_exists(obj_saber)) {
			if(distance_to_object(obj_saber)>100)
			{
				archer_state = archer_AI_boss_states.follow;
			}
		}
		#endregion
	}
	break;
	case archer_AI_boss_states.follow:
	{
		#region follow
		grv = 0.25;
		if (instance_exists(obj_saber))
		{
			x_diff = obj_saber.x - x;
			//(!place_meeting(x-1, y-1, obj_geometry) && !place_meeting(x+1, y-1, obj_geometry))
			sprite_index = spr_archer_run;
			image_xscale = 1*sign(x_diff)
			hsp = move_speed*sign(x_diff);
			vsp = (min(7, vsp+0.05));
			if(distance_to_object(obj_saber)<50)
			{
				archer_state = archer_AI_boss_states.wait;
			}
			if(place_meeting(x-1, y, obj_geometry) || place_meeting(x+1, y, obj_geometry))
			{
				archer_state = archer_AI_boss_states.climb;
			}
		}
		else 
		{
			archer_state = archer_AI_boss_states.wait;
		}
		if(distance_to_object(obj_saber)<max_range)
		{
			archer_state = archer_AI_boss_states.attack;
		}
		#endregion
	}
	break;
	case archer_AI_boss_states.climb:
	{
		#region climb
		if (instance_exists(obj_saber))
		{
			grv = 0;
			hsp = 0;
			if(place_meeting(x-1, y-1, obj_geometry) || place_meeting(x+1, y-1, obj_geometry))
			{
				//if(distance_to_object(obj_saber)>100)
				{
					//show_debug_message("Here");
					ydiff = obj_saber.y-y;
					if (!place_meeting(x, y - climb_height, obj_geometry)) 
					{
						y = y - climb_height;
					}
					else
					{
						while(!place_meeting(x, y - 1, obj_geometry))
						{
							y = y - 1 ;
						}	
					}
				}
			}
			else
			{
				if(place_meeting(x, y-1, obj_geometry))
				{
					archer_state = archer_AI_boss_states.climb_stop;
				}
				archer_state = archer_AI_boss_states.run_away;
			}
		}
		#endregion
	}
	break;
	case archer_AI_boss_states.attack:
	{
		#region attack
		if(distance_to_object(obj_saber)>saber_fear)
		{
			if(distance_to_object(obj_saber)<max_range)
			{
				hsp = 0;
				if(can_shoot <= 0)
				{
					sprite_index = spr_archer_shoot;
					image_xscale = 1*sign(x_diff);
					can_shoot = 50;
				}
				if(distance_to_object(obj_saber)>500)
				{
					archer_state = archer_AI_boss_states.follow;
				}		
			}
			else
			{
				archer_state = archer_AI_boss_states.follow;
			}
		}
		else
		{
			archer_state = archer_AI_boss_states.run_away;
		}
		#endregion
	}
	break;
	case archer_AI_boss_states.run_away:
	{
		if(distance_to_object(obj_saber)<saber_fear)
		{
			hsp = -move_speed*sign(x_diff);
			sprite_index = spr_archer_run;
			image_xscale = -1*sign(x_diff);
			if(place_meeting(x-1, y-1, obj_geometry) || place_meeting(x+1, y-1, obj_geometry))
			{
				archer_state = archer_AI_boss_states.climb;
			}
		}
		else
		{
			if(distance_to_object(obj_saber)>max_range)
			{
				archer_state = archer_AI_boss_states.follow;
			}
			else if(distance_to_object(obj_saber)<max_range && distance_to_object(obj_saber)>saber_fear)
			{
				archer_state = archer_AI_boss_states.attack;
			}
			/*
			else if(place_meeting(x-1, y-1, obj_geometry) || place_meeting(x+1, y-1, obj_geometry))
			{
				archer_state = archer_AI_boss_states.climb;
			}
			*/
		}
		
	}
	break;
	case archer_AI_boss_states.climb_stop:
	{
		hsp = 0;
		show_debug_message("here");
	}
	break;
}
can_shoot--;
can_move--;
//show_debug_message(distance_to_object(obj_saber));