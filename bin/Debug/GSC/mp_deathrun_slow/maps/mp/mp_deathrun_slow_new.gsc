main()
{

	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
	maps\mp\_load::main();
	maps\mp\_teleport::main();
//AUTO 	ambientPlay("bass");
	
	
	
	game["allies"] = "sas";
	game["axis"] = "russian";
	game["attackers"] = "allies";
	game["defenders"] = "axis";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";
	setExpFog(300, 1400, 0.5, 0.5, 0.5, 0);
	

////threads////
	
	thread trap1();
	thread trap2();
	thread trap3();
	thread trap5();
	thread trap6();
	thread doora();
	thread finish();
//AUTO 	thread knife();
//AUTO 	thread sniper();
	thread nade();
	thread ammo();
	thread ammo1();
	thread jumpreset1();
	thread jumpreset2();
	thread jumpreset3();
	thread jumpreset4();
	thread takescope();
	thread text();
	thread message();
	
////trap triggers////

	addTriggerToList( "trap1_trig" );
	addTriggerToList( "trap2_trig" );
	addTriggerToList( "trap3_trig" );
	addTriggerToList( "trap4_trig" );
	addTriggerToList( "trap5_trig" );
	addTriggerToList( "trap6_trig" );
	
	level.bjump1 = getEnt( "jb1", "targetname" );
	level.bacti1 = getEnt( "ab1", "targetname" );
	level.bjump2 = getEnt( "jb2", "targetname" );
	level.bacti2 = getEnt( "ab2", "targetname" );
	level.bjump3 = getEnt( "jb3", "targetname" );
	level.bacti3 = getEnt( "ab3", "targetname" );
	level.bjump4 = getEnt( "jb4", "targetname" );
	level.bacti4 = getEnt( "ab4", "targetname" );
	
	
}

