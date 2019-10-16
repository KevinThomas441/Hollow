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
can_move = 0;
max_range = 400;
saber_fear = 200;
enum archer_AI_boss_states
{
	follow,
	wait,
	climb,
	climb_stop,
	attack,
	run_away
};
wait_order = false;
archer_state = archer_AI_states.wait;