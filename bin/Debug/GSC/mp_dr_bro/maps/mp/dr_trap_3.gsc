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
thread runtrap3();
}

runtrap3()
{
	trab_n3 = [];
	trab_n3[0]= getent("dr_trap_3[0]","targetname"); 	//search the bush dr_trap_3
	trab_n3[1]= getent("dr_trap_3[1]","targetname");
	trab_n3[2]= getent("dr_trap_3[2]","targetname");
	trab_n3[3]= getent("dr_trap_3[3]","targetname");
	trab_n3[4]= getent("dr_trap_3[4]","targetname");
	trab_n3[5]= getent("dr_trap_3[5]","targetname");
	trab_n3[6]= getent("dr_trap_3[6]","targetname");
	trab_n3[7]= getent("dr_trap_3[7]","targetname");
	trab_n3[8]= getent("dr_trap_3[8]","targetname");
	trab_n3[9]= getent("dr_trap_3[9]","targetname");
	trab_n3[10]= getent("dr_trap_3[10]","targetname");
		
	while(1) 											//infinity loop
	{
		n3 = RandomInt(10);
		trab_n3[n3] rotatePitch(-30,1);					// the Z^ X> axis rotation (+360° , speed)
		trab_n3[n3] waittill ("rotatedone");			//expected end of the movement
		trab_n3[n3] rotatePitch(30,1);
		trab_n3[n3] waittill ("rotatedone");	
		wait(RandomInt(2));			   					// wait 0 to 2 seconds
	}			
}	
