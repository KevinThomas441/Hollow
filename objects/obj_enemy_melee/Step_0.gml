//If enemy health is lteq zero, destroy the 

if(hlth<=0)
{
	instance_destroy();
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
	vsp= 0;
}
y = y+vsp;
//Actions based on enemy states
switch(state)
{

	case MeleeEnemyStates.attack : 
	{
		hsp = 0;
	}
	
	break;
	
	
	case MeleeEnemyStates.move :
	{
		if(x < obj_player_parent.x)
		{
			hsp = 5;
			sprite_index = spr_enemy_sword_run;
			image_xscale = -1;
	
		}
		else
		{
			hsp = -5;
			sprite_index = spr_enemy_sword_run;
			image_xscale = 1;
		}
	}
	
	break;
	
	case MeleeEnemyStates.patrol :
	{
		//hsp = -4;
		sprite_index = spr_enemy_sword;
	}
	break;
}
can_attack--;