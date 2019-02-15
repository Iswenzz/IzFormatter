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

setdvar( "r_specularcolorscale", "1" );
setdvar("r_glowbloomintensity0",".25");
setdvar("r_glowbloomintensity1",".25");
setdvar("r_glowskybleedintensity0",".3");
setdvar("compassmaxrange","1800");

level._effect["c4explosion"] = loadfx ("explosions/aa_explosion");
level._effect["partylight"] = loadfx ("lightshow/lightshow_small");
level._effect["fireball"] = loadfx ("fire/launchtube_fire_child");
level._effect["gas"] = loadfx ("deathrun/greensmoke");

addTriggerToList( "trig_trap1" );
addTriggerToList( "trig_trap2" );
addTriggerToList( "trig_trap3" );
addTriggerToList( "trig_trap4" );
addTriggerToList( "trig_trap5" );
addTriggerToList( "trig_trap6" );
addTriggerToList( "trig_trap7" );
addTriggerToList( "trig_trap8" );
addTriggerToList( "trig_trap9" );
addTriggerToList( "trig_trap10" );
addTriggerToList( "trig_trap11" );
addTriggerToList( "trig_trap12" );
addTriggerToList( "trig_trap13" );
addTriggerToList( "trig_trap14" );
addTriggerToList("trig_trap15");
addTriggerToList("trig_trap16");
addTriggerToList("trig_trap17");

thread start();
//AUTO thread weapon();
//AUTO thread weapon1();
//AUTO thread weapon2();
thread startdoor();
thread messages();
thread credits();
thread mover();
thread trap1();
thread trap2();
thread trap3();
thread trap4();
thread trap5();
thread trap6();
thread trap7();
thread trap8();
thread lift();
thread tele();
thread tele1();
thread fx1();
thread trap9();
thread trap10();
thread trap11();
thread trap12();
thread trap13();
thread trap14();
thread trap15();
thread tele2();
thread trap16();
thread trap17();
//AUTO thread oldroom();
//AUTO thread sniperroom();
//AUTO thread kniferoom();
//AUTO thread bounceroom();
//AUTO thread bouncegun();
//AUTO thread bouncetele();
//AUTO thread bouncetele1();
thread end();
}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

start()
{
trigger = getEnt ("weap","targetname");
object = getEnt ("weap1","targetname");
trigger waittill ("trigger",player);
//AUTO IprintLnBold ("^2Something Moved ?");
wait 0.5;
object moveZ (150,1);
}

weapon()
{
trig = getEnt ("g3","targetname");
for(;;)
{
trig waittill ("trigger",player);
wait 0.5;
//AUTO player giveWeapon ("colt45_mp");
//AUTO player switchToWeapon ("colt45_mp");
//AUTO player giveMaxAmmo ("colt45_mp");
wait 0.5;
//AUTO player IprintLnBold ("You got the Amazing ^3Colt!");
}
}

weapon1()
{
trig = getEnt ("ak","targetname");
for(;;)
{
trig waittill ("trigger",player);
wait 0.5;
//AUTO player giveWeapon ("deserteagle_mp");
//AUTO player switchToWeapon ("deserteagle_mp");
//AUTO player giveMaxAmmo ("deserteagle_mp");
wait 0.5;
//AUTO player IprintLnBold ("You got this hot  ^3deserteagle, ^5Have fun with it :D");
}
}

weapon2()
{
trig = getEnt ("brick","targetname");
for(;;)
{
trig waittill ("trigger",player);
wait 0.5;
//AUTO player giveWeapon ("remington700_mp");
//AUTO player switchToWeapon ("remington700_mp");
//AUTO player giveMaxAmmo ("remington700_mp");
wait 0.5;
//AUTO player IprintLnBold ("^3R700?? ^4WTF!!! ^5Hahaha :D");
}
}

