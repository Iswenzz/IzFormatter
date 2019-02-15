main()
{
/#
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
//AUTO 	if ( getdvar( "clientSideEffects" ) != "1" )
		maps\createfx\mp_dr_jurapark_fx::main();
#/		
}

