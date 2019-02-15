main()
{
//////////////////////////////thready////////////
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
//AUTO   		ambientPlay("indipyramid");
	
      thread door_a();
	  thread door_b();
      thread jump_teleport();
      thread secret_teleport();	

precacheItem( "remington700_mp" );
//AUTO precacheItem( "knife_mp" );
precacheItem( "tomahawk_mp" );
precacheItem( "winchester1200_mp" );
precacheItem( "skorpion_mp" );
precacheItem( "m4_mp" );
precacheItem( "g3_mp" );
//AUTO precacheItem( "ak47_mp" );
precacheItem( "rpd_mp" );

//AUTO thread old(); //64
thread jump(); //64
thread snip();  //304
thread secret2();
//AUTO thread jump_room_gun();
	  
        maps\mp\_load::main();
	
	maps\mp\mp_dr_indipyramid_script1::main();
	maps\mp\mp_dr_indipyramid_script2::main();
	maps\mp\mp_dr_indipyramid_obrazy::main();
	
	
//////////////////////////////////global////////////////////////////

	game["allies"] = "sas";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";
	
	setdvar( "r_specularcolorscale", "1" );
	
	setdvar("r_glowbloomintensity0",".25");
	setdvar("r_glowbloomintensity1",".25");
	setdvar("r_glowskybleedintensity0",".3");
	setdvar("compassmaxrange","1800");

//////////////////////////////////////////deathrun/////////////////////

        level.trapTriggers = [];
        level.trapTriggers[level.trapTriggers.size] = getEnt( "t1", "targetname" );
        level.trapTriggers[level.trapTriggers.size] = getEnt( "t2", "targetname" );
        level.trapTriggers[level.trapTriggers.size] = getEnt( "t3", "targetname" );
        level.trapTriggers[level.trapTriggers.size] = getEnt( "t4", "targetname" );
        level.trapTriggers[level.trapTriggers.size] = getEnt( "t5", "targetname" );
        level.trapTriggers[level.trapTriggers.size] = getEnt( "t6", "targetname" );
        level.trapTriggers[level.trapTriggers.size] = getEnt( "t7", "targetname" );
        level.trapTriggers[level.trapTriggers.size] = getEnt( "t8", "targetname" );
        level.trapTriggers[level.trapTriggers.size] = getEnt( "t9", "targetname" );
     	level.trapTriggers[level.trapTriggers.size] = getEnt( "t10", "targetname" );	
	    level.trapTriggers[level.trapTriggers.size] = getEnt( "t11", "targetname" );	
    	level.trapTriggers[level.trapTriggers.size] = getEnt( "t12", "targetname" );	
    	level.trapTriggers[level.trapTriggers.size] = getEnt( "t13", "targetname" );	
		level.trapTriggers[level.trapTriggers.size] = getEnt( "t14", "targetname" );	
    	level.trapTriggers[level.trapTriggers.size] = getEnt( "t15", "targetname" );	
		
}

door_a()
{
door_a = getent ("door_start" ,"targetname");

wait 10;

door_a movez(-313, 3 );
door_a waittill ("movedone");
door_a delete();
}

door_b()
{
	trig = getent ("door_final" , "targetname");
	trig waittill ("trigger",player);
	trig delete ();
//AUTO 	iprintlnbold ("^3---^1" + player.name + "^3--- ^2finished the map!!");
//AUTO 	ambientPlay("indipyramid_final");
}

old()
{
enter_old = getent ("old_enter" , "targetname");
door = getentarray ("final_door" , "targetname");
sipka = getent ("sipka" , "targetname");
enter_snip = getent ("snip_enter" , "targetname");
enter_jump = getent ("jump_enter" , "targetname");

enter_old waittill ("trigger" , player);
enter_snip delete();
enter_jump delete();

//AUTO iprintlnbold ("^3---^1" + player.name + "^3--- ^2open FINAL door!");

sipka movex (184, 5);
door [randomInt(door.size)] movez(400, 20);
}

jump()
{
enter_old = getent ("old_enter" , "targetname");
sipka = getent ("sipka" , "targetname");
enter_snip = getent ("snip_enter" , "targetname");
level.enter_jump = getent ("jump_enter" , "targetname");

level.enter_jump waittill ("trigger" , jumper);
enter_snip delete();
enter_old delete();
sipka movex (64, 1.73);

thread aktiv_teleport_jump();
jumper thread jumper_jump();
}

snip()
{
enter_old = getent ("old_enter" , "targetname");
sipka = getent ("sipka" , "targetname");
level.enter_snip = getent ("snip_enter" , "targetname");
enter_jump = getent ("jump_enter" , "targetname");

level.enter_snip waittill ("trigger" , jumper);
enter_jump delete();
enter_old delete();
sipka movex (304, 8.26);

thread aktiv_teleport_snip();
jumper thread jumper_snip();
}

