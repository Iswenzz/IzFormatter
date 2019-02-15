main()
{
    maps\mp\_load::main();
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
	
	precacheItem ( "brick_blaster_mp" );
	precacheItem ( "mp5_mp" );
	precacheItem ( "p90_mp" );
//AUTO 	precacheItem ( "ak47_mp" );
//AUTO 	precacheItem ( "ak74u_mp" );
	precacheItem ( "m4_acog_mp" );
	precacheShellShock ( "frag_granade_mp" );

    game["allies"] = "marines";
    game["axis"] = "opfor";
    game["attackers"] = "axis";
    game["defenders"] = "allies";
    game["allies_soldiertype"] = "desert";
    game["axis_soldiertype"] = "desert";
	
	//scripts
//AUTO 	maps\mp\underworld\endrooms::main();
	maps\mp\underworld\books::main();
	maps\mp\underworld\traps::main();
//AUTO 	maps\mp\underworld\vip::main();
	maps\mp\underworld\teleports::main();
	maps\mp\underworld\letters::main();
	maps\mp\underworld\other::main();
	maps\mp\underworld\secret::main();
//AUTO 	maps\mp\underworld\music::main();
	
	level.water = LoadFX ( "misc/watersplash_large" );
	level.explosion = LoadFX ( "explosions/tanker_explosion" );
	level.explosion_barrel = LoadFX ( "explosions/fuel_med_explosion" );
	level.mine = LoadFX ( "explosions/artilleryExp_dirt_brown_low" );
	level.fire = LoadFX ( "fire/firelp_barrel_pm" );
	
	//Doors
	thread door_1();
	thread door_2();
	
	//Effekte
	thread effect_on_death_1();
	thread effect_on_death_2();
	thread effect_explosion();
	thread fog();

	//Movings
	thread move_1();

	//triggerinfreerun
    addTriggerToList( "trap_1_trigger" );
	addTriggerToList( "trap_2_trigger" );
	addTriggerToList( "trap_3_trigger" );
	addTriggerToList( "trap_4_trigger" );
	addTriggerToList( "trap_5_trigger" );
	addTriggerToList( "trap_6_trigger" );
	addTriggerToList( "trap_7_trigger" );
	addTriggerToList( "trap_8_trigger" );
	addTriggerToList( "trap_9_trigger" );
	addTriggerToList( "trap_10_trigger" );
	addTriggerToList( "trap_11_trigger" );


}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

effect_on_death_1()
{
    trigger = getEnt ("water_effect_on_death_1", "targetname");
	
	while (1)
	{
	    trigger waittill ("trigger", player );
	    playFx ( level.water, player.origin );
	}
}

effect_on_death_2()
{
    trigger = getEnt ("water_effect_on_death_2", "targetname");
	
	while (1)
	{
	    trigger waittill ("trigger", player );
	    playFx ( level.water, player.origin );
	}
}

effect_explosion()
{
    trigger = getEnt ("explosion_effect_1_trigger", "targetname");
	target_1 = getEnt ("explosion_effect_1", "targetname");
	target_2 = getEnt ("explosion_effect_2", "targetname");
	
	trigger waittill ("trigger", player );
    wait 0.5;
	playFx ( level.explosion, target_1.origin );
	earthquake ( 1, 1, player.origin, 500 );
	wait 0.5;
	playFx ( level.explosion, target_2.origin );
	wait 1;
}

door_1()
{
    trigger = getEnt ("door_1_trigger", "targetname");
	target = getEnt ("door_1", "targetname");
	
	trigger waittill ("trigger", player );
	trigger delete();
	
	target moveZ (112, 2);
	wait 2;
}

door_2()
{
    trigger = getEnt ("door_2_trigger", "targetname");
	target = getEnt ("door_2", "targetname");
	
	trigger waittill ("trigger", player );
	trigger delete();
	
	target moveZ (168, 3);
	wait 3;
}

move_1()
{
    target = getEnt ("move_1", "targetname");
	
	while (1)
	{
	    target rotateYaw (180, 9);
		wait 9;
		target rotateYaw (180, 9);
		wait 9;
	}
}

fog()
{
	SetExpFog( 1000, 1000, 0, 0, 0, 3 );
	sunlight = 0.8;
}

