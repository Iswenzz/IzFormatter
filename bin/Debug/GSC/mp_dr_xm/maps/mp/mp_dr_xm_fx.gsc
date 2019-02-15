main()
{
	level._effect[ "start" ] = loadfx( "xm/start" );
	
/#
	if ( getdvar( "clientSideEffects" ) != "1" )
		maps\createfx\mp_deathrun_crystal_fx::main();
#/		
}