main()
{
	thread secret_wall();
}

secret_wall()
{
	wall = getent("inv_wall1","targetname");
	trig = getent("inv_trig1","targetname");

	while(true)
	{
		trig waittill("trigger", player);

		{
			iprintlnbold("Hooray" + " " + "^1"+ player.name + " "+ "^7found a plunger!");
			wall movez (-2,1,0.5,0.5); 
			wall waittill ("movedone");
			wait 10000 ;

		}

	}
}
