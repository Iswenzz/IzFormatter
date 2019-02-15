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
thread training7();
}
training7()
{
	trab_t7a = getent("trap_g1","targetname");		//search the bush trap_g1
	trab_t7b = getent("trap_g2","targetname");

	while(1)
	{	
		trab_t7a movez (50,1,0);					//move to z
		trab_t7a waittill ("movedone");				//expected end of the movement
		
		trab_t7a movez (-50,1,0);					//move to -z
		trab_t7a waittill ("movedone");				//expected end of the movement
		
		wait(RandomInt(2));			   				// wait 0 to 2 seconds
		
		trab_t7b movez (-50,1,0);					//move to -z
		trab_t7b waittill ("movedone");				//expected end of the movement
		
		trab_t7b movez (50,1,0);					//move to z
		trab_t7b waittill ("movedone");				//expected end of the movement
		
		wait(RandomInt(2));			   				// wait 0 to 2 seconds
	}
}