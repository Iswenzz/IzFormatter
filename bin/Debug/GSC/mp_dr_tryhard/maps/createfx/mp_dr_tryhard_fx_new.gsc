main()
{
	ent = maps\mp\_utility::createOneshotEffect( "rain_heavy_mist" );
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
	ent.v[ "origin" ] = ( X, Y, Z );
	ent.v[ "angles" ] = ( 270, 0, 0 );
	ent.v[ "fxid" ] = "rain_heavy_mist";
	ent.v[ "delay" ] = -15;

	ent = maps\mp\_utility::createOneshotEffect( "lightning" );
	ent.v[ "origin" ] = ( X, Y, Z );
	ent.v[ "angles" ] = ( 270, 0, 0 );
	ent.v[ "fxid" ] = "lightning";
	ent.v[ "delay" ] = -15;

	ent = maps\mp\_utility::createOneshotEffect( "water_noise_ud" );
	ent.v[ "origin" ] = ( 0, 0, 0 );
	ent.v[ "angles" ] = ( 270, 0, 0 );
	ent.v[ "fxid" ] = "water_noise_ud";
	ent.v[ "delay" ] = -15;

	ent = maps\mp\_utility::createOneshotEffect( "water_noise" );
	ent.v[ "origin" ] = ( 0, 0, 0 );
	ent.v[ "angles" ] = ( 270, 0, 0 );
	ent.v[ "fxid" ] = "water_noise";
	ent.v[ "delay" ] = -15;
}

