main()//Map By Phill580
{
     maps\mp\_load::main();
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);

//AUTO      ambientPlay("amb_eye");

     Precacheitem("brick_blaster_mp");
     PreCacheItem("frag_grenade_mp");
     PreCacheItem("g36c_mp");
     PreCacheItem("g3_mp");
//AUTO      PreCacheItem("ak74u_mp");
//AUTO      PreCacheItem("ak47_mp");
     PreCacheItem("p90_mp");
     PreCacheItem("m40a3_mp");
     PreCacheItem("rpg_mp");

     
//AUTO      thread addTestClients();
     thread door();
     thread trap1();
     thread trap2();
     thread trap3();
     thread trap4();
     thread trap5();
     thread trap6();
     thread trap7();
     thread trap8();
     thread trap9();
     thread trap10();
     thread trap11();
//AUTO      thread sniper();
//AUTO      thread old();
     thread noobtube();
     thread brickgunpuzzle1();
     thread brickgunpuzzle2();
     thread brickgunpuzzle3();
     thread credits();
     thread md();
     thread gem();
     thread t2d();
     thread king();
     thread glovy();
     thread lozza();
     thread tayz();
     thread y_v();
     thread phill();
     thread ammobox();



            addTriggerToList("trig1");
            addTriggerToList("trig2");
            addTriggerToList("trig3");
            addTriggerToList("trig4");
            addTriggerToList("trig5");
            addTriggerToList("trig6");
            addTriggerToList("trig7");
            addTriggerToList("trig8");
            addTriggerToList("trig9");
            addTriggerToList("trig10");
            addTriggerToList("trig11");
}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

door()
{     
     brush1 = getEnt("door1","targetname"); 
     brush2 = getEnt("door2","targetname");
     brush3 = getEnt("door3","targetname");
     brush4 = getEnt("door4","targetname"); 

     {
     wait 5;
     brush1 movez(-100,1);
     brush2 moveZ(100,1);
     brush3 moveX(-100,1);
     brush4 moveX(100,1);
     wait 2;
     brush1 delete();
     brush2 delete();
     brush3 delete();
     brush4 delete();
     }
}

trap1()
{
      trig = getEnt("trig1","targetname");
	level endon("trigger");
      brush = getEnt("trap1","targetname");

      trig waittill("trigger");
      trig delete();
      {
                  brush moveZ(-152,1);
                  wait 3;
                  brush moveZ(152,1);
                  wait 3;
      }
}

trap2()
{
        trig = getEnt( "trig2", "targetname" );
	level endon("trigger");
	brushGroup1 = getEntArray( "trap2.1", "targetname" );
	brushGroup2 = getEntArray( "trap2.2", "targetname" );

	trig waittill("trigger");
	trig delete();
	
	brushGroup1[randomInt(brushGroup1.size)] notSolid();
	brushGroup2[randomInt(brushGroup2.size)] notSolid();

}

trap3()
{
      trig = getEnt("trig3","targetname");
	level endon("trigger");
      brush = getEnt("trap3","targetname");

      trig waittill("trigger");
      trig delete();
      {
                  brush moveY(528,0.5);
                  wait 3;
                  brush moveY(-528,2);
                  wait 3;
      }
}   

trap4()
{
      trig = getEnt("trig4","targetname");
	level endon("trigger");
      brush = getEnt("trap4","targetname");

      trig waittill("trigger");
      trig delete();

      while(true)
      {
           brush rotateYaw(360,1);
           wait 1;
      }
}

trap5()
{
      trig = getEnt("trig5","targetname");
	level endon("trigger");
      brush1 = getEnt("trap5.1","targetname");
      brush2 = getEnt("trap5.2","targetname");

      trig waittill("trigger");
      trig delete();
      
      while(true)
      {
            brush1 moveY(380,1);            
            brush2 moveY(-380,1);
            wait 1;
            brush1 moveY(-380,1);
            brush2 moveY(380,1);
            wait 1;
      }
}

