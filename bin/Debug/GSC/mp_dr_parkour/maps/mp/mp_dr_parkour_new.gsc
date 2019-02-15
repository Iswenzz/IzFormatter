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
	setdvar("compassmaxrange","1800");

	level.wallplode=loadfx("explosions/wallplode");
	
//AUTO 	ambientPlay("parkour");

	thread tele1();
	thread rip_wall();
	thread line4_car1();
	thread line4_car2();
	thread line4_car3();
	thread line3_car1();
	thread line3_car2();
	thread line3_car3();
	thread line2_car1();
	thread line2_car2();
	thread line2_car3();
	thread line1_car1();
	thread line1_bus();
	thread line1_clip();

}

tele1()
{
	trig = getEnt ("tele1", "targetname");
	end = getEnt ("tele1_go", "targetname");
	while(1)
    	{
        trig waittill ("trigger", player);          
	player SetOrigin(end.origin);
        player SetPlayerAngles( end.angles );
	player freezecontrols(true);
//AUTO //AUTO 	iPrintlnBold( "^1Wait 5 seconds" );
//AUTO 	wait 5;
	player freezecontrols(false);
	}
}

rip_wall()
{

	wall = getent ("wall1","targetname");
	trigger = getent ("rip_wall","targetname");
	wallfx = getent ("wall1_fx","targetname");
	trigger waittill ("trigger", player);
	playfx(level.wallplode,wallfx.origin);
	wallfx playSound("boxplode");
	wall delete();

}

line4_car1()
{
	car = getent ("line4_car1","targetname");
	while(1)
	{
		car movex(-5991,13);
		car waittill ("movedone");
		car hide();
		car movex(5991,0.1);
		car waittill ("movedone");
		car show();
		wait 7;
	}
}

line4_car2()
{
	car = getent ("line4_car2","targetname");
	while(1)
	{
		wait 2;
		car movex(-5991,15);
		car waittill ("movedone");
		car hide();
		car movex(5991,0.1);
		car waittill ("movedone");
		car show();
		wait 5;
	}
}

line4_car3()
{
	car = getent ("line4_car3","targetname");
	while(1)
	{
		wait 3;
		car movex(-5991,10);
		car waittill ("movedone");
		car hide();
		car movex(5991,0.1);
		car waittill ("movedone");
		car show();
		wait 4;
	}
}

line3_car1()
{
	car = getent ("line3_car1","targetname");
	while(1)
	{
		wait 6;
		car movex(-5991,15);
		car waittill ("movedone");
		car hide();
		car movex(5991,0.1);
		car waittill ("movedone");
		car show();
		wait 1;
	}
}

line3_car2()
{
	car = getent ("line3_car2","targetname");
	while(1)
	{
		wait 4;
		car movex(-5991,14);
		car waittill ("movedone");
		car hide();
		car movex(5991,0.1);
		car waittill ("movedone");
		car show();
		wait 3;
	}
}

line3_car3()
{
	car = getent ("line3_car3","targetname");
	while(1)
	{
		wait 5;
		car movex(-5991,15);
		car waittill ("movedone");
		car hide();
		car movex(5991,0.1);
		car waittill ("movedone");
		car show();
		wait 2;
	}
}

line2_car1()
{
	car = getent ("line2_car1","targetname");
	while(1)
	{
		wait 1;
		car movex(5991,15);
		car waittill ("movedone");
		car hide();
		car movex(-5991,0.1);
		car waittill ("movedone");
		car show();
		wait 5;
	}
}

line2_car2()
{
	car = getent ("line2_car2","targetname");
	while(1)
	{
		wait 4;
		car movex(5991,15);
		car waittill ("movedone");
		car hide();
		car movex(-5991,0.1);
		car waittill ("movedone");
		car show();
		wait 2;
	}
}

line2_car3()
{
	car = getent ("line2_car3","targetname");
	while(1)
	{
		wait 3;
		car movex(5991,13);
		car waittill ("movedone");
		car hide();
		car movex(-5991,0.1);
		car waittill ("movedone");
		car show();
		wait 3;
	}
}

line1_car1()
{
	car = getent ("line1_car1","targetname");
	while(1)
	{
		wait 4;
		car movex(5991,15);
		car waittill ("movedone");
		car hide();
		car movex(-5991,0.1);
		car waittill ("movedone");
		car show();
		wait 4;
	}
}

line1_bus()
{
	car = getent ("line1_bus","targetname");
	while(1)
	{
		car movex(5512,16);
		car waittill ("movedone");
		car hide();
		car movex(-5512,0.1);
		car waittill ("movedone");
		car show();
		wait 3;
	}
}

	line1_clip()
{
	car = getent ("bus_clip","targetname");
	while(1)
	{
		car movex(5512,16);
		car waittill ("movedone");
		car movex(-5512,0.1);
		car waittill ("movedone");
		wait 3;
	}
}

