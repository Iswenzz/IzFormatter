main()
{	
	maps\mp\_load::main();	
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
	
	SetDvar( "player_meleerange", "100" );
	
	game["allies"] = "sas";
	game["axis"] = "russian";
	game["attackers"] = "allies";
	game["defenders"] = "axis";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";
	
	//thread expandTimeLimit( 2 );
	
//AUTO 	ambientPlay("zor");
	precacheItem("m40a3_mp");
//AUTO 	precacheItem("ak74u_mp");
	precacheitem("deserteagle_mp");
	PrecacheShellShock("death");
	
	level.abovehuman["fireball_idle"] = LoadFX("dball/kishot");
	level.abovehuman["fireball_explosion"] = LoadFX("dball/kishotimpact");
	level.abovehuman["fireball_idlebig"] = LoadFX("dball/kishotbig");
	level.abovehuman["fireball_explosionbig"] = LoadFX("dball/kishotimpactbig");
	level.abovehuman["ssjspawn"] = LoadFX("dball/ssjspawn");
	precacheModel( "viewmodel_hands_zombie" );

	setdvar( "r_specularcolorscale", "1" );
//AUTO 	setdvar( "dr_jumpers_speed", "1.2" );
//AUTO 	setdvar( "dr_activators_speed", "1.2" );
	setdvar("r_glowbloomintensity0",".25");
	setdvar("r_glowbloomintensity1",".25");
	setdvar("r_glowskybleedintensity0",".3");
	setdvar("compassmaxrange","1800");
//AUTO 	level.dvar["time_limit"] = 6;
	
	
	level.hurtrig =getent("hurt_meteor","targetname");
	level.hurtrig.dmg = 0;
	
	Dhider= getent("dragonhider","targetname");
	Dhider.angles = (0,180,0);
	level.fx_nukeflash["explosions/nuke_flash"] = loadFx("explosions/nuke_flash");
	//PlayLoopedFX( level.fx_nukeflash,Dhider );
	//playLoopedFx(level.fx_nukeflash["explosions/nuke_flash"], 2, dhider.origin, 0, anglestoforward ((0,0,0)), anglestoup((0,0,0)));
		
	rocks_1=getentarray("rock1","targetname");
	if(isdefined(rocks_1))
	{
	for(i=0;i<rocks_1.size;i++)
	{
	rocks_1[i] thread rock_move();
	rocks_1[i] thread trap3();
	}
	}
	
	
	trap_rotatefloor=getentarray("trap_1","targetname");
	if(isdefined(trap_rotatefloor))
	{
	for(i=0;i<trap_rotatefloor.size;i++)
	{
	trap_rotatefloor[i] thread trap_1_rotatefloorz();
	}
	}
	
	
	thread clientdvar();
	thread credit();
	thread dballs();
	thread rotators_1();
	thread declare();
	thread trap_moveplat();
	thread spikedodgepath();
	thread activatorufoflight();
	thread dragonballmidblock();
	thread dragonballsfound();
	thread hud();
//AUTO 	thread weapon();
	thread lastelevator();
	thread senzubeanrestore();
	thread secretteleport();
	thread secretteleportback();
	thread jumpgamerespawn();
	thread checkactivatorafk();
	thread antilagg();
	
	//transmissions
	thread transmissions();

	//traps
	thread trap1();
	thread trap2();
	thread trap4();
//AUTO 	thread trap_bounce();
	thread boomeye();
	thread trap_crouchpush();
	thread trap_rotator();
	
	
	//level.playernamezor="wingz";
	//level.burn_fx = LoadFX("dball/playerburst");
	level.burn_fx = LoadFX("dball/ssjglow");
	level.glow = LoadFX("dball/playerburst");
	//thread findburner();
	level.firsttime=true;
//AUTO 	thread pickroom();
	thread addtriggers();
	
//AUTO 	level.dvar["time_limit"] = 6;
	level.dvar["dr_timelimit"]=6;
//AUTO 	//level.dvar["time_limit"] += 2;
}

addtriggers()
{
    addTriggerToList("trigger_trap1_rotate");
addTriggerToList("trigger_trap2_fireballs");
addTriggerToList("trigger_trap_rock");
addTriggerToList("trigger_pushtrap");
addTriggerToList("trigger_boomeye");
addTriggerToList("trigger_crouchpusher");
addTriggerToList("trigger_brush_rotator");
addTriggerToList("trap_createabounce");

}

