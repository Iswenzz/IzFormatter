main()
{
	ent = maps\mp\_utility::createOneshotEffect( "torch" );
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
	ent.v[ "origin" ] = ( 3872, 2368, 72 );
	ent.v[ "angles" ] = ( -90, 0, 0 );
	ent.v[ "fxid" ] = "torch";
	ent.v[ "delay" ] = -1;

	ent = maps\mp\_utility::createOneshotEffect( "torch" );
	ent.v[ "origin" ] = ( 3872, 2752, 72 );
	ent.v[ "angles" ] = ( -90, 0, 0 );
	ent.v[ "fxid" ] = "torch";
	ent.v[ "delay" ] = -1;

	ent = maps\mp\_utility::createOneshotEffect( "torch" );
	ent.v[ "origin" ] = ( 4144, 3040, 72 );
	ent.v[ "angles" ] = ( -90, 0, 0 );
	ent.v[ "fxid" ] = "torch";
	ent.v[ "delay" ] = -1;

	ent = maps\mp\_utility::createOneshotEffect( "torch" );
	ent.v[ "origin" ] = ( 4416, 3376, 72 );
	ent.v[ "angles" ] = ( -90, 0, 0 );
	ent.v[ "fxid" ] = "torch";
	ent.v[ "delay" ] = -1;

	ent = maps\mp\_utility::createOneshotEffect( "torch" );
	ent.v[ "origin" ] = ( 4800, 3376, 72 );
	ent.v[ "angles" ] = ( -90, 0, 0 );
	ent.v[ "fxid" ] = "torch";
	ent.v[ "delay" ] = -1;

	ent = maps\mp\_utility::createOneshotEffect( "torch" );
	ent.v[ "origin" ] = ( 5072, 3104, 72 );
	ent.v[ "angles" ] = ( -90, 0, 0 );
	ent.v[ "fxid" ] = "torch";
	ent.v[ "delay" ] = -1;

	ent = maps\mp\_utility::createOneshotEffect( "torch" );
	ent.v[ "origin" ] = ( 5408, 2784, 72 );
	ent.v[ "angles" ] = ( -90, 0, 0 );
	ent.v[ "fxid" ] = "torch";
	ent.v[ "delay" ] = -1;

	ent = maps\mp\_utility::createOneshotEffect( "torch" );
	ent.v[ "origin" ] = ( 5408, 2400, 72 );
	ent.v[ "angles" ] = ( -90, 0, 0 );
	ent.v[ "fxid" ] = "torch";
	ent.v[ "delay" ] = -1;

	ent = maps\mp\_utility::createOneshotEffect( "torch" );
	ent.v[ "origin" ] = ( 5152, 2048, 72 );
	ent.v[ "angles" ] = ( -90, 0, 0 );
	ent.v[ "fxid" ] = "torch";
	ent.v[ "delay" ] = -1;

	ent = maps\mp\_utility::createOneshotEffect( "torch" );
	ent.v[ "origin" ] = ( 4800, 1728, 72 );
	ent.v[ "angles" ] = ( -90, 0, 0 );
	ent.v[ "fxid" ] = "torch";
	ent.v[ "delay" ] = -1;

	ent = maps\mp\_utility::createOneshotEffect( "torch" );
	ent.v[ "origin" ] = ( 4416, 1728, 72 );
	ent.v[ "angles" ] = ( -90, 0, 0 );
	ent.v[ "fxid" ] = "torch";
	ent.v[ "delay" ] = -1;

	ent = maps\mp\_utility::createOneshotEffect( "torch" );
	ent.v[ "origin" ] = ( 4208, 2000, 72 );
	ent.v[ "angles" ] = ( -90, 0, 0 );
	ent.v[ "fxid" ] = "torch";
	ent.v[ "delay" ] = -1;

	ent = maps\mp\_utility::createOneshotEffect( "torch" );
	ent.v[ "origin" ] = ( -5480, -44, 348 );
	ent.v[ "angles" ] = ( -90, 0, 0 );
	ent.v[ "fxid" ] = "torch";
	ent.v[ "delay" ] = -1;

	ent = maps\mp\_utility::createOneshotEffect( "torch" );
	ent.v[ "origin" ] = ( -5480, -676, 348 );
	ent.v[ "angles" ] = ( -90, 0, 0 );
	ent.v[ "fxid" ] = "torch";
	ent.v[ "delay" ] = -1;

	ent = maps\mp\_utility::createOneshotEffect( "torch" );
	ent.v[ "origin" ] = ( -6152, -44, 348 );
	ent.v[ "angles" ] = ( -90, 0, 0 );
	ent.v[ "fxid" ] = "torch";
	ent.v[ "delay" ] = -1;

	ent = maps\mp\_utility::createOneshotEffect( "torch" );
	ent.v[ "origin" ] = ( -6152, -676, 348 );
	ent.v[ "angles" ] = ( -90, 0, 0 );
	ent.v[ "fxid" ] = "torch";
	ent.v[ "delay" ] = -1;

	ent = maps\mp\_utility::createOneshotEffect( "torch" );
	ent.v[ "origin" ] = ( -6792, -44, 348 );
	ent.v[ "angles" ] = ( -90, 0, 0 );
	ent.v[ "fxid" ] = "torch";
	ent.v[ "delay" ] = -1;

	ent = maps\mp\_utility::createOneshotEffect( "torch" );
	ent.v[ "origin" ] = ( -6792, -676, 348 );
	ent.v[ "angles" ] = ( -90, 0, 0 );
	ent.v[ "fxid" ] = "torch";
	ent.v[ "delay" ] = -1;

	ent = maps\mp\_utility::createOneshotEffect( "torch" );
	ent.v[ "origin" ] = ( -7196, 136, 348 );
	ent.v[ "angles" ] = ( -90, 0, 0 );
	ent.v[ "fxid" ] = "torch";
	ent.v[ "delay" ] = -1;

	ent = maps\mp\_utility::createOneshotEffect( "torch" );
	ent.v[ "origin" ] = ( -7652, 136, 348 );
	ent.v[ "angles" ] = ( -90, 0, 0 );
	ent.v[ "fxid" ] = "torch";
	ent.v[ "delay" ] = -1;

	ent = maps\mp\_utility::createOneshotEffect( "torch" );
	ent.v[ "origin" ] = ( -7196, 712, 348 );
	ent.v[ "angles" ] = ( -90, 0, 0 );
	ent.v[ "fxid" ] = "torch";
	ent.v[ "delay" ] = -1;

	ent = maps\mp\_utility::createOneshotEffect( "torch" );
	ent.v[ "origin" ] = ( -7652, 712, 348 );
	ent.v[ "angles" ] = ( -90, 0, 0 );
	ent.v[ "fxid" ] = "torch";
	ent.v[ "delay" ] = -1;

	ent = maps\mp\_utility::createOneshotEffect( "torch" );
	ent.v[ "origin" ] = ( -7272, 808, 872 );
	ent.v[ "angles" ] = ( -90, 0, 0 );
	ent.v[ "fxid" ] = "torch";
	ent.v[ "delay" ] = -1;

	ent = maps\mp\_utility::createOneshotEffect( "torch" );
	ent.v[ "origin" ] = ( -7560, 808, 888 );
	ent.v[ "angles" ] = ( -90, 0, 0 );
	ent.v[ "fxid" ] = "torch";
	ent.v[ "delay" ] = -1;
}

