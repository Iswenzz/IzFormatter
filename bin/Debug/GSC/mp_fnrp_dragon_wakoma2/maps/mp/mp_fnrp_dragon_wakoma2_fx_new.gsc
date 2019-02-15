main()
{

	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
  level._effect[ "yellow_light" ] = loadfx( "misc/yellow_light" ); 
  ent = maps\mp\_utility::createOneshotEffect( "yellow_light" );
  ent.v[ "origin" ] = ( 47, -762, 16 ); 
  ent.v[ "angles" ] = ( -90, 0, 0 );
  ent.v[ "fxid" ] = "yellow_light";
  ent.v[ "delay" ] = -15;
  
  level._effect[ "yellow_light" ] = loadfx( "misc/yellow_light" ); 
  ent = maps\mp\_utility::createOneshotEffect( "yellow_light" );
  ent.v[ "origin" ] = ( 62, 767, 16 ); 
  ent.v[ "angles" ] = ( -90, 0, 0 );
  ent.v[ "fxid" ] = "yellow_light";
  ent.v[ "delay" ] = -15;
  
  level._effect[ "yellow_light" ] = loadfx( "misc/yellow_light" ); 
  ent = maps\mp\_utility::createOneshotEffect( "yellow_light" );
  ent.v[ "origin" ] = ( 4, -10, 16 ); 
  ent.v[ "angles" ] = ( -90, 0, 0 );
  ent.v[ "fxid" ] = "yellow_light";
  ent.v[ "delay" ] = -15;  
  
}

