main()
{
	maps\mp\_load::main();
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
	
	
	setExpFog(500, 2200, 0.81, 0.75, 0.63, 0.5);
//AUTO 	Print3d( (0,0,0), "START", (1.0, 0.8, 0.5), 1000, 1000, 100000 );
	
	
	precacheItem("m40a3_mp");
	precacheItem("remington700_mp");
//AUTO 	precacheItem("ak74u_mp");
	precacheItem("deserteaglegold_mp");	
	
	
//AUTO 	ambientPlay("ambient1");
	
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
	
	
	rotaterollers = getentarray("rollers","targetname");
	if(isdefined(rotaterollers))
	{
	for(i=0;i<rotaterollers.size;i++)
	{
	wait(0.05);
	rotaterollers[i] thread trap_rollers();
	}
	}
	
	rotateplanksz = getentarray("rotatestickz","targetname");
	if(isdefined (rotateplanksz) )
	{
	for(i=0;i<rotateplanksz.size;i++)
	{
	rotateplanksz[i] thread rotateplanks_always();
	}
	}
		
	elevatorparts = getentarray("elevator","targetname");
	if(isdefined(elevatorparts))
	{
	for(i=0;i<elevatorparts.size;i++)
	{
	wait(0.05);
	elevatorparts[i] thread elevator();
	}
	}
	
	elevatorpartsactivator = getentarray("elevator_activator","targetname");
	if(isdefined(elevatorpartsactivator))
	{
	for(i=0;i<elevatorpartsactivator.size;i++)
	{
	elevatorpartsactivator[i] thread activator_elevator();
	}
	}
	
	twisterparts = getentarray("trap_twisters","targetname");
	if(isdefined(twisterparts))
	{
	for(i=0;i<twisterparts.size;i++)
	{
	twisterparts[i] thread trap_twister();
	}
	}
	
		
	thread startdoor();
	thread startdoor2();
	thread trap_4squares();
	thread elevator();
	thread trap_pusher();
	thread platform_pusher();
	thread trap_spikes_left();
	thread trap_spikes_right();
	thread trap_lifter();
	thread secondfloor();
	thread finaldoors();
	thread startact();
	thread hardlevel();
	thread finaldoor();
//AUTO 	thread teleportsniperroom();
	thread takeguns();
	thread trap_floor();
	thread teleportjump();
	thread jumperrespawn();
//AUTO 	thread jumperrespawn_bouncer();
//AUTO 	thread jumproomright();
//AUTO 	thread jumproomleft();
//AUTO 	thread jumproommid();
	thread jump_teleport_fail2();
	thread jump_teleport_fail();
//AUTO 	thread secretroom_unlock();
//AUTO 	thread secretroom_teleport();
//AUTO 	thread secretroom_teleport_back();
//AUTO 	thread secretroom_teleport_fail();
//AUTO 	thread secretroom_teleport_fail3();
//AUTO 	thread secretroom_teleport_fail4();
//AUTO 	thread secretroom_teleport_fail2();
//AUTO 	thread secretroom_teleport_fail5();
//AUTO 	thread secretroom_teleport_fail6();
//AUTO 	thread secretroom_teleport_fail7();
	thread jump_teleport_end();
	thread jumperendclip();
	thread unlock_door();
	
	thread addTriggerToList( "hardlevel" );
	thread addTriggerToList( "trigger_4squares" );
	thread addTriggerToList( "trigger_pusher" );
	thread addTriggerToList( "trigger_rollers" );
	thread addTriggerToList( "trigger_spikes" );
	thread addTriggerToList( "trigger_lifter" );
	thread addTriggerToList( "spintest" );
	thread addTriggerToList( "trap_rotatefloor" );
	
}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

hardlevel()
{
level.hardtrigger = getEnt("hardlevel", "targetname");
level.hardtrigger waittill("trigger", player);
if( isDefined( level.trapsDisabled ) && level.trapsDisabled)
{
//AUTO player iPrintLnBold("^1Stop being a low"); //Change the message if you want
level.hardtrigger delete();
}
else
{
//AUTO iPrintLnBold(player.name+ " put ^1Hard-Mode ^7on"); //Change the message if you want
thread hardlevel_mover();
thread hardlevel_nonsolid();
thread hardlevel_laser1();
thread hardlevel_laser2();
thread hardlevel_pilars();
level.hardtrigger delete();
}
}

