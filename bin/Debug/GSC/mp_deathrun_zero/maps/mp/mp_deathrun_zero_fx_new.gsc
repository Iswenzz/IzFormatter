main()
{

	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
	level._effect[ "portal2" ]	           			= loadfx( "misc/portal2" );
	level._effect[ "portal1" ]	           			= loadfx( "misc/portal" );
	level._effect[ "fire" ]	           				= loadfx( "misc/fire" );
	level._effect[ "blesky1" ]	           			= loadfx( "misc/blesky1" );
	level._effect[ "fire21" ]	           			= loadfx( "fire/fire21" );
	level._effect[ "fire22" ]	           			= loadfx( "fire/fire22" );
	level._effect[ "playerfire" ]	           		= loadfx( "props/playerfire" );

/#
//AUTO 	if ( getdvar( "clientSideEffects" ) != "1" )
		maps\createfx\mp_deathrun_zero_fx::main();
#/		
}

