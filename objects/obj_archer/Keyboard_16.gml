if(room!=rm_boss)
{
	if(object_exists(obj_saber_AI))
	{
		if(can_switch<=0)
		{
			global.current_player = obj_saber;
			instance_create_layer(obj_saber_AI.x, obj_saber_AI.y, "layer_player", obj_saber);
			obj_camera.follow = obj_saber;
			instance_destroy(obj_saber_AI)
			instance_create_layer(x, y, "layer_player", obj_archer_AI);
			instance_destroy(obj_archer);
			can_switch = 20;
		}
	}
}