trap6()
{
      trig = getEnt("trig6","targetname");
	level endon("trigger");
      brush1 = getEnt("trap6.1","targetname");
      brush2 = getEnt("trap6.2","targetname");

      trig waittill("trigger");
      trig delete();
      
      while(true)
      {
        brush1 rotateRoll(180,2);
        wait 3;
        brush2 rotateRoll(-180,2);
        wait 3;
      }
}

trap7()
{
      trig = getEnt("trig7","targetname");
	level endon("trigger");
      brush = getEnt("trap7","targetname");
      hurt = getEnt("trap7_hurt","targetname");

      hurt enablelinkto();
      hurt linkto(brush);

      trig waittill("trigger");
      trig delete();
      {
          brush moveY(528,0.7);
          wait 2;
          brush moveY(-528,3);
      }
}

trap8()
{
      trig = getEnt("trig8","targetname");
	level endon("trigger");
      brush = getEnt("trap8","targetname");

      trig waittill("trigger");
      trig delete();

      while(true)
      {
           brush rotateRoll(360,2);
           wait 1;
      }
}

trap9()
{
      trig = getEnt("trig9","targetname");
	level endon("trigger");
      brush = getEnt("trap9","targetname");

      trig waittill("trigger");
      trig delete();      
      {
           brush moveZ(176,0.1);
           wait 1;
           brush moveZ(-176,2); 
      }
}

trap10()
{
      trig = getEnt("trig10","targetname");
	level endon("trigger");
      brush = getEnt("trap10","targetname");

      trig waittill("trigger");
      trig delete();      
      brush delete();
}

trap11()
{
      trig = getEnt("trig11","targetname");
	level endon("trigger");
      brush = getEnt("trap11","targetname");
      hurt = getEnt("trap11_hurt","targetname");

      hurt enablelinkto();
      hurt linkto(brush);


      trig waittill("trigger");
      trig delete();      
      {
      brush moveZ(70,1);
      wait 4;
      brush moveZ(-70,1);
      }
}

Sniper()
{
	level.snip_trig = getEnt( "trigger_sniper", "targetname");
	jump = getEnt( "jumper_sniper", "targetname" );
	acti = getEnt( "activator_sniper", "targetname" );
        trig = getEnt("trigger_old","targetname");
	
	while(1)
	{
		level.snip_trig waittill( "trigger", player );
		if( !isDefined( level.snip_trig ) )
			return;
		
		trig delete();
                level.nt_trig delete();
		player SetPlayerAngles( jump.angles );
		player setOrigin( jump.origin );
//AUTO 		player TakeAllWeapons();
//AUTO 		player GiveWeapon( "remington700_mp" );
//AUTO 		player giveMaxAmmo( "remington700_mp" );
		level.activ setPlayerangles( acti.angles );
		level.activ setOrigin( acti.origin );
//AUTO 		level.activ TakeAllWeapons();
//AUTO 		level.activ GiveWeapon( "remington700_mp" );
//AUTO 		level.activ GiveMaxAmmo( "remington700_mp" );
		wait 0.05;
//AUTO 		player switchToWeapon( "remington700_mp" );
//AUTO 		level.activ SwitchToWeapon( "remington700_mp" );
//AUTO 		iPrintlnBold( " ^8" + player.name + " has chosen Sniper room!" );
		
                                     while( isAlive( player ) && isDefined( player ) )
			wait 1;
	}
}

Old()
{
      trig = getEnt("trigger_old","targetname");
      brush = getEnt("old_door","targetname");

      trig waittill("trigger", player);
      trig delete();
      level.snip_trig delete();
      level.nt_trig delete();
//AUTO       iPrintlnBold( " ^6" + player.name + " has chosen Old!" );	
      {
        brush moveZ(-144,1);
        wait 1;
      }
}      			

brickgunpuzzle1()
{
      trig = getEnt("spike1_trig","targetname");
      brush = getEnt("spike1","targetname");

      trig waittill("trigger");
      trig delete();
      {
          brush moveZ(-80,3);
          wait 1;
      }
}