hardlevel_pilars()
{
hardlevelpilar1 = getEnt("hardlevel_pilar1", "targetname");
hardlevelpilar2 = getEnt("hardlevel_pilar2", "targetname");
hardlevelpilar3 = getEnt("hardlevel_pilar3", "targetname");
hardlevelpilar4 = getEnt("hardlevel_pilar4", "targetname");
while(1)
{
hardlevelpilar1 movez(100,5);
hardlevelpilar2 movez(-110,5.5);
hardlevelpilar3 movez(80,4);
hardlevelpilar4 movez(-150,7.5);
hardlevelpilar4 waittill("movedone");
hardlevelpilar1 movez(-100,5);
hardlevelpilar2 movez(110,5.5);
hardlevelpilar3 movez(-80,4);
hardlevelpilar4 movez(150,7.5);
hardlevelpilar4 waittill("movedone");
}
}

hardlevel_mover()
{
trigger = getEnt("hardlevel_dropdown_trigger", "targetname");
trigger waittill("trigger");
hardlevelmover = getEnt("hardlevel_dropdown", "targetname");
hardlevelmover movez(-600,1);
hardlevelmover waittill ("movedone");
hardlevelmover movez(600,1);
hardlevelmover waittill ("movedone");
}

hardlevel_nonsolid()
{
hardlevelstairs = getEnt("hardlevel_nonsolid", "targetname");
hardlevelstairs1 = getEnt("hardlevel_nonsolid1", "targetname");
hardlevelstairs2 = getEnt("hardlevel_nonsolid2", "targetname");
hardlevelstairs3 = getEnt("hardlevel_nonsolid3", "targetname");
hardlevelstairs4 = getEnt("hardlevel_nonsolid4", "targetname");
hardlevelstairs5 = getEnt("hardlevel_nonsolid5", "targetname");
hardlevelstairs7 = getEnt("hardlevel_nonsolid7", "targetname");
hardlevelstairs notsolid();
hardlevelstairs1 notsolid();
hardlevelstairs2 notsolid();
hardlevelstairs3 notsolid();
hardlevelstairs4 notsolid();
hardlevelstairs5 notsolid();
hardlevelstairs7 notsolid();
}

hardlevel_laser1()
{
laser1 = getEnt("hardlevel_laser1", "targetname");
laser1_hurt = getEnt("hardlevel_laser1_hurt", "targetname");	
for(;;)
{
wait(0.05);
laser1 movex(230,1);
laser1_hurt.origin += (230,0,0);
laser1 waittill("movedone");
laser1 movex(-230,1);
laser1_hurt.origin += (-230,0,0);
laser1 waittill("movedone");
}
}

hardlevel_laser2()
{
laser2 = getEnt("hardlevel_laser2", "targetname");
laser2_hurt = getEnt("hardlevel_laser2_hurt", "targetname");	
for(;;)
{
wait(0.05);
laser2 movez(-100,1);
laser2_hurt.origin += (0,0,-100);
laser2 waittill("movedone");
laser2 movez(100,1);
laser2_hurt.origin += (0,0,100);
laser2 waittill("movedone");
}
}

finaldoor()
{
door=getent("finaldoor","targetname");
wall=getent("finaldoor_wall","targetname");
level.classictrigger = getEnt("lastdoor", "targetname");
level.classictrigger waittill("trigger");
level.snipertrigger delete();
level.jumpertrigger delete();
//AUTO iPrintLnBold("Final door is opening"); //Change the message if you want
door movez(-200,3);
wall movez(200,1);
door waittill ("movedone");
level.square delete();
level.pushertrig delete();
level.rollertrig delete();
level.spiketrig delete();
level.liftertrig delete();
level.twistertrig delete();
level.floortrig delete();
}

startact()
{
door=getent("startact","targetname");
wait(12);
door movez(-200,3);
door waittill ("movedone");
}

startdoor()
{
door=getent("startdoor","targetname");
wait(12);
//AUTO iPrintLnBold("^2Door is opening"); //Change the message if you want
door movez(-325,10,1,9);
door waittill ("movedone");
}

