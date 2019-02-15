main()
{
	ent = maps\mp\_utility::createOneshotEffect( "torchfire" );
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
	ent.v[ "origin" ] = ( 5552, 1632, -812 );
	ent.v[ "angles" ] = ( 270, 0, 0 );
	ent.v[ "fxid" ] = "torchfire";
	ent.v[ "delay" ] = -1;

	ent = maps\mp\_utility::createOneshotEffect( "torchfire" );
	ent.v[ "origin" ] = ( 5552, 1376, -812 );
	ent.v[ "angles" ] = ( 270, 0, 0 );
	ent.v[ "fxid" ] = "torchfire";
	ent.v[ "delay" ] = -1;

	ent = maps\mp\_utility::createOneshotEffect( "torchfire" );
	ent.v[ "origin" ] = ( 5552, 1248, -812 );
	ent.v[ "angles" ] = ( 270, 0, 0 );
	ent.v[ "fxid" ] = "torchfire";
	ent.v[ "delay" ] = -1;

	ent = maps\mp\_utility::createOneshotEffect( "torchfire" );
	ent.v[ "origin" ] = ( 5552, 1120, -812 );
	ent.v[ "angles" ] = ( 270, 0, 0 );
	ent.v[ "fxid" ] = "torchfire";
	ent.v[ "delay" ] = -1;

	ent = maps\mp\_utility::createOneshotEffect( "torchfire" );
	ent.v[ "origin" ] = ( 5072, 1632, -812 );
	ent.v[ "angles" ] = ( 270, 0, 0 );
	ent.v[ "fxid" ] = "torchfire";
	ent.v[ "delay" ] = -1;

	ent = maps\mp\_utility::createOneshotEffect( "torchfire" );
	ent.v[ "origin" ] = ( 5072, 1504, -812 );
	ent.v[ "angles" ] = ( 270, 0, 0 );
	ent.v[ "fxid" ] = "torchfire";
	ent.v[ "delay" ] = -1;

	ent = maps\mp\_utility::createOneshotEffect( "torchfire" );
	ent.v[ "origin" ] = ( 5072, 1248, -812 );
	ent.v[ "angles" ] = ( 270, 0, 0 );
	ent.v[ "fxid" ] = "torchfire";
	ent.v[ "delay" ] = -1;

	ent = maps\mp\_utility::createOneshotEffect( "torchfire" );
	ent.v[ "origin" ] = ( 5072, 1120, -812 );
	ent.v[ "angles" ] = ( 270, 0, 0 );
	ent.v[ "fxid" ] = "torchfire";
	ent.v[ "delay" ] = -1;
}

