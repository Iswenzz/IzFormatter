main()
{
     	ent = maps\mp\_utility::createOneshotEffect( "light_shaft_dust_large" );
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
     	ent.v[ "origin" ] = (X, Y, Z);
     	ent.v[ "angles" ] = ( 1, 0, 0 );
     	ent.v[ "fxid" ] = "light_shaft_dust_large";
     	ent.v[ "delay" ] = -15;
     	ent.v[ "soundalias" ] = "joker";
}

