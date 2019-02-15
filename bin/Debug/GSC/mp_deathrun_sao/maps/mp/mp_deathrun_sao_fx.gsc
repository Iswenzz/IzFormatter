main()
{
	level._effect[ "torch" ] = loadfx( "sao/torch" );
	
/#
	if ( getdvar( "clientSideEffects" ) != "1" )
		maps\createfx\mp_deathrun_sao_fx::main();
#/		
}