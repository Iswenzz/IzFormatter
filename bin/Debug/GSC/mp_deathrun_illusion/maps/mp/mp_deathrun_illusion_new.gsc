main()
{
	maps\mp\_load::main();
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
	
	
	//setExpFog(500, 2200, 0, 0, 0, 0.5);
//AUTO 	//Print3d( (0,0,0), "START", (1.0, 0.8, 0.5), 1000, 1000, 100000 );
	
	
	precacheItem("m40a3_mp");
	precacheItem("remington700_mp");
//AUTO 	precacheItem("ak74u_mp");
	precacheItem("deserteaglegold_mp");	
		
	
	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";
	
		
	setdvar( "r_specularcolorscale", "1" );
	setdvar("r_glowbloomintensity0",".25");
	setdvar("r_glowbloomintensity1",".25");
	setdvar("r_glowskybleedintensity0",".3");
		


//threads
thread twister1a();
thread twister1b();
thread short1();
thread trap1();
thread trap2();
thread trap3();
thread trap4();
thread trap5();
thread trap6();
thread trap7();
thread trap8();
thread rotate7sense();
thread rotateparadise();
thread start();
thread WatchEndTrigger();
//AUTO thread bounce();
thread actistartup();
thread pickgametype();
thread fakebrushes();
thread addtriggers();
thread fixvariables();
}

addtriggers()
{
addTriggerToList("trap1act");
addTriggerToList("trap2act");
addTriggerToList("trap3act");
addTriggerToList("trap4act");
addTriggerToList("trap5act");
addTriggerToList("trap6act");
addTriggerToList("trap7act");
addTriggerToList("trap8act");
}

