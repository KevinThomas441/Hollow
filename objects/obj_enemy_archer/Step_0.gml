if(hlth<=0)
{
	instance_destroy();
}

switch(state)
{

	case ArcherEnemyStates.fire : 
	show_debug_message("Absolute value - ");
	show_debug_message(abs(x - obj_player_parent.x));
	//player_direction = point_direction(x,y,obj_player_parent.x,obj_player_parent.y);
	//image_angle = player_direction-270;
	//move_towards_point(obj_player_parent.x+150,obj_player_parent.y-50,3);
	if(reload==0)
	{
		//instance_create_depth(x,y,obj_player_parent.depth,obj_arrow)
		var arrow_instace = instance_create_layer(x,y,"layer_player",obj_arrow_enemy)
		sprite_index = spr_enemy_archer_shoot;
		image_xscale = 1*sign(obj_player_parent.x - x);
		with(arrow_instace)
		{
			other.reload = 1;
			other.alarm[0] = 30;
		}	
	}
	break;
	
	
	case ArcherEnemyStates.idle :	
	
	break;
	

}




