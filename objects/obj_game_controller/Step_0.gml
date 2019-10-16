if(global.player_experience>=global.max_experience)
{
	global.player_level+=1;
	global.max_experience+=100;
	global.saber_max_health+=1;
	global.saber_health = global.saber_max_health;
	global.archer_attack+=1;
}
