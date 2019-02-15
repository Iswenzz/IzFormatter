main()
{
		// CreateFX entities placed: 0
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
     	/*ent = maps\mp\_utility::createOneshotEffect( "fog_ground_200_red" );
     	ent.v[ "origin" ] = ( 471.128, 853.821, -8 );
     	ent.v[ "angles" ] = ( 270, 0, 0 );
     	ent.v[ "fxid" ] = "fog_ground_200_red";
     	ent.v[ "delay" ] = -15;*/
}

