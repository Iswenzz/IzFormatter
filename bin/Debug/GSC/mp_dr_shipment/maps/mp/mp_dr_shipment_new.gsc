main()
{
	maps\mp\_load::main();
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
	
	
	
	
	
	
	game["allies"] = "sas";
	game["axis"] = "russian";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";

	level.explosion = loadFX("custom/explosion1");
	level.trail = loadFX("custom/genesis1");
	level.flasheffect = loadFX("muzzleflashes/syndcarnage");
	PrecacheItem( "python_mp" );
	PrecacheItem( "syndcarnage_mp" );
//AUTO 	PrecacheItem( "ak74u_mp" );
	PrecacheItem( "remington700_mp" );
	precacheShader("material,mtl_deadpool_guns");
	precacheShader("material,mtl_deadpool_body");
	precacheShader("material,mtl_deadpool_eyes");
	precacheShader("material,mtl_deadpool_misc");
	precacheShader("material,mtl_deadpool_swords");
	precacheModel("deadpool");
	
	
/////dvars\\\\\\\\	
	setdvar( "r_specularcolorscale", "1" );

	setdvar("r_glowbloomintensity0",".1");
	setdvar("r_glowbloomintensity1",".1");
	setdvar("r_glowskybleedintensity0",".1");
	setdvar("compassmaxrange","1500");
	
	thread creds();
//AUTO 	thread music();
	thread teleport1();
	thread teleport2();
	thread trap2();
	thread strafes();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap6();
	thread trap7();
	thread trap8();
//AUTO     thread vip();
	thread secret();
//AUTO 	thread endroom();
//AUTO 	thread endroom2();
//AUTO 	thread endroom3();
	thread trap9();
	thread trap10();
	thread hsecretp1();
	thread hsecretp2();
	thread synd();
	
	 addTriggerToList( "explosiontrig" );
	 addTriggerToList( "dissapear_strafestrig" );
	 addTriggerToList( "trap3trig" );
	 addTriggerToList( "trig4" );
	 addTriggerToList( "trig5" );
	 addTriggerToList( "trig6" );
	 addTriggerToList( "trig7_1" );
	 addTriggerToList( "trig7_2" );
	 addTriggerToList( "trig8" );
	 addTriggerToList( "trig9" );
	 addTriggerToList( "hellsecret" );
	 
}

