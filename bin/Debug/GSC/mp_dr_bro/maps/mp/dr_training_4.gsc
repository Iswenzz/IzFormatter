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
thread training4();
}
training4()
{
	trab_t4 = [];
	trab_t4[0] = getent("trap_d1","targetname");		//search the bush trap_d1
	trab_t4[1] = getent("trap_d2","targetname");
	
	while(1)
	{	
	t4 = RandomInt(2);
	trab_t4[t4] rotateYaw(360,5);				// the y^ X> axis rotation (+360° , speed)
	trab_t4[t4] waittill ("rotatedone");		//expected end of the movement
	wait(RandomInt(2));			   			// wait 0 to 2 seconds
	}
}