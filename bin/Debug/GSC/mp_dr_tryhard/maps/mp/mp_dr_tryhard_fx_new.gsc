main()
{
   level._effect[ "rain_heavy_mist" ]       = loadfx( "weather/rain_mp_farm" );
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
   level._effect[ "lightning" ]          = loadfx( "weather/lightning_mp_farm" );

   //ambient runners
   level._effect[ "water_noise_ud" ]       = loadfx( "ambient_runners/mp_farm_water_noise_ud01" );
   level._effect[ "water_noise" ]          = loadfx( "ambient_runners/mp_farm_water_noise01" );
   
/#
//AUTO    if ( getdvar( "clientSideEffects" ) != "1" )
      maps\createfx\mp_dr_tryhard_fx::main();
#/      
}

