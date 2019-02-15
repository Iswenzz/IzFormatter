main()
{
	ent = maps\mp\_utility::createOneshotEffect( "crystal_blue_fire" );
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
	ent.v[ "origin" ] = ( 3384, -3480, 96 );
	ent.v[ "angles" ] = ( -90, 0, 0 );
	ent.v[ "fxid" ] = "crystal_blue_fire";
	ent.v[ "delay" ] = -1;

        ent = maps\mp\_utility::createOneshotEffect( "crystal_blue_fire" );
	ent.v[ "origin" ] = ( 3384, -3752, 96 );
	ent.v[ "angles" ] = ( -90, 0, 0 );
	ent.v[ "fxid" ] = "crystal_blue_fire";
	ent.v[ "delay" ] = -1;

        ent = maps\mp\_utility::createOneshotEffect( "crystal_blue_fire" );
	ent.v[ "origin" ] = ( 3384, -4576, 96 );
	ent.v[ "angles" ] = ( -90, 0, 0 );
	ent.v[ "fxid" ] = "crystal_blue_fire";
	ent.v[ "delay" ] = -1;

        ent = maps\mp\_utility::createOneshotEffect( "crystal_blue_fire" );
	ent.v[ "origin" ] = ( 3384, -4848, 96 );
	ent.v[ "angles" ] = ( -90, 0, 0 );
	ent.v[ "fxid" ] = "crystal_blue_fire";
	ent.v[ "delay" ] = -1;

        ent = maps\mp\_utility::createOneshotEffect( "crystal_blue_fire" );
	ent.v[ "origin" ] = ( 1472, -5192, 176 );
	ent.v[ "angles" ] = ( -90, 0, 0 );
	ent.v[ "fxid" ] = "crystal_blue_fire";
	ent.v[ "delay" ] = -1;

        ent = maps\mp\_utility::createOneshotEffect( "crystal_blue_fire" );
	ent.v[ "origin" ] = ( 1744, -5192, 176 );
	ent.v[ "angles" ] = ( -90, 0, 0 );
	ent.v[ "fxid" ] = "crystal_blue_fire";
	ent.v[ "delay" ] = -1;

}

