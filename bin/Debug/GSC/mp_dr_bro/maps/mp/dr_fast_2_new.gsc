main()
{
thread runfast2();
}

runfast2()
{
	trab_f2 = [];
	trab_f2[0] = getent("fast_trap_2a","targetname");		//search the bush fast_trap_2a
	trab_f2[1] = getent("fast_trap_2b","targetname");
	trab_f2[2] = getent("fast_trap_2c","targetname");	
	
	hurt_t2a = getent("fast_trap_2a_hurt","targetname");	//search the bush fast_trap_2a_hurt
	hurt_t2b = getent("fast_trap_2b_hurt","targetname");
	hurt_t2c = getent("fast_trap_2c_hurt","targetname");	

	
	hurt_t2a enablelinkto();
    hurt_t2a linkto (trab_f2[0]);         			// link tigger_hurt to script bushmodel
	hurt_t2b enablelinkto();
    hurt_t2b linkto (trab_f2[1]);	
	hurt_t2c enablelinkto();
    hurt_t2c linkto (trab_f2[2]);

	while(1)
	{	
	t2 = RandomInt(3);
	trab_f2[t2] rotatePitch(360,.6);		// the y^ z> axis rotation (+360� , speed)
	trab_f2[t2] waittill ("rotatedone");	//expected end of the movement
	wait(RandomInt(1));			   			// wait 0 to 1 seconds
	}
}

