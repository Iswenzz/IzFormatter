/*
###############################
                       _  __ ##
 ____           ____  | |/ / ##
|  _ \   / \   |  _ \ | ' /  ##
| | | | / _ \  | |_) ||  <   ##
| |_| |/ ___ \ |  _ <|| . \  ##
|____//_/   \_\|_| \_\|_|\_\ ##
###############################
*/

main()
{
thread runtrap8();
}
runtrap8()
{
	trab_n8a = getent("dr_trap_8a","targetname");	//search the bush dr_trap_8a
	trab_n8b = getent("dr_trap_8b","targetname");
	
	hurt_n8a = getent("dr_trap_8a_hurt","targetname");	//search the bush dr_trap_8a_hurt
	hurt_n8b = getent("dr_trap_8b_hurt","targetname");
	
	hurt_n8a enablelinkto();
    hurt_n8a linkto (trab_n8a);
	
	hurt_n8b enablelinkto();
    hurt_n8b linkto (trab_n8b);
	
	
	while(1)
	{	
		trab_n8a movey (50,1,0);					//move to y
		trab_n8b movey (-50,1,0);					//move to -y
		trab_n8b waittill ("movedone");				//expected end of the movement
		
		trab_n8a movey (-50,1,0);
		trab_n8b movey (50,1,0);
		trab_n8b waittill ("movedone");
		wait(RandomInt(10));			   			// wait 0 to 4 seconds
	}
		
}