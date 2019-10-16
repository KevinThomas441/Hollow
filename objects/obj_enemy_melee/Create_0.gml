/// @description set properties
//hspeed = 4;
//gravity = 0.25;
hlth = 5;
flash = 0;
move_speed = 4;
can_attack = 0;
grv = 0.25;
hsp = 4;
vsp = 0;

enum MeleeEnemyStates{
	attack,
	move,
	patrol
}


state = MeleeEnemyStates.patrol;

//image_xscale = sign(hspeed);