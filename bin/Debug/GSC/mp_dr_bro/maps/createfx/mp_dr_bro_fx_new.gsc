main()
{
ent = maps\mp\_utility::createOneshotEffect( "dust/amb_dust_hangar");
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
ent.v[ "origin" ] = (376, 24, 76);
ent.v[ "angles" ] = (0,270,0);
ent.v[ "fxid" ] = "dust";
ent.v[ "delay" ] = -3;

ent = maps\mp\_utility::createOneshotEffect( "dust/amb_dust_hangar");
ent.v[ "origin" ] = (-360, -24, 76);
ent.v[ "angles" ] = (0,270,0);
ent.v[ "fxid" ] = "dust";
ent.v[ "delay" ] = -3;

ent = maps\mp\_utility::createOneshotEffect( "misc/wind_controlled_leaves");
ent.v[ "origin" ] = (-472, -1240, 81);
ent.v[ "angles" ] = (0,270,0);
ent.v[ "fxid" ] = "misc";
ent.v[ "delay" ] = -3;

ent = maps\mp\_utility::createOneshotEffect( "distortion/shower_wall_large");
ent.v[ "origin" ] = (-1448, -264, 76);
ent.v[ "angles" ] = (0, 90, 0);
ent.v[ "fxid" ] = "distortion";
ent.v[ "delay" ] = -3;

ent = maps\mp\_utility::createOneshotEffect( "treadfx/heli_dust_village_defend");
ent.v[ "origin" ] = (1528, -72, 76);
ent.v[ "angles" ] = (0,90,0);
ent.v[ "fxid" ] = "treadfx";
ent.v[ "delay" ] = -3;

ent = maps\mp\_utility::createOneshotEffect( "treadfx/heli_dust_village_defend");
ent.v[ "origin" ] = (-408, 1272, 76);
ent.v[ "angles" ] = (0,180,0);
ent.v[ "fxid" ] = "treadfx";
ent.v[ "delay" ] = -3;

}

