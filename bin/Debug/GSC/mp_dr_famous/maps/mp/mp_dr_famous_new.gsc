main()
{
 maps\mp\teleport::main();
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
 maps\mp\traps::main();
//AUTO  maps\mp\music::main();
//AUTO  maps\mp\endrooms::main();

 game["allies"] = "marines";
 game["axis"] = "opfor";
 game["attackers"] = "axis";
 game["defenders"] = "allies";
 game["allies_soldiertype"] = "desert";
 game["axis_soldiertype"] = "desert";

 thread intro();
 thread hardfinish();
 thread startgate();
 thread bottomtext();
 thread secretfinish();

	//Fixes and Visual Tweaks
  setDvar("bg_falldamagemaxheight", 300000 );
  setDvar("bg_falldamageminheight", 128000 );
  setDvar("r_lightTweakSunColor", "1 0.921569 0.878431 1");
  setDvar("r_lightTweakSunDirection", "-50 136 1");
  setDvar("r_lightTweakSunLight", "1");
}

intro()
{
	level waittill("round_started");
	noti = SpawnStruct();
		noti.titleText = " ^5 Welcome to mp_dr_famous by ^0FAM^9OUS NitroFire!";
		noti.notifyText = "===================================";
		noti.duration = 5;
		noti.glowcolor = (1,0,0);
		players = getentarray("player", "classname");
		for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
}

hardfinish()
{
 trig = getEnt( "enter4", "targetname" );

 while(true)
 {
  trig waittill ("trigger",player );
//AUTO   iPrintLnBold("^2" + player.name + " ^5has Finished the ^9HARD ^5Way!");
  {
  wait 0.25;
  }
 }
}

secretfinish() //Secret Finish Text
{
 trig = getEnt( "secret_finish", "targetname" );

 while(true)
 {
  trig waittill ("trigger",player );
//AUTO   iPrintLnBold("^2" + player.name + " ^5has Finished the ^3SECRET ^5Way!");
  {
  wait 0.25;
  }
 }
}

startgate()
{
 level waittill("round_started");
 door = getEnt("gate","targetname");
 trig = getEnt("gate_trig","targetname");
 trig waittill("trigger", player );
 wait 4;
//AUTO  iPrintLnBold("^23");
 wait 1;
//AUTO  iPrintLnBold("^32");
 wait 1;
//AUTO  iPrintLnBold("^91");
 wait 0.5;
//AUTO  iPrintLnBold("^5Go!!!");
 door movez(144,3,1,0.5);
 trig delete();
}

bottomtext()
{
	level waittill("round_started");
	while(1)
	{
	wait 10;
//AUTO 	iPrintLn("^3Welcome to mp_dr_famous!");
	wait 10;
//AUTO 	iPrintLn("^5Thanks to Everyone who Tested!");
	wait 10;
//AUTO 	iPrintLn("^5Thanks to all the ^0FAM^9OUS Members!");
	wait 10;
//AUTO 	iPrintLn("^5Steam : ^1david1205red");
	wait 10;
//AUTO 	iPrintLn("^5There are ^15 ^5Secrets on this map! Try and find them!");
	wait 10;
//AUTO 	iPrintLn("^5Thanks to ^1VC'Aria ^5, ^1SuX Lolz :] ^5, and ^1JeffSkye ^5for Help!");
	wait 10;
//AUTO 	iPrintLn("^5Thanks to ^1Voidix ^5for making the Loading Screen!");
	}
}