addTriggerToList( name )
{
   if( !isDefined( level.trapTriggers ) )
      level.trapTriggers = [];
   level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

trap1()
{
	trig = getent ("trap1_trig" , "targetname");
	level endon("trigger");
	brush = getent ("trap1" , "targetname");
	
	trig waittill ("trigger", player);
	trig delete();
	
	while(1)
	{
		brush rotateyaw (360,4); 
		wait 6;
	}
	
}

trap2()
{
	trig = getent ("trap2_trig" , "targetname");
	level endon("trigger");
	brush = getent ("trap2" , "targetname");
	
	trig waittill ("trigger", player);
	trig delete();
	
	while(1)
	{
		brush rotateyaw (360,2); 
		wait 1;
	}
	
}

trap3()
{
	trig = getEnt("trap3_trig","targetname");
	level endon("trigger");
	brush1 = getEnt("trap3","targetname");
	brush2 = getEnt("trap3a","targetname");
	

	trig waittill("trigger");
	trig delete();


		while( 1 )
	{
		brush1 moveY (-384,2);
		brush2 moveY (384,2);
		wait 1;
		brush1 moveY (384,2);
		brush2 moveY (-384,2);
		wait 1;
	}
}

trap5()
{
	trig = getent ("trap5_trig" , "targetname");
	level endon("trigger");
	brush = getent ("trap5" , "targetname");
	
	trig waittill ("trigger", player);
	trig delete();
	
	brush moveZ (256 , 1);
	wait 5;
	brush moveZ (-256 , 3);
	
}

trap6()
{
trig = getEnt ("trap6_trig", "targetname");	
	level endon("trigger");
hurt = getEnt ("trap6_spikeshurt", "targetname");	
spikes = getEnt ("trap6", "targetname"); 

hurt enablelinkto(); 
hurt linkto (spikes); 

trig waittill ("trigger");
trig delete ();


{
spikes moveZ (-256,1); 
wait 5;
spikes moveZ (256,1); 
wait 5;
}
}

doora()
{
	dooro = getent ("door" ,"targetname" );
	dooroa = getent ("doora" ,"targetname" );
	old_trigger = getEnt( "dooropen", "targetname" );
	sniper_trigger = getEnt( "trigger_sniper", "targetname" );
	knife_trig = getEnt ("trigger_knife", "targetname");
	bounce_trigger = getEnt( "trigger_bounce", "targetname" );
	
	old_trigger waittill ("trigger", player);
	old_trigger delete();
	knife_trig delete();
	sniper_trigger delete();
	bounce_trigger delete();
	
	noti = SpawnStruct();
	noti.notifyText = "^6>>^1"+player.name+" entered old";
	noti.duration = 6;
	noti.glowcolor = (1,0,0);
	players = getEntArray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	
	dooro movez (98 , 1.1);
	dooroa movez (98 , 1.1);
	wait 1;
}

finish()
{
	trig = getEnt( "finish", "targetname" );
	
	trig waittill ("trigger",player);
	trig delete();

//AUTO 	iPrintlnBold("^1>>^2" + player.name + " finished the map at first place!");
	//noti = SpawnStruct();
	//noti.notifyText = "^6>>^1"+player.name+" finished the map first";
	//noti.duration = 6;
	//noti.glowcolor = (1,0,0);
	//players = getEntArray("player", "classname");
	//for(i=0;i<players.size;i++)
	//	players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
}

sniper()
{
	self endon("death");
	self endon( "disconnect" );	
	self endon( "joined_team" );
	self endon( "joined_spectators" );

	old_trigger = getEnt( "dooropen", "targetname" );
	sniper_trigger = getEnt( "trigger_sniper", "targetname" );
	sniper_originj = getEnt ("jumper_enter_snipe", "targetname");
	knife_trig = getEnt ("trigger_knife", "targetname");
	nade_trigger = getEnt ("nade_trig", "targetname");
	
	sniper_trigger waittill ("trigger", player);
	thread sniper_acti();
	knife_trig delete();
	old_trigger delete();
	nade_trigger delete();
	
	noti = SpawnStruct();
	noti.notifyText = "^6>>^1"+player.name+" entered sniper";
	noti.duration = 6;
	noti.glowcolor = (1,0,0);
	players = getEntArray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	
	player FreezeControls (1);
	player SetOrigin(sniper_originj.origin);	
	player SetPlayerAngles( sniper_originj.angles );
	
//AUTO 	player TakeAllWeapons();
//AUTO 	player GiveWeapon("m40a3_mp");
	wait 0.01;
//AUTO 	player SwitchToWeapon("m40a3_mp");
	
	wait 2;
	player FreezeControls (0);
	
	player thread onDeath_sniper();
	wait 0.1;
	
	
    for(;;)
    {
		wait .1;		
		while(isAlive(player))
		{
			wait 1;
		}
		
    }
}

onDeath_sniper()
{
	self endon("disconnect");
	
	self waittill("death");
	thread sniper();
}

sniper_acti()
{
	sniperacti = getEnt ("activator_enter_snipe", "targetname");


	players = getentarray("player", "classname");
	for(i=0;i<=players.size;i++)
	{
		if(players[i].pers["team"] == "axis")
		{
			players[i] FreezeControls (1);
			players[i] SetOrigin(sniperacti.origin);
			players[i] SetPlayerAngles( sniperacti.angles );
	
//AUTO 			players[i] TakeAllWeapons();
//AUTO 			players[i] GiveWeapon("m40a3_mp");
			wait 0.01;
//AUTO 			players[i] SwitchToWeapon("m40a3_mp");
			wait 2;
			players[i] FreezeControls (0);
		}
	}
}

knife()
{
	self endon("death");
	self endon( "disconnect" );	
	self endon( "joined_team" );
	self endon( "joined_spectators" );
	
	acti = undefined;
	jumper = undefined;
	
	knife_trigger = getEnt ("trigger_knife", "targetname");
	jumper = getEnt ("jumpers_knife", "targetname");
	sniper_trigger = getEnt( "trigger_sniper", "targetname" );
	old_trigger = getEnt( "dooropen", "targetname" );
	nade_trigger = getEnt ("nade_trig", "targetname");
	
	knife_trigger waittill ("trigger", player);
	thread knife_acti();
	sniper_trigger delete();
	old_trigger delete();
	nade_trigger delete();
	
	noti = SpawnStruct();
	noti.notifyText = "^6>>^1"+player.name+" entered knife";
	noti.duration = 6;
	noti.glowcolor = (1,0,0);
	players = getEntArray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	
	player FreezeControls (1);
	player SetOrigin(jumper.origin);	
	player SetPlayerAngles( jumper.angles );
	
//AUTO 	player TakeAllWeapons();
//AUTO 	player GiveWeapon("tomahawk_mp");
	wait 0.05;
//AUTO 	player SwitchToWeapon("tomahawk_mp");
	
	player thread onDeath_knife();
	wait 0.1;
	player FreezeControls (0);
	
	
    for(;;)
    {
		wait .1;		
		while(isAlive(player))
		{
			wait 1;
		}
		
    }
}

onDeath_knife()
{
	self endon("disconnect");
	
	self waittill("death");
	thread knife();
}

knife_acti()
{
	acti = getEnt ("acti_knife", "targetname");


	players = getentarray("player", "classname");
	for(i=0;i<=players.size;i++)
	{
		if(players[i].pers["team"] == "axis")
		{
			players[i] FreezeControls (1);
			players[i] SetOrigin(acti.origin);
			players[i] SetPlayerAngles( acti.angles );
	
//AUTO 			players[i] TakeAllWeapons();
//AUTO 			players[i] GiveWeapon("tomahawk_mp");
			wait 0.05;
//AUTO 			players[i] SwitchToWeapon("tomahawk_mp");
			wait 1;
			players[i] FreezeControls (0);
		}
	}
}

ammo1()
{	
	trig = getEnt( "ammo1", "targetname" );
	
	trig waittill ("trigger", who);
	
	for(;;)
	{
	
		trig waittill ("trigger", who);
		
		
		who takeWeapon( who getCurrentWeapon() ); 

//AUTO 		who giveWeapon("m40a3_mp");
//AUTO 		who GiveMaxAmmo("m40a3_mp");
//AUTO 		who SwitchToWeapon("m40a3_mp");
		
		wait 5;

	}
}

ammo()
{	
	trig = getEnt( "ammo", "targetname" );
	
	trig waittill ("trigger", who);
	
	for(;;)
	{
	
		trig waittill ("trigger", who);
		
		
		who takeWeapon( who getCurrentWeapon() ); 

//AUTO 		who giveWeapon("m40a3_mp");
//AUTO 		who GiveMaxAmmo("m40a3_mp");
//AUTO 		who SwitchToWeapon("m40a3_mp");
		
		wait 5;

	}
}

nade()
{
	self endon("death");
	self endon( "disconnect" );	
	self endon( "joined_team" );
	self endon( "joined_spectators" );
	
	acti = undefined;
	jumper = undefined;
	
	nade_trigger = getEnt ("nade_trig", "targetname");
	knife_trigger = getEnt ("trigger_knife", "targetname");
	jumper = getEnt ("jump_nade", "targetname");
	sniper_trigger = getEnt( "trigger_sniper", "targetname" );
	old_trigger = getEnt( "dooropen", "targetname" );
	
	nade_trigger waittill ("trigger", player);
	thread nade_acti();
	sniper_trigger delete();
	knife_trigger delete();
	old_trigger delete();
	
		noti = SpawnStruct();
	noti.notifyText = "^6>>^1"+player.name+" entered bounce";
	noti.duration = 6;
	noti.glowcolor = (1,0,0);
	players = getEntArray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	
	
	player FreezeControls (1);
	player SetOrigin(jumper.origin);	
	player SetPlayerAngles( jumper.angles );
	
//AUTO 	player TakeAllWeapons();
//AUTO 	player GiveWeapon("tomahawk_mp");
//AUTO 	wait 0.05;
//AUTO 	player SwitchToWeapon("tomahawk_mp");
	player thread onDeath_nade();
//AUTO 	wait 1;
	player FreezeControls (0);
	
//AUTO 	wait 0.1;
	
	
    for(;;)
    {
//AUTO 		wait .1;		
		while(isAlive(player))
		{
//AUTO 			wait 1;
		}
		
    }
}

onDeath_nade()
{
	self endon("disconnect");
	
	self waittill("death");
	thread nade();
}

nade_acti()
{
	acti = getEnt ("acti_nade", "targetname");


	players = getentarray("player", "classname");
	for(i=0;i<=players.size;i++)
	{
		if(players[i].pers["team"] == "axis")
		{
			players[i] FreezeControls (1);
			players[i] SetOrigin(acti.origin);
			players[i] SetPlayerAngles( acti.angles );
	
//AUTO 			players[i] TakeAllWeapons();
//AUTO 			players[i] GiveWeapon("tomahawk_mp");
			wait 0.01;
//AUTO 			players[i] SwitchToWeapon("tomahawk_mp");
			wait 2;
			players[i] FreezeControls (0);
		}
	}
}

jumpreset1(port_allies,port_axis)
{
 trig = getent("broomf", "targetname");

	for(;;)
	{
		trig waittill( "trigger", player );
		if(player.pers["team"] == "axis")
		{
		    level.activ setPlayerangles( level.bacti1.angles );
		    level.activ setOrigin( level.bacti1.origin );
		}
		if(player.pers["team"] == "allies")
		{
		    player setplayerangles( level.bjump1.angles, 3 );
		    player setorigin( level.bjump1.origin, 3 );
		}
	}
}

jumpreset2(port_allies,port_axis)
{
 trig = getent("broomf1", "targetname");

	for(;;)
	{
		trig waittill( "trigger", player );
		if(player.pers["team"] == "axis")
		{
		    level.activ setPlayerangles( level.bacti2.angles );
		    level.activ setOrigin( level.bacti2.origin );
		}
		if(player.pers["team"] == "allies")
		{
		    player setplayerangles( level.bjump2.angles, 3 );
		    player setorigin( level.bjump2.origin, 3 );
		}
	}
}

jumpreset3(port_allies,port_axis)
{
 trig = getent("broomf2", "targetname");

	for(;;)
	{
		trig waittill( "trigger", player );
		if(player.pers["team"] == "axis")
		{
		    level.activ setPlayerangles( level.bacti3.angles );
		    level.activ setOrigin( level.bacti3.origin );
		}
		if(player.pers["team"] == "allies")
		{
		    player setplayerangles( level.bjump3.angles, 3 );
		    player setorigin( level.bjump3.origin, 3 );
		}
	}
}

jumpreset4(port_allies,port_axis)
{
 trig = getent("broomf3", "targetname");

	for(;;)
	{
		trig waittill( "trigger", player );
		if(player.pers["team"] == "axis")
		{
		    level.activ setPlayerangles( level.bacti4.angles );
		    level.activ setOrigin( level.bacti4.origin );
		}
		if(player.pers["team"] == "allies")
		{
		    player setplayerangles( level.bjump4.angles, 3 );
		    player setorigin( level.bjump4.origin, 3 );
		}
	}
}

takescope()
{
level.trig = getEnt("takescopetrig","targetname");
while(1)
{
level.trig waittill("trigger", jumper);

//AUTO jumper TakeAllWeapons();
//AUTO jumper GiveWeapon("m40a3_mp");
//AUTO jumper GiveMaxAmmo("m40a3_mp");
wait 0.01;
//AUTO jumper SwitchToWeapon("m40a3_mp");
}
}

message()
{
	trig = getEnt("message","targetname");
	trig waittill("trigger");
	trig delete();
	
		hud_clock = NewHudElem();
		hud_clock.alignX = "center";
		hud_clock.alignY = "middle";
		hud_clock.horzalign = "center";
		hud_clock.vertalign = "middle";
		hud_clock.alpha = 1;
		hud_clock.x = 0;
		hud_clock.y = -150;
		hud_clock.font = "objective";
		hud_clock.fontscale = 2;
		hud_clock.glowalpha = 1.5;
		hud_clock.glowcolor = (1,1,0);
		hud_clock.label = &"^1Map by Calum";
		hud_clock SetPulseFX( 40, 5400, 200 );
		wait 8;
		hud_clock = NewHudElem();
		hud_clock.alignX = "center";
		hud_clock.alignY = "middle";
		hud_clock.horzalign = "center";
		hud_clock.vertalign = "middle";
		hud_clock.alpha = 1;
		hud_clock.x = 0;
		hud_clock.y = -150;
		hud_clock.font = "objective";
		hud_clock.fontscale = 2;
		hud_clock.glowalpha = 1.5;
		hud_clock.glowcolor = (0,1,0);
		hud_clock.label = &"^1For TwS Deathrun";
		hud_clock SetPulseFX( 40, 5400, 200 );
		wait 6;
}

text()
{
 for(;;)
 {
//AUTO   iprintln("^6>>>^1  Map made by Calum  ");
  wait 30;
//AUTO   iprintln("^6>>>^1 TwS @ 95.211.38.102:29100 ");
  wait 30;
//AUTO   iprintln("^6>>>^1 Bumba is a chicken");
  wait 100;
 }
}

