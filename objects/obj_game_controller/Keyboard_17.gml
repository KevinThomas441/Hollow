if(keyboard_check_pressed(ord("B")))
{
	instance_destroy(obj_saber);
	instance_destroy(obj_saber_AI);
	instance_destroy(obj_archer);
	instance_destroy(obj_archer_AI);
	room_goto(rm_boss);
}
if(keyboard_check_pressed(ord("1")))
{
   if window_get_fullscreen()
   {
      window_set_fullscreen(false);
   }
   else
   {
      window_set_fullscreen(true);
   }
}
if(keyboard_check_pressed(ord("N")))
{
	global.player_experience += 100;
}
if(keyboard_check_pressed(ord("2")))
{
	room_goto(rm_forest);
}
if(keyboard_check_pressed(ord("3")))
{
	room_goto(rm_mountains);
}
if(keyboard_check_pressed(ord("4")))
{
	room_goto(rm_boss);
}
