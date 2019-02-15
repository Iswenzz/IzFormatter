main()
{
thread runtrap5(360);
}

runtrap5(rotation)
{
	trab_n5= getent("dr_trap_5","targetname"); 	 //search the bush dr_trap_5
	level endon("trigger");
	
	while(1)
	{
		trab_n5 rotatePitch(rotation,15);		// the Z^ X> axis rotation (+360� , speed)
		trab_n5 waittill ("rotatedone");		//expected end of the movement
		wait(RandomInt(2));			   		// wait 0 to 4 seconds
	}		
}

