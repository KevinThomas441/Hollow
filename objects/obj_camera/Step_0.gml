x += (xTo - x)/25;
y = 385;

/*
if(object_exists(obj_saber) && !object_exists(obj_saber_AI))
{
	follow = obj_saber;
	//camera_set_view_target(view_camera[0], obj_saber);
	//view_visible[0] = true;
	//view_visible[1] = false;
	//view_enabled[0] = true;
	//view_enabled[1] = false;
	//view_visible[0] = 1;
	//view_visible[1] = 0;
	
	//view_set_visible(view_camera[0], visible);
	//view_set_visible(view_camera[1], 0);
	//xTo = obj_saber.x;
	//yTo = obj_saber.y;
}
else if(object_exists(obj_archer) && !object_exists(obj_archer_AI))
{
	follow = obj_archer;
	//view_visible[1] = true;
	//view_visible[0] = false;
	//view_enabled[1] = true;
	//view_enabled[0] = false;

	
	//view_set_visible(view_camera[1], visible);
	//view_set_visible(view_camera[0], 0);
	//xTo = obj_archer.x;
	//yTo = obj_archer.y;
}
else
{
	follow = noone;
}
/*
else
{
	follow = noone;
}
*/
if(follow != noone)
{
	if(follow == obj_saber)
	{
		xTo = follow.x + 100;
	}
	else if(follow == obj_archer)
	{
		xTo = follow.x + 300;
	}
	//yTo = follow.y;
}

//x1 = clamp(x, 512, room_width-512);
//y1 = clamp(y, 384, room_height-384);
var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
camera_set_view_mat(camera, vm);