startdoor2()
{
door2=getent("startdoor2","targetname");
wait(12);
door2 movez(-325,10,1,9);
door2 waittill ("movedone");
}

rotateplanks_always()
{
if (!isdefined(self.speed))
 self.speed = 2;
if (!isdefined(self.script_noteworthy))
 self.script_noteworthy = "y";
while(true)
{
wait(0.05);
 // rotateYaw(float rot, float time, <float acceleration_time>, <float deceleration_time>);
 if (self.script_noteworthy == "z")
  self rotateYaw(360,self.speed);
 else if (self.script_noteworthy == "x")
  self rotateRoll(360,self.speed);
 else if (self.script_noteworthy == "y")
  self rotatePitch(360,self.speed);
 wait ((self.speed)-0.1); // removes the slight hesitation that waittill("rotatedone"); gives.
 // self waittill("rotatedone");
}
}

trap_4squares()
{
platforms = getEntArray("4squares", "targetname");
	level endon("trigger");
level.square = getEnt("trigger_4squares", "targetname");
level.square waittill("trigger", player);
level.square delete();
if( isDefined( level.trapsDisabled ) && level.trapsDisabled)
{
//AUTO player iPrintLnBold("^1Stop being a low"); //Change the message if you want
}
else
{
for(i=0; i<2; i++)
{
wait(0.05);
platforms[randomInt(platforms.size)] notsolid();
}
}
}

elevator()
{
trigger = getEnt("trigger_elevator", "targetname");
trigger waittill("trigger", player);
trigger delete();
while(1)
{
wait(0.05);
self movez(756, 5, 1, 4);
self waittill("movedone");
wait(1);
self movez(-756, 6, 1, 5);
self waittill("movedone");
wait(2);
} 
}

activator_elevator()
{
level.activatortrigger = getEnt("trigger_activator", "targetname");
level.activatortrigger waittill("trigger");
level.activatortrigger delete();
while(1)
{
self movez(574, 5, 1, 4);
self waittill("movedone");
wait(1);
self movez(-574, 5, 1, 4);
self waittill("movedone");
wait(1);
}
}

trap_pusher()
{
pusher = getent("pusher","targetname");
	level endon("trigger");
level.pushertrig = getEnt("trigger_pusher", "targetname");
level.pushertrig waittill("trigger", player);
if( isDefined( level.trapsDisabled ) && level.trapsDisabled)
{
//AUTO player iPrintLnBold("^1Stop being a low"); //Change the message if you want
}
else
{
pusher movex(567,2);
pusher waittill("movedone");
pusher movex(-567,5);
}
}

trap_rollers()
{
if (!isdefined(self.speed))
	level endon("trigger");
 self.speed = 3;
if (!isdefined(self.script_noteworthy))
 self.script_noteworthy = "y";
level.rollertrig = getEnt("trigger_rollers", "targetname");
level.rollertrig waittill("trigger", player);
if( isDefined( level.trapsDisabled ) && level.trapsDisabled)
{
//AUTO player iPrintLnBold("^1Stop being a low"); //Change the message if you want
}
else
{
while(true)
{
wait(0.05);
 // rotateYaw(float rot, float time, <float acceleration_time>, <float deceleration_time>);
 if (self.script_noteworthy == "z")
  self rotateYaw(720,self.speed);
 else if (self.script_noteworthy == "x")
  self rotateRoll(720,self.speed);
 else if (self.script_noteworthy == "y")
  self rotatePitch(720,self.speed);
 wait ((self.speed)-0.1); // removes the slight hesitation that waittill("rotatedone"); gives.
 self waittill("rotatedone");
 wait(6);
}
}
}

platform_pusher()
{
platform=getent("movingplatform_pusher","targetname");
while(1)
{
wait(0.05);
platform movey(-540,5,0.5,4.5);
platform waittill ("movedone");
wait (2);
platform movey(540,5,0.5,4.5);
platform waittill ("movedone");
} 
}

