if(instance_exists(obj_saber))
{
	direction = point_direction(obj_archer_boss.x, (obj_archer_boss.y+100), obj_saber.x, obj_saber.y+(obj_saber.sprite_height/2));
}
image_angle = direction;
speed = 10;
already_hit=0;
