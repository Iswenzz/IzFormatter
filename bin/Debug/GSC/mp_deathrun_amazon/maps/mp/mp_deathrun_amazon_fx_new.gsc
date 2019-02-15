main()
{
	level._effect[ "thin_black_smoke_L" ] = loadfx( "smoke/thin_black_smoke_L" );
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
	level._effect[ "fx_wtrfall_splash_sm" ]	= loadfx( "misc/fx_wtrfall_splash_sm" );
//AUTO 	level._effect[ "viper_waterfall" ] = loadfx( "misc/viper_waterfall" );
//AUTO 	level._effect[ "viper_waterfall_cntr" ]	= loadfx( "misc/viper_waterfall_cntr" );
//AUTO 	level._effect[ "viper_waterfall_down" ]	= loadfx( "misc/viper_waterfall_down" );
//AUTO 	level._effect[ "viper_waterfall_down_2" ] = loadfx( "misc/viper_waterfall_down_2" );
	level._effect[ "hawk" ] = loadfx( "weather/hawk" );

/#
//AUTO 	if ( getdvar( "clientSideEffects" ) != "1" )
		maps\createfx\mp_deathrun_amazon_fx::main();
#/		
}

