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
thread runtrap11();
}
runtrap11()
{
	trab_n11 = getent("dr_trap_11","targetname");
	hurt_n11 = getent("dr_trap_11_hurt","targetname");
	
	hurt_n11 enablelinkto();
    hurt_n11 linkto (trab_n11);
	
	
	while(1)
	{	
	trab_n11 movez (-130,1,0);					//move to Z
	trab_n11 waittill ("movedone");				//expected end of the movement
	trab_n11 movez (130,1,0);					//move to Z
	trab_n11 waittill ("movedone");				//expected end of the movement	
	wait(RandomInt(10));			   			// wait 0 to 8 seconds
	}
		
}