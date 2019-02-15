main()
{
 maps\mp\_load::main();
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
 

 
	game["allies"] = "marines";
    game["axis"] = "opfor";
    game["attackers"] = "axis";
    game["defenders"] = "allies";
    game["allies_soldiertype"] = "desert";
    game["axis_soldiertype"] = "desert";
    setDvar( "r_specularcolorscale", "1" );
    setDvar("r_glowbloomintensity0",".25");
    setDvar("r_glowbloomintensity1",".25");
    setDvar("r_glowskybleedintensity0",".3");
//AUTO 	setDvar("g_speed","190");
//AUTO 	//setMoveSpeedScale( 1 );
	setDvar("bg_falldamagemaxheight", 20000 );
    setDvar("bg_falldamageminheight", 15000 );
  	setDvar("dr_bunnyhoop_pro","0");
	precacheShellShock( "jeepride_ridedeath");
	precacheShader("ehvolevi");
	precacheShader("gay");
	precacheItem("m40a3_mp");
//AUTO 	precacheItem("ak47_mp");
	precacheItem("rpg_mp");
	precacheShader("ossidiana2d");
	level.boom_fx = LoadFx("explosions/default_explosion");
	level.wingstrail = LoadFx("deathrun/wingstrail");
	//level.fireball = LoadFx("deathrun/fireball");
	//level.italymoth = LoadFx("deathrun/italymoth");
	level.volevi = false;
	level.door = false;
	level.pro = "x";
	
//AUTO 	level.music=[];
//AUTO     level.music[0]["song"]    ="KSHMR ft. Sirah - Memories";
//AUTO     level.music[0]["alias"]    ="song1";
//AUTO     level.music[1]["song"]    ="Ralvero - Mayday (KXA Remix)";
//AUTO     level.music[1]["alias"]    ="song2";
//AUTO     level.music[2]["song"]    ="Coldplay - Viva La Vida";
//AUTO     level.music[2]["alias"]    ="song3";
//AUTO     level.music[3]["song"]    ="Big Wild - Invincible";
//AUTO     level.music[3]["alias"]    ="song4";
//AUTO     level.music[4]["song"]    ="Illenium - Sound Of Walking Away";
//AUTO     level.music[4]["alias"]    ="song5";
//AUTO 	level.music[5]["song"]    ="TENVEY - Oceans";
//AUTO     level.music[5]["alias"]    ="song6";
	
	level.trash = false;
//AUTO 	host = getDvar("sv_hostname");
		if (isSubStr( toLower(host), toLower("Zsever") ) || isSubStr( toLower(host), toLower("LuV")) || isSubStr( toLower(host), toLower("CM'") ) || isSubStr( toLower(host), toLower("Nice*")) || isSubStr( toLower(host), toLower("Swat")) || isSubStr( toLower(host), toLower("TeX")) || isSubStr( toLower(host), toLower("PWDF")) || isSubStr( toLower(host), toLower("FNRP")))
	{
	level.trash = true;
	level.timer = 14;
//AUTO 	iPrintLnBold ("^1Map made by ^0DarkSTEP");
	level waittill("round_started");
//AUTO 	iPrintLnBold ("^1High speed detected, difficulty increased!");
	wait 4;
//AUTO 	iPrintLnBold ("^3Always keep an eye on the timer up here...");
	}	
	else
	{
	level.timer = 17;
	level waittill("round_started");
	wait 6;
//AUTO 	iPrintLnBold ("^3Always look at the timer on the top...");
	}	
	level.timetext = (" "+level.timer+" ");
	level.day = 0;
    level.night = 0;
	level.timertextcolor = (randomfloatrange(0.0, 1.0),randomfloatrange(0.0, 1.0),randomfloatrange(0.0, 1.0));
	thread timer();
	thread rotator();
	thread games();
//AUTO 	thread sniper();
	thread endmover();
//AUTO 	thread bounceroom();
//AUTO 	thread bouncefail1();
//AUTO 	thread bouncefail2();
//AUTO 	thread bgivesniper();
//AUTO 	thread knife();
	thread messages();
	thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap6();
	thread trap7();
	thread aj1();
	thread aj2();
	thread aj3();
	thread asecret();
	thread adoor();
	thread asaver();
	thread aendsecret();
	thread trap8();
	thread lava_hud();
	thread trap9();
	thread trap10();
	thread trap11();
	thread nonono();
	thread trap12();
	thread trap5();
//AUTO 	thread vipcheck();
	thread pctest();
	thread gay();
//AUTO 	thread addTestClients();
//AUTO 	thread musicbox();
	thread gap();
	thread jgap();
	thread agap();
	thread jgap1();
	thread jgap2();
	thread jgap3();
	thread jgap4();
	thread jgap5();
	thread agap1();
	thread agap2();
	thread agap3();
	thread agap4();
	thread agap5();
//AUTO 	thread deagle();
//AUTO 	thread bounce1s();
//AUTO 	thread bounce2s();
	thread goback();
	thread antigay();
	thread supershit();
	thread secretosenter();
	thread secretosexit();
	thread secretos1();
	thread secretos2();
	thread secretos3();
	thread secretostep1();
	thread secretostep2();
	thread rpg();
	thread yolo();
	addTriggerToList( "trig_trap1" );
	addTriggerToList( "trig_trap2" );
	addTriggerToList( "trig_trap3" );
	addTriggerToList( "trig_trap4" );
	addTriggerToList( "trig_trap5" );
	addTriggerToList( "trig_trap6" );
	addTriggerToList( "trig_trap7" );
	addTriggerToList( "trig_trap8" );
	addTriggerToList( "trig_trap9" );
	addTriggerToList( "trig_trap10" );
	addTriggerToList( "trig_trap11" );
	addTriggerToList( "trig_trap12" );
}	

musicbox()
{
    level.cambiato = false;
    trig = getEnt("musictrigger","targetname");
    trig setHintString("Press ^1&&1^7 to select song");
	if (level.cambiato==true)
	{
	return;
	}
	else
	{
    trig waittill("trigger",p);
//AUTO 	p braxi\_rank::giveRankXP("", 50);
    trig delete();
    
    p freezeControls(1);
    p musicmenu();
}
}