startdoor()
{
object = getEnt ("door","targetname");
wait 0.05;
//AUTO ambientPlay("ambient1");
//AUTO IprintLn ("^3>>>>^2Galantis - Runaway^3<<<<<");
//AUTO IprintLn ("^3>>>>^2Galantis - Runaway^3<<<<<");
//AUTO IprintLn ("^3>>>>^2Galantis - Runaway^3<<<<<");
wait 20;
//AUTO IprintLnBold ("^7Door opened");
object moveZ (150,5);
object waittill ("movedone");
}

mover()
{
plat = getEnt ("plat_move","targetname");
while(1)
	{
		wait(4);
		plat moveX (-530,4);
		wait (4);
		plat moveX (530,4);
		wait (4);
	}
}

messages()
{
	
//AUTO 	IprintLn ("^4Welcome to my first map ^1mp_dr_shield");
	wait(10);
//AUTO 	IprintLn ("^1Map made by ^5Shield");
	wait(10);
//AUTO 	IprintLn ("^3Have Fun and ^2enjoy the map");
	wait(10);
//AUTO 	IprintLn ("^2Good Luck");
	wait(30);
//AUTO 	iPrintLn ("^1Any Bugs/Glitches. Report it. ^3Skype: shieldagente");
	wait(20);
//AUTO 	iPrintLn ("^4Skype : shieldagente");
	
}

credits()
{
wait(7);
thread drawInformation( 800, 0.8, 1, "Welcome to the map Shield" );
wait(5);
thread drawInformation( 800, 0.8, 1, "Made by BW|Shield" );
wait(6);
thread drawInformation ( 800, 0.8, 1, "Skype: shieldagente");
wait(6);
thread drawInformation ( 800, 0.8, 1, "Have fun and enjoy it");
wait(5);
thread drawInformation ( 800, 0.8, 1, "Kill the Activator!");
}

drawInformation( start_offset, movetime, mult, text )
{
	start_offset *= mult;
	hud = new_ending_hud( "center", 0.1, start_offset, 90 );
	hud setText( text );
	hud moveOverTime( movetime );
	hud.x = 0;
	wait( movetime );
	wait( 3 );
	hud moveOverTime( movetime );
	hud.x = start_offset * -1;

	wait movetime;
	hud destroy();
}

new_ending_hud( align, fade_in_time, x_off, y_off )
{
	hud = newHudElem();
    hud.foreground = true;
	hud.x = x_off;
	hud.y = y_off;
	hud.alignX = align;
	hud.alignY = "middle";
	hud.horzAlign = align;
	hud.vertAlign = "middle";

 	hud.fontScale = 3;

	hud.color = (0.3, 1.0, 0.4);
	hud.font = "objective";
	hud.glowColor = (0.5, 1.0, 0.5);
	hud.glowAlpha = 1;

	hud.alpha = 0;
	hud fadeovertime( fade_in_time );
	hud.alpha = 1;
	hud.hidewheninmenu = true;
	hud.sort = 10;
	return hud;
}

trap1()
{
	trigger = getEnt ("trig_trap1","targetname");
	level endon("trigger");
	dead = getEnt ("trap1","targetname");
	trigger waittill ("trigger",player);
//AUTO 	player braxi\_rank::giveRankXP("", 100);
	wait 1;
	dead delete();
}

trap2()
{
	trigger = getEnt ("trig_trap2","targetname");
	level endon("trigger");
	ob1 = getEnt ("trap2","targetname");
	trigger waittill ("trigger",player);
//AUTO 	player braxi\_rank::giveRankXP("", 100);
	while(1)
		{
			ob1 moveZ (100,2);
			wait 2;
			ob1 moveZ (-100,2);
			wait 2;
		}
}

trap3()
{
	trigger = getEnt ("trig_trap3","targetname");
	level endon("trigger");
	bounce = getEnt ("trap3","targetname");
	trigger waittill ("trigger",player);
//AUTO 	player braxi\_rank::giveRankXP("", 100);
	while(1)
		{
			bounce rotateYaw (720,4);
			wait (5);
		}
}

