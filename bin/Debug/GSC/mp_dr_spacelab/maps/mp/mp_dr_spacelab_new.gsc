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
    setdvar("r_glowbloomintensity0",".25");
    setdvar("r_glowbloomintensity1",".25");
    setdvar("r_glowskybleedintensity0",".3");
//AUTO 	setdvar("g_speed","190");
	setdvar("bg_fallDamageMaxHeight", "99999"); 
	setdvar("bg_fallDamageMinHeight", "99998");
	level.bluefire = LoadFx("deathrun/blueburst");
	level.bluelight = LoadFx("deathrun/bluelight");
	level.spark = LoadFx("deathrun/sparks");
	level.portal = LoadFx("deathrun/portal");
//AUTO 	level.music=[];
//AUTO     level.music[0]["song"]    ="Wasted Penguinz - Moments";
//AUTO     level.music[0]["alias"]    ="sniper";
//AUTO     level.music[1]["song"]    ="R3hab & KSHMR - Strong";
//AUTO     level.music[1]["alias"]    ="song2";
//AUTO 	level.music[2]["song"]    ="Krewella - I Live for the Creatures";
//AUTO     level.music[2]["alias"]    ="song3";
//AUTO 	level.music[3]["song"]    ="Headhunterz - Reignite";
//AUTO     level.music[3]["alias"]    ="song4";
//AUTO 	level.music[4]["song"]    ="D-Block - Angels & Demons";
//AUTO     level.music[4]["alias"]    ="song5";
//AUTO 	level.music[5]["song"]    ="Aero Chord - Twerk";
//AUTO     level.music[5]["alias"]    ="song6";
	level.master = "M";
	level.actispace = false;
	level.cambiato = false;
	level.gapmode = 0;
	level.activKills = 0;
	level.boom_fx = LoadFx("explosions/default_explosion");
	level.wingstrail = LoadFx("deathrun/wingstrail");
	precacheShellShock( "jeepride_ridedeath");	
	precacheShader("metallic2d");
	precacheShader("astrohelmet");
	precacheItem("labowie_mp");
	precacheModel("astroglovez");
	precacheModel("fox_chiller");
	precacheShader("mtl_chiller");
	precacheItem("labaxe_mp");
	precacheItem("usp_silencer_mp");
	precacheItem("uzi_silencer_mp");
	precacheItem("labm40a3_mp");
	precacheItem("labr700_mp");
	precacheItem("labm9a1_mp");
//AUTO 	precacheItem("labdeagle_mp");
//AUTO 	precacheItem("ak74u_mp");
	precacheItem("deserteaglegold_mp");
	precacheItem("rpg_mp");
	precacheItem("g3_mp");
	precacheItem("winchester1200_mp");
//AUTO 	precacheItem("ak47_mp");
	precacheItem("rpd_mp");
	precacheItem("rpd_acog_mp");
	
	thread fire1();
	thread fire2();
	thread fire3();
//AUTO 	thread musicbox();
	thread gate();
	thread portal();
	thread plat1();
	thread plat2();
	thread plat3();
	thread plat4();
	thread portalfx();
//AUTO 	thread suitgiver();
	thread sdoor1();
	thread sdoor2();
	thread sdoor3();
	thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap6();
	thread trap7();
	thread trap8();
	thread trap9();
	thread trap10();
	thread trap11();
	thread trap12();
	thread trap13();
	thread trap15();
	thread dmg1();
	thread dmg2();
	thread axe();
	thread pearl();
	thread plank1();
	thread plank2();
	thread plank3();
	thread plank4();
	thread actidoor();
	thread actidoor2();
	thread actitp2();
	thread actitp3();
	thread actitp4();
	thread actitp5();
	thread actitpspace();
	thread games();
//AUTO 	thread roomportalfx();
	thread secretchoice();
	thread supershit();
	thread supershit2();
//AUTO 	thread vipcheck();
//AUTO 	thread sniper();
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
//AUTO 	//thread addTestClients();
//AUTO 	thread room_simonsays();
	thread actiaxe();
