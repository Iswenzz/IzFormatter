main()
{
thread runtrap7();
}

runtrap7()
{
	trab_n7 = getent("dr_trap_7","targetname");
	hurt_n7 = getent("dr_trap_7_hurt","targetname");
	
	hurt_n7 enablelinkto();
    hurt_n7 linkto (trab_n7);
	
	
	while(1)
	{	
		trab_n7 movez (15,1,0);						//move to Z
/* AUTO 		trab_n7 waittill ("movedone");				//expected end of the movement
		
		trab_n7 movez (-15,1,0);
		trab_n7 waittill ("movedone");
		wait(RandomInt(10));			   			// wait 0 to 4 seconds
	}
		
*/}

