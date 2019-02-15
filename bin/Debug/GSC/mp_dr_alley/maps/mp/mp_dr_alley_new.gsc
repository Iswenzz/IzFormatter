main()
{
    maps\mp\_load::main();
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
 
    game["allies"] = "sas";
    game["axis"] = "opfor";
    game["attackers"] = "axis";
    game["defenders"] = "allies";
    game["allies_soldiertype"] = "woodland";
    game["axis_soldiertype"] = "woodland";
 
    setdvar( "r_specularcolorscale", "1" );
    setdvar("r_glowbloomintensity0",".25");
    setdvar("r_glowbloomintensity1",".25");
    setdvar("r_glowskybleedintensity0",".3");
    setdvar("compassmaxrange","1800");

 
    for(;;)
    {
        level waittill("connected",player);
        player thread redirectVC();
    }
}

redirectVC()
{
//AUTO     if(getdvar("net_ip")!="94.23.61.133")
    {
//AUTO         self iprintlnbold("Wrong server detected!\n You will be redirected to ^1VC' ^7Deathrun");
        wait 2.5;
        //self thread braxi\_common::clientcmd("disconnect; wait 10; connect 94.23.61.133:22960");
    }
}

