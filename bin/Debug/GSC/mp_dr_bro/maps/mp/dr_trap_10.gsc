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
thread runtrap10();
}
runtrap10()
{
	trab_n10= getentarray("dr_trap_10","targetname"); //search the bush dr_trap_10
	if(isdefined(trab_n10))
	{
		for(i=0;i<trab_n10.size;i++)
 		{	
		trab_n10[i] thread movetrap10();	
		}	
	}
}

movetrap10()
{
		self rotateYaw(-360,30);		     // the Y^ X> axis rotation (+360° , speed)
		//self waittill ("rotatedone");		//expected end of the movement		
}
