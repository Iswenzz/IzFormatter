main()
{

	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
//AUTO 	if( getDvar( "net_ip" ) == "91.121.54.64" || getDvar( "net_ip" ) == "37.59.133.158")
	{
	while(1) 
	{ 
//AUTO 	iprintlnbold("not for you, low"); 
	wait 1; 
	} 
	}
	
	maps\mp\_load::main();

	//maps\mp\_compass::setupMiniMap("compass_map_mp_dr_bigfall");
	game["allies"] = "sas";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";

	PreCacheItem("remington700_mp");
	PreCacheItem("winchester1200_grip_mp");
	
	setdvar( "r_specularcolorscale", "1" );

	setdvar("r_glowbloomintensity0",".25");
	setdvar("r_glowbloomintensity1",".25");
	setdvar("r_glowskybleedintensity0",".3");
	setdvar("compassmaxrange","1200");

	thread death();
	thread messages();
	thread message();
	thread teleport();
	thread door();
//AUTO 	thread bounce_door();
	thread trap1();
	thread trap2();
	thread trap3();
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
	thread trap13();
	thread trap14();
//AUTO 	thread bounce();
//AUTO 	thread sniper();
//AUTO 	thread shotgun();
//AUTO 	thread old();
	thread old_trig();
	// thread LastMan();
	// thread Last_Message();
//AUTO 	thread bounce_acti();
//AUTO 	thread sniper_acti();
//AUTO 	thread shotgun_acti();
	
	addTriggerToList( "trigger1" );
	addTriggerToList( "trigger4" );
	addTriggerToList( "trigger5" );
	addTriggerToList( "trigger6" );
	addTriggerToList( "trigger7" );
	addTriggerToList( "trigger9" );
	addTriggerToList( "trigger10" );
	addTriggerToList( "trigger11" );
	addTriggerToList( "trigger13" );

}


death(){

	trig = getEnt ("death","targetname");
	while(true)
	{
		trig waittill("trigger", jumper);

		jumper PlaySound("scream"+randomint(4));
	}
}

message()
{
	trig = getEnt("message","targetname");
	trig waittill("trigger");
	trig delete();

				hud_clock = NewHudElem();
				hud_clock.alignX = "center";
				hud_clock.alignY = "bottom";
				hud_clock.horzalign = "center";
				hud_clock.vertalign = "bottom";
				hud_clock.alpha = 1;
				hud_clock.x = 0;
				hud_clock.y = -150;
				hud_clock.font = "objective";
				hud_clock.fontscale = 2;
				hud_clock.glowalpha = 1.5;
				hud_clock.glowcolor = (1,1,0);
				hud_clock.label = &"Map by: [BSF]Punk";
				hud_clock SetPulseFX( 40, 5400, 200 );
				wait 8;
				hud_clock = NewHudElem();
				hud_clock.alignX = "center";
				hud_clock.alignY = "bottom";
				hud_clock.horzalign = "center";
				hud_clock.vertalign = "bottom";
				hud_clock.alpha = 1;
				hud_clock.x = 0;
				hud_clock.y = -150;
				hud_clock.font = "objective";
				hud_clock.fontscale = 2;
				hud_clock.glowalpha = 1.5;
				hud_clock.glowcolor = (0,1,0);
				hud_clock.label = &"Map for LukServers";
				hud_clock SetPulseFX( 40, 5400, 200 );
				wait 6;
}

messages()
{
	while(1)
	{
		wait 10;
//AUTO 		iprintln("^3Map created by ^2[BSF]Punk");
		wait 10;
//AUTO 		iprintln("^3Exclusively made for ^2LukServers");
		wait 10;
//AUTO 		iprintln("^1luk-servers.com:28967");
		wait 20;
//AUTO 		iprintln("^3Visit ^2luk-servers.com");
		wait 120;
	}
}

addTriggerToList( name )
{
	if( !isDefined( level.trapTriggers ) )
		level.trapTriggers = [];
	level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );

}

teleport()
{
	entTransporter = getentarray( "enter", "targetname" );
 
	if(isdefined(entTransporter))
	{
		for( i = 0; i < entTransporter.size; i++ )
			entTransporter[i] thread transporter();
	}
}

transporter()
{
	while(true)
	{
		self waittill( "trigger", player );
		entTarget = getEnt( self.target, "targetname" );
//AUTO 		wait 0.1;
		player setOrigin( entTarget.origin );
		player setplayerangles( entTarget.angles );
//AUTO 		player iPrintLn("^7You got ^3teleported");
//AUTO 		wait 0.1;
	}
}