addTriggerToList( name )
{
  if( !isDefined( level.trapTriggers ) )
      level.trapTriggers = [];
  level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

fakebrushes()
{
fakebrush = getentarray("fake", "targetname");
	for(i = 0; i < fakebrush.size; i++)
	{
                    thread spin(fakebrush[i]);
					thread spots(fakebrush[i]);
	}
}

spin(brush)
{
if (!isdefined(brush.speed))
 brush.speed = 3;
if (!isdefined(brush.script_noteworthy))
 brush.script_noteworthy = "z";

while(true)
{
 // rotateYaw(float rot, float time, <float acceleration_time>, <float deceleration_time>);
 if (brush.script_noteworthy == "z")
  brush rotateYaw(360,brush.speed);
 else if (brush.script_noteworthy == "x")
  brush rotateRoll(360,brush.speed);
 else if (brush.script_noteworthy == "y")
  brush rotatePitch(360,brush.speed);
 wait ((brush.speed)-0.1); // removes the slight hesitation that waittill("rotatedone"); gives.
 //epic waittill("rotatedone");
}
}

spots(brush)
{
brush notsolid();
while(1)
{
//randx = RandomIntRange(-777, 3831 );
randx = RandomIntRange(-4777, 7831 );
spot=(randx,19911,728);				
brush moveTo(spot,1);
brush waittill("movedone");
randwait = RandomIntRange(1, 10 );
wait(randwait);
brush show();
randsolid = RandomIntRange(1, 10 );
if(randsolid<3)
	brush solid();
else
	brush notsolid();
randmovetime = RandomIntRange(3, 12 );
randx2 = RandomIntRange(256, 2816 );
endspot=(randx2,7768,728);
brush moveTo(endspot,randmovetime);
brush waittill("movedone");
brush notsolid();
brush hide();
}

}

actistartup()
{
//pusher
push_brush=getent("pusher","targetname");
level waittill("round_started");
wait(10);
if(level.gamepicked==true)
{
	push_brush movey(240,1);
	push_brush waittill("movedone");
	thread dropdown();
}
else
{
//AUTO ambientPlay("default");
level.angletrigger delete();
level.twisttrigger delete();
thread dropdown();
push_brush movey(240,3);
push_brush waittill("movedone");
}
level notify("actipickedgame");
}

pickgametype()
{
level.gamepicked=false;
thread anglemode();
}

anglemode()
{
level.angletrigger = getEnt("angle", "targetname");
level.angletrigger waittill("trigger", player);

thread angleturner();
//AUTO iprintlnbold("Angle Mode Activated");
//AUTO 	ambientPlay("angle");
level.gamepicked=true;

}

angleturner()
{
spot=getent("jumpertele","targetname");
trigger=getent("modetrig","targetname");
while(1)
{
trigger waittill("trigger", player);
if(!isdefined(player.angleset))
	{
	player SetPlayerAngles(spot.origin);
	player.angleset=true;
	}
wait(0.05);
}
}

dropdown()
{
level.floor=getent("floor","targetname");
level.floor delete();
}

trap1()
{
trigger = getEnt("trap1act", "targetname");
	level endon("trigger");
trigger waittill("trigger", player);
trigger delete();
thread trapa();
thread trapb();
}

fixvariables()
{
trigger=getent("modetrig2","targetname");
while(1)
{
trigger waittill("trigger", player);
	if(isdefined(player.angleset))
		player.angleset=undefined;
wait 0.05;
}
}

trapa()
{
brush1 = getEnt("trap1a", "targetname");
	level endon("trigger");
while(1)
{
brush1 movey(64,0.5);
brush1 waittill("movedone");
brush1 movey(-64,0.5);
brush1 waittill("movedone");
brush1 movey(-64,0.5);
brush1 waittill("movedone");
brush1 movey(64,0.5);
brush1 waittill("movedone");
}
}

trapb()
{
brush1 = getEnt("trap1b", "targetname");
	level endon("trigger");
while(1)
{
brush1 movex(64,0.5);
brush1 waittill("movedone");
brush1 movex(-64,0.5);
brush1 waittill("movedone");
brush1 movex(-64,0.5);
brush1 waittill("movedone");
brush1 movex(64,0.5);
brush1 waittill("movedone");
}
}

trap2()
{
trigger = getEnt("trap2act", "targetname");
	level endon("trigger");
trigger waittill("trigger", player);
trigger delete();
thread trap2a();
thread trap2b();
}

trap2a()
{
epic = getEnt("trap2a", "targetname");
	level endon("trigger");
if (!isdefined(epic.speed))
 epic.speed = 12;
if (!isdefined(epic.script_noteworthy))
 epic.script_noteworthy = "z";

while(true)
{
 // rotateYaw(float rot, float time, <float acceleration_time>, <float deceleration_time>);
 if (epic.script_noteworthy == "z")
  epic rotateYaw(360,epic.speed);
 else if (epic.script_noteworthy == "x")
  epic rotateRoll(360,epic.speed);
 else if (epic.script_noteworthy == "y")
  epic rotatePitch(360,epic.speed);
 wait ((epic.speed)-0.1); // removes the slight hesitation that waittill("rotatedone"); gives.
 //epic waittill("rotatedone");
}
}

trap2b()
{
epic = getEnt("trap2b", "targetname");
	level endon("trigger");
if (!isdefined(epic.speed))
 epic.speed = 12;
if (!isdefined(epic.script_noteworthy))
 epic.script_noteworthy = "z";

while(true)
{
 // rotateYaw(float rot, float time, <float acceleration_time>, <float deceleration_time>);
 if (epic.script_noteworthy == "z")
  epic rotateYaw(-360,epic.speed);
 else if (epic.script_noteworthy == "x")
  epic rotateRoll(-360,epic.speed);
 else if (epic.script_noteworthy == "y")
  epic rotatePitch(-360,epic.speed);
 wait ((epic.speed)-0.1); // removes the slight hesitation that waittill("rotatedone"); gives.
 //epic waittill("rotatedone");
}
}

trap3()
{
trigger = getEnt("trap3act", "targetname");
	level endon("trigger");
trigger waittill("trigger", player);
trigger delete();
thread trap3a();
thread trap3b();
}

trap3a()
{
brush1 = getEnt("trap3a", "targetname");
	level endon("trigger");
brush1 movey(-1344,4);
brush1 waittill("movedone");
}

trap3b()
{
wait 4;
	level endon("trigger");
brush1 = getEnt("trap3b", "targetname");
brush1 movey(-1088,3);
brush1 waittill("movedone");
}

short1()
{
trigger = getEnt("short1act", "targetname");
brush1 = getEnt("short1plat", "targetname");
trigger waittill("trigger");
trigger delete();
//AUTO iprintlnbold("Target hit");
brush1 movey(-576,3);
brush1 waittill("movedone");
}

trap4()
{
trigger = getEnt("trap4act", "targetname");
	level endon("trigger");
trigger waittill("trigger", player);
trigger delete();
thread trap4a();
thread trap4b();
thread trap4c();
thread trap4d();
}

trap4a()
{
brush1 = getEnt("trap4a", "targetname");
	level endon("trigger");
while(1)
{
brush1 movey(64,0.6);
brush1 waittill("movedone");
brush1 movey(-64,0.6);
brush1 waittill("movedone");
brush1 movez(-64,0.6);
brush1 waittill("movedone");
brush1 movez(64,0.6);
brush1 waittill("movedone");
}
}

trap4b()
{
brush1 = getEnt("trap4b", "targetname");
	level endon("trigger");
while(1)
{
brush1 movey(-64,0.6);
brush1 waittill("movedone");
brush1 movey(64,0.6);
brush1 waittill("movedone");
brush1 movex(64,0.6);
brush1 waittill("movedone");
brush1 movex(-64,0.6);
brush1 waittill("movedone");
}
}

trap4c()
{
brush1 = getEnt("trap4c", "targetname");
	level endon("trigger");
while(1)
{
brush1 movex(64,0.6);
brush1 waittill("movedone");
brush1 movex(-64,0.6);
brush1 waittill("movedone");
brush1 movey(-64,0.6);
brush1 waittill("movedone");
brush1 movey(64,0.6);
brush1 waittill("movedone");
}
}

trap4d()
{
brush1 = getEnt("trap4d", "targetname");
	level endon("trigger");
while(1)
{
brush1 movez(-32,0.6);
brush1 waittill("movedone");
brush1 movez(32,0.6);
brush1 waittill("movedone");
brush1 movex(-64,0.6);
brush1 waittill("movedone");
brush1 movex(64,0.6);
brush1 waittill("movedone");
}
}

trap5()
{
trigger = getEnt("trap5act", "targetname");
	level endon("trigger");
trigger waittill("trigger", player);
trigger delete();
thread trap5a();
thread trap5b();
thread trap5c();
}

trap5a()
{
brush1 = getEnt("trap5a", "targetname");
	level endon("trigger");
while(1)
{
brush1 movex(832,2.5);
brush1 waittill("movedone");
brush1 movex(-832,2.5);
brush1 waittill("movedone");
}
}

trap5b()
{
brush1 = getEnt("trap5b", "targetname");
	level endon("trigger");
while(1)
{
brush1 movex(-832,2.5);
brush1 waittill("movedone");
brush1 movex(832,2.5);
brush1 waittill("movedone");
}
}

trap5c()
{
brush1 = getEnt("trap5c", "targetname");
	level endon("trigger");
wait 0.5;
brush1 movez(-488,2.5);
brush1 waittill("movedone");
}

trap6()
{
trigger = getEnt("trap6act", "targetname");
	level endon("trigger");
trigger waittill("trigger", player);
trigger delete();
thread trap6a();
}

trap6a()
{
brush1 = getEnt("trap6a", "targetname");
	level endon("trigger");
while(1)
{
brush1 movey(-96,0.5);
brush1 waittill("movedone");
brush1 movez(64,0.5);
brush1 waittill("movedone");
brush1 movey(-4032,4);
brush1 waittill("movedone");
brush1 hide();
brush1 notsolid();
brush1 movey(96,0.5);
brush1 waittill("movedone");
brush1 movez(-64,0.5);
brush1 waittill("movedone");
brush1 movey(4032,0.5);
brush1 waittill("movedone");
brush1 show();
brush1 solid();
wait(1);
}
}

twister1a()
{
epic = getEnt("twister1a", "targetname");
if (!isdefined(epic.speed))
 epic.speed = 8;
if (!isdefined(epic.script_noteworthy))
 epic.script_noteworthy = "z";

while(true)
{
 // rotateYaw(float rot, float time, <float acceleration_time>, <float deceleration_time>);
 if (epic.script_noteworthy == "z")
  epic rotateYaw(360,epic.speed);
 else if (epic.script_noteworthy == "x")
  epic rotateRoll(360,epic.speed);
 else if (epic.script_noteworthy == "y")
  epic rotatePitch(360,epic.speed);
 wait ((epic.speed)-0.1); // removes the slight hesitation that waittill("rotatedone"); gives.
 //epic waittill("rotatedone");
}
}

twister1b()
{
epic = getEnt("twister1b", "targetname");
if (!isdefined(epic.speed))
 epic.speed = 8;
if (!isdefined(epic.script_noteworthy))
 epic.script_noteworthy = "z";

while(true)
{
 // rotateYaw(float rot, float time, <float acceleration_time>, <float deceleration_time>);
 if (epic.script_noteworthy == "z")
  epic rotateYaw(-360,epic.speed);
 else if (epic.script_noteworthy == "x")
  epic rotateRoll(-360,epic.speed);
 else if (epic.script_noteworthy == "y")
  epic rotatePitch(-360,epic.speed);
 wait ((epic.speed)-0.1); // removes the slight hesitation that waittill("rotatedone"); gives.
 //epic waittill("rotatedone");
}
}

trap7()
{
trigger = getEnt("trap7act", "targetname");
	level endon("trigger");
trigger waittill("trigger", player);
trigger delete();
thread trap7a();
}

trap7a()
{
epic = getEnt("trap7a", "targetname");
	level endon("trigger");
if (!isdefined(epic.speed))
 epic.speed = 15;
if (!isdefined(epic.script_noteworthy))
 epic.script_noteworthy = "x";

while(true)
{
 // rotateYaw(float rot, float time, <float acceleration_time>, <float deceleration_time>);
 if (epic.script_noteworthy == "z")
  epic rotateYaw(-360,epic.speed);
 else if (epic.script_noteworthy == "x")
  epic rotateRoll(-360,epic.speed);
 else if (epic.script_noteworthy == "y")
  epic rotatePitch(-360,epic.speed);
 wait ((epic.speed)-0.1); // removes the slight hesitation that waittill("rotatedone"); gives.
 //epic waittill("rotatedone");
}
}

trap8()
{
trigger = getEnt("trap8act", "targetname");
	level endon("trigger");
trigger waittill("trigger", player);
trigger delete();
thread trap8a();
}

trap8a()
{
epic = getEnt("trap8a", "targetname");
	level endon("trigger");
if (!isdefined(epic.speed))
 epic.speed = 2;
if (!isdefined(epic.script_noteworthy))
 epic.script_noteworthy = "y";

while(true)
{
 // rotateYaw(float rot, float time, <float acceleration_time>, <float deceleration_time>);
 if (epic.script_noteworthy == "z")
  epic rotateYaw(-360,epic.speed);
 else if (epic.script_noteworthy == "x")
  epic rotateRoll(-360,epic.speed);
 else if (epic.script_noteworthy == "y")
  epic rotatePitch(-360,epic.speed);
 wait ((epic.speed)-0.1); // removes the slight hesitation that waittill("rotatedone"); gives.
 //epic waittill("rotatedone");
 wait 2;
  // rotateYaw(float rot, float time, <float acceleration_time>, <float deceleration_time>);
 if (epic.script_noteworthy == "z")
  epic rotateYaw(360,epic.speed);
 else if (epic.script_noteworthy == "x")
  epic rotateRoll(360,epic.speed);
 else if (epic.script_noteworthy == "y")
  epic rotatePitch(360,epic.speed);
 wait ((epic.speed)-0.1); // removes the slight hesitation that waittill("rotatedone"); gives.
 //epic waittill("rotatedone");
 wait 5;
}
}

rotate7sense()
{
epic = getEnt("7sense", "targetname");
if (!isdefined(epic.speed))
 epic.speed = 5;
if (!isdefined(epic.script_noteworthy))
 epic.script_noteworthy = "z";

while(true)
{
 // rotateYaw(float rot, float time, <float acceleration_time>, <float deceleration_time>);
 if (epic.script_noteworthy == "z")
  epic rotateYaw(-360,epic.speed);
 else if (epic.script_noteworthy == "x")
  epic rotateRoll(-360,epic.speed);
 else if (epic.script_noteworthy == "y")
  epic rotatePitch(-360,epic.speed);
 wait ((epic.speed)-0.1); // removes the slight hesitation that waittill("rotatedone"); gives.
 //epic waittill("rotatedone");
 }
 }

 rotateparadise()
{
epic = getEnt("paradise", "targetname");
if (!isdefined(epic.speed))
 epic.speed = 5;
if (!isdefined(epic.script_noteworthy))
 epic.script_noteworthy = "z";
 
while(true)
{
  epic rotateYaw(720,epic.speed);
	epic waittill("rotatedone");
	epic rotateRoll(720,2);
	epic waittill("rotatedone");
	epic rotateYaw(-720,epic.speed);
	epic waittill("rotatedone");
		epic rotateRoll(720,2);
	epic waittill("rotatedone");
 }
 }

start()
{
brush1 = getEnt("startdoor", "targetname");
level waittill("actipickedgame");
brush1 movez(-832,2.5);
brush1 waittill("movedone");
brush1 delete();
}

WatchEndTrigger()
{	
	triggertele = getEnt("roomtrigger", "targetname");
	level.acti_enemy = undefined;
	level.turn = 1;
	level.jumper_turn = [];
	while(1)
	{
		triggertele waittill("trigger", player );
		if( getTeamPlayersAlive("axis") < 1 )
		{
//AUTO 			player iprintlnbold("^1You can't fight alone.");
			return;
		}
		
		if( isDefined( level.acti_enemy ) && level.acti_enemy != player )
		{
			self.control = 0;
			for(clturn=1;clturn<level.turn;clturn++)
			{
				if( level.jumper_turn[clturn] ==  player )
				{	self.control = 1;
				}
			}
			
			if( self.control != 1)
			{
				level.turn = level.turn + 1;
//AUTO 				player iprintlnbold("^3Finished " + level.turn );
				level.jumper_turn[level.turn] = player;
				wait 3;
			}
			else
			{
//AUTO 				player iprintlnbold("Wait your turn.");
				wait 3;
			}
			
				
		}
		if( !isDefined(level.acti_enemy))
		{
			level.jumper_turn[level.turn] = player;
			level.acti_enemy = level.jumper_turn[1];
//AUTO 			iprintlnbold( player.name + " finished first!");
			randsong = RandomIntRange(1, 100 );
			if(randsong<50)
//AUTO 				ambientPlay("impossible");
			else
//AUTO 				ambientPlay("twist");
//AUTO 			player iprintlnbold("^11 VS 1 Fight!");
			thread StartFinalFight();
			thread controljumper();	
		}
	}
}

controljumper()
{
	
	while(1)
	{
		
		if(isAlive(level.acti_enemy))
		{
			for(turn=1;turn<level.turn;turn++)
			{
//AUTO 				iprintln( turn + "^2 >" + level.jumper_turn[turn]);
				wait 2;
	   		}
			
		}
		else
		{
			for(turn=1;turn<level.turn;turn++)
			{	
				if( isAlive(level.jumper_turn[turn]))
				{
					level.acti_enemy = level.jumper_turn[turn];
					thread StartFinalFight();
				}
			}	
		     }
	wait 3;
	}
}

StartFinalFight()
{
	

	acti = undefined;
	jumper = level.acti_enemy;

	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
	{
		if( players[i].pers["team"] == "axis" && isAlive(players[i]) )
		{
			acti = players[i];
			break;
		}
	}
	



	spawnorigin = getEnt("jumpertele", "targetname");
	level.actspawnorigin = getEnt("actitele", "targetname");
		
	acti SetPlayerAngles( level.actspawnorigin.angles );
	acti SetOrigin( level.actspawnorigin.origin );
	jumper SetPlayerAngles( spawnorigin.angles );
	jumper SetOrigin( spawnorigin.origin );
	
//AUTO 	acti takeallweapons();
//AUTO 	acti GiveWeapon("m40a3_mp");
//AUTO 	acti GiveWeapon("remington700_mp");
//AUTO 	acti SwitchToWeapon( "m40a3_mp" );
//AUTO 	acti GiveMaxAmmo( self.pers["m40a3_mp"] );
//AUTO 	acti GiveMaxAmmo( self.pers["remington700_mp"] );
	
//AUTO 	jumper takeallweapons();
//AUTO 	jumper GiveWeapon("m40a3_mp");
//AUTO 	jumper GiveWeapon("remington700_mp");
//AUTO 	jumper SwitchToWeapon( "m40a3_mp" );
//AUTO 	jumper GiveMaxAmmo( self.pers["m40a3_mp"] );
//AUTO 	jumper GiveMaxAmmo( self.pers["remington700_mp"] );


	acti FreezeControls(1);
	jumper FreezeControls(1);
	

	wait 2;

	noti = SpawnStruct();
	noti.titleText = "=|FINAL FIGHT|=";
	noti.notifyText = "1 VS 1 ";
	noti.duration = 5;
	noti.glowcolor = (1,0,0);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	
	wait 2;
	
	noti = SpawnStruct();
	noti.titleText = acti.name + " ^3VS ^7" + jumper.name;
	noti.notifyText = "GET READY!";
	noti.duration = 5;
	noti.glowcolor = (1,0,0);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	
	wait 2;
	
	VisionSetNaked( "finalfight_mp", 2 );
	jumper FreezeControls(0);
	acti FreezeControls(0);
	
//AUTO 	iprintlnbold("^3F  I  G  H  T !");
}

bounce()
{
trigger=getent("bounceskiptrig","targetname");
brush=getent("bounceskip","targetname");
brush hide();
brush notsolid();
trigger waittill("trigger", other);
brush show();
brush solid();
}

