main()
{
	thread secret_wall();
}

secret_wall()
{
	wall = getent("inv_wall","targetname");
	trig = getent("inv_trig","targetname");

	while(true)
	{
		trig waittill("trigger", player);

		{
//AUTO 			iprintlnbold("YEAH" + " " + "^1"+ player.name + " "+ "^7unlocked the door, nice shot!!!");
			wall movez (-215,1,0.5,0.5); 
			wall waittill ("movedone");
			wait 10000 ;

		}

	}
}

