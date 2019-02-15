main()
{
thread runtrap9();
}

runtrap9()
{
	trab_n9 = [];
	trab_n9[0] = getent("dr_trap_9a","targetname");		//search the bush dr_trap_9a
	trab_n9[1] = getent("dr_trap_9b","targetname");
	trab_n9[2] = getent("dr_trap_9c","targetname");	
	trab_n9[3] = getent("dr_trap_9d","targetname");
	
	hurt_n9a = getent("dr_trap_9a_hurt","targetname");	//search the bush dr_trap_9a_hurt
	hurt_n9b = getent("dr_trap_9b_hurt","targetname");
	hurt_n9c = getent("dr_trap_9c_hurt","targetname");	
	hurt_n9d = getent("dr_trap_9d_hurt","targetname");
	
	hurt_n9a enablelinkto();
    hurt_n9a linkto (trab_n9[0]);
	hurt_n9b enablelinkto();
    hurt_n9b linkto (trab_n9[1]);	
	hurt_n9c enablelinkto();
    hurt_n9c linkto (trab_n9[2]);
	hurt_n9d enablelinkto();
    hurt_n9d linkto (trab_n9[3]);
	
	while(1)
	{	
	n9 = RandomInt(3);
	trab_n9[n9] rotateYaw(360,1);			// the Y^ X> axis rotation (+360� , speed)
/* AUTO 	trab_n9[n9] waittill ("rotatedone");	//expected end of the movement
	wait(RandomInt(2));			   				// wait 0 to 2 seconds
	}
		
*/}

