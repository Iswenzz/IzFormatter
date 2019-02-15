main()
{
 maps\mp\_load::main();
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
 
 game["allies"] = "marines";
 game["axis"] = "opfor";
 game["attackers"] = "axis";
 game["defenders"] = "allies";
 game["allies_soldiertype"] = "desert";
 game["axis_soldiertype"] = "desert";
 
//AUTO 	setdvar("g_speed" ,"190");
//AUTO 	setdvar("dr_jumpers_speed" ,"1");
	
	setdvar( "r_specularcolorscale", "1" );

	setdvar("r_glowbloomintensity0",".1");
	setdvar("r_glowbloomintensity1",".1");
	setdvar("r_glowskybleedintensity0",".1");

	thread messages();
	thread startdoor();
	thread automove();
	thread automove2();
	thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap6();
	thread trap7();
	thread trap8();
	thread porte1();
	thread porte2();
	thread arme1();
	thread arme2();
	thread arme3();
	thread secret();
//AUTO 	thread old();
//AUTO 	thread sniper();
//AUTO 	thread bounce();
	thread respawn();
	thread respawn2();
//AUTO 	thread music();

}

messages()
{
wait 10;
//AUTO iprintlnBold("^2Welcome to LittleMap by ^6M^2i^3T^4h^5y^6X");
wait 1;
}

startdoor()
{
lootje = getent("startdoor","targetname");
{
wait 15;
lootje moveZ(-260, 5);
//AUTO iprintlnbold("^4Start door opened.");
wait 2;
}
}

automove()
{
   block = getent("automove","targetname");
   
   for(;;)
   {
   wait 2;
   block moveX (-100, 2);
   wait 2;
   block moveX (100, 2);
   }
   
}

automove2()
{
   block = getent("automove2","targetname");
   
   for(;;)
   {
   wait 5;
   block moveX (-380, 5);
   wait 5;
   block moveX (380, 5);
   }
   
}

trap1()
{
    block = getent("trap1","targetname");
	trig = getent("trig_trap1","targetname");
	trig SetHintString("^3 Move the brush");
/* AUTO 	trig waittill("trigger",player);
	
	for(;;)
	{
	wait 1;
	block moveZ (100, 0.5);
	wait 1;
	block moveZ (-100, 0.5);
	}
	
*/}

trap2()
{
    block = getent("trap2","targetname");
	trig = getent("trig_trap2","targetname");
	trig SetHintString("^3 Rotate the bounce");
/* AUTO 	trig waittill("trigger",player);
	
	for(;;)
	{
	wait 0.1;
	block rotateYaw(1440, 4);
	wait 10;	
	}
	
*/}

trap3()
{
    block = getent("trap3","targetname");
    trig = getent("trig_trap3","targetname");
	trig SetHintString("^3 Rotate the bounce");
/* AUTO 	trig waittill("trigger",player);
	
	for(;;)
	{
	wait 0.1;
	block rotateYaw(1440, 4);
	wait 10;	
	}
	
*/}

trap4()
{
    platform = getent("trap4","targetname");
    trig = getent("trig_trap4","targetname");
    trig SetHintString("^3 Remove the brush");
/* AUTO     trig waittill("trigger",player);
   
    platform delete();
   
    trig delete();
   
*/}

trap7()
{
    platform = getent("trap7","targetname");
    trig = getent("trig_trap7","targetname");
    trig SetHintString("^3 Remove the brush");
/* AUTO     trig waittill("trigger",player);
   
    platform delete();
   
    trig delete();
   
*/}

trap6()
{
    block = getent("trap6","targetname");
	trig = getent("trig_trap6","targetname");
	trig SetHintString("^3 Move the brush");
/* AUTO 	trig waittill("trigger",player);
	
	for(;;)
	{
	wait 3;
	block moveX (100, 3);
	wait 3;
	block moveX (-100, 3);
	}
	
*/}

trap8()
{
    block = getent("trap8","targetname");
	trig = getent("trig_trap8","targetname");
	trig SetHintString("^3 Rotate the bounce");
/* AUTO 	trig waittill("trigger",player);
	
	for(;;)
	{
	wait 0.1;
	block rotateYaw(1440, 4);
	wait 10;	
	}
	
*/}

porte1()
{
   lootje = getent("porte1","targetname");
   trig = getent("trig_porte1","targetname");
   trig SetHintString("^5 [use] ^3Open the door");
   trig waittill("trigger",player);
   {
   wait 2;
   lootje moveZ (-224, 5);
   wait 2;
   }
   trig delete();
}

porte2()
{
   lootje = getent("porte2","targetname");
   trig = getent("trig_porte2","targetname");
   trig SetHintString("^5 [use] ^3Open the door");
   trig waittill("trigger",player);
   {
   wait 2;
   lootje moveZ (-275, 5);
   wait 2;
   }
   trig delete();
}

arme1()
{
	trig = getent("trig_arme1","targetname");
	trig SetHintString("^3m^44^60^2a^53");
	trig waittill("trigger",player);
	
	for(;;)
	{
	wait 1;
//AUTO 	player GiveWeapon("m40a3_mp");
//AUTO 	player GiveMaxAmmo("m40a3_mp");
	wait 1;
	}
	
}

arme2()
{
	trig = getent("trig_arme2","targetname");
	trig SetHintString("^3r^27^50^60");
	trig waittill("trigger",player);
	
	for(;;)
	{
	wait 1;
//AUTO 	player GiveWeapon("remington700_mp");
//AUTO 	player GiveMaxAmmo("remington700_mp");
	wait 1;
	}
	
}

