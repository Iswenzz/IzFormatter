main()
{
thread training5();
}

training5()
{
	trab_t5 = getent("trap_e1","targetname");		//search the bush trap_e1
	
	while(1)
	{	
	trab_t5 rotatePitch(90,20);			// the Z^ X> axis rotation (+360� , speed)
	trab_t5 waittill ("rotatedone");	//expected end of the movement
	wait (2); 
	}
}

