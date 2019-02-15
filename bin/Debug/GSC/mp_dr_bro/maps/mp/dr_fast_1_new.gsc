main()
{
thread runfast1();
}

runfast1()
{
	trab_f1a = getent("fast_trap_1a","targetname");		//search the bush fast_trap_1b
	trab_f1b = getent("fast_trap_1b","targetname");

	while(1)
	{	
		trab_f1a movex (180,3,1);					//move to x
		trab_f1b movex (-180,3,1);					//move to -x
		trab_f1b waittill ("movedone");				//expected end of the movement
		
		wait(RandomInt(2));			   				// wait 0 to x seconds
		
		trab_f1a movex (-180,3,1);					//move to -x
		trab_f1b movex (180,3,1);					//move to x
		trab_f1b waittill ("movedone");				//expected end of the movement
		
		wait(RandomInt(2));			   				// wait 0 to x seconds
	}
}