addTriggerToList( name )
{
  if( !isDefined( level.trapTriggers ) )
      level.trapTriggers = [];
  level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

trap_rotator()
{
platform=getent("brush_rotator","targetname");
	level endon("trigger");
trigger=getent("trigger_brush_rotator","targetname");

if (!isdefined(platform.speed))
 platform.speed = 8;
if (!isdefined(platform.script_noteworthy))
 platform.script_noteworthy = "z";
 
trigger waittill("trigger", player);
 while(true)
{
 // rotateYaw(float rot, float time, <float acceleration_time>, <float deceleration_time>);
 if (platform.script_noteworthy == "z")
  platform rotateYaw(-360,platform.speed);
 else if (platform.script_noteworthy == "x")
  platform rotateRoll(-360,platform.speed);
 else if (platform.script_noteworthy == "y")
  platform rotatePitch(-360,platform.speed);
 wait ((platform.speed)-0.1); // removes the slight hesitation that waittill("rotatedone"); gives.
 // self waittill("rotatedone");
}
}

antilagg()
{
triggerdeath=getent("antilaggbind","targetname");
while(1)
{
triggerdeath waittill("trigger", player);
player thread antilaggbinder();
}
}

antilaggbinder()
{
	self endon( "death" );
	self ShellShock( "death", 5 );
	self PlaySoundToPlayer("laggbinderz", self );
	wait (1);
	self ShellShock( "death", 5 );
	wait (3);
	self suicide();
}

checkactivatorafk()
{
level.roomdeclaredbyacti = false;
trigger=getent("roomdeclared","targetname");
trigger waittill("trigger", player);
if(level.roomdeclaredbyacti == false)
{
//AUTO iPrintLnBold("Activator hasnt picked anyroom");
//AUTO iPrintLnBold("^1Knife room open !");
level.knife delete();
level.power delete();
level.roomdeclaredbyacti = true;
thread kniferoom();
}
}

pickroom()
{
level.power=getent("trigger_pickpower","targetname");
level.jump=getent("trigger_pickjump","targetname");
level.knife=getent("trigger_pickknife","targetname");
thread powerpick();
thread jumppick();
thread knifepick();
}

powerpick()
{
level.power waittill("trigger", player);
//AUTO iPrintLnBold("Activator has picked : ^1PowerGame"); //Change the message if you want
level.knife delete();
level.jump delete();
level.roomdeclaredbyacti = true;
thread fightpowertesting();
}

jumppick()
{
level.jump waittill("trigger", player);
//AUTO iPrintLnBold("Activator has picked : ^1JumpGame"); //Change the message if you want
level.power delete();
level.jump delete();
level.roomdeclaredbyacti = true;
thread jumpergame();
}

knifepick()
{
level.knife waittill("trigger", player);
//AUTO iPrintLnBold("Activator has picked : ^1KnifeGame"); //Change the message if you want
level.power delete();
level.jump delete();
level.roomdeclaredbyacti = true;
thread kniferoom();
}

kniferoom()
{
level.doors=getent("kniferoomdoors","targetname");
level.kniferoom=getent("kniferoomtrigger","targetname");
activatorspot=getent("kniferoomtrigger_activatorteleport","targetname");
jumperspot=getent("kniferoomtrigger_jumperteleport","targetname");
level.firstteleportknife = false;
while(1)
{
level.kniferoom waittill("trigger", player);
wait(0.05);
if(level.firstteleportknife == false)
{
player FreezeControls(true);
level.activ FreezeControls(true);
player PlaySoundToPlayer( "tele", player );
wait(0.05);
player SetOrigin( jumperspot.origin );
player setplayerangles(jumperspot.angles );
player thread findburner();
//AUTO iPrintLnBold(player.name+ " has entered ^1Knife room ! !"); //Change the message if you want
level.activ PlaySoundToPlayer( "tele", level.activ );
wait(0.05);
level.activ SetOrigin( activatorspot.origin );
level.activ setplayerangles(activatorspot.angles );
wait(0.05);
level.activ thread findburner();
AmbientStop();
//AUTO ambientPlay("endzor");
thread kniferoomdeadcounter();
player thread countdown();
level.activ thread countdown();
player oneonone();
}
else
{
player FreezeControls(true);
level.activ FreezeControls(true);
player PlaySoundToPlayer( "tele", player );
wait(0.05);
player SetOrigin( jumperspot.origin );
player setplayerangles(jumperspot.angles );
player thread findburner();
//AUTO iPrintLnBold(player.name+ " has entered ^1Knife room ! !"); //Change the message if you want
level.activ PlaySoundToPlayer( "tele", level.activ );
wait(0.05);
level.activ SetOrigin( activatorspot.origin );
level.activ setplayerangles(activatorspot.angles );
wait(0.05);
AmbientStop();
//AUTO ambientPlay("endzor");
thread kniferoomdeadcounter();
player thread countdown();
player thread tillstayalive();
level.activ thread countdown();
}
level.firstteleportknife = true;
wait(3);
}
}

oneonone()
{
self endon( "death" );
for(;;)
{
wait(3);
}
}

tillstayalive()
{
self endon( "death" );
for(;;)
{
wait(2);
}
}

grantxp()
{
players = getentarray("player", "classname");
for(i=0;i<=players.size;i++)
            {
            wait 0.1;
                if(isAlive(players[i]))
                {
		wait(0.05);
//AUTO 		players[i] braxi\_rank::giveRankXp( "activator" );
//AUTO 		players[i] braxi\_rank::giveRankXp( "activator" );
//AUTO 		players[i] braxi\_rank::giveRankXp( "activator" );
//AUTO 		players[i] braxi\_rank::giveRankXp( "activator" );
//AUTO 		players[i] braxi\_rank::giveRankXp( "activator" );
//AUTO 		players[i] braxi\_rank::giveRankXp( "activator" );
//AUTO 		players[i] braxi\_rank::giveRankXp( "activator" );
//AUTO 		players[i] braxi\_rank::giveRankXp( "activator" );
//AUTO 		players[i] braxi\_rank::giveRankXp( "activator" );
//AUTO 		players[i] braxi\_rank::giveRankXp( "activator" );
}
}
}

kniferoomdeadcounter()
{
trigger=getent("kniferoomdead","targetname");
while(1)
{
trigger waittill("trigger", other);
	if(other == level.activ)
	{
		other suicide();
	}
	else
	{
		other suicide();
		if(isAlive(level.activ))
		{
//AUTO 		level.activ braxi\_rank::giveRankXP( "melee" );
		}
	}
	}
}

