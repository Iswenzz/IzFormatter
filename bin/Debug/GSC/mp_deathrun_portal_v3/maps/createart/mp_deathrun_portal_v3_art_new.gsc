main()
{
	level.tweakfile = true;
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
 
	setdvar( "scr_fog_disable", "0" );
	setExpFog( 1000, 2500, 0.501961, 0.501961, 0.45098, 0 );
	VisionSetNaked( "mp_deathrun_portal_v3", 0 );
}

