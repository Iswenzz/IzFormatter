main()
{

	level._effect[ "portal2" ]	           			= loadfx( "misc/portal2" );
	level._effect[ "portal1" ]	           			= loadfx( "misc/portal" );
	level._effect[ "fire" ]	           				= loadfx( "misc/fire" );
	level._effect[ "blesky1" ]	           			= loadfx( "misc/blesky1" );
	level._effect[ "fire21" ]	           			= loadfx( "fire/fire21" );
	level._effect[ "fire22" ]	           			= loadfx( "fire/fire22" );
	level._effect[ "playerfire" ]	           		= loadfx( "props/playerfire" );

/#
	if ( getdvar( "clientSideEffects" ) != "1" )
		maps\createfx\mp_deathrun_zero_fx::main();
#/		
}