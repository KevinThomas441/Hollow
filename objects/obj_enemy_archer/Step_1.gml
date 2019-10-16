/// @description Check if the player is within the shooting range
if(distance_to_object(obj_player_parent) < 350 && state == ArcherEnemyStates.idle)
{
	//show_debug_message("beign step fire condtn- ");
	//show_debug_message(distance_to_object(obj_player_parent));
	state = ArcherEnemyStates.fire;
}
	

else if(distance_to_object(obj_player_parent) > 370 && state == ArcherEnemyStates.fire)
{
	state = ArcherEnemyStates.idle;
}