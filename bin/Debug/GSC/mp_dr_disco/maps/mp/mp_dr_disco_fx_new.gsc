main()
{
    level.scr_sound["floor1"] = "floor1";
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
    level.scr_sound["floor2"] = "floor2";
    level.scr_sound["floor3"] = "floor3";
    level.scr_sound["end_old"] = "end_old";
//AUTO     level.scr_sound["end_sniper"] = "end_sniper";
    level.scr_sound["end_fall"] = "end_fall";
    level.scr_sound["end_spin"] = "end_spin";
    level.scr_sound["and_marine"] = "end_marine";
    level.scr_sound["end_earthquake"] = "end_earthquake";
    level.scr_sound["end_bush"] = "end_bush";
    level.scr_sound["end_flash"] = "end_flash";
    level.scr_sound["end_heavy"] = "end_heavy";
/#
//AUTO     if ( getdvar( "clientSideEffects" ) != "1" )
        maps\createfx\mp_dr_neon_fx::main();
#/        
}

