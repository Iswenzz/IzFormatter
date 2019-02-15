main()
{

	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
	level.tweakfile = true;
 

	//* Fog section * 

	setdvar( "scr_fog_disable", "0" );

	//setExpFog(300, 1400, 0.5, 0.5, 0.5, 0);
	setExpFog(1000, 1000, 0, 0, 0, 0.2);
	VisionSetNaked( "mp_bog", 0 );

}

