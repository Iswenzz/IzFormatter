main()
{
level._effect[ "wood" ] = loadfx( "explosions/grenadeExp_wood" );
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
level._effect[ "dust" ] = loadfx( "explosions/grenadeExp_dirt_1" );
level._effect[ "brick" ] = loadfx( "explosions/grenadeExp_concrete_1" );
level._effect[ "coolaidmanbrick" ] = loadfx( "explosions/grenadeExp_concrete_1" );
level._effect[ "rain_heavy_mist" ] = loadfx( "weather/rain_mp_farm" );
level._effect[ "lightning" ] = loadfx( "weather/lightning_mp_farm" );
level._effect[ "cgoshp_drips_a" ] = loadfx( "misc/cgoshp_drips_a" );

//ambient runners
level._effect[ "rain_splash_mp_farm" ] = loadfx( "ambient_runners/mp_farm_rain_splash01" );
level._effect[ "water_noise_ud" ] = loadfx( "ambient_runners/mp_farm_water_noise_ud01" );
level._effect[ "water_noise" ] = loadfx( "ambient_runners/mp_farm_water_noise01" );


/#
//AUTO if ( getdvar( "clientSideEffects" ) != "1" )
maps\createfx\mp_deathrun_eudora_fx::main();
#/ 
}