trap4()
{
	trigger = getEnt ("trig_trap4","targetname");
	level endon("trigger");
	blocks = getEnt ("trap4","targetname");
	trigger waittill ("trigger",player);
//AUTO 	player braxi\_rank::giveRankXP("", 100);
	while(1)
		{
			blocks moveY (100,4);
			blocks waittill ("movedone");
			blocks moveY (-100,4);
			blocks waittill ("movedone");
		}
}

trap5()
{
	trigger = getEnt ("trig_trap5","targetname");
	level endon("trigger");
	form = getEnt ("trap5","targetname");
	trigger waittill ("trigger",player);
//AUTO 	player braxi\_rank::giveRankXP("", 100);
	wait (4);
	form notsolid();
}

trap6()
{
	trigger = getEnt ("trig_trap6","targetname");
	level endon("trigger");
	rot = getEnt ("trap6","targetname");
	trigger waittill ("trigger",player);
//AUTO 	player braxi\_rank::giveRankXP("", 100);
	while(1)
		{
			rot rotateYaw (320,1);
			wait 2;
			rot rotateYaw (720,2);
			wait 3;
		}
}

trap7()
{
	trigger = getEnt ("trig_trap7","targetname");
	level endon("trigger");
	spikes = getEnt ("trap7","targetname");
	kill = getEnt ("death","targetname");
	trigger waittill ("trigger",player);
//AUTO 	player braxi\_rank::giveRankXP("", 100);
	kill enablelinkto();
	kill linkto (spikes);
	spikes moveZ (130,0.1);
	wait (5);
	spikes moveZ (-130,0.1);
}

trap8()
{
	trigger = getEnt ("trig_trap8","targetname");
	level endon("trigger");
	boom = getEnt("boom","targetname");
	trigger waittill ("trigger",player);
//AUTO 	player braxi\_rank::giveRankXP("", 100);
//AUTO 	iPrintLnBold(3);
	wait 0.05;
//AUTO 	iPrintLnBold(2);
	wait 0.05; 
//AUTO 	iPrintLnBold(1);
	wait (0.5);
	playfx(level._effect["c4explosion"], (boom.origin));
	RadiusDamage (boom.origin, 200, 200, 200);
}

lift()
{
	trigger = getEnt ("press_trig","targetname");
	object = getEnt ("up","targetname");
	trigger waittill ("trigger",player);
//AUTO 	player braxi\_rank::giveRankXP("", 100);
	wait 3;
	while(1)
		{
			object moveZ (1380,4);
			wait 10;
			object moveZ (-1380,4);
			wait 10;
		}
}

tele()
{
	trigger = getEnt ("tele","targetname");
	ori = getEnt ("tele_go","targetname");
	for(;;)
		{
			trigger waittill ("trigger",player);
			player setOrigin (ori.origin);
		}
}

tele1()
{
	trigger = getEnt ("tele1","targetname");
	ori1 = getEnt ("tele1_go","targetname");
	for(;;)
		{
			trigger waittill ("trigger",player);
			player setOrigin (ori1.origin);
		}
}

fx1()
{
	trigger = getEnt ("party","targetname");
	eff = getEnt ("effect1","targetname");
	trigger waittill ("trigger",player);
	wait 0.5;
//AUTO 	ambientPlay("party");
	wait 0.05;
//AUTO 	IprintLn ("^4>>>>^1Ain't Nobody^4<<<<<");
//AUTO 	IprintLn ("^4>>>>^1Ain't Nobody^4<<<<<");
//AUTO 	IprintLn ("^4>>>>^1Ain't Nobody^4<<<<<");
	wait 0.05;
//AUTO 	IprintLnBold ("^1Party ^2Mod, ^3Ouh ^5Yeah!!!");
	playfx(level._effect["partylight"],(eff.origin));
		
}

