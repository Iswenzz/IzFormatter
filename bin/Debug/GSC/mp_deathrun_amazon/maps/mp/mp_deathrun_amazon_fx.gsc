main()
{
	level._effect[ "thin_black_smoke_L" ] = loadfx( "smoke/thin_black_smoke_L" );
	level._effect[ "fx_wtrfall_splash_sm" ]	= loadfx( "misc/fx_wtrfall_splash_sm" );
	level._effect[ "viper_waterfall" ] = loadfx( "misc/viper_waterfall" );
	level._effect[ "viper_waterfall_cntr" ]	= loadfx( "misc/viper_waterfall_cntr" );
	level._effect[ "viper_waterfall_down" ]	= loadfx( "misc/viper_waterfall_down" );
	level._effect[ "viper_waterfall_down_2" ] = loadfx( "misc/viper_waterfall_down_2" );
	level._effect[ "hawk" ] = loadfx( "weather/hawk" );

/#
	if ( getdvar( "clientSideEffects" ) != "1" )
		maps\createfx\mp_deathrun_amazon_fx::main();
#/		
}