addTriggerToList( name )
{
   if( !isDefined( level.trapTriggers ) )
      level.trapTriggers = [];
   level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

creds()
{
     level.xxx = newHudElem(); 
         level.xxx.x = 0;      
         level.xxx.y = -200;   
         level.xxx.horzAlign = "left"; 
         level.xxx.vertAlign = "middle";
         level.xxx.alignX = "left";
         level.xxx.alignY = "middle";
         level.xxx.sort = 102; 
         level.xxx.foreground = 1;     
         level.xxx.archived = true;    
         level.xxx.alpha = 1;  
         level.xxx.fontScale = 1.4;
         level.xxx.hidewheninmenu = false;     
         level.xxx.color = (255,128,0);
         level.xxx.glowColor = (0.3, 0.6, 0.3);
         level.xxx.glowAlpha = 1;
while(1)
         {
         level.xxx.color = (255,124,0);
         level.xxx.label = &"Map By Synd";    
         wait 3;
         level.xxx.color = (0,50,258);
         level.xxx.label = &"Thanks to iMtroll";
         wait 5;
		 level.xxx.color = (100,45,255);
         level.xxx.label = &"Thanks to Sheep Wizard for these amazing credits c:";
         wait 5;
		 level.xxx.color = (1,0,0);
         level.xxx.label = &"Thanks to everyone that helped test ^.^";
		 wait 5;
}
}

music()
{
	songs = [];
	songs[songs.size] = "song1";
	songs[songs.size] = "song2";
	songs[songs.size] = "song3";

	selected = songs[ Randomint( songs.size ) ];
//AUTO 	AmbientPlay( selected );
}

teleport1()
{
	teleport1 = GetEnt("teleport1","targetname");
	origin1 = GetEnt("teleport1origin","targetname");
	teleport1 waittill("trigger", player);
	
			player SetPlayerAngles( origin1.angles );
	        player setOrigin( origin1.origin );
}	

teleport2()
{
	teleport2 = GetEnt("teleport2","targetname");
	origin2 = GetEnt("teleport2origin","targetname");
	teleport2 waittill("trigger", player);
	
			player SetPlayerAngles( origin2.angles );
	        player setOrigin( origin2.origin );
}			

strafes()
{
	strafes = GetEnt("strafes","targetname");
	trig = GetEnt("dissapear_strafestrig","targetname");
	trig waittill("trigger", player);
	trig delete();
	
	
	strafes hide();
	strafes notsolid();

}	

trap2()
{
explosion = GetEnt("explosion_origin","targetname");
	level endon("trigger");
explosionkill = GetEnt("explosionkill","targetname");
trig = GetEnt("explosiontrig","targetname");
trig waittill("trigger", player);
trig delete();
thread trap2_1();
PlayFX( level.explosion, explosion.origin );
explosion PlaySound( "grenade_explo01");

for(;;)
{
explosionkill waittill("trigger", player);
wait 0.01;
player suicide();
}
}

trap2_1()
{
explosionkill = GetEnt("explosionkill","targetname");
wait 1;
explosionkill delete();
}

trap3()
{
	planks = GetEnt("planks","targetname");
	level endon("trigger");
	trig = GetEnt("trap3trig","targetname");
	trig waittill("trigger", player);
	trig delete();
	
	
	planks MoveZ(-500, 1);
	wait 1;
	planks hide();

}	

trap4()
{
	floor = GetEnt("moving_floor","targetname");
	level endon("trigger");
	trig = GetEnt("trig4","targetname");
	trig waittill("trigger", player);
	trig delete();
	
while(1)
{
	
	floor rotateroll(-360, 4);
	
	
wait 0.5;
}	
}

trap5()
{
	floor = GetEnt("drop_floor","targetname");
	level endon("trigger");
	trig = GetEnt("trig5","targetname");
	trig waittill("trigger", player);
	trig delete();

	
	floor moveZ(-88, 1);
	wait 5;
	floor moveZ(88, 1);

}	

trap6()
{
	crate = GetEnt("falling_box","targetname");
	level endon("trigger");
	chain = GetEnt("chain","targetname");
	kill = GetEnt("falling_box_kill","targetname");
	trig = GetEnt("trig6","targetname");
	trig waittill("trigger", player);
	trig delete();
	
	kill EnableLinkTo();
	kill LinkTo( crate );
	
	
	crate moveZ(-160, 1);
	chain moveZ(-160, 1);
	wait 5;
	crate moveZ(160, 4);
	chain moveZ(160, 1);
}	

trap7()
{
	spinner = GetEnt("spinner1","targetname");
	level endon("trigger");
	trig = GetEnt("trig7_1","targetname");
	trig waittill("trigger", player);
	trig delete();
	
	
	
while(1)
{
	
	spinner rotateyaw(-360, 4);
	
	
wait 0.5;
}	
}

trap8()
{
	spinner = GetEnt("spinner2","targetname");
	level endon("trigger");
	trig = GetEnt("trig7_2","targetname");
	trig waittill("trigger", player);
	trig delete();
	
	
while(1)
{
	
	spinner rotateyaw(360, 4);
	
	
wait 0.5;
}	
}

vip()
{
	level waittill( "round_started" );
	wait 3;

	players = GetEntArray("player", "classname");
	for(i=0;i<players.size;i++)
	{
		Guid = getSubStr(players[i] getGuid(),24,32);
		if( (Guid == "65586cbf" || Guid == "e194bab0") || (Guid == "8df4b8b9" || Guid == "9f6491a0") || (Guid == "fde5baa9" || Guid == "22b565c8") || (Guid == "8df4b8b9" || Guid == "9f6491a0") || (Guid == "07987968" || Guid == "9e3ed98b") && players[i].pers["team"] == "allies" )
		{
//AUTO 			players[i] GiveWeapon( "python_mp" );
//AUTO 			players[i] GiveMaxAmmo( "python_mp" );
			wait .05;
//AUTO 			players[i] SwitchToWeapon( "python_mp" );
//AUTO 			players[i] iPrintlnBold( "^3Grats on VIP " + players[i].name );
			wait 1;
			players[i] endon("disconnect");
			players[i] detachAll();
			players[i] setModel("deadpool");
//AUTO 			players[i] iprintLnBold("^5You are Deadpool, and have a random color python!");	
			
		}
	}
}

secret()
{
	secret = GetEnt("secret","targetname");
	secret waittill("trigger", player);
	secret delete();
	
//AUTO 			player GiveWeapon( "python_mp" );
//AUTO 			player GiveMaxAmmo( "python_mp" );
			wait .05;
//AUTO 			player SwitchToWeapon( "python_mp" );
			wait 1;
			player endon("disconnect");
			player detachAll();
			player setModel("deadpool");
//AUTO 			player iprintLnBold("You Found the Broken Python!");	
//AUTO 			player iprintLnBold("You are now Deadpool!");	
}

endroom()
{
	level.endroom = GetEnt("endroom","targetname");
    jump = GetEnt( "jump", "targetname" );
    acti = GetEnt( "acti", "targetname" );

	while(1)
	{
		level.endroom waittill("trigger", player);
		if( !level.PlayerInRoom )
		{
			if( isDefined(level.old_trig) )
			level.PlayerInRoom = true;
			level.endroom2 delete();
			level.endroom3 delete();

			player.health = player.maxhealth;
			level.activ.health = level.activ.maxhealth;
			player SetPlayerAngles( jump.angles );
	        player setOrigin( jump.origin );
//AUTO 	        player TakeAllWeapons();
//AUTO 	        player GiveWeapon( "python_mp" );
//AUTO 			player GiveMaxAmmo( "python_mp" );
	        level.activ setPlayerangles( acti.angles );
	        level.activ setOrigin( acti.origin );
//AUTO 	        level.activ TakeAllWeapons();
//AUTO 	        level.activ GiveWeapon( "python_mp" );
//AUTO 	        level.activ GiveMaxAmmo( "python_mp" );
	        wait .05;
//AUTO 	        player switchToWeapon( "python_mp" ); 
//AUTO 	        level.activ SwitchToWeapon( "python_mp" );
	        player FreezeControls(1);
			level.activ FreezeControls(1);
			noti = SpawnStruct();
					noti.titleText = "Welcome to Shipment!";
					noti.notifyText = level.activ.name + " ^3VS^5 " + player.name;
					noti.glowcolor = (1,0,0.9);
					noti.duration = 5;
					players = getentarray("player", "classname");
					for(i=0;i<players.size;i++)
						players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
					wait 5;
					player FreezeControls(0);
					level.activ FreezeControls(0);
			player waittill( "death" );
			level.PlayerInRoom = false;
		}
	}
}

endroom2()
{
	level.endroom2 = GetEnt("endroom2","targetname");
    jump = GetEnt( "jump", "targetname" );
    acti = GetEnt( "acti", "targetname" );

	while(1)
	{
		level.endroom2 waittill("trigger", player);
		if( !level.PlayerInRoom )
		{
			if( isDefined(level.old_trig) )
			level.PlayerInRoom = true;
			level.endroom3 delete();
			level.endroom delete();

			player.health = player.maxhealth;
			level.activ.health = level.activ.maxhealth;
			player SetPlayerAngles( jump.angles );
	        player setOrigin( jump.origin );
//AUTO 	        player TakeAllWeapons();
//AUTO 	        player GiveWeapon( "remington700_mp" );
//AUTO 			player GiveMaxAmmo( "remington700_mp" );
	        level.activ setPlayerangles( acti.angles );
	        level.activ setOrigin( acti.origin );
//AUTO 	        level.activ TakeAllWeapons();
//AUTO 	        level.activ GiveWeapon( "remington700_mp" );
//AUTO 	        level.activ GiveMaxAmmo( "remington700_mp" );
	        wait .05;
//AUTO 	        player switchToWeapon( "remington700_mp" ); 
//AUTO 	        level.activ SwitchToWeapon( "remington700_mp" );
	        player FreezeControls(1);
			level.activ FreezeControls(1);
			noti = SpawnStruct();
					noti.titleText = "Welcome to Shipment!";
					noti.notifyText = level.activ.name + " ^3VS^5 " + player.name;
					noti.glowcolor = (1,0,0.9);
					noti.duration = 5;
					players = getentarray("player", "classname");
					for(i=0;i<players.size;i++)
						players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
					wait 5;
					player FreezeControls(0);
					level.activ FreezeControls(0);
			player waittill( "death" );
			level.PlayerInRoom = false;
		}
	}
}

endroom3()
{
	level.endroom3 = GetEnt("endroom3","targetname");
    jump = GetEnt( "jump", "targetname" );
    acti = GetEnt( "acti", "targetname" );

	while(1)
	{
		level.endroom3 waittill("trigger", player);
		if( !level.PlayerInRoom )
		{
			if( isDefined(level.old_trig) )
			level.PlayerInRoom = true;
			level.endroom2 delete();
			level.endroom delete();

			player.health = player.maxhealth;
			level.activ.health = level.activ.maxhealth;
			player SetPlayerAngles( jump.angles );
	        player setOrigin( jump.origin );
//AUTO 	        player TakeAllWeapons();
//AUTO 	        player GiveWeapon( "ak74u_mp" );
//AUTO 			player GiveMaxAmmo( "ak74u_mp" );
//AUTO 			player GiveWeapon( "deserteagle_mp" );
//AUTO 			player GiveMaxAmmo( "deserteagle_mp" );
	        level.activ setPlayerangles( acti.angles );
	        level.activ setOrigin( acti.origin );
//AUTO 	        level.activ TakeAllWeapons();
//AUTO 	        level.activ GiveWeapon( "ak74u_mp" );
//AUTO 	        level.activ GiveMaxAmmo( "ak74u_mp" );
//AUTO 			level.activ GiveWeapon( "deserteagle_mp" );
//AUTO 	        level.activ GiveMaxAmmo( "deserteagle_mp" );
	        wait .05;
//AUTO 	        player switchToWeapon( "ak74u_mp" ); 
//AUTO 	        level.activ SwitchToWeapon( "ak74u_mp" );
	        player FreezeControls(1);
			level.activ FreezeControls(1);
			noti = SpawnStruct();
					noti.titleText = "Welcome to Shipment!";
					noti.notifyText = level.activ.name + " ^3VS^5 " + player.name;
					noti.glowcolor = (1,0,0.9);
					noti.duration = 5;
					players = getentarray("player", "classname");
					for(i=0;i<players.size;i++)
						players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
					wait 5;
					player FreezeControls(0);
					level.activ FreezeControls(0);
			player waittill( "death" );
			level.PlayerInRoom = false;
		}
	}
}

trap9()
{
	trap8 = GetEnt("trap8","targetname");
	level endon("trigger");
	trig = GetEnt("trig8","targetname");
	trig waittill("trigger", player);
	trig delete();
	
	
	trap8 hide();
	trap8 notsolid();

}	

trap10()
{
	trap9 = GetEnt("trap9","targetname");
	level endon("trigger");
	trig = GetEnt("trig9","targetname");
	trig waittill("trigger", player);
	trig delete();
	
	
	trap9 hide();
	trap9 notsolid();

}	

hsecretp1()
{
	secret = GetEnt("hellsecret","targetname");
	secretorigin = GetEnt("hellsecretorigin","targetname");
	secret waittill("trigger", player);
	secret delete();
	
			player SetPlayerAngles( secretorigin.angles );
	        player setOrigin( secretorigin.origin );
//AUTO 			player iPrintlnBold( "^9How did you manage to find this.");
}			

hsecretp2()
{
	secret2 = GetEnt("hellsecretend","targetname");
	secretorigin2 = GetEnt("hellsecretorigin2","targetname");
	quake = getent("quake","targetname");        // quake origin
	sound = getent("sound","targetname");        // sound origin
	secret2 waittill("trigger", player);


//AUTO    player iprintlnbold( "^9SYNDS WEAPON HAS BEEN UNLEASHED");
//AUTO    player GiveWeapon( "syndcarnage_mp" );
//AUTO    player GiveMaxAmmo( "syndcarnage_mp" );  
//AUTO    player switchToWeapon( "syndcarnage_mp" ); 
   sound PlaySound( "elm_quake_sub_rumble"); 
   Earthquake( 1, 5, quake.origin, 1000 ); 
   wait 5;
   			player SetPlayerAngles( secretorigin2.angles );
	        player setOrigin( secretorigin2.origin );
   wait 2;
}			

synd()
{
	level waittill( "round_started" );
	wait 5;

	players = GetEntArray("player", "classname");
	for(i=0;i<players.size;i++)
	{
		Guid = getSubStr(players[i] getGuid(),24,32);
		if( (Guid == "65586cbf" || Guid == "11111111") && players[i].pers["team"] == "allies" )
		{
//AUTO 			players[i] GiveWeapon( "syndcarnage_mp" );
//AUTO 			players[i] GiveMaxAmmo( "syndcarnage_mp" );
			wait .05;
//AUTO 			players[i] SwitchToWeapon( "syndcarnage_mp" );
//AUTO 			players[i] iPrintlnBold( "^3you need this");
		}
	}
}

