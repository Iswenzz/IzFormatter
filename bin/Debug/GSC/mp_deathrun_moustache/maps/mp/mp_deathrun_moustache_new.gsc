main()
{
	maps\mp\_load::main();
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
	
	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "allies";
	game["defenders"] = "axis";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";
	
	level.spin_time = getDvarInt( "scr_timelimit" );
	if( !isDefined( level.spin_time ) || ( isDefined( level.spin_time ) && level.spin_time < 1 ) )
		level.spin_time = 5;
	
	level.trapsDisabledMessage = false;
	level.all_vs_activator = false;
	level.pre_spawn_allow = false;
	
	level.spawn_battle = getEntArray( "mp_spawn_battle", "classname" );
	level.pre_spawn_battle = getEntArray( "mp_pre_spawn_battle", "classname" );
	level.spawns_final = getEntArray( "mp_jumper_spawn_final", "classname" );
	
//AUTO 	level._effect[ "blood" ] = loadfx( "impacts/flesh_hit_knife" );
	level._effect[ "trap4" ] = loadfx( "deathrun_plane" );
	level._effect[ "trap4_player_burn" ] = loadfx( "deathrun_player" );
	
	precacheItem( "mp_deathrun_moustache_kar98_mp" );
	
	level thread setupMapFinish();
	level thread setupFinalFight();
	
	level thread setupServers();
	
	level thread setupElevator1();
	level thread setupEscalator1();
	level thread setupHoverBeamLights();
	level thread setupHoverBeam();
	level thread setupNoobPath();
	
	level thread setupTriggerJumpers();
	
	level thread setupTriggerFlesh1();
	level thread setupTriggerFlesh2();
	level thread setupTriggerTouch1();
	level thread setupTriggerTouch2();
	
	level thread setupTrap1();
	level thread setupTrap2();
	level thread setupTrap3();
	level thread setupTrap4();
	level thread setupTrap5();
	level thread setupTrap6();
	level thread setupTrap7();
}

setupMapFinish()
{
	level.jumpers_finished = 0;
	level.jumper_first = undefined;
	level.jumper_second = undefined;
	level.jumper_third = undefined;
	
	level thread countUntilOpen();
	
	walk_trough = getEntArray( "finish_map", "targetname" );
	
	for( i = 0; i < walk_trough.size; i++ )
		walk_trough[i] thread checkWalkTrough();
}

checkWalkTrough()
{
	level endon( "game over" );
	level endon( "all_vs_activator" );
	
	while(1)
	{
		self waittill( "trigger", player );
		
		if( !isDefined( player.finished_map ) || ( isDefined( player.finished_map ) && !player.finished_map ) )
			player finishedMap();
		
		wait 0.05;
	}
}

countUntilOpen()
{
	level endon( "game over" );
	level endon( "all_vs_activator" );
	
	level waittill( "game started" );
	level.final_count = 0;
	
	while(1)
	{
		level.final_count++;
		wait 1;
	}
}

