main()
{
	level._effect[ "wood" ]					 				= loadfx( "explosions/grenadeExp_wood" );
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
	level._effect[ "dust" ]					 				= loadfx( "explosions/grenadeExp_dirt_1" );
	level._effect[ "brick" ]								= loadfx( "explosions/grenadeExp_concrete_1" );
	level._effect[ "coolaidmanbrick" ]		 				= loadfx( "explosions/grenadeExp_concrete_1" );

	// rainfx
	level._effect[ "rain_heavy_mist" ]		 				= loadfx( "weather/rain_mp_cargoship" );
	level._effect[ "lightning" ]			 				= loadfx( "weather/lightning_mp_farm" );
	level._effect[ "cgoshp_drips" ]			 				= loadfx( "misc/cgoshp_drips" );
	level._effect[ "cgoshp_drips_a" ]		 				= loadfx( "misc/cgoshp_drips_a" );
	//level._effect[ "rain_noise" ]		 					= loadfx( "weather/rain_noise" );
	//level._effect[ "rain_noise_ud" ]		 				= loadfx( "weather/rain_noise_ud" );
	


	level._effect[ "mp_cargoship_rain_noise01" ]			= loadfx( "ambient_runners/mp_cargoship_rain_noise01" );
	level._effect[ "mp_cargoship_rain_noise02" ]			= loadfx( "ambient_runners/mp_cargoship_rain_noise02" );
	level._effect[ "mp_cargoship_rain_noise03" ]			= loadfx( "ambient_runners/mp_cargoship_rain_noise03" );
	level._effect[ "mp_cargoship_rain_noise04" ]			= loadfx( "ambient_runners/mp_cargoship_rain_noise04" );
	level._effect[ "mp_cargoship_rain_noise05" ]			= loadfx( "ambient_runners/mp_cargoship_rain_noise05" );

	level._effect[ "mp_cargoship_rain_noise_ud01" ]			= loadfx( "ambient_runners/mp_cargoship_rain_noise_ud01" );
	level._effect[ "mp_cargoship_rain_noise_ud02" ]			= loadfx( "ambient_runners/mp_cargoship_rain_noise_ud02" );
	level._effect[ "mp_cargoship_rain_noise_ud03" ]			= loadfx( "ambient_runners/mp_cargoship_rain_noise_ud03" );
	


	ent = maps\mp\_createfx::createLoopSound();
	ent.v[ "origin" ] = ( 0, 0, 0 );
	ent.v[ "angles" ] = ( 270, 0, 0 );
	ent.v[ "soundalias" ] = "rain";
	

	
		
	ent = maps\mp\_utility::createOneshotEffect( "wood" );
	ent.v[ "origin" ] = ( 0, 0, 0 );
	ent.v[ "angles" ] = ( 270, 0, 0 );
	ent.v[ "fxid" ] = "wood";
	ent.v[ "delay" ] = -15;

	ent = maps\mp\_utility::createOneshotEffect( "dust" );
	ent.v[ "origin" ] = ( 0, 0, 0 );
	ent.v[ "angles" ] = ( 270, 0, 0 );
	ent.v[ "fxid" ] = "dust";
	ent.v[ "delay" ] = -15;

	ent = maps\mp\_utility::createOneshotEffect( "brick" );
	ent.v[ "origin" ] = ( 0, 0, 0 );
	ent.v[ "angles" ] = ( 270, 0, 0 );
	ent.v[ "fxid" ] = "brick";
	ent.v[ "delay" ] = -15;
	
	ent = maps\mp\_utility::createOneshotEffect( "coolaidmanbrick" );
	ent.v[ "origin" ] = ( 0, 0, 0 );
	ent.v[ "angles" ] = ( 270, 0, 0 );
	ent.v[ "fxid" ] = "coolaidmanbrick";
	ent.v[ "delay" ] = -15;	
	
	ent = maps\mp\_utility::createOneshotEffect( "rain_heavy_mist" );
	ent.v[ "origin" ] = ( 924, 924, 3200  );
	ent.v[ "angles" ] = ( 270, 0, 0 );
	ent.v[ "fxid" ] = "rain_heavy_mist";
	ent.v[ "delay" ] = -15;
	
	ent = maps\mp\_utility::createOneshotEffect( "rain_heavy_mist" );
	ent.v[ "origin" ] = ( 924, -924, 3200  );
	ent.v[ "angles" ] = ( 270, 0, 0 );
	ent.v[ "fxid" ] = "rain_heavy_mist";
	ent.v[ "delay" ] = -15;
	
	ent = maps\mp\_utility::createOneshotEffect( "rain_heavy_mist" );
	ent.v[ "origin" ] = ( -924, 924, 3200 );
	ent.v[ "angles" ] = ( 270, 0, 0 );
	ent.v[ "fxid" ] = "rain_heavy_mist";
	ent.v[ "delay" ] = -15;
	
	ent = maps\mp\_utility::createOneshotEffect( "rain_heavy_mist" );
	ent.v[ "origin" ] = ( -924, -924, 3200  );
	ent.v[ "angles" ] = ( 270, 0, 0 );
	ent.v[ "fxid" ] = "rain_heavy_mist";
	ent.v[ "delay" ] = -15;	

	ent = maps\mp\_utility::createOneshotEffect( "rain_heavy_mist" );
	ent.v[ "origin" ] = ( 924, 924, 1600  );
	ent.v[ "angles" ] = ( 270, 0, 0 );
	ent.v[ "fxid" ] = "rain_heavy_mist";
	ent.v[ "delay" ] = -15;
	
	ent = maps\mp\_utility::createOneshotEffect( "rain_heavy_mist" );
	ent.v[ "origin" ] = ( 924, -924, 1600  );
	ent.v[ "angles" ] = ( 270, 0, 0 );
	ent.v[ "fxid" ] = "rain_heavy_mist";
	ent.v[ "delay" ] = -15;
	
	ent = maps\mp\_utility::createOneshotEffect( "rain_heavy_mist" );
	ent.v[ "origin" ] = ( -924, 924, 1600 );
	ent.v[ "angles" ] = ( 270, 0, 0 );
	ent.v[ "fxid" ] = "rain_heavy_mist";
	ent.v[ "delay" ] = -15;
	
	ent = maps\mp\_utility::createOneshotEffect( "rain_heavy_mist" );
	ent.v[ "origin" ] = ( -924, -924, 1600  );
	ent.v[ "angles" ] = ( 270, 0, 0 );
	ent.v[ "fxid" ] = "rain_heavy_mist";
	ent.v[ "delay" ] = -15;	
	
	ent = maps\mp\_utility::createOneshotEffect( "rain_heavy_mist" );
	ent.v[ "origin" ] = ( 924, 924, 0  );
	ent.v[ "angles" ] = ( 270, 0, 0 );
	ent.v[ "fxid" ] = "rain_heavy_mist";
	ent.v[ "delay" ] = -15;
	
	ent = maps\mp\_utility::createOneshotEffect( "rain_heavy_mist" );
	ent.v[ "origin" ] = ( 924, -924, 0  );
	ent.v[ "angles" ] = ( 270, 0, 0 );
	ent.v[ "fxid" ] = "rain_heavy_mist";
	ent.v[ "delay" ] = -15;
	
	ent = maps\mp\_utility::createOneshotEffect( "rain_heavy_mist" );
	ent.v[ "origin" ] = ( -924, 924, 0 );
	ent.v[ "angles" ] = ( 270, 0, 0 );
	ent.v[ "fxid" ] = "rain_heavy_mist";
	ent.v[ "delay" ] = -15;
	
	ent = maps\mp\_utility::createOneshotEffect( "rain_heavy_mist" );
	ent.v[ "origin" ] = ( -924, -924, 0  );
	ent.v[ "angles" ] = ( 270, 0, 0 );
	ent.v[ "fxid" ] = "rain_heavy_mist";
	ent.v[ "delay" ] = -15;	
	
	ent = maps\mp\_utility::createOneshotEffect( "lightning" );
	ent.v[ "origin" ] = ( 0, 0, 0 );
	ent.v[ "angles" ] = ( 270, 0, 0 );
	ent.v[ "fxid" ] = "lightning";
	ent.v[ "delay" ] = -15;
	
	ent = maps\mp\_utility::createOneshotEffect( "cgoshp_drips" );
	ent.v[ "origin" ] = ( 0, 0, 0 );
	ent.v[ "angles" ] = ( 270, 0, 0 );
	ent.v[ "fxid" ] = "cgoshp_drips";
	ent.v[ "delay" ] = -15;
	
	ent = maps\mp\_utility::createOneshotEffect( "cgoshp_drips_a" );
	ent.v[ "origin" ] = ( 0, 0, 0 );
	ent.v[ "angles" ] = ( 270, 0, 0 );
	ent.v[ "fxid" ] = "cgoshp_drips_a";
	ent.v[ "delay" ] = -15;
	
	ent = maps\mp\_utility::createOneshotEffect( "cgoshp_drips_a" );
	ent.v[ "origin" ] = ( 0, 0, 0 );
	ent.v[ "angles" ] = ( 270, 0, 0 );
	ent.v[ "fxid" ] = "cgoshp_drips_a";
	ent.v[ "delay" ] = -15;
	
	ent = maps\mp\_utility::createOneshotEffect( "mp_cargoship_rain_noise01" );
	ent.v[ "origin" ] = ( 0, 0, 0 );
	ent.v[ "angles" ] = ( 270, 0, 0 );
	ent.v[ "fxid" ] = "mp_cargoship_rain_noise01";
	ent.v[ "delay" ] = -15;
	
	ent = maps\mp\_utility::createOneshotEffect( "mp_cargoship_rain_noise02" );
	ent.v[ "origin" ] = ( 0, 0, 0 );
	ent.v[ "angles" ] = ( 270, 0, 0 );
	ent.v[ "fxid" ] = "mp_cargoship_rain_noise02";
	ent.v[ "delay" ] = -15;
	
	ent = maps\mp\_utility::createOneshotEffect( "mp_cargoship_rain_noise03" );
	ent.v[ "origin" ] = ( 0, 0, 0 );
	ent.v[ "angles" ] = ( 270, 0, 0 );
	ent.v[ "fxid" ] = "mp_cargoship_rain_noise03";
	ent.v[ "delay" ] = -15;
	
	ent = maps\mp\_utility::createOneshotEffect( "mp_cargoship_rain_noise04" );
	ent.v[ "origin" ] = ( 0, 0, 0 );
	ent.v[ "angles" ] = ( 270, 0, 0 );
	ent.v[ "fxid" ] = "mp_cargoship_rain_noise04";
	ent.v[ "delay" ] = -15;
	
	ent = maps\mp\_utility::createOneshotEffect( "mp_cargoship_rain_noise05" );
	ent.v[ "origin" ] = ( 0, 0, 0 );
	ent.v[ "angles" ] = ( 270, 0, 0 );
	ent.v[ "fxid" ] = "mp_cargoship_rain_noise05";
	ent.v[ "delay" ] = -15;
	
	ent = maps\mp\_utility::createOneshotEffect( "mp_cargoship_rain_noise_ud01" );
	ent.v[ "origin" ] = ( 0, 0, 0 );
	ent.v[ "angles" ] = ( 270, 0, 0 );
	ent.v[ "fxid" ] = "mp_cargoship_rain_noise_ud01";
	ent.v[ "delay" ] = -15;
	
	ent = maps\mp\_utility::createOneshotEffect( "mp_cargoship_rain_noise_ud02" );
	ent.v[ "origin" ] = ( 0, 0, 0 );
	ent.v[ "angles" ] = ( 270, 0, 0 );
	ent.v[ "fxid" ] = "mp_cargoship_rain_noise_ud02";
	ent.v[ "delay" ] = -15;
	
	ent = maps\mp\_utility::createOneshotEffect( "mp_cargoship_rain_noise_ud03" );
	ent.v[ "origin" ] = ( 0, 0, 0 );
	ent.v[ "angles" ] = ( 270, 0, 0 );
	ent.v[ "fxid" ] = "mp_cargoship_rain_noise_ud03";
	ent.v[ "delay" ] = -15;
	
	
	
/#	
//AUTO 	if ( getdvar( "clientSideEffects" ) != "1" )
		maps\createfx\mp_dr_stormyascent_fx::main();
#/
}