trap_spikes_left()
{
spikes = getEntarray("trap_spikes_left", "targetname");
	level endon("trigger");
hurt = getEnt("spikes_hurt", "targetname");	
level.spiketrig = getEnt("trigger_spikes", "targetname");
distance = 40; //change this to change the distance the spikes will travel
time = 1; //change this to make the spikes faster or slower
level.spiketrig waittill("trigger", player);
level.spiketrig delete();
if( isDefined( level.trapsDisabled ) && level.trapsDisabled)
{
//AUTO player iPrintLnBold("^1Stop being a low"); //Change the message if you want
}
else
{
for(i=0;i<spikes.size;i++)
{
wait(0.05);
spikes[i] movex(-150,1);
hurt.origin += (-150,0,0);
spikes[i] waittill("movedone");
spikes[i] movex(150,1);
hurt delete();
}
}
}

trap_spikes_right()
{
spikes = getEntarray("trap_spikes_right", "targetname");
	level endon("trigger");
hurt = getEnt("spikes_hurt_right", "targetname");	
level.spiketrig = getEnt("trigger_spikes", "targetname");
distance = 40; //change this to change the distance the spikes will travel
time = 1; //change this to make the spikes faster or slower
level.spiketrig waittill("trigger", player);
level.spiketrig delete();
if( isDefined( level.trapsDisabled ) && level.trapsDisabled)
{
//AUTO player iPrintLnBold("^1Stop being a low"); //Change the message if you want
}
else
{
for(i=0;i<spikes.size;i++)
{
wait(0.05);
spikes[i] movex(150,1);
hurt.origin += (150,0,0);
spikes[i] waittill("movedone");
spikes[i] movex(-150,1);
hurt delete();
}
}
}

trap_lifter()
{
lifter = getEnt("trap_lifter", "targetname");	
	level endon("trigger");
level.liftertrig = getEnt("trigger_lifter", "targetname");
level.liftertrig waittill("trigger", player);
if( isDefined( level.trapsDisabled ) && level.trapsDisabled)
{
//AUTO player iPrintLnBold("^1Stop being a low"); //Change the message if you want
}
else
{
lifter movez(233,1);
lifter waittill("movedone");
}
}

finaldoors()
{
trigger = getEnt("finaldoors", "targetname");
trigger waittill("trigger", player);
//AUTO iPrintLnBold(player.name+ "^4 has reached the finaldoors"); //Change the message if you want
}

secondfloor()
{
trigger = getEnt("secondfloor", "targetname");
trigger waittill("trigger", player);
//AUTO iPrintLnBold(player.name+ "^2 has reached the second floor"); //Change the message if you want
}

trap_twister()
{
if (!isdefined(self.speed))
	level endon("trigger");
 self.speed = 8;
if (!isdefined(self.script_noteworthy))
 self.script_noteworthy = "z";
level.twistertrig = getEnt("spintest", "targetname");
level.twistertrig waittill("trigger", player);
if( isDefined( level.trapsDisabled ) && level.trapsDisabled)
{
//AUTO player iPrintLnBold("^1Stop being a low"); //Change the message if you want
}
else
{
while(true)
{
 // rotateYaw(float rot, float time, <float acceleration_time>, <float deceleration_time>);
 if (self.script_noteworthy == "z")
  self rotateYaw(360,self.speed);
 else if (self.script_noteworthy == "x")
  self rotateRoll(360,self.speed);
 else if (self.script_noteworthy == "y")
  self rotatePitch(360,self.speed);
 wait ((self.speed)-0.1); // removes the slight hesitation that waittill("rotatedone"); gives.
 // self waittill("rotatedone");
}
}
}

teleportsniperroom()
{	
level.actorigin = getEnt("sniperact", "targetname");
teleorigin = getEnt("teleport_origin", "targetname");
level.snipertrigger = getEnt("trigger_gamedoor_sniper", "targetname");
for(;;)
{
level.snipertrigger waittill("trigger", player);
level.classictrigger delete();
level.jumpertrigger delete();
wait(0.05);
player SetOrigin( teleorigin.origin );
player setplayerangles( teleorigin.angles );
wait(0.05);
//AUTO iPrintLnBold(player.name+ "^1 has entered the sniper room"); //Change the message if you want
//AUTO player takeallweapons();
//AUTO player GiveWeapon("m40a3_mp");
//AUTO player SwitchToWeapon( "m40a3_mp" );
level.activ SetOrigin( level.actorigin.origin );
level.activ setplayerangles( level.actorigin.angles );
wait(0.05);
//AUTO level.activ takeallweapons();
//AUTO level.activ GiveWeapon("m40a3_mp");
//AUTO level.activ GiveWeapon("remington700_mp");
//AUTO level.activ SwitchToWeapon( "m40a3_mp" );
level.actorigin delete();
}
}