brickgunpuzzle2()
{
      trig = getEnt("spike2_trig","targetname");
      brush = getEnt("spike2","targetname");

      trig waittill("trigger");
      trig delete();
      {
          brush moveZ(-80,3);
          wait 1;
      }
}

brickgunpuzzle3()
{
      trig = getEnt("spike3_trig","targetname");
      brush = getEnt("spike3","targetname");

      trig waittill("trigger");
      trig delete();
      {
          brush moveZ(-80,3);
          wait 1;
      }
}  

noobtube()
{
	level.nt_trig = getEnt( "trigger_nt", "targetname");
	jump = getEnt( "nt_jumper", "targetname" );
	acti = getEnt( "nt_activator", "targetname" );
        trig = getEnt("trigger_old","targetname");
	
	while(1)
	{
		level.nt_trig waittill( "trigger", player );
		if( !isDefined( level.nt_trig ) )
			return;
		
                level.snip_trig delete();
		trig delete();
		player SetPlayerAngles( jump.angles );
		player setOrigin( jump.origin );
//AUTO 		player TakeAllWeapons();
//AUTO 		player GiveWeapon( "frag_grenade_mp" );               
//AUTO                 player GiveMaxAmmo( "frag_grenade_mp" );                               
		level.activ setPlayerangles( acti.angles );
		level.activ setOrigin( acti.origin );
//AUTO 		level.activ TakeAllWeapons();
//AUTO 		level.activ GiveWeapon( "frag_grenade_mp" );
//AUTO                 level.activ GiveMaxAmmo( "frag_grenade_mp" );		
//AUTO 		wait 0.05;
//AUTO 		player switchToWeapon( "frag_grenade_mp" );
//AUTO 		level.activ SwitchToWeapon( "frag_grenade_mp" );
//AUTO 		iPrintlnBold( " ^4" + player.name + " has chosen Nade Area!" );
		
                                     while( isAlive( player ) && isDefined( player ) )
//AUTO 			wait 1;
	}
}

addTestClients()
{
	setDvar("scr_testclients", "");
	wait 1;
	for(;;)
	{
		if(getdvarInt("scr_testclients") > 0)
			break;
		wait 1;
	}
	testclients = getdvarInt("scr_testclients");
	setDvar( "scr_testclients", 0 );
	for(i=0;i<testclients;i++)
	{
		ent[i] = addtestclient();

		if (!isdefined(ent[i]))
		{
//AUTO 			println("Could not add test client");
			wait 1;
			continue;
		}
		ent[i].pers["isBot"] = true;
		ent[i] thread TestClient("autoassign");
	}
	thread addTestClients();
}

TestClient(team)
{
	self endon( "disconnect" );

	while(!isdefined(self.pers["team"]))
		wait .05;
		
	self notify("menuresponse", game["menu_team"], team);
	wait 0.5;
}

credits()
{
	for(;;)
   {
	level waittill("connected", player);
        {
			wait 10;
        hud_clock = NewHudElem();
	hud_clock.alignX = "center";
	hud_clock.alignY = "middle";
	hud_clock.horzalign = "center";
	hud_clock.vertalign = "middle";
	hud_clock.alpha = 1;
	hud_clock.x = 0;
	hud_clock.y = 0;
	hud_clock.font = "objective";
	hud_clock.fontscale = 3;
	hud_clock.glowalpha = 1;
	hud_clock.glowcolor = (9,9,9);
	hud_clock.label = &"^9 Map By Phill580!";
                   hud_clock SetPulseFX( 40, 5400, 200 );
                   wait 3;
         }
   }
}                                   

phill()
{
	wait 10;
	
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
	{
		if( GetSubStr( players[i] GetGuid(), 24, 32 ) == "50d109d9" )
		{
//AUTO 			players[i] iprintLnBold("RPG!");
//AUTO 			players[i] TakeAllWeapons();
//AUTO 			players[i] GiveWeapon("rpg_mp");
//AUTO 			players[i] GiveMaxAmmo("rpg_mp");
			wait 0.05;
//AUTO 			players[i] SwitchToWeapon("rpg_mp");                                                                                               
		}
	}
}

