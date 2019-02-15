main()
{
thread platfrm ();
}

platfrm ()
{
	plat = getEnt ("mover1" , "targetname");
	while (1)
	{
	plat moveY (250 , 3 );
	wait 3 ;
	plat moveY (-250 , 3 );
	wait 3 ;
	}
}

