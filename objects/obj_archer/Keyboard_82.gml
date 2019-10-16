if(object_exists(obj_saber_AI))
{
	if(can_order<=0)
	{
		if(obj_saber_AI.wait_order)
		{
			obj_saber_AI.wait_order = false;
		}
		else
		{
			obj_saber_AI.wait_order = true;
		}
		can_order=20;
	}
}