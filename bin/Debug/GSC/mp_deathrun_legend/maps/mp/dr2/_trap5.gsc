main()

{

thread trap5();

}

trap5()
{
        trigger = getent("trigger_t1_","targetname");
	object = getent("t1_","targetname");
        trigger waittill ("trigger" , player );
        trigger delete();
	a = getent("t1a","targetname");
	b = getent("t1b","targetname");
	c = getent("t1c","targetname");
	d = getent("t1d","targetname");
	e = getent("t1e","targetname");
	f = getent("t1f","targetname");
	
	while(1)
	{
		a moveX(-64,0.5);
		b moveX(64,0.5);
		c moveX(-64,0.5);
		d moveX(64,0.5);
		e moveX(-64,0.5);
		f moveX(64,0.5);
		wait 1.5;
		a moveX(64,0.5);
		b moveX(-64,0.5);
		c moveX(64,0.5);
		d moveX(-64,0.5);
		e moveX(64,0.5);
		f moveX(-64,0.5);
		wait 1.5;
	}
}