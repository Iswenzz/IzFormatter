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
 
 thread messages();
 thread startdoor();
//AUTO  thread music();
//AUTO  thread music_tele();
//AUTO  thread music_tele2();
}

messages()
{
	wait 6;
//AUTO 	iprintlnBold("^1Welcome to MANILA!");
	wait 1;
}

startdoor()
{
	door = getEnt("startDoor","targetname");
	{
	wait 10;
	door moveZ(250,5)
//AUTO 	iprintlnBold("^2Door has opened!");
	wait 2;	
	}

}

music()
{
    level waittill( "round_started" );
    
    wait 1;
    
//AUTO     ambientPlay( "song1" );
}

music_tele()
{
	trig = getEnt ("music_tele_start", "targetname");
	end = getEnt ("music_tele_end", "targetname");
	while(1)
    	{
        trig waittill ("trigger", player);          
		player SetOrigin(end.origin);
        player SetPlayerAngles( end.angles );
	}
}

music_tele2()
{
	trig = getEnt ("music_tele_start_2", "targetname");
	end = getEnt ("music_tele_end", "targetname");
	while(1)
    	{
        trig waittill ("trigger", player);          
	player SetOrigin(end.origin);
        player SetPlayerAngles( end.angles );
	}
}

