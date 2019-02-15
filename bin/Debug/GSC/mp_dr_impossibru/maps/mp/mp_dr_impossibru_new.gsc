main()
{
	maps\mp\_load::main(); 
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
//AUTO 	ambientPlay("map");

	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";

	level.bjump1 = getEnt( "gohere4", "targetname" );
	level.bacti1 = getEnt( "activator4", "targetname" );

	setdvar( "r_specularcolorscale", "1" );

	setdvar("r_glowbloomintensity0",".25");
	setdvar("r_glowbloomintensity1",".25");
	setdvar("r_glowskybleedintensity0",".3");
	setdvar("compassmaxrange","1800");

	thread trap1();         
	thread trap2();
	thread trap3();
	thread trap3a();                
//AUTO 	thread trap4();                  //works but gives an error at the end if I put developer 1 
//AUTO 	thread sniper();
//AUTO 	thread knife();
	thread gun();
	thread spam();
	thread cylinder();              
	thread secret();               
	thread playerJoined();
	thread trap3a_trig();
	thread prank();
	thread update();
	thread trapdoor();
//AUTO 	thread bounce();
//AUTO 	thread bounce_respawn();
//AUTO 	thread bounce_ob();

	addTriggerToList( "trap1_trig" );
	addTriggerToList( "trap2_trig" );
	addTriggerToList( "trap3_trig" );
	addTriggerToList( "trap3b_trig" );
	addTriggerToList( "trap4_trig" );
	addTriggerToList( "trap3a_trig" );

}

