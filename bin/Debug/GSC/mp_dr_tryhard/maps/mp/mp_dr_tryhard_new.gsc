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
	setdvar("r_glowbloomintensity0",".1");
	setdvar("r_glowbloomintensity1",".1");
	setdvar("r_glowskybleedintensity0",".1");
	
	
	thread GetActivator();
	thread MakeTriggers();
	
	
}

MakeTriggers()
{
	level.trapTriggers[0] = getent("trigger1", "targetname");

}

GetActivator()
{
	players = getentarray( "player", "classname" );
	
	for(i = 0;i < players.size;i++)
	{
		player = players[i];
		
		if( isdefined( player ) && isplayer( player ) && isalive( player ) && player.pers["team"] == "axis"	)
			return player;
	}
	
	return "Noactivator";
}

trapN1()
{
	while(1)
	level endon("trigger");
	{
		self waittill("trigger");

		maps\mp\dr_trap_1::main();
		self delete();
		break;
	}
	
}

trap2()
{
trap = getEnt("trap2","targetname");
	level endon("trigger");

	while( 1 )
	{
	trap rotateYaw(360, 1);
	trap waittill("movedone");
	wait 4; 
	}
}

trap3()
{
trap = getEnt("trap3","targetname");
	level endon("trigger");

	while( 1 )
	{
	trap rotateYaw(360, 1);
	trap waittill("movedone");
	wait 6; 
	}
}

