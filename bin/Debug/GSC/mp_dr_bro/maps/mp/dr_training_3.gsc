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
thread training3();
}
training3()
{
	trab_t3 = [];
	trab_t3[0] = getent("trap_c1","targetname");		//search the bush trap_c1
	trab_t3[1] = getent("trap_c2","targetname");
	trab_t3[2] = getent("trap_c3","targetname");	
	
	hurt_t3a = getent("trap_c1_hurt","targetname");		//search the bush trap_c1_hurt
	hurt_t3b = getent("trap_c2_hurt","targetname");
	hurt_t3c = getent("trap_c3_hurt","targetname");	

	
	hurt_t3a enablelinkto();
    hurt_t3a linkto (trab_t3[0]);
	hurt_t3b enablelinkto();
    hurt_t3b linkto (trab_t3[1]);	
	hurt_t3c enablelinkto();
    hurt_t3c linkto (trab_t3[2]);

	while(1)
	{	
	t3 = RandomInt(3);
	trab_t3[t3] rotateRoll(360,1);			// the y^ z> axis rotation (+360° , speed)
	trab_t3[t3] waittill ("rotatedone");	//expected end of the movement
	wait(RandomInt(4));			   			// wait 0 to 4 seconds
	}
}