addTriggerToList( name )
{
	if( !isDefined( level.trapTriggers ) )
		level.trapTriggers = [];
	level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

trap1()                        
{
	trigger = getent("trap1_trig", "targetname");
	level endon("trigger");
	object = getent("trap1a", "targetname");
	object2 = getent("trap1b", "targetname");
	object3 = getent("trap1c", "targetname");
	object4 = getent("trap1d", "targetname");
	trigger setHintString("^1Spin");

	trigger waittill( "trigger", player );
	trigger delete();

	while(1)
	{
		object rotateyaw(360,3);
		object2 rotateyaw(360,3);
		object3 rotateyaw(360,3);
		object4 rotateyaw(360,3);
		wait 3;
	}
}

trap2()
{
	trigger = getEnt("trap2_trig", "targetname");
	level endon("trigger");
	object = getEnt("trap2", "targetname");
	trigger setHintString("^2Hide Blocks");
	trigger waittill("trigger", who );
	trigger delete();
	object  notSolid();
	object hide();
}

trap3()
{
	trigger = getent("trap3_trig", "targetname");
	level endon("trigger");
	object = getent("trap3", "targetname");
	trigger setHintString("^3Rotate Circles");
	trigger waittill ("trigger" , player );
	trigger delete();
	while(1)
	{
		object rotateyaw(360,3);
		wait 3;
	}
}

trap3a()
{
	trigger = getent("trap3b_trig","targetname");
	level endon("trigger");
	object = getent("trap3a","targetname");
	trigger setHintString("^4No Short Cuts!!!");
	trigger waittill ("trigger" , player );
	trigger delete();
	object  notSolid();
}

trap4()
{
	trigger = getent("trap4_trig", "targetname");
	level endon("trigger");
	object = getent("trap4", "targetname");
	killtrigger = getent ("killtrig4" , "targetname");

	killtrigger enablelinkto ();
	killtrigger linkto (object);

	trigger setHintString("^5Spikes");
	trigger waittill ("trigger" , player );
	trigger delete();

	while(1)
	{
		object movez(144, 3, 1, 2);
		object waittill("movedone");
		wait(2);
		object movez(-144, 3, 1, 2);
		object waittill("movedone");
		wait(1);
	}
}

sniper()  
{
	level.snip_trig = getEnt( "enter", "targetname");
	jump = getEnt( "gohere", "targetname" );
	acti = getEnt( "activator", "targetname" );
	
	while( isDefined( level.snip_trig ) )
	{
		level.snip_trig waittill( "trigger", player );
		if( !isDefined( level.snip_trig ) )
			return;
		
		level.bounce_trig delete();
		level.gun_trig delete();
		level.knife_trig delete();

		player SetPlayerAngles( jump.angles );
		player setOrigin( jump.origin );
//AUTO 		player TakeAllWeapons();
//AUTO 		player GiveWeapon( "m40a3_mp" ); 
		player setSpawnWeapon( "m40a3_mp" );
		if( isDefined( level.activ ) && isAlive( level.activ ) )
		{
			level.activ setPlayerangles( acti.angles );
			level.activ setOrigin( acti.origin );
//AUTO 			level.activ TakeAllWeapons();
//AUTO 			level.activ GiveWeapon( "m40a3_mp" );
			level.activ SetSpawnWeapon( "m40a3_mp" );
		}
//AUTO 		iPrintlnBold( " ^6" + player.name + " ^5 HAS CHOSEN Sniper^1!" );
		while( isDefined( player ) && isAlive( player ) )
			wait 1;
	}
}

knife()     
{
	level.knife_trig = getEnt( "enter2", "targetname");
	jump = getEnt( "gohere2", "targetname" );
	acti = getEnt( "activator2", "targetname" );
	
	while( isDefined( level.knife_trig ) )
	{
		level.knife_trig waittill( "trigger", player );
		if( !isDefined( level.knife_trig ) )
			return;
		
		level.snip_trig delete();
		level.gun_trig delete();
		level.bounce_trig delete();

		player SetPlayerAngles( jump.angles );
		player setOrigin( jump.origin );
//AUTO 		player TakeAllWeapons();
//AUTO 		player GiveWeapon( "tomahawk_mp" ); 
		player setSpawnWeapon( "tomahawk_mp" );
//AUTO 		player setmovespeed( 999 );
//AUTO 		player setjumpheight( 999 );

		if( isDefined( level.activ ) && isAlive( level.activ ) )
		{
			level.activ setPlayerangles( acti.angles );
			level.activ setOrigin( acti.origin );
//AUTO 			level.activ TakeAllWeapons();
//AUTO 			level.activ GiveWeapon( "tomahawk_mp" );
			level.activ SetSpawnWeapon( "tomahawk_mp" );
//AUTO 			level.activ setmovespeed( 999 );
//AUTO 			level.activ setjumpheight( 999 );
		}
//AUTO 		iPrintlnBold( " ^6" + player.name + " ^5 HAS CHOSEN Knife^1!" );
		while( isDefined( player ) && isAlive( player ) )
			wait 0.05;

		if( !isDefined( player ) )
			continue;
//AUTO 		player setmovespeed( 190 );
//AUTO 		player setjumpheight( 39 );
	}
}

gun()       
{
	level.gun_trig = getEnt( "enter3", "targetname");
	jump = getEnt( "gohere3", "targetname" );
	acti = getEnt( "activator3", "targetname" );
	
	while( isDefined( level.gun_trig ) )
	{
		level.gun_trig waittill( "trigger", player );
		if( !isDefined( level.gun_trig ) )
			return;
		
		level.snip_trig delete();
		level.knife_trig delete();
		level.bounce_trig delete();

		player SetPlayerAngles( jump.angles );
		player setOrigin( jump.origin );
//AUTO 		player TakeAllWeapons();
//AUTO 		player GiveWeapon( "defaultweapon_mp" );
		player setSpawnWeapon( "defaultweapon_mp" );
//AUTO 		player setgravity( 100 );

		if( isDefined( level.activ ) && isAlive( level.activ ) )
		{
			level.activ setPlayerangles( acti.angles );
			level.activ setOrigin( acti.origin );
//AUTO 			level.activ TakeAllWeapons();
//AUTO 			level.activ GiveWeapon( "defaultweapon_mp" );
//AUTO 			level.activ setgravity( 100 );
			level.activ SetSpawnWeapon( "defaultweapon_mp" );
		}
//AUTO 		iPrintlnBold( "^6" + player.name + " ^5 HAS CHOSEN Weapon^1!" );
		while( isDefined( player ) && isAlive( player ) )
//AUTO 			wait 0.05;

		if( isDefined( player ) )
//AUTO 			player setgravity( 800 );
	}
}

spam()
{
	for(;;)
	{
		wait 10;
//AUTO 		iprintln ("^7Map created by ^5IceOps|Delta ^1& ^5mks!");
		wait 10;
//AUTO 		iprintln ("^7Mega Thanks ^3IceOps|Ninja & ^5IceOps|TheKelm & ^7Frosty &^8Phaedrean ");         
		wait 10;
//AUTO 		iprintln ("^1 Report bugs xfire: dragonflam4 , steam:xray190");
		wait 10;
//AUTO 		iprintln ("^3 Thanks for Xenon and Lossy Tutorials");
	}
}

cylinder()       
{
	wait 10;
	object = getent("autotrap", "targetname");
	killtrigger = getent ("killtrigauto" , "targetname");
	wait 0.01;
	killtrigger enablelinkto ();  
	killtrigger linkto (object);
	object movez(-1008, 3);
	object rotateroll(-360,3);
	object waittill("movedone");
	wait 0.01;
//AUTO 	iPrintlnBold( "^1Run!!!" ); 
	wait 0.01;
	object movey(5075,25);
	object rotateroll(-1440,25);
	object waittill ("movedone");
	object movez(-1024,3);
	object rotateroll(-360,3);
	object waittill ("movedone");
}

secret()
{
	trig = getEnt ("secret", "targetname");
	target = getEnt ("secret2", "targetname");
	
	for(;;)
	{
		trig waittill("trigger", player);
		
//AUTO 		player iprintlnbold("You have been teleported");
		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );
	}
}