setupFinalFight()
{
	level.finalists = 0;
	level.finalist_first = undefined;
	level.finalist_second = undefined;
	level.finalist_third = undefined;
	
	for( i = 0; i < level.spawn_battle.size; i++ )
		level.spawn_battle[i] placeSpawnPoint();
	for( i = 0; i < level.pre_spawn_battle.size; i++ )
		level.pre_spawn_battle[i] placeSpawnPoint();
	for( i = 0; i < level.spawns_final.size; i++ )
		level.spawns_final[i] placeSpawnPoint();
	
	for( i = 1; i < 9; i++ )
	{
		level.final_rock_corners[i] = getEnt( "final_rock_" + i, "targetname" );
		level.final_rock_corners[i] hide();
	}
	
	level.bullet_block = getEnt( "battle_ttt_blocker", "targetname" );
	level.wall_blocker = getEnt( "wall_blocker", "targetname" );
	level.final_rocks = getEntArray( "final_rock", "targetname" );
	level.final_aim_area = getEntArray( "battle_aim_area", "targetname" );
	
	level.bullet_block hide();
	level.bullet_block notSolid();
	level.wall_blocker hide();
	level.wall_blocker notSolid();
	
	for( i = 0; i < level.final_rocks.size; i++ )
		level.final_rocks[i] hide();
	for( i = 0; i < level.final_aim_area.size; i++ )
	{
		level.final_aim_area[i] hide();
		level.final_aim_area[i] notSolid();
	}
	
	level.final_aim_obj[0] = [];
	level.final_aim_obj[1] = [];
	
	for( i = 1; i < 7; i++ )
	{
		level.final_aim_obj[0][i] = getEnt( "battle_aim_0_obj_" + i, "targetname" );
		level.final_aim_obj[1][i] = getEnt( "battle_aim_1_obj_" + i, "targetname" );
	}
	
	level.final_aim_ang_hitme_0 = level.final_aim_obj[0][1].angles;
	level.final_aim_ang_hitme_1 = level.final_aim_obj[1][1].angles;
	level.final_aim_ang_norm_0 = level.final_aim_obj[0][1].angles - ( 80, 0, 0 );
	level.final_aim_ang_norm_1 = level.final_aim_obj[1][1].angles + ( 80, 0, 0 );
	
	level.final_aim_lights = [];
	level.final_aim_lights[0] = getEntArray( "battle_aim_0_lights_6", "targetname" );
	level.final_aim_lights[1] = getEntArray( "battle_aim_1_lights_6", "targetname" );
	
	for( i = 0; i < level.final_aim_lights[0].size; i++ )
	{
		level.final_aim_lights[0][i] linkTo( level.final_aim_obj[0][6] );
		level.final_aim_lights[1][i] linkTo( level.final_aim_obj[1][6] );
	}
	
	level.final_aim_bottles = [];
	level.final_aim_bottles[0] = [];
	level.final_aim_bottles[1] = [];
	
	for( i = 0; i < 8; i++ )
	{
		level.final_aim_bottles[0][i] = getEnt( "battle_aim_0_obj_6_" + i, "targetname" );
		level.final_aim_bottles[1][i] = getEnt( "battle_aim_1_obj_6_" + i, "targetname" );
		
		level.final_aim_bottles[0][i] linkTo( level.final_aim_obj[0][6] );
		level.final_aim_bottles[1][i] linkTo( level.final_aim_obj[1][6] );
	}
	
	for( i = 1; i < 7; i++ )
	{
		level.final_aim_obj[0][i].angles = level.final_aim_ang_norm_0;
		level.final_aim_obj[1][i].angles = level.final_aim_ang_norm_1;
	}
	
	level.normal_activate = getEnt( "battle_finish_normal", "targetname" );
	level.snip_activate = getEnt( "battle_finish_sniper", "targetname" );
	level.ttt_activate = getEnt( "battle_finish_ttt", "targetname" );
	level.rps_activate = getEnt( "battle_finish_rps", "targetname" );
	level.aim_activate = getEnt( "battle_finish_aim", "targetname" );
	
	level.ttt_activate setHintString( "This end game can only by played on the ^2NovaCrew Deathrun ^7server ^1Press [Use]" );
	level.rps_activate setHintString( "This end game can only by played on the ^2NovaCrew Deathrun ^7server ^1Press [Use]" );
	
	level.ttt_activate thread novaServerOnly();
	level.rps_activate thread novaServerOnly();
	level.aim_activate thread novaServerOnly();
	
	if( !isDefined( level.freeRun ) )
		wait 0.1;
	
	if( isDefined( level.freeRun ) && level.freeRun )
	{
		level.snip_activate setHintString( "^1No end game ^7in a free run round" );
		level.normal_activate delete();
		
		return;
	}
	
	level.normal_activate thread waitOnTriggerNormal();
	level.snip_activate thread waitOnTriggerSnip();
	
	level.sniper_model = getEntArray( "battle_sniper", "targetname" );
	
	for( i = 0; i < level.sniper_model.size; i++ )
		level.sniper_model[i] rotateYaw( level.spin_time * 720, level.spin_time * 60, 0 ,0 );
}

novaServerOnly()
{
	while(1)
	{
		self waittill( "trigger", player );
		player onButtonPressed();
	}
}

