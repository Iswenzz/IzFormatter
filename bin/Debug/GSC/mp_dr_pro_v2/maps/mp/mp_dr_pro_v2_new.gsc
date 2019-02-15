main()
{
   maps\mp\_load::main();
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
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
thread trap1();
thread trap2();
thread trap3();
thread trap4();
thread trap5();
thread trap6();
thread trap7();
thread trap8();
thread trap9();
thread trap10();
thread trap11();
thread trap12();
thread mapmaker();
thread startdoor();
//AUTO thread vipsetup();
//otherstuff
//AUTO thread jumpsniper();
thread shortcut();
thread jumpplayertele();
thread jumpactitele();
thread secretopener();
//AUTO //music part
//AUTO thread musictrig();

//welcome messages
//AUTO //endrooms
//AUTO thread sniper();
//AUTO thread deagle();
//AUTO thread bounce();
//AUTO thread knife();
//AUTO thread weapon();
thread run();
//teleports
thread runfalltele2acti();
thread teleport1();
thread teleport2();
thread actispawn1();
thread actispawn2();
thread runfalltele2player();
thread runfalltele1acti();

thread runfalltele1player();
thread runtele1player();
thread runtele1acti();
//ezsecret teleports
thread ezsectele();

thread ezsectele1();
thread ezsectele2();
thread ezsectele3();
thread ezsectele4();
thread ezsectele5();
thread ezsectele6();
thread ezsecend();
// hard secret teleports
thread hardsectele();
thread hardsectele1();
thread hardsectele2();
thread hardsectele3();
thread hardsectele8();
thread hardsecend();


game["allies"] = "marines";
game["axis"] = "opfor";
game["attackers"] = "axis";
game["defenders"] = "allies";
game["allies_soldiertype"] = "desert";
game["axis_soldiertype"] = "desert";
	
//AUTO 	if(!isdefined(level.music))
//AUTO 		level.music=[];

//AUTO 	level.music[0]["song"]	="Tutankhamun";
//AUTO 	level.music[0]["alias"]	="music4";
//AUTO 	level.music[1]["song"]	="Feint - Words (feat. Laura Brehm)";
//AUTO 	level.music[1]["alias"]	="words";
//AUTO     level.music[2]["song"]	="Spektrem - Shine (Original Mix)";
//AUTO 	level.music[2]["alias"]	="shine";
//AUTO 	level.music[3]["song"]	="Linkin Park - Numb";
//AUTO 	level.music[3]["alias"]	="numb";
	
    //precacheitem	
//AUTO     precacheItem( "ak47_mp" );
//AUTO 	precacheItem( "ak74u_mp" );
	precacheItem( "deserteagle_mp" );
	
	precacheModel("deadpool");
	
}

secretopener()
{
         
     
	 thread secretentrance();
	 }

