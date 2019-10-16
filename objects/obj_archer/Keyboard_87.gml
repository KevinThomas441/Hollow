if (climbing) 
{
	if ((place_meeting(x+1, y, obj_geometry)) || (place_meeting(x-1, y, obj_geometry)))
	{
		if (!place_meeting(x, y - climb_height, obj_geometry)) 
		{
			y = y - climb_height;
		}
		else
		{
			while(!place_meeting(x, y - 1, obj_geometry))
			{
				y = y - 1;
			}
		}
	}
}