arme3()
{
	trig = getent("trig_arme3","targetname");
	trig SetHintString("^3 m40a3");
	trig waittill("trigger",player);
	
	for(;;)
	{
	wait 1;
//AUTO 	player GiveWeapon("m40a3_mp");
//AUTO 	player GiveMaxAmmo("m40a3_mp");
	wait 1;
	}
	
}

secret()
{
   level.secret_trigger = getent("trig_secret","targetname");
   telejumporigin = getent("secret_jumper", "targetname");
   
   while(1)
   {
      level.secret_trigger waittill( "trigger", player );
      if( !isDefined( level.secret_trigger ) )
      return;
      if(level.firstenter==true)
//AUTO    wait(0.05);

   player SetOrigin( telejumporigin.origin );
   player setplayerangles( telejumporigin.angles );
//AUTO    wait(0.05);
   
}
}

old()
{
   block = getent("porte4","targetname");
   trig = getent("trig_porte4","targetname");
   trig SetHintString("^3 Old room");
   trig waittill("trigger",player);
   {
   wait 2;
   block moveZ (-224, 5);
   wait 2;
   }
   trig delete();
}

sniper()
{
   level.sniper_trigger = getent("trig_sniper","targetname");
   level.teleactorigin = getent("sniper_activator", "targetname");
   telejumporigin = getent("sniper_jumper", "targetname");

   while(1)
   {
      level.sniper_trigger waittill( "trigger", player );

      if( !isDefined( level.sniper_trigger ) )
      return;
      if(level.firstenter==true)
   {
   level.old_trigger delete();
   level.bounce_trigger delete();
   level.firstenter=false;
   } 
//AUTO    wait(0.05);

   player SetOrigin( telejumporigin.origin );
   player setplayerangles( telejumporigin.angles );
//AUTO    player TakeAllWeapons();
//AUTO    player GiveWeapon("m40a3_mp");
//AUTO    player GiveWeapon( "remington700_mp" ); 
//AUTO    player GiveMaxAmmo("m40a3_mp");
//AUTO    player GiveMaxAmmo( "remington700_mp" );
//AUTO    wait .05;
//AUTO    player SwitchToWeapon("m40a3_mp"); 
//AUTO    wait(0.05);
   level.activ SetOrigin (level.teleactorigin.origin);
   level.activ setplayerangles (level.teleactorigin.angles);
//AUTO    level.activ TakeAllWeapons();
//AUTO    level.activ GiveWeapon( "m40a3_mp" );
//AUTO    level.activ GiveWeapon( "remington700_mp" );
//AUTO    level.activ GiveMaxAmmo("m40a3_mp");
//AUTO    level.activ GiveMaxAmmo( "remington700_mp" );
//AUTO    wait .05;
//AUTO    level.activ SwitchToWeapon("m40a3_mp"); 
//AUTO    iPrintlnBold( " ^8" + player.name + " ^4 has entered the Sniper room^8!" ); 
//AUTO    wait(0.05);
//AUTO    player switchToWeapon( "m40a3_mp" );
//AUTO    level.activ SwitchToWeapon( "m40a3_mp" );




   player waittill( "death" );
   level.PlayerInRoom = false;

}
}

bounce()
{
   level.bounce_trigger = getent("trig_bounce","targetname");
   level.teleactorigin = getent("bounce_activator","targetname");
   telejumporigin = getent("bounce_jumper","targetname");

   while(1)
   {
      level.bounce_trigger waittill("trigger",player );

      if( !isDefined(level.bounce_trigger ) )
      return;
      if(level.firstenter==true)
   {
   level.old_trigger delete();
   level.sniper_trigger delete();
   level.firstenter=false;
   } 
//AUTO    wait(0.05);

   player SetOrigin(telejumporigin.origin );
   player setplayerangles(telejumporigin.angles );
//AUTO    player TakeAllWeapons();
//AUTO    wait(0.05);
   level.activ SetOrigin (level.teleactorigin.origin);
   level.activ setplayerangles (level.teleactorigin.angles);
//AUTO    level.activ TakeAllWeapons();
//AUTO    wait .05;
//AUTO    iPrintlnBold(" ^8" + player.name + " ^4 has entered the Bounce room^8!"); 
//AUTO    wait(0.05);



   player waittill( "death" );
   level.PlayerInRoom = false;

}
}

respawn()
{
   level.respawn_trigger = getent("trig_respawn","targetname");
   telejumporigin = getent("bounce_jumper", "targetname");
   
   while(1)
   {
      level.respawn_trigger waittill( "trigger", player );
      if( !isDefined( level.respawn_trigger ) )
      return;
      if(level.firstenter==true)
//AUTO    wait(0.05);

   player SetOrigin( telejumporigin.origin );
   player setplayerangles( telejumporigin.angles );
//AUTO    wait(0.05);
   
}
}

respawn2()
{
   level.respawn2_trigger = getent("trig_respawn2","targetname");
   level.teleactorigin = getent("bounce_activator", "targetname");
   
   while(1)
   {
      level.respawn2_trigger waittill( "trigger", player );
      if( !isDefined( level.respawn2_trigger ) )
      return;
      if(level.firstenter==true)
//AUTO    wait(0.05);

   level.activ SetOrigin (level.teleactorigin.origin);
   level.activ setplayerangles (level.teleactorigin.angles);
//AUTO    wait(0.05);
   
}
}

music()
{
    level waittill( "round_started" );
    
    wait 1;
    
//AUTO     ambientPlay( "song1" );
}

