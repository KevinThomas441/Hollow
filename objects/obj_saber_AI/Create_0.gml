grv = 0.25;
hsp = 0;
vsp = 0;
move_speed = 4;
jump_height = -4;
jumping = false;
last_direction = 1;
climbing = false;
climb_height = 4;
can_attack = 0;
enum saber_AI_states
{
	run,
	wait,
	climb,
	attack	
};
wait_order = false;
saber_state = saber_AI_states.run;