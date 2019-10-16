//sets enemy stats to be inherited
enemy_health = 5;
enemy_damage = 1;

is_dead = false;

//sets stats for enemy pushback when hit
pushback_distance = 0;
pushback_time = 0;
push_direction = 1;

//kevin changes
hsp = 2.5;
vsp = 0;
grv = 0.1;
height_fear = 1;
flash = 0;
state = e_state.idle;
can_shoot = 5;
enum e_state
{
	idle,
	chase
}