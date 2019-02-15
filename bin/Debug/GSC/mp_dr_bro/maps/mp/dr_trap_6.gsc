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
thread runtrap6();
}
runtrap6()
{
	trab_n6= getentarray("dr_trap_6","targetname"); //search the bush dr_trap_6
	if(isdefined(trab_n6))
	{
		for(i=0;i<trab_n6.size;i++)
 		{	
		trab_n6[i] thread movetrap6();	
		}	
	}
}

movetrap6()
{
		t6 = RandomInt(1);
		if(t6 != 1 ) self notsolid(); 		
}
