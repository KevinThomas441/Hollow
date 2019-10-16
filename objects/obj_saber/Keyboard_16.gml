if(object_exists(obj_archer_AI))
{
	if(can_switch <= 0)
	{
		global.current_player = obj_archer;
		instance_create_layer(obj_archer_AI.x, obj_archer_AI.y, "layer_player", obj_archer);
		obj_camera.follow = obj_archer;
		instance_destroy(obj_archer_AI)
		instance_create_layer(x, y, "layer_player", obj_saber_AI);
		instance_destroy(obj_saber);
		can_switch = 20;
	}
}