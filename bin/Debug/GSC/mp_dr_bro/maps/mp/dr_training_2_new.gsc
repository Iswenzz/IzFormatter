main()
{
thread training2();
}

training2()
{
	trab_t2= getent("trap_b1","targetname"); 	 //search the bush trap_b1
	
	while(1)
	{
		trab_t2 rotateRoll(360,8);		     // the Y^ Z> axis rotation (+360� , speed)
		trab_t2 waittill ("rotatedone");	//expected end of the movement
		wait(RandomInt(2));			   // wait 0 to 4 seconds
	}	
			
}

