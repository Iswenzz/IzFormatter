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
thread training6();
}
training6()
{
	trab_t6 = [];
	trab_t6[0] = getent("trap_f1","targetname");		//search the bush dr_trap_9a
	trab_t6[1] = getent("trap_f2","targetname");
	trab_t6[2] = getent("trap_f3","targetname");	

	
	hurt_t6a = getent("trap_f1_hurt","targetname");		//search the bush dr_trap_9a_hurt
	hurt_t6b = getent("trap_f2_hurt","targetname");
	hurt_t6c = getent("trap_f3_hurt","targetname");	

	
	hurt_t6a enablelinkto();
    hurt_t6a linkto (trab_t6[0]);
	hurt_t6b enablelinkto();
    hurt_t6b linkto (trab_t6[1]);	
	hurt_t6c enablelinkto();
    hurt_t6c linkto (trab_t6[2]);
	
	while(1)
	{	
	t6 = RandomInt(3);
	trab_t6[t6] rotateYaw(360,1);			// the z axis rotation
	trab_t6[t6] waittill ("rotatedone");	//expected end of the movement
	wait(RandomInt(2));			   			// wait 0 to 2 seconds
	}
}