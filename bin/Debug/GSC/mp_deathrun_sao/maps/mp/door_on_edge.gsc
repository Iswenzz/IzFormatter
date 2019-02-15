main()
{
	thread door_on_endge(); //dont even try to figure it out, kuz, u wount...
}

door_on_endge()
{
	door1 = getent("door1","targetname");
	door2 = getent("door2","targetname");
	door_trig = getent("door_trig","targetname");
	door_trig waittill("trigger", user);
	{
		door_trig delete();
		door1 rotateyaw(90,2);
		door2 rotateyaw(-90,2);
	}
}