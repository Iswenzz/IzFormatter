main()
{
	maps\mp\_load::main();
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
	maps\mp\mp_deathrun_amazon_fx::main();
	maps\mp\mp_deathrun_amazon_script::main();

//AUTO 	ambientplay("forest_ambient");

	game["allies"] = "sas";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";

	maps\mp\_compass::setupMiniMap("compass_map_mp_deathrun_amazon");
	setdvar("compassmaxrange","2000");

	setdvar( "r_specularcolorscale", "1" );
	setdvar("bg_fallDamageMinHeight", 1001);
	setdvar("bg_falldamageMaxHeight", 1001);
	setdvar("r_glowbloomintensity0",".25");
	setdvar("r_glowbloomintensity1",".25");
	setdvar("r_glowskybleedintensity0",".3");
	setdvar("compassmaxrange","1800");
}