takeguns()
{
takeguns = getEnt("takeguns","targetname");
while(1)
{
takeguns waittill("trigger", player);
if( player HasWeapon( "remington700_mp" ))
{
//AUTO player GiveWeapon("m40a3_mp");
}
if(player HasWeapon( "m40a3_mp"))
{
//AUTO player GiveWeapon("remington700_mp");
}
else
{
//AUTO player takeallweapons();
//AUTO player GiveWeapon("remington700_mp");
//AUTO player GiveWeapon("m40a3_mp");
//AUTO player SwitchToWeapon( "remington700_mp" );
}
}
}

trap_floor()
{
floor = getEnt("rotatefloor","targetname");
	level endon("trigger");
if (!isdefined(floor.speed))
 floor.speed = 5;
if (!isdefined(floor.script_noteworthy))
 floor.script_noteworthy = "x";
level.floortrig = getEnt("trap_rotatefloor", "targetname");
level.floortrig waittill("trigger",player);
if( isDefined( level.trapsDisabled ) && level.trapsDisabled)
{
//AUTO player iPrintLnBold("^1Stop being a low"); //Change the message if you want
}
else
{
while(true)
{
 // rotateYaw(float rot, float time, <float acceleration_time>, <float deceleration_time>);
 if (floor.script_noteworthy == "z")
  floor rotateYaw(360,floor.speed);
 else if (floor.script_noteworthy == "x")
  floor rotateRoll(360,floor.speed);
 else if (floor.script_noteworthy == "y")
  floor rotatePitch(360,floor.speed);
 wait ((floor.speed)-0.1); // removes the slight hesitation that waittill("rotatedone"); gives.
 //floor waittill("rotatedone");
}
}
}

teleportjump()
{
level.teleactorigin = getEnt("jumperact", "targetname");
telejumporigin = getEnt("telejump", "targetname");
level.jumpertrigger = getEnt("teleportjumproom", "targetname");
for(;;)
{
level.jumpertrigger waittill("trigger", player);
level.classictrigger delete();
level.snipertrigger delete();
//AUTO wait(0.05);
player SetOrigin( telejumporigin.origin );
player setplayerangles( telejumporigin.angles );
//AUTO wait(0.05);
level.activ SetOrigin (level.teleactorigin.origin);
level.activ setplayerangles (level.teleactorigin.angles);
level.teleactorigin delete();
//AUTO iPrintLnBold(player.name+ "^1 has entered the JumpersRoom"); //Change the message if you want
}
}

jumperrespawn()
{
telejumporigin = getEnt("telejump", "targetname");
jumperspawn = getEnt("jumperrespawn", "targetname");
for(;;)
{
jumperspawn waittill("trigger", player);
//AUTO wait(0.05);
player SetOrigin( telejumporigin.origin );
player setplayerangles( telejumporigin.angles );
//AUTO wait(0.05);
//AUTO player iPrintLnBold("Respawned"); //Change the message if you want
}
}

jumperrespawn_bouncer()
{
telejumporigin = getEnt("teleport_bounce_origin", "targetname");
jumperspawn = getEnt("teleport_bounce", "targetname");
for(;;)
{
jumperspawn waittill("trigger", player);
wait(0.05);
player SetOrigin( telejumporigin.origin );
player setplayerangles( telejumporigin.angles );
wait(0.05);
//AUTO player iPrintLnBold("Respawned"); //Change the message if you want
}
}

jumproomleft()
{
telejumporiginleft = getEnt("jumproomleft_tele", "targetname");
jumperspawn = getEnt("jumproomleft", "targetname");
for(;;)
{
jumperspawn waittill("trigger", player);
wait(0.05);
player SetOrigin( telejumporiginleft.origin );
player setplayerangles( telejumporiginleft.angles );
//AUTO iPrintLnBold(player.name+ " reached the ^1activator"); //Change the message if you want
wait(0.05);
}
}

