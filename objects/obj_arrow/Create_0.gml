if(instance_exists(obj_archer))
	direction = point_direction(obj_archer.x, obj_archer.y, mouse_x, mouse_y);

else if(instance_exists(obj_archer_AI))
	direction = point_direction(obj_archer_AI.x, obj_archer_AI.y, mouse_x, mouse_y);


image_angle = direction;
speed = 10;
already_hit=0;
