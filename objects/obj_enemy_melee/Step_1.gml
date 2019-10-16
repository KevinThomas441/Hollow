/// @description sense environment before step
// You can write your code in this editor

//Check distance from player object. If it is nearby, run towards him to attack
if(distance_to_object(obj_player_parent) < 80 && state == MeleeEnemyStates.patrol)
{
	state = MeleeEnemyStates.move;
}

else if(distance_to_object(obj_player_parent) > 80)
{
	state = MeleeEnemyStates.patrol;
}

else if(distance_to_object(obj_player_parent) < 4 && state == MeleeEnemyStates.move)
{
	state = MeleeEnemyStates.attack;
}

show_debug_message(state);