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

	setdvar( "r_specularcolorscale", "1" );

	addTriggerToList("trig_trap1");
	addTriggerToList("trig_trap2");
	addTriggerToList("trig_trap3");
	addTriggerToList("trig_trap4");
	addTriggerToList("trig_trap5");
	addTriggerToList("trig_trap6");
	addTriggerToList("trig_trap7");
	addTriggerToList("trig_trap8");
//AUTO 	addTriggerToList("trig_bounce2");
	addTriggerToList("trig_trap10");
	addTriggerToList("trig_trap11");

//AUTO 	if(!isdefined(level.music))
//AUTO 	level.music=[];
//AUTO 	level.music[0]["song"]    ="Kiiara - Gold";
//AUTO 	level.music[0]["alias"]    ="kiiaragold";
//AUTO 	level.music[1]["song"]    ="Lenno - Good thing (Re-Edit)";
//AUTO 	level.music[1]["alias"]    ="lennogood";
//AUTO 	level.music[2]["song"]    ="Hoodie Allen & Ed Sheeran - All about it";
//AUTO 	level.music[2]["alias"]    ="edall";
//AUTO 	level.music[3]["song"]    ="G-Eazy - I mean it";
//AUTO 	level.music[3]["alias"]    ="imeanit";
//AUTO 	level.music[4]["song"]    ="Madden & 6AM - Golden light";
//AUTO 	level.music[4]["alias"]    ="madden";
//AUTO 	level.music[5]["song"]    ="JVG - Hehkuu ^5(gr8 finnish song I r8 8/8)";
//AUTO 	level.music[5]["alias"]    ="hehkuu";
//AUTO 	thread musicBox();
	
//AUTO 	thread trap_bounce2();
	thread map_mover();
	thread map_mover2();
	thread start_door();
	thread acti_tele1();
	thread acti_tele1back();
	thread acti_mover1();
	thread acti_secret();
	thread secret_end();
	thread dbl_secret_end();
//AUTO 	thread rooms();
	thread creators();
	thread s_shoot1();
	thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap6_1();
	thread trap7();
	thread trap8();
	thread trap10();
	thread trap11();
	thread secretwep();
//AUTO 	thread sniper_logo();
//AUTO 	thread knife_logo();
	thread rpg_logo();
//AUTO 	thread bounce_logo();
	thread secret_enter();
	thread act0();
	thread act1();
}

addTriggerToList(name)
{
    if(!isDefined(level.trapTriggers))
    level.trapTriggers=[];
    level.trapTriggers[level.trapTriggers.size]=getEnt(name,"targetname");
}

musicBox()
{
    trig=getent("vcmusic","targetname");
    trig sethintstring("Press ^1&&1^7 to select Music");
    trig waittill("trigger",p);
    trig delete();
    
    p freezecontrols(1);
    p musicMenu();
}

