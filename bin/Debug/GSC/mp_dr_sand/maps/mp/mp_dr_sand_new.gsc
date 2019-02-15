main()
{
	maps\mp\_load::main();
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
	maps\mp\_teleport::main();
	maps\mp\mp_dr_sand\moving::main();
	maps\mp\mp_dr_sand\effects::main();
	maps\mp\mp_dr_sand\traps::main();
	
	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";

	setdvar( "r_specularcolorscale", "1" );
	setdvar( "r_specular", "0" );
	setdvar("r_glowbloomintensity0",".25");
	setdvar("r_glowbloomintensity1",".25");
	setdvar("r_glowskybleedintensity0",".3");
	setdvar("compassmaxrange","1800");
	setDvar("bg_falldamagemaxheight", 99999999 );
	setDvar("bg_falldamageminheight", 9999999 );
	
	thread message();
	thread message2();
	thread First();
	thread games();
	thread secret();
//AUTO 	thread deagle();
//AUTO 	thread knife();
//AUTO 	thread sniper();
	
//AUTO 	thread music();
	
//AUTO 	if(!isdefined(level.music))
//AUTO 		level.music=[];

//AUTO 	level.music[0]["song"]	="DJ Fresh - Gold Dust";
//AUTO 	level.music[0]["alias"]	="gold";
//AUTO 	level.music[1]["song"]	="Tujamo & Plastik - Dr. WHO (Smooth Remix)";
//AUTO 	level.music[1]["alias"]	="who";
//AUTO 	level.music[2]["song"]	="DJ Fresh - Flashlight (Radio Edit)";
//AUTO 	level.music[2]["alias"]	="flash";
//AUTO 	level.music[3]["song"]	="Reol & nqrse - Ooedo ranvu";
//AUTO 	level.music[3]["alias"]	="ooedo";
//AUTO 	level.music[4]["song"]	="Skillet - Hero";
//AUTO 	level.music[4]["alias"]	="skillet";
//AUTO 	level.music[5]["song"]	="Galantis - No Money (T-Mass Remix)";
//AUTO 	level.music[5]["alias"]	="money";
//AUTO 	level.music[6]["song"]	="Borgore Ft. G-Eazy - Forbes (Wildfellaz & ASUHRUH Remix)";
//AUTO 	level.music[6]["alias"]	="borgore";
	
}

	onDisconnect()
{
	self endon( "music thread terminated" );
	self waittill( "disconnect" );
	self cleanUp();
}

	onDeath()
{
	self endon( "disconnect" );
	self endon( "music thread terminated" );
	self waittill( "death" );
	self cleanUp();
}

