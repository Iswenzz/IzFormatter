main()
{
thread runtrap2();
}

runtrap2()
{
	trab_n2= getent("dr_trap_2","targetname"); 	 //search the bush dr_trap_2
	
	while(1)
	{
		trab_n2 rotateRoll(360,8);		    // the Y^ Z> axis rotation (+360� , speed)
/* AUTO 		trab_n2 waittill ("rotatedone");	//expected end of the movement
		wait(RandomInt(2));			  		// wait 0 to 2 seconds
	}		
*/}

