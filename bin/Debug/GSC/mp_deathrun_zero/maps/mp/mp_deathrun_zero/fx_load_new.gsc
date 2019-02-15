main()
{
randomStartDelay = randomfloatrange( -20, -15);

	global_FX( "portal21", "portal2", "misc/portal2", randomStartDelay, "portal" );
	global_FX( "portal22", "portal2", "misc/portal2", randomStartDelay, "portal" );
	global_FX( "portal23", "portal", "misc/portal", randomStartDelay, "portal" );
	global_FX( "fire11", "fire", "misc/fire", randomStartDelay, "fire" );
	global_FX( "fire12", "fire", "misc/fire", randomStartDelay, "fire" );

}

global_FX( targetname, fxName, fxFile, delay, soundalias )
{
	// script_structs
	ents = getstructarray(targetname,"targetname");
	if ( !isdefined( ents ) )
		return;
	if ( ents.size <= 0 )
		return;
	
	for ( i = 0 ; i < ents.size ; i++ )
		ents[i] global_FX_create( fxName, fxFile, delay, soundalias );
}

global_FX_create( fxName, fxFile, delay, soundalias )
{
	if ( !isdefined( level._effect ) )
		level._effect = [];
	if ( !isdefined( level._effect[ fxName ] ) )
		level._effect[ fxName ]	= loadfx( fxFile );
	
	// default effect angles if they dont exist
	if ( !isdefined( self.angles ) )
		self.angles = ( 0, 0, 0 );
	
	ent = createOneshotEffect( fxName );
	ent.v[ "origin" ] = ( self.origin );
	ent.v[ "angles" ] = ( self.angles );
	ent.v[ "fxid" ] = fxName;
	ent.v[ "delay" ] = delay;
	if ( isdefined( soundalias ) )
	{
		ent.v[ "soundalias" ] = soundalias;
	}
}

