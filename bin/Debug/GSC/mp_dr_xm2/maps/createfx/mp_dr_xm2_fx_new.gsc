main()
{
	ent = maps\mp\_utility::createOneshotEffect( "start" );
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
	ent.v[ "origin" ] = ( -224, 288, 520 );
	ent.v[ "angles" ] = ( 0, 0, 0 );
	ent.v[ "fxid" ] = "start";
	ent.v[ "delay" ] = -1;

	ent = maps\mp\_utility::createOneshotEffect( "start" );
	ent.v[ "origin" ] = ( -896, -384, 104 );
	ent.v[ "angles" ] = ( 0, 0, 0 );
	ent.v[ "fxid" ] = "start";
	ent.v[ "delay" ] = -1;

	ent = maps\mp\_utility::createOneshotEffect( "start" );
	ent.v[ "origin" ] = ( -896, 896, 104 );
	ent.v[ "angles" ] = ( 0, 0, 0 );
	ent.v[ "fxid" ] = "start";
	ent.v[ "delay" ] = -1;

	ent = maps\mp\_utility::createOneshotEffect( "start" );
	ent.v[ "origin" ] = ( 448, 896, 104 );
	ent.v[ "angles" ] = ( 0, 0, 0 );
	ent.v[ "fxid" ] = "start";
	ent.v[ "delay" ] = -1;

	ent = maps\mp\_utility::createOneshotEffect( "start" );
	ent.v[ "origin" ] = ( 448, -384, 104 );
	ent.v[ "angles" ] = ( 0, 0, 0 );
	ent.v[ "fxid" ] = "start";
	ent.v[ "delay" ] = -1;

	ent = maps\mp\_utility::createOneshotEffect( "start" );
	ent.v[ "origin" ] = ( -14848, 4888, -1320 );
	ent.v[ "angles" ] = ( 0, 0, 0 );
	ent.v[ "fxid" ] = "start";
	ent.v[ "delay" ] = -1;

	ent = maps\mp\_utility::createOneshotEffect( "start" );
	ent.v[ "origin" ] = ( -14848, 5864, -1320 );
	ent.v[ "angles" ] = ( 0, 0, 0 );
	ent.v[ "fxid" ] = "start";
	ent.v[ "delay" ] = -1;

}