//AUTO 	thread weaponroom();
//AUTO 	thread knife();
//AUTO //AUTO 	thread bgiveweapon();
//AUTO 	thread bounceroom();
//AUTO 	thread bouncefail1();
//AUTO 	thread bouncefail2();
	thread startdoor();
	thread messages();
	thread pure();
	thread pureendjumper();
	thread pureendacti();
	thread startvision();
	thread newsfeed();
	thread main190();
	thread enter190();
	thread b190();
	thread c190();
	thread d190();
	thread e190();
	thread f190();
	thread g190();
	thread h190();
	thread i190();
	thread secretend190();
	thread secretend190fx();
	thread main210();
	thread enter210();
	thread b210();
	thread c210();
	thread d210();
	thread e210();
	thread f210();
	thread g210();
	thread h210();
	thread i210();
	thread secretend210();
	thread secretend210fx();
	thread mainactis();
	thread enteractis();
	thread bactis();
	thread cactis();
	thread dactis();
	thread secretendactis();
	thread secretendactisfx();
	thread weapall();
	thread donottouch();
	thread shipmover1();
	thread shipmover2();
	thread moreaxes();
	thread welp();
	
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
	addTriggerToList( "trig_trap13" );
}

	addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

startdoor()
{
door = getEnt("startdoor", "targetname");
//AUTO kek = getDvar("sv_hostname");
wait 20;
	if (isSubStr( toLower(kek), toLower("xM")) || isSubStr( toLower(kek), toLower("Nice*") ))
	{
//AUTO 		iPrintLnBold ("^1KYS ^6RAKY");
		wait 2;
		exitLevel(true);
	}
	else {
door moveZ(320, 6);
//AUTO iprintlnbold("^5Start door opened.");
wait 2;
	if (level.cambiato == false)
 {
  thread songs(); 
  level.cambiato = true;
 }
	}
}	

songs()
{
x=randomint(6);
if (x==0)
{
//AUTO ambientPlay("sniper");
//AUTO iPrintln("^2>>^1Now playing: ^5Wasted Penguinz - Moments^2<<");
}

if (x==1)
{
//AUTO ambientPlay("song2");
//AUTO iPrintln("^2>>^1Now playing: ^5R3hab & KSHMR - Strong^2<<");
}

if (x==2)
{
//AUTO ambientPlay("song3");
//AUTO iPrintln("^2>>^1Now playing: ^5Krewella - I Live for the Creatures^2<<");
}

if (x==3)
{
//AUTO ambientPlay("song4");
//AUTO iPrintln("^2>>^1Now playing: ^5Headhunterz - Reignite^2<<");
}

if (x==4)
{
//AUTO ambientPlay("song5");
//AUTO iPrintln("^2>>^1Now playing: ^5D-Block - Angels & Demons^2<<");
}

if (x==5)
{
//AUTO ambientPlay("song6");
//AUTO iPrintln("^2>>^1Now playing: ^5Aero Chord - Twerk^2<<");
}

}

messages()
{
wait 10;
//AUTO iprintlnBold("^5Spacelab");
wait 5;
//AUTO iPrintln("^5Map made by ^0Dark^5STEP");
for(;;)
{
wait 35;
x=randomint(10);
if (x==0)
{
//AUTO iPrintln("^5Map made by ^0Dark^5STEP");
}

if (x==1)
{
//AUTO iPrintln("^5There are 2 jumper secrets, one for 190 and the other for 210 speed!");
}

if (x==2)
{
//AUTO iPrintln("^5This shit took ^13^5 months of work so i hope it's worth it :)");
}

if (x==3)
{
//AUTO iPrintln("^5Secrets have an antiglitch system so don't try to shortcut ;)");
}

if (x==4)
{
//AUTO iPrintln("^1Steam: ^5CAR ^0DarkSTEP");
}

if (x==5)
{
//AUTO iPrintln("^5Feel free to report bugs");
}

if (x==6)
{
//AUTO iPrintln("^5Feel free to join us on ^1xenia-gaming.net");
}

if (x==7)
{
//AUTO iPrintln("^1Discord: ^5DarkSTEP#7390");
}

if (x==8)
{
//AUTO iPrintln("^5Special thanks to ^1CAR 0rK!DeA ^5for ^2hud & vision fix ^5and to ^1VC'ERIK ^5for ^2some fx & tips");
}

if (x==9)
{
//AUTO iPrintln("^5After a room fight your ^2health^5 will be restored");
}

}
}

musicbox()
{
    trig = getEnt("musictrigger","targetname");
    trig setHintString("Press ^1&&1^7 to select song");
    trig waittill("trigger",p);
	if (level.cambiato == false)
	{
//AUTO 	p braxi\_rank::giveRankXP("", 50);
    trig delete();
    p freezeControls(1);
    p musicmenu();
	}
}

