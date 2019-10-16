if (climbing) 
{
	if (!place_meeting(x, y + (2*climb_height), obj_geometry)) 
	{
		y = y + (2*climb_height);
	}
	else
	{
		while(!place_meeting(x, y + 1, obj_geometry))
		{
			y = y + 1;
		}
	}
}