grv = 0.25;
hsp = 0;
vsp = 0;
move_speed = 5;
jump_height = -8;
jumping = false;
last_direction = 1;
climbing = false;
climb_height = 4;
can_shoot = 0;
max_range = 400;
enum archer_AI_states
{
	follow,
	wait,
	climb,
	climb_stop,
	attack	
};
wait_order = false;
archer_state = archer_AI_states.wait;