jumper_snip()
{
enter_jumper_room = getent ("jumper_enter_snip_2" , "targetname");

self setorigin (enter_jumper_room.origin);
self setplayerangles (enter_jumper_room.angles);

//AUTO iprintlnbold ("^3---^1" + self.name + "^3--- ^2go in SNIPER room!");

//AUTO self TakeAllWeapons();
//AUTO self GiveWeapon("remington700_mp");
wait 0.01;
//AUTO self SwitchToWeapon("remington700_mp");

self death();
self thread jumper_port();

//AUTO iprintlnbold ("^3---^1" + self.name + "^3--- ^2death!");
//AUTO iprintlnbold ("^2SNIPER ^3room opened!!");
}

death()
{
self endon("disconnect");

self waittill ("death");
}

jumper_port()
{
while(1)
{
level.enter_snip waittill ("trigger" ,jumper);

i = RandomIntRange(1,4);
enter_jumper_room2 = getent ("jumper_enter_snip_"+i , "targetname");

jumper setorigin (enter_jumper_room2.origin);
jumper setplayerangles (enter_jumper_room2.angles);

//AUTO iprintlnbold ("^3---^1" + jumper.name + "^3--- ^2go in SNIPER room!");

//AUTO jumper TakeAllWeapons();
//AUTO jumper GiveWeapon("remington700_mp");
//AUTO wait 0.01;
//AUTO jumper SwitchToWeapon("remington700_mp");

jumper death();

//AUTO iprintlnbold ("^3---^1" + jumper.name + "^3--- ^2death!");
//AUTO iprintlnbold ("^2SNIPER ^3room opened!!");
}
}

aktiv_teleport_jump()
{
	players = getEntArray("player", "classname");
	for(i=0;i<players.size;i++)
	{
		if( IsAlive(players[i]))
		{
			if( players[i].pers["team"] == "axis" )
			{
				players[i] thread atj_1();
			}
		}
	}
}

atj_1()
{
i = RandomIntRange(1,4);
enter_aktiv_room = getent ("aktivator_enter_jump_"+i , "targetname");

self setorigin (enter_aktiv_room.origin);
self setplayerangles (enter_aktiv_room.angles);

//AUTO self TakeAllWeapons();
//AUTO self GiveWeapon("knife_mp");
//AUTO //self GiveWeapon("ak47_mp");
wait 0.01;
//AUTO self SwitchToWeapon("knife_mp");
//AUTO //self SwitchToWeapon("ak47_mp");
}

aktiv_teleport_snip()
{
	players = getEntArray("player", "classname");
	for(i=0;i<players.size;i++)
	{
		if( IsAlive(players[i]))
		{
			if( players[i].pers["team"] == "axis" )
			{
				players[i] thread ats_1();
			}
		}
	}
}

ats_1()
{
i = RandomIntRange(1,4);
enter_aktiv_room = getent ("aktivator_enter_snip_"+i , "targetname");

self setorigin (enter_aktiv_room.origin);
self setplayerangles (enter_aktiv_room.angles);

//AUTO self TakeAllWeapons();
//AUTO self GiveWeapon("remington700_mp");
wait 0.01;
//AUTO self SwitchToWeapon("remington700_mp");
}

jumper_jump()
{
j = RandomIntRange(1,4);
enter_jumper_room = getent ("jumper_enter_jump_"+j , "targetname"); //1,2,3

self setorigin (enter_jumper_room.origin);
self setplayerangles (enter_jumper_room.angles);

//AUTO iprintlnbold ("^3---^1" + self.name + "^3--- ^2go in JUMP room!");

//AUTO self TakeAllWeapons();
//AUTO self GiveWeapon("knife_mp");
//AUTO //self GiveWeapon("ak47_mp");
wait 0.01;
//AUTO self SwitchToWeapon("knife_mp");
//AUTO //self SwitchToWeapon("ak47_mp");

while (1)
{
i = RandomIntRange(1,4);
enter_jumper_room2 = getent ("jumper_enter_jump_"+i , "targetname"); //1,2,3

level.enter_jump waittill ("trigger" ,jumper);

jumper setorigin (enter_jumper_room2.origin);
jumper setplayerangles (enter_jumper_room2.angles);

//AUTO iprintlnbold ("^3---^1" + jumper.name + "^3--- ^2go in JUMP room!");

//AUTO jumper TakeAllWeapons();
//AUTO jumper GiveWeapon("knife_mp");
//AUTO //jumper GiveWeapon("ak47_mp");
//AUTO wait 0.01;
//AUTO jumper SwitchToWeapon("knife_mp");
//AUTO //jumper SwitchToWeapon("ak47_mp");
}
}

