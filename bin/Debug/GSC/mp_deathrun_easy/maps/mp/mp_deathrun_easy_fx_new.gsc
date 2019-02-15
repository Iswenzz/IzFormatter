main()
{
	level._effect["m_resp"]		= loadfx( "misc/m_resp" );
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
	level._effect["pulse"]		= loadfx( "misc/pulse" );
	level._effect["blesky1"]		= loadfx( "misc/blesky1" );
	level._effect["teleport_fx"]	= loadfx( "misc/teleport" );
	level._effect["bridge"]			= loadfx( "misc/bridge" );	
}