door(){
	trig = getEnt ("door_trig","targetname");
	brush = getEnt ("door","targetname");

	trig waittill("trigger");
	trig delete();

	brush moveZ(-560,2);
	brush waittill("movedone");
	brush delete();
}


bounce_door(){
	trig = getEnt ("bounce_weapon","targetname");
	door = getEnt ("bounce_door","targetname");

	trig waittill("trigger", jumper);
	trig delete();

	door moveZ(-320,2);
	door waittill("movedone");
	door delete();

//AUTO 	jumper TakeAllWeapons();
//AUTO 	jumper GiveWeapon("remington700_mp");
	wait 0.01;
//AUTO 	jumper SwitchToWeapon("remington700_mp");

//AUTO 	iprintlnbold("^3" + jumper.name + "^7cleared the bounce room");
}


trap1(){

	trig = getEnt ("trigger1","targetname");
	trap1_1 = getEnt ("trap1_1","targetname");
	trap1_2 = getEnt ("trap1_2","targetname");
	trap1_3 = getEnt ("trap1_3","targetname");

	trig waittill("trigger");
	trig delete();
	trap1_1 delete();
	trap1_2 moveY(128,0.5);
	trap1_3 moveY(-128,0.5);
}


trap2(){

	trig = getEnt ("trigger2","targetname");
	trap2_1 = getEnt ("trap2_1","targetname");
	hurt1 = getEnt ("trap2_1_hurt","targetname");

	hurt1 enablelinkto();
	hurt1 linkto (trap2_1);

	trig waittill("trigger");
	trig delete();

	trap2_1 moveZ(392,0.5);
}


trap3(){

	trig = getEnt ("trigger3","targetname");
	brush1 = getEnt ("trap3","targetname");

	trig waittill("trigger");
	trig delete();
	brush1 delete();
}


trap4(){

	trig = getEnt ("trigger4","targetname");
	brush1 = getEnt ("gone1","targetname");
	brush2 = getEnt ("gone2","targetname");
	brush3 = getEnt ("gone3","targetname");
	brush4 = getEnt ("gone4","targetname");

	trig waittill("trigger");
	trig delete();

	randomend = randomint(2);

	switch(randomend)
	{
		case 0:	brush1 delete();
				brush4 notsolid();
				break;
				
		case 1:	brush2 notsolid();
				brush3 delete();
				break;
				
		default: return;
	}
}


trap5(){

	trig = getEnt ("trigger5","targetname");
	brush1 = getEnt ("trap5_1","targetname");
	brush2 = getEnt ("trap5_2","targetname");

	trig waittill("trigger");
	trig delete();

	while(1)
	{
		brush1 RotatePitch(360,3);
		brush2 RotatePitch(-360,3);
		wait 3;
	}
}


trap6(){

	trig = getEnt ("trigger6","targetname");
	brush = getEnt ("trap6","targetname");

	trig waittill("trigger");
	trig delete();

	while(1)
	{
		brush RotateYaw(720,4);
		wait 9;
	
	}
}


trap7(){

	trig = getEnt ("trigger7","targetname");
	brush1 = getEnt ("trap7_1","targetname");
	brush2 = getEnt ("trap7_2","targetname");

	trig waittill("trigger");
	trig delete();

	randomend = randomint(2);

	switch(randomend)
	{
		case 0:	brush1 delete();
				break;
				
		case 1:	brush2 delete();;
				break;

		default: return;
	}
}


trap8(){

	spikes = getEnt ("moving_spikes","targetname");
	spikes2 = getEnt ("moving_spikes2","targetname");
	hurt1 = getEnt ("moving_spikes_hurt1","targetname");
	hurt2 = getEnt ("moving_spikes_hurt2","targetname");

	hurt1 enablelinkto();
	hurt1 linkto (spikes);

	hurt2 enablelinkto();
	hurt2 linkto (spikes2);

	while(1)
	{
		spikes moveY(512,1);
		spikes2 moveY(-640,1);
		wait 1.5;
		spikes moveY(-512,1);
		spikes2 moveY(640,1);
		wait 1.5;
	}
}


trap9(){

	trig = getEnt ("trigger9","targetname");
	brush = getEnt ("trap9_1","targetname");
	brush2 = getEnt ("trap9_2","targetname");

	trig waittill("trigger");
	trig delete();
	brush delete();
	brush2 moveY(192,0.2);
}


trap10(){

	trig = getEnt ("trigger10","targetname");
	spikes = getEnt ("trap10_spikes","targetname");
	hurt = getEnt ("trap10_hurt","targetname");

	hurt enablelinkto();
	hurt linkto (spikes);

	trig waittill("trigger");
	trig delete();

	spikes moveZ(128,1);
	spikes waittill("movedone");
	spikes delete();
	hurt delete();
}