trap9()
{
	trigger = getEnt ("trig_trap9","targetname");
	level endon("trigger");
	object = getEnt ("trap9","targetname");
	trigger waittill ("trigger",player);
//AUTO 	player braxi\_rank::giveRankXP("", 100);
	wait 0.5;
	object delete();
}

trap10()
{
	trigger = getEnt ("trig_trap10","targetname");
	level endon("trigger");
	schieber = getEnt ("trap10","targetname");
	trigger waittill ("trigger",player);
//AUTO 	player braxi\_rank::giveRankXP("", 100);
	while(1)
	{
		schieber moveX (1118,1);
		schieber waittill ("movedone");
		schieber moveX (-1118,1);
		schieber waittill ("movedone");
	}
}

trap11()
{
	trigger = getEnt ("trig_trap11","targetname");
	level endon("trigger");
	move = getEnt ("trap11","targetname");
	trigger waittill ("trigger",player);
//AUTO 	player braxi\_rank::giveRankXP("", 100);
	while(1)
	{
		move moveZ(80,2);
		move waittill ("movedone");
		move moveZ (-80,2);
		move waittill ("movedone");
	}
}

trap12()
{
	trigger = getEnt ("trig_trap12","targetname");
	level endon("trigger");
	ui = getEnt ("fire","targetname");
	trigger waittill ("trigger",player);
//AUTO 	player braxi\_rank::giveRankXP("", 100);
	playfx(level._effect["gas"],(ui.origin));
	RadiusDamage (ui.origin, 125, 125, 125);
	}

trap13()
{
	trigger = getEnt ("trig_trap13","targetname");
	level endon("trigger");
	eff = getEnt ("green","targetname");
	trigger waittill ("trigger",player);
//AUTO 	player braxi\_rank::giveRankXP("", 100);
	playfx(level._effect["fireball"],(eff.origin));
	RadiusDamage (eff.origin, 150, 150, 150);
	
}

trap14()
{
	trigger = getEnt ("trig_trap14","targetname");
	level endon("trigger");
	object = getEnt ("trap14","targetname");
	trigger waittill ("trigger",player);
//AUTO 	player braxi\_rank::giveRankXP("", 100);
	while(1)
	{
		object moveX (-1113,5);
		object waittill ("movedone");
		object moveX (1113,5);
		object waittill ("movedone");
	}
}

trap15()
{
	trigger = getEnt ("trig_trap15","targetname");
	level endon("trigger");
	brush = getEnt ("trap15","targetname");
	trigger waittill ("trigger",player);
//AUTO 	player braxi\_rank::giveRankXP("", 100);
	wait 1;
	brush notsolid();
}

tele2()
{
	trigger = getEnt ("tele2","targetname");
	ob = getEnt ("or","targetname");
	for(;;)
	{
		trigger waittill ("trigger",player);
		player setOrigin (ob.origin);
	}
}

trap16()
{
	trigger = getEnt ("trig_trap16","targetname");
	level endon("trigger");
	plat = getEnt ("trap16","targetname");
	trigger waittill ("trigger",player);
//AUTO 	player braxi\_rank::giveRankXP("", 100);
	plat moveZ (-500,2);
	plat waittill ("movedone");
	plat moveZ (500,2);
}

trap17()
{
	trigger = getEnt ("trig_trap17","targetname");
	level endon("trigger");
	rot = getEnt ("trap17","targetname");
	trigger waittill ("trigger",player);
//AUTO 	player braxi\_rank::giveRankXP("", 100);
	while(1)
	{
	wait 1;
	rot rotateYaw (720,2);
	wait 4;
	}
}

