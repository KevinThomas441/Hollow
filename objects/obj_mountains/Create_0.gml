if(global.current_player == obj_saber)
{
	instance_create_layer(352, 544, "layer_player", obj_saber);
	instance_create_layer(256, 544, "layer_player", obj_archer_AI);
}
else if(global.current_player == obj_archer)
{
	instance_create_layer(352, 544, "layer_player", obj_saber_AI);
	instance_create_layer(256, 544, "layer_player", obj_archer);
}