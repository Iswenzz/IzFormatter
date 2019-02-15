main()
{

	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
	maps\mp\_teleport::main();
	
//AUTO 	ambientPlay("ambient_mp_dr_rainbow");

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
	setDvar("bg_falldamagemaxheight", 9999999999 );
	setDvar("bg_falldamageminheight", 999999999 );
	
	


	thread message();
	thread Br11();
	thread Br12();
	thread Br21();
	thread Br22();
	thread Rpb1();
		thread Rpb21();
		thread Rpb22();
		thread Rpb23();
		thread Rpb24();
		thread Rpb25();
		thread Rpb26();
		thread Rpb27();
	thread Rpb4();
	thread rpdb();
	thread rpdv();
		thread adB();
		thread adV();
		thread adJ();
		thread adO();
		
		
		
	thread tb1();
	thread tb2();
	thread tb3();
	thread tb4();
	thread string();
	
	thread tv1();
	thread tv2();
	thread tv3();
	thread rpv1s();
	thread rpv2s();
	thread rpv3s();
	thread rpj1();
	thread rpj2();
	thread tj1();
	thread tj2();
	thread to1();
	thread to2();
	
	
	
	thread First();
	thread games();
	thread Death();
//AUTO 	thread sniper();
	thread surf_end_2();
//AUTO 	thread old();
	thread surf();
	thread surf_end_1();
//AUTO 	thread knife();
//AUTO 	thread bounce();
//AUTO 	thread knife_bouncer();
	thread be1();
	thread be2();
	thread be12();
	thread be22();
//AUTO 	thread bounce_sniper();
	
	thread secret_ez();
	thread secret_ezz();
	thread secret_hard();
	thread secret_i();
	thread secret_ii();
	thread secret_ez2();
	thread secret_ezz2();
	thread secret_hard2();
	thread secret_i2();
	thread secret_ii2();
	
	thread secret_a();
	thread secret_a2();
	
	
	
		addTriggerToList("tb1pt");
		addTriggerToList("tb2pt");
		addTriggerToList("tb3pt");
		addTriggerToList("tb4pt");
		addTriggerToList("tv1pt");
		addTriggerToList("tv2pt");
		addTriggerToList("tv3pt");
		addTriggerToList("tj1pt");
		addTriggerToList("tj2pt");
		addTriggerToList("to1t");
		addTriggerToList("to2t");
		
//AUTO 	thread musictrig();
	thread message2();
	
//AUTO 	if(!isdefined(level.music))
//AUTO 		level.music=[];

//AUTO 	level.music[0]["song"]	="Nero - Promises (Skrillex Remix) [QUIX FLIP]";
//AUTO 	level.music[0]["alias"]	="song1";
//AUTO 	level.music[1]["song"]	="Kygo x Romy Wave - Raging (SGNFCNTS Remix)";
//AUTO 	level.music[1]["alias"]	="song2";
//AUTO 	level.music[2]["song"]	="Eljay - No Pressure";
//AUTO 	level.music[2]["alias"]	="song3";

	
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

