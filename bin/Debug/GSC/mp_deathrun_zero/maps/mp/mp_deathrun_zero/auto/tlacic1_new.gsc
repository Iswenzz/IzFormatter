main()
{
thread platfrm ();
}

platfrm ()
{
	plat = getEnt ("tlacic1" , "targetname");
	while (1)
	{
	plat moveX (240 , 2 );
	wait 2 ;
	plat moveX (-240 , 2 );
	wait 2 ;
	}
}

