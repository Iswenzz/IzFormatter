main()
{
	level._effect[ "snowplode" ]	= loadfx( "explosions/snowtreefall" );

/#
	if ( getdvar( "clientSideEffects" ) != "1" )
		maps\createfx\mp_dr_merry_xmas_fx::main();
#/		
}
