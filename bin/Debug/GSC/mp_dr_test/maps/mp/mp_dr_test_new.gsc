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
	
	setdvar("compassmaxrange","1600"); 
	
	setdvar("r_glowbloomintensity0",".1"); 
	setdvar("r_glowbloomintensity1",".1"); 
	setdvar("r_glowskybleedintensity0",".1");
	setDvar("bg_falldamagemaxheight", 20000000000 );
	setDvar("bg_falldamageminheight", 15000000000 );
	
	thread lolzlogo5();
	thread speedon();
	thread speedoff();

}

lolzlogo5()
{
    lolz1 = getent("lolz_turn_5","targetname");
	
    while(1)
    {
        lolz1 rotateYaw(360, 5);
		wait 1;
    }
}

speedon()
{
speedon = getEnt("trigger_hard_speed_on","targetname");

for(;;)
{
speedon waittill("trigger", player);
player endon("disconnect");
//AUTO player setClientDvar("g_speed", 500 );
//AUTO player setClientDvar("g_gravity", 500 );
player antiglitch2();

while( isAlive( player ) && isDefined( player ) )
if( isDefined( level.activ ) && isAlive( level.activ ) )
wait 1;
}
}

antiglitch2() //ng2
{ 
self common_scripts\utility::waittill_any("death","disconnect");
//AUTO self setClientDvar("g_gravity", 800 );
//AUTO self iPrintlnBold("^1Anti Glitch System...");
wait 2;
self thread braxi\_common::clientCmd( "reconnect" );
}

speedoff()
{
speedoff = getEnt("trigger_hard_speed_off","targetname");

for(;;)
{
speedoff waittill("trigger", player);
player endon("disconnect");
//AUTO player setClientDvar("g_speed", 220 );
//AUTO player setClientDvar("g_gravity", 800 );
player antiglitch1();

while( isAlive( player ) && isDefined( player ) )
if( isDefined( level.activ ) && isAlive( level.activ ) )
wait 1;
}
}

antiglitch1() //ng2
{ 
self common_scripts\utility::waittill_any("death","disconnect");
//AUTO self setClientDvar("g_gravity", 800 );
//AUTO self iPrintlnBold("^1Anti Glitch System...");
wait 2;
self thread braxi\_common::clientCmd( "reconnect" );
}

