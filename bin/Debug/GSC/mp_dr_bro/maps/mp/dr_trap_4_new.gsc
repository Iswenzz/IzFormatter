main()
{
thread runtrap4(180);
}

runtrap4(rotation)
{
	trab_n4= getent("dr_trap_4","targetname"); 	 //search the bush dr_trap_4
	level endon("trigger");
	
	trab_n4 rotateYaw(rotation,1);				// the Y^ X> axis rotation (+360� , speed)
	trab_n4 waittill ("rotatedone");			//expected end of the movement
	//wait(RandomInt(4));			   			// wait 0 to 4 seconds
	
}

