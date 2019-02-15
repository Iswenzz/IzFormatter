main()
{
thread runtrap1();
}

runtrap1()
{
	trab_n1= getent("dr_trap_1","targetname"); 	 //search the bush dr_trap_1
	level endon("trigger");
	
	while(1)
	{
		trab_n1 rotateYaw(360,15);		     // the Y^ X> axis rotation (+360� , speed)
		trab_n1 waittill ("rotatedone");	//expected end of the movement
		//wait(RandomInt(4));			   // wait 0 to 4 seconds
	}		
}