md()
{
	wait 10;
	
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
	{
		if( GetSubStr( players[i] GetGuid(), 24, 32 ) == "" )
		{
//AUTO 			players[i] iprintLnBold("MD!");
//AUTO 			players[i] TakeAllWeapons();
//AUTO 			players[i] GiveWeapon("p90_mp");
//AUTO 			players[i] GiveMaxAmmo("p90_mp");
			wait 0.05;
//AUTO 			players[i] SwitchToWeapon("p90_mp");
		}
	}
}

gem()
{
	wait 10;
	
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
	{
		if( GetSubStr( players[i] GetGuid(), 24, 32 ) == "" )
		{
//AUTO 			players[i] iprintLnBold("GEM!");			
//AUTO 			players[i] GiveWeapon("g36c_mp");
//AUTO 			players[i] GiveMaxAmmo("g36c_mp");
			wait 0.05;
//AUTO 			players[i] SwitchToWeapon("g36c_mp");
		}
	}
}

t2d()
{
	wait 10;
	
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
	{
		if( GetSubStr( players[i] GetGuid(), 24, 32 ) == "d586bc100" )
		{
//AUTO 			players[i] iprintLnBold("T2D!");			
//AUTO 			players[i] GiveWeapon("m40a3_mp");
//AUTO 			players[i] GiveMaxAmmo("m40a3_mp");
			wait 0.05;
//AUTO 			players[i] SwitchToWeapon("m40a3_mp");
		}
	}
}

king()
{
	wait 10;
	
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
	{
		if( GetSubStr( players[i] GetGuid(), 24, 32 ) == "daf8a792" )
		{
//AUTO 			players[i] iprintLnBold("KING!");			
//AUTO 			players[i] GiveWeapon("p90_mp");
//AUTO 			players[i] GiveMaxAmmo("p90_mp");
			wait 0.05;
//AUTO 			players[i] SwitchToWeapon("p90_mp");
		}
	}
}

glovy()
{
	wait 10;
	
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
	{
		if( GetSubStr( players[i] GetGuid(), 24, 32 ) == "0CBDB481" )
		{
//AUTO 			players[i] iprintLnBold("GLOVY!");			
//AUTO 			players[i] GiveWeapon("ak74u_mp");
//AUTO 			players[i] GiveMaxAmmo("ak74u_mp");
			wait 0.05;
//AUTO 			players[i] SwitchToWeapon("ak74u_mp");
		}
	}
}

lozza()
{
	wait 10;
	
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
	{
		if( GetSubStr( players[i] GetGuid(), 24, 32 ) == "daab769c" )
		{
//AUTO 			players[i] iprintLnBold("LOZZA!");			
//AUTO 			players[i] GiveWeapon("g3_mp");
//AUTO 			players[i] GiveMaxAmmo("g3_mp");
			wait 0.05;
//AUTO 			players[i] SwitchToWeapon("g3_mp");
		}
	}
}

tayz()
{
	wait 10;
	
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
	{
		if( GetSubStr( players[i] GetGuid(), 24, 32 ) == "d6f130c4" )
		{
//AUTO 			players[i] iprintLnBold("TAYZ!");			
//AUTO 			players[i] GiveWeapon("ak74u_mp");
//AUTO 			players[i] GiveMaxAmmo("ak74u_mp");
			wait 0.05;
//AUTO 			players[i] SwitchToWeapon("ak74u_mp");
		}
	}
}

y_v()
{
	wait 10;
	
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
	{
		if( GetSubStr( players[i] GetGuid(), 24, 32 ) == "ea174970" )
		{
//AUTO 			players[i] iprintLnBold("Y_V!");			
//AUTO 			players[i] GiveWeapon("ak47_mp");
//AUTO 			players[i] GiveMaxAmmo("ak47_mp");
			wait 0.05;
//AUTO 			players[i] SwitchToWeapon("ak47_mp");
		}
	}
}      

ammobox()
{
            trig = getEnt("ammobox","targetname");

           while(1)
           {
             trig waittill ("trigger", who);
//AUTO              who GiveMaxAmmo( "frag_grenade_mp" );           
           }
}