oldroom()
{
	level.trigger_old = getEnt ("old_trig","targetname");
	origin = getEnt ("old","targetname");
	while(1)
	{
		level.trigger_old waittill ("trigger",player);
		if( !isDefined( level.trigger_old ) ) 
        return;
	
	level.trigger_snip delete();
	level.trigger_knife delete();
	level.trigger_jump delete();
	
 
		if(isDefined(player) && isAlive(player))
		{
//AUTO 			iPrintLnBold (" ^1 " +  player.name + " Entered the ^3Oldroom ^2and only get a ^1knife ^5:P");
			player setOrigin (origin.origin);
//AUTO 			player takeAllWeapons();
//AUTO 			player giveWeapon ("knife_mp");
//AUTO 			player switchToWeapon ("knife_mp");
			wait 1;
//AUTO 			iPrintLnBold ("^2Oldroom is for noobs");
		}
		
		if(isDefined(level.activ) && isAlive(level.activ)) 
		{
//AUTO 			level.activ giveWeapon ("deserteagle_mp");
//AUTO 			level.activ giveMaxAmmo ("deserteagle_mp");
//AUTO 			level.activ switchToWeapon ("deserteagle_mp");
		}
		
	player die();
	
	}
}


	{
  level.trigger_sniper = getEnt( "sniper_trig", "targetname"); 
  jump = getEnt( "sniper", "targetname" ); 
  acti = getEnt( "sniper_acti", "targetname" ); 
 
  while(1) 
  {
    level.trigger_sniper waittill( "trigger", player ); 
    if( !isDefined( level.trigger_sniper ) ) 
      return;
  
    level.trigger_old delete();
	level.trigger_knife delete();
	level.trigger_jump delete();
 
//AUTO 	  iPrintlnBold( " ^2 "  +  player.name +  " ^4Entered the Sniperroom " );
      player setOrigin( jump.origin ); 
      player freezeControls(true); 
//AUTO       player takeAllWeapons();  
//AUTO       player giveWeapon("remington700_mp"); 
//AUTO       player giveMaxAmmo("remington700_mp"); 
//AUTO       player switchToWeapon("remington700_mp");
    
      level.activ setOrigin( acti.origin );
      level.activ freezeControls(true);
//AUTO       level.activ takeAllWeapons();
//AUTO       level.activ giveWeapon("remington700_mp");
//AUTO       level.activ giveMaxAmmo( "remington700_mp" );
//AUTO       level.activ switchToWeapon( "remington700_mp" );
	  wait 0.05;
//AUTO       level.activ IprintLnBold ("^13");
//AUTO 	  player IprintLnBold ("^13");
	  wait 0.5;
//AUTO 	  level.activ IprintLnBold ("^22");
//AUTO 	  player IprintLnBold ("^22");
	  wait 0.5;
//AUTO 	  level.activ IprintLnBold ("^31");
//AUTO 	  player IprintLnBold ("^31");
      wait 1;
//AUTO 	  player IprintLnBold ("^2Fight!");
//AUTO 	  level.activ IprintLnBold ("^2Fight!");
	  player freezecontrols(false);
      level.activ freezecontrols(false);
	  player die();
  }
}


	{
	level.trigger_knife = getEnt ("knife_trig","targetname");
	jumper = getEnt ("knife","targetname");
	acti = getEnt ("knife_acti","targetname"); 
	while(1)
	{
		level.trigger_knife waittill ("trigger",player);
		if(!isDefined( level.trigger_knife))
			return;
		
	level.trigger_old delete();
	level.trigger_sniper delete();
	level.trigger_jump delete();
		
//AUTO 	  iPrintlnBold( " ^6 "  +  player.name + " ^5Entered the Kniferoom " );
      player setOrigin( jumper.origin ); 
      player freezeControls(true); 
//AUTO       player takeAllWeapons(); 
//AUTO       player giveWeapon( "knife_mp" ); 
//AUTO       player switchToWeapon("knife_mp");
      
	  level.activ setOrigin( acti.origin );
      level.activ freezeControls(true);
//AUTO       level.activ takeAllWeapons();
//AUTO       level.activ giveWeapon("knife_mp");
//AUTO       level.activ switchToWeapon( "knife_mp" );
	  wait 0.05;
//AUTO 	  level.activ IprintLnBold ("^13");
//AUTO 	  player IprintLnBold ("^13");
	  wait 0.5;
//AUTO 	  level.activ IprintLnBold ("^22");
//AUTO 	  player IprintLnBold ("^22");
	  wait 0.5;
//AUTO 	  level.activ IprintLnBold ("^31");
//AUTO 	  player IprintLnBold ("^31");
      wait 1;
//AUTO 	  player IprintLnBold ("^4Fight!");
//AUTO 	  level.activ IprintLnBold ("^4Fight!");
	  player freezecontrols(false);
      level.activ freezecontrols(false);
	  player die();

  }
}

