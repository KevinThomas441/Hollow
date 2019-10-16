nearest_enemy = instance_nearest(x,y,obj_enemy)


if(nearest_enemy != noone)
{
	direction = point_direction(obj_archer_AI.x, obj_archer_AI.y, nearest_enemy.x, nearest_enemy.y+(sprite_height/2));
	image_angle = direction;
	speed = 10;
}

