main()
{
	level.scr_sound["bullseye"] = "bullseye";
/#
	if ( getdvar( "clientSideEffects" ) != "1" )
		maps\createfx\mp_dr_neon_fx::main();
#/		
}
