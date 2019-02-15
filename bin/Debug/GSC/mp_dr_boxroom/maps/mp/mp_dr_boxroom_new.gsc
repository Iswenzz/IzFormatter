main()
{
              maps\mp\_load::main();
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);

              thread trap1();
              thread trap2();
              thread trap3();
              thread trap4();
              thread trap5();
              thread trap6();
              thread trap7();
              thread trap8();
              thread door1();
             thread notrig();
}

trap1()
{
                  trig = getEnt("trig1","targetname");
                  rotate = getEnt("trap1","targetname");
                  
/* AUTO                  trig waittill("trigger");
                 trig delete();
                 
                 while( isdefined( rotate ) )
                 {    
                               rotate rotateroll(-360,3);
                               wait 2;
                 }
*/}

trap2()
{
      trig = getEnt("trig2","targetname");
      brush = getEnt("trap2","targetname");
     
            
/* AUTO                    trig waittill("trigger");
                   trig delete();

                  while(true)
                  {
                                          brush rotatePitch(360,2);
                                          wait 4;
                                          brush rotatePitch(-360,2);
                                         wait 4;
                   }    
*/}

trap3()
{
                   trig = getEnt( "trig3", "targetname" );
	brushGroup1 = getEntArray( "trap3.1", "targetname" );
	brushGroup2 = getEntArray( "trap3.2", "targetname" );

/* AUTO 	trig waittill("trigger");
	trig delete();
	
	brushGroup1[randomInt(brushGroup1.size)] notSolid();
	brushGroup2[randomInt(brushGroup2.size)] notSolid();
*/}

trap4()
{
      trig = getEnt("trig4","targetname");
      brush = getEnt("trap4","targetname");
       hurt = getEnt ("trap4_hurt", "targetname");
                 
                 hurt enablelinkto();
                 hurt linkto(brush);
            
/* AUTO                    trig waittill("trigger");
                   trig delete();
                  {
                                          brush moveY(-432,1);
                                          wait 2;
                                          brush moveY(432,1);
                  }
*/}

trap5()
{
      trig = getEnt("trig5","targetname");
      brush = getEnt("trap5","targetname");
     
            
/* AUTO                    trig waittill("trigger");
                   trig delete();

                  while(true)
                  {
                                          brush rotateYaw(360,2);
                                          wait 1;
                   }    
*/}

trap6()
{
      trig = getEnt("trig6","targetname");
      brush = getEnt("trap6","targetname");
       hurt = getEnt ("trap6_hurt", "targetname");
                 
                 hurt enablelinkto();
                 hurt linkto(brush);
            
/* AUTO                    trig waittill("trigger");
                   trig delete();
                  {
                                          brush moveZ(-1000,5);
                                          wait 3;
                                          brush moveZ(488,5);
                  }
*/}

trap7()
{
      trig = getEnt("trig7","targetname");
      brush = getEnt("trap7","targetname");
       hurt = getEnt ("trap7_hurt", "targetname");
                 
                 hurt enablelinkto();
                 hurt linkto(brush);
            
/* AUTO                    trig waittill("trigger");
                   trig delete();
                  {
                                          brush moveY(2000,4);
                                          wait 3;
                                          brush moveY(-2000,4);
                  }
*/}

trap8()
{
      trig = getEnt("trig8","targetname");
      brush = getEnt("trap8","targetname");
     
            
/* AUTO                    trig waittill("trigger");
                   trig delete();
                  {
                                          brush moveX(-512,2);
                                          wait 2;
                                          brush moveX(512,2);
                  }    
*/}

door1()
{
      trig = getEnt("door1_trig","targetname");
      brush = getEnt("door1","targetname");
     
            
                   trig waittill("trigger");
                   trig delete();
                  {
                                          brush moveZ(176,3);
                                          wait 2;

                                   players = getentarray("player", "classname");
//AUTO 	               iprintlnbold("^1WARNING:^4ACTIVATOR ALERT^1!");
                   }
}

notrig()
{
            brush = getEnt("notrig","targetname");

            while(1)
            {
                   brush moveX(512,3);
                   wait 3;
                  brush moveX(-512,3);
                  wait 3;
            }
}

