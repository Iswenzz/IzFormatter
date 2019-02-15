main()
{
thread training1();
}

training1()
{
	trab_t1[0]= getent("trap_a1","targetname"); 	 //search the bush trap_a1
	trab_t1[1]= getent("trap_a2","targetname"); 	 
	
	t1 = RandomInt(1);
	trab_t1[t1] notsolid();	    // no colling bush
	//wait(RandomInt(4));			   // wait 0 to 4 seconds
			
}

