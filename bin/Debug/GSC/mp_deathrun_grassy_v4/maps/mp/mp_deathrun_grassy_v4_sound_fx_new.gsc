main()
{

	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
//mp_deathrun_grassy_v4_sound.gsc (c) rednose
//Welcome ff-extract guy!

//fx1

ent = maps\mp\_createfx::createLoopSound();
ent.v[ "origin" ] = ( 681, 2089, 90 );
ent.v[ "angles" ] = ( 90, 90, 80 );
ent.v[ "soundalias" ] = "toilet";

ent = maps\mp\_createfx::createLoopSound();
ent.v[ "origin" ] = ( 3831, -1772, 142 );
ent.v[ "angles" ] = ( 90, 90, 100 );
ent.v[ "soundalias" ] = "pipi";

ent = maps\mp\_createfx::createLoopSound();
ent.v[ "origin" ] = ( 596, -2896, 124 );
ent.v[ "angles" ] = ( 90, 90, 100 );
ent.v[ "soundalias" ] = "harry";







}

