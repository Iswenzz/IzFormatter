main()
{
	thread ac130();
}

ac130()
{
	ac130 = getent("ac130","targetname");
	trig = getent("trigac","targetname");

	while(true)
	{
		trig waittill("trigger", player);
		{
			ac130 movey (-60000,50,30,20); 
			ac130 waittill ("movedone");
			ac130 delete();
			wait 10000 ;
		}

	}
}