jump_teleport()
{
enter = getent ("jump_teleport" , "targetname");

while(1)
{
i = RandomIntRange(1,4);
j = RandomIntRange(1,4);

enter_jumper_room = getent ("jumper_enter_jump_"+i , "targetname");
enter_aktiv_room = getent ("aktivator_enter_jump_"+j , "targetname");

enter waittill ("trigger", player);

if( player.pers["team"] != "spectator" )
{
if( player.pers["team"] == "allies" )
{
	player SetPlayerAngles(enter_jumper_room.angles);
	player SetOrigin(enter_jumper_room.origin);
}

if( player.pers["team"] == "axis" )
{
	player SetPlayerAngles(enter_aktiv_room.angles);
	player SetOrigin(enter_aktiv_room.origin);
}

}
}
}

secret_teleport()
{
enter = getent ("secret_enter" , "targetname");
go = getent ("secret_go" , "targetname");
player5 = getent ("secret_player" , "targetname");
trig1 = getent ("secret_player_trig1" , "targetname");
trig2 = getent ("secret_player_trig2" , "targetname");
text = getent ("secret_text" , "targetname");

trig1 waittill ("trigger");
trig2 waittill ("trigger");

player5 delete();

text thread secret_text();

enter waittill ("trigger", player);

	player SetPlayerAngles(go.angles);
	player SetOrigin(go.origin);

}

secret_text()
{
while(1)
{
self waittill("trigger", player);
//AUTO player iprintlnbold ("^3---^1Welcome to secret room^3---");
wait 2;
//AUTO player iprintlnbold ("^3---^2Map by ^1Col!ar ^2& ^1PetX^3---");
}
}

secret2()
{
level.open = getent ("secret2_use1" , "targetname");

level.enter = getent ("secret2_enter" , "targetname");
level.go = getent ("secret2_go" , "targetname");

level.enter2 = getent ("secret2_enter2" , "targetname");
level.go2 = getent ("secret2_go2" , "targetname");

level.enter3 = getent ("secret2_enter3" , "targetname");

model_t = getent ("tomahawk_model" , "targetname");
trig_t = getent ("tomahawk_trig" , "targetname");

level.open waittill("trigger");
thread secret2_port();
thread secret2_port2();
thread secret2_port3();

trig_t waittill ("trigger", player);

//AUTO player GiveWeapon("tomahawk_mp");
//AUTO //player GiveWeapon("ak47_mp");
wait 0.01;
//AUTO player SwitchToWeapon("tomahawk_mp");
//AUTO //player SwitchToWeapon("ak47_mp");

trig_t waittill ("trigger", player2);
model_t delete();
trig_t delete();

//AUTO player2 GiveWeapon("tomahawk_mp");
//AUTO //player2 GiveWeapon("ak47_mp");
wait 0.01;
//AUTO player2 SwitchToWeapon("tomahawk_mp");
//AUTO //player2 SwitchToWeapon("ak47_mp");
}

secret2_port()
{
    level.enter waittill ("trigger", player);
	player SetPlayerAngles(level.go.angles);
	player SetOrigin(level.go.origin);
//AUTO 	player iprintlnbold ("^3---Welcome to secret room---");
    wait 2;
//AUTO     player iprintlnbold ("^3---Map by ^1Col!ar ^3& ^1PetX---");
	
	level.enter waittill ("trigger", player);
	player SetPlayerAngles(level.go.angles);
	player SetOrigin(level.go.origin);
//AUTO 	player iprintlnbold ("^3---Welcome to secret room---");
    wait 2;
//AUTO     player iprintlnbold ("^3---Map by ^1Col!ar ^3& ^1PetX---");
	
    level.enter waittill ("trigger", player);
	player SetPlayerAngles(level.go.angles);
	player SetOrigin(level.go.origin);
//AUTO 	player iprintlnbold ("^3---Welcome to secret room---");
    wait 2;
//AUTO     player iprintlnbold ("^3---Map by ^1Col!ar ^3& ^1PetX---");
}

secret2_port2()
{
  while(1)
  {
    level.enter2 waittill ("trigger", player);
	player SetPlayerAngles(level.go2.angles);
	player SetOrigin(level.go2.origin);
  }
}

secret2_port3()
{
  while(1)
  {
    level.enter3 waittill ("trigger", player);
	player SetPlayerAngles(level.go.angles);
	player SetOrigin(level.go.origin);
  }
}

jump_room_gun()
{
weapon = getent ("weapon_use" , "targetname");
weapon waittill("trigger",player);

x = 1+RandomInt(3);
gun = GetRandomWeapon( x );
//AUTO player GiveWeapon( gun );
wait 0.01;
//AUTO player SwitchToWeapon( gun );
}

GetRandomWeapon( num )
{
	if( num == 2 )
		return "knife_mp";
	else
	{
		x = RandomInt( 51 );
		if( x < 10 )
			return "winchester1200_mp";
		if( x > 9 && x < 20 )
			return "skorpion_mp";
		if( x > 20 && x < 30 )
			return "m4_mp";
		if( x > 30 && x < 40 )
			return "g3_mp";
		if( x > 40 && x < 50 )
			return "ak47_mp";
		if( x == 50 )
			return "rpd_mp";
	}
}

