//_createfx generated. Do not touch!!

main()
{
	ent = maps\mp\_utility::createOneshotEffect( "rain_heavy_mist" );
	ent.v[ "origin" ] = ( X, Y, Z );
	ent.v[ "angles" ] = ( 270, 0, 0 );
	ent.v[ "fxid" ] = "rain_heavy_mist";
	ent.v[ "delay" ] = -15;

	ent = maps\mp\_utility::createOneshotEffect( "lightning" );
	ent.v[ "origin" ] = ( X, Y, Z );
	ent.v[ "angles" ] = ( 270, 0, 0 );
	ent.v[ "fxid" ] = "lightning";
	ent.v[ "delay" ] = -15;

	ent = maps\mp\_utility::createOneshotEffect( "water_noise_ud" );
	ent.v[ "origin" ] = ( 0, 0, 0 );
	ent.v[ "angles" ] = ( 270, 0, 0 );
	ent.v[ "fxid" ] = "water_noise_ud";
	ent.v[ "delay" ] = -15;

	ent = maps\mp\_utility::createOneshotEffect( "water_noise" );
	ent.v[ "origin" ] = ( 0, 0, 0 );
	ent.v[ "angles" ] = ( 270, 0, 0 );
	ent.v[ "fxid" ] = "water_noise";
	ent.v[ "delay" ] = -15;
}