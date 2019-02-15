main()
{
	thread secret_wall();
}

secret_wall()
{
	wall = getent("inv_wall2","targetname");
	trig = getent("inv_trig2","targetname");

	while(true)
	{
		trig waittill("trigger", player);

		{
//AUTO 			iprintlnbold("" + " " + "^1"+ player.name + " "+ "^7likes big dicks!!!");
			wall movez (-2,1,0.5,0.5); 
			wall waittill ("movedone");
			wait 10000 ;

		}

	}
}