bounceroom()	
{
  level.trigger_jump = getEnt( "trig_bounce", "targetname"); 
  jump = getEnt( "bounce", "targetname" ); 
  acti = getEnt( "bounce_acti", "targetname" ); 
 
  while(1) 
  {
    level.trigger_jump waittill( "trigger", player ); 
    if( !isDefined( level.trigger_jump ) ) 
      return;
  
    level.trigger_old delete();
	level.trigger_sniper delete();
	level.trigger_knife delete();
 
//AUTO 	  iPrintlnBold( " ^6 "  +  player.name + " ^5Entered the Bounceroom " );
      player setOrigin( jump.origin ); 
      player freezeControls(true); 
//AUTO       player takeAllWeapons(); 
//AUTO       player giveWeapon( "knife_mp" ); 
//AUTO       player switchToWeapon("knife_mp");
      
      level.activ setOrigin( acti.origin );
      level.activ freezeControls(true);
//AUTO       level.activ takeAllWeapons();
//AUTO       level.activ giveWeapon("knife_mp");
//AUTO       level.activ switchToWeapon( "knife_mp" );
      wait 0.05;
//AUTO 	  level.activ IprintLnBold ("^13");
//AUTO 	  player IprintLnBold ("^13");
	  wait 0.5;
//AUTO 	  level.activ IprintLnBold ("^22");
//AUTO 	  player IprintLnBold ("^22");
	  wait 0.5;
//AUTO 	  level.activ IprintLnBold ("^31");
//AUTO 	  player IprintLnBold ("^31");
      wait 1;
//AUTO 	  player IprintLnBold ("Get the sniper!");
//AUTO 	  level.activ IprintLnBold ("Get the sniper!");
	  player freezecontrols(false);
      level.activ freezecontrols(false);
	  level.activ bouncetele();
	  player bouncetele1();
	  player die();  
  }
}

die()
{
        self endon("disconnect");
 
        self waittill("death");
//AUTO         iPrintlnBold("^1 "+self.name+ " ^2died^4!");
}

bouncegun()
{
	trigger = getEnt ("getweap","targetname");
	for(;;)
	{
		trigger waittill ("trigger",player);
//AUTO 		player giveWeapon ("remington700_mp");
//AUTO 		player giveMaxAmmo ("remington700_mp");
//AUTO 		player switchToWeapon ("remington700_mp");
//AUTO 		IprintLnBold (" ^3 " +  player.name + " ^4get the Sniper ");
	}
}

bouncetele()
{
trigger = getEnt ("acti_tele","targetname");
acti = getEnt ("acti_origin","targetname");
for(;;)
{
trigger waittill ("trigger",player);
player setOrigin (acti.origin);
}
}

bouncetele1()
{
trigger = getEnt ("jumper_tele","targetname");
jumper = getEnt ("jumper_origin","targetname");
for(;;)
{
trigger waittill ("trigger",player);
player setOrigin (jumper.origin);
}
}

end()
{
	trigger = getEnt ("endtrigger","targetname");
	trigger waittill ("trigger",player);
//AUTO 	player braxi\_rank::giveRankXP("", 350);
//AUTO 	IprintLnBold (" ^1 "  +   player.name  + " ^2finished the Map first ");
	
}