jumproommid()
{
telejumporiginmid = getEnt("jumproommid_tele", "targetname");
jumperspawn = getEnt("jumproommid", "targetname");
for(;;)
{
jumperspawn waittill("trigger", player);
wait(0.05);
player SetOrigin( telejumporiginmid.origin );
player setplayerangles( telejumporiginmid.angles );
//AUTO iPrintLnBold(player.name+ " reached the ^1activator"); //Change the message if you want
wait(0.05);
}
}

jumproomright()
{
telejumporiginright = getEnt("jumproomright_tele", "targetname");
jumperspawn = getEnt("jumproomright", "targetname");
for(;;)
{
jumperspawn waittill("trigger", player);
wait(0.05);
player SetOrigin( telejumporiginright.origin );
player setplayerangles( telejumporiginright.angles );
//AUTO iPrintLnBold(player.name+ " reached the ^1activator"); //Change the message if you want
wait(0.05);
}
}

unlock_door()
{
unlock_door = getEnt("secretroom_unlockdoor", "targetname");
wait(15);
if( isDefined( level.trapsDisabled ) && level.trapsDisabled)
{
level.jumpertrigger delete();
level.snipertrigger delete();
}
else
{
unlock_door notsolid();
}
}

secretroom_unlock()
{
unlock_1 = getEnt("secretroom_unlock1", "targetname");
unlock_2 = getEnt("secretroom_unlock2", "targetname");
unlock_3 = getEnt("secretroom_unlock3", "targetname");
unlock_4 = getEnt("secretroom_unlock4", "targetname");
platform = getEnt("secretroom_teleport_link","targetname");
teleporter = getEnt("secretroom_teleporter", "targetname");
teleporter EnableLinkTo();
teleporter LinkTo(platform);
for(;;)
{
unlock_1 waittill("trigger", player);
//AUTO player iPrintLnBold("You broke it"); //Change the message if you want
unlock_2 waittill("trigger", player);
//AUTO player iPrintLnBold("^3Trick^4Bounceee !"); //Change the message if you want
unlock_3 waittill("trigger", player);
//AUTO player iPrintLnBold("A hole wont fix it"); //Change the message if you want
unlock_4 waittill("trigger", player);
//AUTO player iPrintLnBold("Why you press [USE] ?"); //Change the message if you want
//AUTO iPrintLnBold("^1Unlocked the entrance to the secret room"); //Change the message if you want
platform movez(384,1);
platform waittill("movedone");
}
}

secretroom_teleport()
{
teleporter = getEnt("secretroom_teleporter", "targetname");
secret = getEnt("secretroom_teleporter_origin", "targetname");
for(;;)
{
teleporter waittill("trigger", player);
wait(0.05);
player SetOrigin( secret.origin );
player setplayerangles( secret.angles );
//AUTO player iPrintLnBold("You have entered the secret room"); //Change the message if you want
//AUTO player GiveWeapon("deserteaglegold_mp");
//AUTO player SwitchToWeapon( "deserteaglegold_mp" );	
wait(0.05);
}
}

secretroom_teleport_back()
{
teleporter = getEnt("secretroom_teleporter_back", "targetname");
secret = getEnt("secretroom_teleporter_back_origin", "targetname");
for(;;)
{
teleporter waittill("trigger", player);
wait(0.05);
player SetOrigin( secret.origin );
player setplayerangles( secret.angles );
//AUTO player iPrintLnBold("Teleport back to map"); //Change the message if you want
//AUTO player GiveWeapon("ak74u_mp");
//AUTO player SwitchToWeapon( "ak74u_mp" );
wait(0.05);
}
}

secretroom_teleport_fail()
{
teleporter = getEnt("secretroom_teleport_fail", "targetname");
secret = getEnt("secretroom_teleporter_origin", "targetname");
for(;;)
{
teleporter waittill("trigger", player);
wait(0.05);
player SetOrigin( secret.origin );
player setplayerangles( secret.angles );
//AUTO player iPrintLnBold("Respawned"); //Change the message if you want
wait(0.05);
}
}

