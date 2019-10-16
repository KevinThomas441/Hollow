if(mouse_check_button_pressed(mb_left))
{
	with(other)
	{
		flash = 3;
		global.archer_health-=global.saber_attack;
	}
}