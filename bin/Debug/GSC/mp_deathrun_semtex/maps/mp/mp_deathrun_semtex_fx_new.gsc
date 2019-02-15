main()
{
	precacheFX();
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
	spawnFX();
}

precacheFX()
{
	level._effect["c4"] = loadfx("explosions/grenadeexp_default");
	level._effect["barrel"] = loadfx("fire/firelp_barrel_pm");
}

spawnFX()
{
	playLoopedFx(level._effect["barrel"], 4, (2944,112,60), 0, anglestoforward ((0,0,0)), anglestoup((0,0,0)));
	playLoopedFx(level._effect["barrel"], 4, (2944,-560,60), 0, anglestoforward ((0,0,0)), anglestoup((0,0,0)));
	playLoopedFx(level._effect["barrel"], 4, (-2176,5824,216), 0, anglestoforward ((0,0,0)), anglestoup((0,0,0)));
	playLoopedFx(level._effect["barrel"], 4, (-1920,5504,216), 0, anglestoforward ((0,0,0)), anglestoup((0,0,0)));
}

