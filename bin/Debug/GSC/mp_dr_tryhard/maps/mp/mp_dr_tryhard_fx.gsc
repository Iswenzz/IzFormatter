main()
{
   level._effect[ "rain_heavy_mist" ]       = loadfx( "weather/rain_mp_farm" );
   level._effect[ "lightning" ]          = loadfx( "weather/lightning_mp_farm" );

   //ambient runners
   level._effect[ "water_noise_ud" ]       = loadfx( "ambient_runners/mp_farm_water_noise_ud01" );
   level._effect[ "water_noise" ]          = loadfx( "ambient_runners/mp_farm_water_noise01" );
   
/#
   if ( getdvar( "clientSideEffects" ) != "1" )
      maps\createfx\mp_dr_tryhard_fx::main();
#/      
}