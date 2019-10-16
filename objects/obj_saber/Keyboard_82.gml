if(object_exists(obj_archer_AI))
{
	if(can_order<=0)
	{
		if(obj_archer_AI.wait_order)
		{
			obj_archer_AI.wait_order = false;
		}
		else
		{
			obj_archer_AI.wait_order = true;
		}
		can_order=20;
	}
}