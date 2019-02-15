main()
{
	thread rotations();
}

rotations()
{
	rotate_obj = getentarray("fan2","targetname");
	if(isdefined(rotate_obj))
	{
		for(i=0; i<rotate_obj.size; i++)
		{
			rotate_obj[i] thread fan_rotate();
		}
	}
}

fan_rotate()
{
	if (!isdefined(self.speed))
	{
		self.speed = 2;
	}
	if (!isdefined(self.script_noteworthy))
	{
		self.script_noteworthy = "y";
	}
	while(true)
	{
		if (self.script_noteworthy == "z")
		{
			self rotateYaw(-360,self.speed);
		}
		else if (self.script_noteworthy == "x")
		{
			self rotateRoll(-360,self.speed);
		}
		else if (self.script_noteworthy == "y")
		{
			self rotatePitch(-360,self.speed);
		}
		wait ((self.speed)-0.1);
	}
}