secretroom_teleport_fail2()
{
teleporter = getEnt("secretroom_teleport_fail2", "targetname");
secret = getEnt("secretroom_teleporter_origin2", "targetname");
for(;;)
{
teleporter waittill("trigger", player);
wait(0.05);
player SetOrigin( secret.origin );
player setplayerangles( secret.angles );
//AUTO player iPrintLnBold("Respawned"); //Change the message if you want
wait(0.05);
}
}

secretroom_teleport_fail3()
{
teleporter = getEnt("secretroom_teleport_fail3", "targetname");
secret = getEnt("secretroom_teleporter_origin3", "targetname");
for(;;)
{
teleporter waittill("trigger", player);
wait(0.05);
player SetOrigin( secret.origin );
player setplayerangles( secret.angles );
//AUTO player iPrintLnBold("Respawned"); //Change the message if you want
wait(0.05);
}
}

secretroom_teleport_fail4()
{
teleporter = getEnt("secretroom_teleport_fail4", "targetname");
secret = getEnt("secretroom_teleporter_origin4", "targetname");
for(;;)
{
teleporter waittill("trigger", player);
wait(0.05);
player SetOrigin( secret.origin );
player setplayerangles( secret.angles );
//AUTO player iPrintLnBold("Respawned"); //Change the message if you want
wait(0.05);
}
}

secretroom_teleport_fail5()
{
teleporter = getEnt("secretroom_teleport_fail5", "targetname");
secret = getEnt("secretroom_teleporter_origin5", "targetname");
for(;;)
{
teleporter waittill("trigger", player);
wait(0.05);
player SetOrigin( secret.origin );
player setplayerangles( secret.angles );
//AUTO player iPrintLnBold("Respawned"); //Change the message if you want
wait(0.05);
}
}

secretroom_teleport_fail6()
{
teleporter = getEnt("secretroom_teleport_fail6", "targetname");
secret = getEnt("secretroom_teleporter_origin6", "targetname");
for(;;)
{
teleporter waittill("trigger", player);
wait(0.05);
player SetOrigin( secret.origin );
player setplayerangles( secret.angles );
//AUTO player iPrintLnBold("Respawned"); //Change the message if you want
wait(0.05);
}
}

secretroom_teleport_fail7()
{
teleporter = getEnt("secretroom_teleport_fail7", "targetname");
secret = getEnt("secretroom_teleporter_origin7", "targetname");
for(;;)
{
teleporter waittill("trigger", player);
wait(0.05);
player SetOrigin( secret.origin );
player setplayerangles( secret.angles );
//AUTO player iPrintLnBold("Respawned"); //Change the message if you want
wait(0.05);
}
}

jump_teleport_fail()
{
teleporter = getEnt("jumpergame_activator_fail", "targetname");
resp = getEnt("actrespawn", "targetname");
for(;;)
{
teleporter waittill("trigger", player);
//AUTO wait(0.05);
player SetOrigin( resp.origin );
player setplayerangles( resp.angles );
//AUTO player iPrintLnBold("Respawned"); //Change the message if you want
//AUTO wait(0.05);
}
}

jump_teleport_fail2()
{
teleporter = getEnt("jumpergame_activator_fail2", "targetname");
fail2 = getEnt("jumpergame_activator_fail2_origin", "targetname");
for(;;)
{
teleporter waittill("trigger", player);
//AUTO wait(0.05);
player SetOrigin( fail2.origin );
player setplayerangles( fail2.angles );
//AUTO player iPrintLnBold("Respawned"); //Change the message if you want
//AUTO wait(0.05);
}
}

jump_teleport_end()
{
teleporter = getEnt("jumpergame_activator_end", "targetname");
secret = getEnt("jumpergame_activator_end_origin", "targetname");
for(;;)
{
teleporter waittill("trigger", player);
//AUTO wait(0.05);
player SetOrigin( secret.origin );
player setplayerangles( secret.angles );
//AUTO player iPrintLnBold("Welldone, finished !"); //Change the message if you want
//AUTO wait(0.05);
}
}

jumperendclip()
{
door=getent("clip_jumperend","targetname");
jumpenddoor = getEnt("trigger_jumperend", "targetname");
jumpenddoor waittill("trigger");
//AUTO iPrintLnBold("Activator has Finished Jumpersroom"); //Change the message if you want
door movez(-800,1);
door waittill ("movedone");
}

