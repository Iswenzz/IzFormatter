main()
{
	level._effect["firelp_barrel_pm"]				= loadfx ("fire/firelp_barrel_pm");	
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
	
	level._effect["firelp_med_pm"]					= loadfx ("fire/firelp_med_pm_nodistort");	
	level._effect["firelp_small_pm"]				= loadfx ("fire/firelp_small_pm");
	level._effect["firelp_small_pm_a"]				= loadfx ("fire/firelp_small_pm_a");
	level._effect["dust_wind_fast"]					= loadfx ("dust/dust_wind_fast");
	level._effect["dust_wind_slow"]					= loadfx ("dust/dust_wind_slow_yel_loop");
	level._effect["dust_wind_spiral"]				= loadfx ("dust/dust_spiral_runner");
//AUTO 	level._effect["battlefield_smokebank_S"]		= loadfx ("smoke/battlefield_smokebank_S");
	level._effect["hallway_smoke_light"]		= loadfx ("smoke/hallway_smoke_light");
/#
//AUTO 	if ( getdvar( "clientSideEffects" ) != "1" )
		maps\createfx\mp_crash_fx::main();
#/

}