playerJoined()
{
	for(;;) 
	{
		level waittill("connected",player);
		if(!isDefined(player.pers["welcomed"]))
		{
			player.pers["welcomed"] = true;
//AUTO 			iPrintlnBold( "Welcome ^2" + player.name + " ^7to the server everyone!!" ); 
		}
	}
}

trap3a_trig()
{
	trig = getEnt ("trap3a_trig", "targetname");
	level endon("trigger");
	
	for(;;)
	{
		trig waittill ("trigger", player);
		trig delete();
		
//AUTO 		player iprintlnbold ("^1No easy way :/");
	}
}

prank()
{
	trig = getEnt ("prank", "targetname");
	
	for(;;)
	{
		trig waittill ("trigger", player);
		trig delete();
		
//AUTO 		player iprintlnbold ("^9You thought something was here :P");
	}
}

update()
{
	trig = getEnt ("update", "targetname");
	
	for(;;)
	{
		trig waittill ("trigger", player);
		trig delete();
		
//AUTO 		player iprintlnbold ("^0More if version 2 is released");
	}
}

trapdoor()
{
	object = getEnt ("trapdoor", "targetname");
	level endon("trigger");
	trigger = getEnt ("trapdoor_trig", "targetname");
	trigger waittill ("trigger" , player );
	trigger delete();
	wait 0.01;
//AUTO 	iPrintlnBold("^1Hurry the door is closing!!!!");
	object movey(112,16);
	object waittill("movedone");
	wait 0.01;
//AUTO 	iPrintlnBold("^2Door closed :/");
	wait 2;
	object movey(-112,5);
	object waittill("movedone");
	wait 0.01;
//AUTO 	iPrintlnBold("^3Door opened!!!");
}

bounce()
{
	level.bounce_trig = getEnt( "enter4", "targetname");
	jump = getEnt( "gohere4", "targetname" );
	acti = getEnt( "activator4", "targetname" );
	
	while( isDefined( level.bounce_trig ) )
	{
		level.bounce_trig waittill( "trigger", player );
		if( !isDefined( level.bounce_trig ) )
			return;
		
		level.snip_trig delete();
		level.gun_trig delete();
		level.knife_trig delete();

		player SetPlayerAngles( jump.angles );
		player setOrigin( jump.origin );
//AUTO 		player TakeAllWeapons();
//AUTO 		player GiveWeapon( "tomahawk_mp" );
		player setSpawnWeapon( "tomahawk_mp" );
		if( isDefined( level.activ ) && isAlive( level.activ ) )
		{
			level.activ setPlayerangles( acti.angles );
			level.activ setOrigin( acti.origin );
//AUTO 			level.activ TakeAllWeapons();
//AUTO 			level.activ GiveWeapon( "tomahawk_mp" );
			level.activ SetSpawnWeapon( "tomahawk_mp" );
		}
//AUTO 		iPrintlnBold( "^6" + player.name + " ^5 HAS CHOSEN Bounce^1!" );

		while( isDefined( player ) && isAlive( player ) )
			wait 1;
	}
}

bounce_respawn(port_allies,port_axis)
{
 	trig = getent("bounce", "targetname");

	for(;;)
	{
		trig waittill( "trigger", player );
		if(player.pers["team"] == "axis")
		{
			player setPlayerangles( level.bacti1.angles );
			player setOrigin( level.bacti1.origin );
		}
		if(player.pers["team"] == "allies")
		{
			player setplayerangles( level.bjump1.angles, 3 );
			player setorigin( level.bjump1.origin, 3 );
		}
	}
}

bounce_ob()
{
	object1 = getEnt ("br1", "targetname");
	object2 = getEnt ("br2", "targetname");
	killtrigger1 = getEnt ("bo1", "targetname");
	killtrigger2 = getEnt ("bo2", "targetname");

	killtrigger1 enablelinkto();
	killtrigger1 linkto (object1);
	killtrigger2 enablelinkto();
	killtrigger2 linkto (object2);

	while(1)
	{
		object1 movey(1056,3);
		object1 waittill("movedone");
		wait(1);
		object2 movey(-1056,3);
		object2 waittill("movedone");
		wait(1);
		object1 movey(-1056,3);
		object1 waittill("movedone");
		wait(1);
		object2 movey(1056,3);
		object2 waittill("movedone");
	}
}

