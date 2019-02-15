main()
{
	ent = maps\mp\_utility::createOneshotEffect( "lightball" );
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
	ent.v[ "origin" ] = ( -7216, -9652, 1032 );
	ent.v[ "angles" ] = ( 0, 0, 0 );
	ent.v[ "fxid" ] = "lightball";
	ent.v[ "delay" ] = -1;

	ent = maps\mp\_utility::createOneshotEffect( "lightball" );
	ent.v[ "origin" ] = ( -7216, -9816, 1032 );
	ent.v[ "angles" ] = ( 0, 0, 0 );
	ent.v[ "fxid" ] = "lightball";
	ent.v[ "delay" ] = -1;

	ent = maps\mp\_utility::createOneshotEffect( "lightball" );
	ent.v[ "origin" ] = ( -8612, -9816, 544 );
	ent.v[ "angles" ] = ( 0, 0, 0 );
	ent.v[ "fxid" ] = "lightball";
	ent.v[ "delay" ] = -1;

	ent = maps\mp\_utility::createOneshotEffect( "lightball" );
	ent.v[ "origin" ] = ( -8612, -9648, 544 );
	ent.v[ "angles" ] = ( 0, 0, 0 );
	ent.v[ "fxid" ] = "lightball";
	ent.v[ "delay" ] = -1;

	ent = maps\mp\_utility::createOneshotEffect( "lightball" );
	ent.v[ "origin" ] = ( -8768, -624, 168 );
	ent.v[ "angles" ] = ( 0, 0, 0 );
	ent.v[ "fxid" ] = "lightball";
	ent.v[ "delay" ] = -1;

	ent = maps\mp\_utility::createOneshotEffect( "lightball" );
	ent.v[ "origin" ] = ( -9664, -624, 168 );
	ent.v[ "angles" ] = ( 0, 0, 0 );
	ent.v[ "fxid" ] = "lightball";
	ent.v[ "delay" ] = -1;

}

