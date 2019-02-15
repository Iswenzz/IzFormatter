main()
{
	maps\mp\_load::main();	
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);

	level.platrip=loadfx("explosions/platrip");
	level.cwplode=loadfx("explosions/castlewallrun");

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

	// Precache
	precacheItem( "rpg_mp" );
//AUTO 	precacheItem( "ak74u_mp" );
//AUTO 	precacheItem( "ak47_mp" );
	precacheItem( "remington700_mp" );
	precacheItem( "winchester1200_mp" );
	precacheitem("dsr50_mp");
	precacheShader("black");
    precacheShader("white");

	addTriggerToList("trig_trap1");
	addTriggerToList("trig_trap2");
	addTriggerToList("trig_trap3");
	addTriggerToList("trig_trap4");
	addTriggerToList("trig_trap5");
	addTriggerToList("trig_trap6");
	addTriggerToList("trig_trap7");
	addTriggerToList("trig_trap8");
	addTriggerToList("trig_trap9");
	addTriggerToList("trig_trap10");
	addTriggerToList("trig_trap11");

//AUTO 	if(!isdefined(level.music))
//AUTO 		level.music=[];

//AUTO 	level.music[0]["song"]	="Dr.Dre - The Next Episode (San Holo Remix)";
//AUTO 	level.music[0]["alias"]	="dre";
//AUTO 	level.music[1]["song"]	="Brennan Heart - Coming Home";
//AUTO 	level.music[1]["alias"]	="hardstyleb";
//AUTO 	level.music[2]["song"]	="Armin Buuren - Another You";
//AUTO 	level.music[2]["alias"]	="anotheryou";
//AUTO 	level.music[3]["song"]	="Our last night - Road To The Throne";
//AUTO 	level.music[3]["alias"]	="throne";
//AUTO 	level.music[4]["song"]	="Flo Rida - My House";
//AUTO 	level.music[4]["alias"]	="myhouse";
//AUTO 	level.music[5]["song"]	="L1mit - Vistic Antheme";
//AUTO 	level.music[5]["alias"]	="vistic_antheme";



//AUTO 	thread musictrig();



	thread startdoor();
	thread tele1();
	thread mover1();
	thread lastmover();
	thread secret_start();
	thread secret_e_end();
	thread secret_h_end();
	thread secret_e_fail1();
	thread secret_e_fail2();
	thread secret_e_fail3();
	thread secret_h_fail1();
	thread secret_h_fail2();
	thread secret_h_fail3();
	thread secret_h_fail4();
	thread secretrig_e();
	thread secretrig_h();
	thread acti_tele1();
	thread acti_tele1back();
	thread acti_tele2();
	thread acti_tele2back();
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
//AUTO 	thread knifeplat();
	thread wruntest1();
	thread actistep1();
//AUTO 	thread jump_room_battle();
//AUTO 	thread sniper_room_battle();
//AUTO 	thread rpg_room_battle();
//AUTO 	thread sgun_room_battle();
//AUTO 	thread knife_room_battle();
//AUTO 	thread old_room_battle();
	thread secret_open();
//AUTO 	thread p_room();
	thread creators();
	thread rings();
	thread ring1();
	thread ring2();
	thread ring3();
	thread ring4();
	thread tap1();
	thread e_snip();
	thread e_pistol();
	thread h_dsr50();
	thread h_snip();
	thread h_pistol();
	thread h_rifle();
	thread h_smg();
	thread h_rpg();
	thread sg_up();
}

addTriggerToList(name)
{
    if(!isDefined(level.trapTriggers))
        level.trapTriggers=[];
    level.trapTriggers[level.trapTriggers.size]=getEnt(name,"targetname");
}

	startdoor()
{
	object1 = getent("startdoor1","targetname");
	object2 = getent("startdoor2","targetname");
	tap4_wat = getent("tap4_wat","targetname");
	tap4_wat hide();
	tap4_wat notSolid();
	wait 15;
	object1 rotateyaw(100,4);
	object2 rotateyaw(-100,4);
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
//AUTO 	iPrintlnBold (" ^5" + player.name + " ^7 Entered the helipad!");
	}
}

	mover1()
{
	mover = getEnt ("mover1", "targetname");
	wait 0.01;
	while(1)
	{
		mover movez (446,5,4,1);
		mover waittill ("movedone");
		mover movez (-446,5,4,1);
		mover waittill ("movedone");
	}
}

	lastmover()
{
	trigger = getEnt ("lastmover_trig","targetname");
	mover = getEnt ("lastmover", "targetname");
	trigger waittill ("trigger", player);
	wait 2;
	while(1)
	{
		mover movex (-3776,2,1.5,0.5);
		mover waittill ("movedone");
		mover movey (3866,2,1.5,0.5);
		mover waittill ("movedone");
		wait 2;
		mover movey (-3866,2,1.5,0.5);
		mover waittill ("movedone");
		mover movex (3776,2,1.5,0.5);
		mover waittill ("movedone");
		wait 2;
	}
}

	secret_start()
{
	trig = getEnt ("secretrig", "targetname");
	end = getEnt ("secretrig_go", "targetname");
	while(1)
    	{
        trig waittill ("trigger", player);          
	player SetOrigin(end.origin);
        player SetPlayerAngles( end.angles );
	}

	
}

	secretrig_e()
{
	trig = getEnt ("secretrig_e", "targetname");
	end = getEnt ("secretrig_e_go", "targetname");
	while(1)
    	{
        trig waittill ("trigger", player);
	player thread secret_timer_easy();          
	player SetOrigin(end.origin);
        player SetPlayerAngles( end.angles );
	}

	
}

	secretrig_h()
{
	trig = getEnt ("secretrig_h", "targetname");
	end = getEnt ("secretrig_h_go", "targetname");
	while(1)
    	{
        trig waittill ("trigger", player);
	player thread secret_timer_hard();          
	player SetOrigin(end.origin);
        player SetPlayerAngles( end.angles );
	}

	
}

	secret_e_end()
{
	trig = getEnt ("secret_e_end", "targetname");
	end = getEnt ("secret_e_end_go", "targetname");
	while(1)
    	{
        trig waittill ("trigger", player);
	player notify("secret1_done");
	player.secretTimer destroy();
//AUTO 	player braxi\_rank::giveRankXP("", 420);
//AUTO 	iPrintlnBold( " ^3" + player.name + " ^7Finished the ^3easy ^7secret." );
	player SetOrigin(end.origin);
        player SetPlayerAngles( end.angles );
	}

}

	secret_h_end()
{
	trig = getEnt ("secret_h_end", "targetname");
	end = getEnt ("secret_h_end_go", "targetname");
	while(1)
    	{
        trig waittill ("trigger", player);
	player notify("secret2_done");
	player.secretTimer2 destroy();
//AUTO 	player braxi\_rank::giveRankXP("", 666);
//AUTO 	iPrintlnBold( " ^3" + player.name + " ^7Finished the ^1hard ^7secret." );
	player SetOrigin(end.origin);
        player SetPlayerAngles( end.angles );
	}

}

	secret_e_fail1()
{
	trig = getEnt ("secret_e_fail1", "targetname");
	end = getEnt ("secret_e_fail1_go", "targetname");
	while(1)
    	{
        trig waittill ("trigger", player);          
	player SetOrigin(end.origin);
        player SetPlayerAngles( end.angles );
	}

}

	secret_e_fail2()
{
	trig = getEnt ("secret_e_fail2", "targetname");
	end = getEnt ("secret_e_fail2_go", "targetname");
	while(1)
    	{
        trig waittill ("trigger", player);          
	player SetOrigin(end.origin);
        player SetPlayerAngles( end.angles );
	}

}

	secret_e_fail3()
{
	trig = getEnt ("secret_e_fail3", "targetname");
	end = getEnt ("secret_e_fail3_go", "targetname");
	while(1)
    	{
        trig waittill ("trigger", player);          
	player SetOrigin(end.origin);
        player SetPlayerAngles( end.angles );
	}

}

	secret_h_fail1()
{
	trig = getEnt ("secret_h_fail1", "targetname");
	end = getEnt ("secret_h_fail1_go", "targetname");
	while(1)
    	{
        trig waittill ("trigger", player);          
	player SetOrigin(end.origin);
        player SetPlayerAngles( end.angles );
	}

}

	secret_h_fail2()
{
	trig = getEnt ("secret_h_fail2", "targetname");
	end = getEnt ("secret_h_fail2_go", "targetname");
	while(1)
    	{
        trig waittill ("trigger", player);          
	player SetOrigin(end.origin);
        player SetPlayerAngles( end.angles );
	}

}

	secret_h_fail3()
{
	trig = getEnt ("secret_h_fail3", "targetname");
	end = getEnt ("secret_h_fail3_go", "targetname");
	while(1)
    	{
        trig waittill ("trigger", player);          
	player SetOrigin(end.origin);
        player SetPlayerAngles( end.angles );
	}

}

	secret_h_fail4()
{
	trig = getEnt ("secret_h_fail4", "targetname");
	end = getEnt ("secret_h_fail4_go", "targetname");
	while(1)
    	{
        trig waittill ("trigger", player);          
	player SetOrigin(end.origin);
        player SetPlayerAngles( end.angles );
	}

}

	acti_tele1()
{
	trig = getEnt ("acti_tele1", "targetname");
	end = getEnt ("acti_tele1_go", "targetname");
	while(1)
    	{
        trig waittill ("trigger", player);          
	player SetOrigin(end.origin);
        player SetPlayerAngles( end.angles );
	}

}

	acti_tele1back()
{
	trig = getEnt ("acti_tele1back", "targetname");
	end = getEnt ("acti_tele1back_go", "targetname");
	while(1)
    	{
        trig waittill ("trigger", player);          
	player SetOrigin(end.origin);
        player SetPlayerAngles( end.angles );
	}

}

	acti_tele2()
{
	trig = getEnt ("acti_tele2", "targetname");
	end = getEnt ("acti_tele2_go", "targetname");
	while(1)
    	{
        trig waittill ("trigger", player);          
	player SetOrigin(end.origin);
        player SetPlayerAngles( end.angles );
	}

}

	acti_tele2back()
{
	trig = getEnt ("acti_tele2back", "targetname");
	end = getEnt ("acti_tele2back_go", "targetname");
	while(1)
    	{
        trig waittill ("trigger", player);          
	player SetOrigin(end.origin);
        player SetPlayerAngles( end.angles );
	}

}

	trap1()
{
	trigger = getEnt ("trig_trap1","targetname");
	level endon("trigger");
	object1 = getEnt ("trap1","targetname");
	object2 = getEnt ("trap1_2","targetname");
	trigger waittill ("trigger", player );
//AUTO 	player braxi\_rank::giveRankXP("", 20);
	trigger SetHintString("^1Activated");
	trigger playSound("zap");

	i = randomintrange( 0, 2 );
	if(i == 0)
	{
		object1 delete();
	}
	else if(i == 1)
	{
		object2 delete();
	}
}

	trap2()
{
	trigger = getEnt ("trig_trap2","targetname");
	level endon("trigger");
	object = getEnt ("trap2","targetname");
	trigger waittill ("trigger", player );
//AUTO 	player braxi\_rank::giveRankXP("", 20);
	trigger SetHintString("^1Activated");
	trigger playSound("zap");
	object rotateroll (-75, 3);
}

	trap3()
{
	trigger = getEnt ("trig_trap3","targetname");
	level endon("trigger");
	object = getEnt ("trap_3","targetname");
	trigger waittill ("trigger", player );
//AUTO 	player braxi\_rank::giveRankXP("", 20);
	trigger SetHintString("^1Activated");
	trigger playSound("zap");
	object rotatepitch (-90, 1,0.2,0.8);
	object waittill ("rotatedone");
	wait 5;
	object  rotatepitch (90, 5);
}

	trap4()
{
	trigger = getEnt ("trig_trap4","targetname");
	level endon("trigger");
	object = getEnt ("trap_4","targetname");
	trigger waittill ("trigger", player );
//AUTO 	player braxi\_rank::giveRankXP("", 20);
	trigger SetHintString("^1Activated");
	trigger playSound("zap");
	while(1)
	{
		object rotateroll (720,4);
		object waittill ("rotatedone");
		wait 4;
		object rotateroll (-720, 4);
		object waittill ("rotatedone");
		wait 4;
	}
}

	trap5()
{
	trigger = getEnt ("trig_trap5","targetname");
	level endon("trigger");
	object1 = getEnt ("trap_5_1","targetname");
	object2 = getEnt ("trap_5_2","targetname");
	object3 = getEnt ("trap_5_3","targetname");
	object4 = getEnt ("trap_5_4","targetname");
	object5 = getEnt ("trap_5_5","targetname");
	trigger waittill ("trigger", player );
//AUTO 	player braxi\_rank::giveRankXP("", 20);
	trigger SetHintString("^1Activated");
	trigger playSound("zap");
	object1 movey(-94,2);
	object2 movey(94,2);
	object3 movey(-94,2);
	object4 movey(94,2);
	object5 movey(-94,2);
	object1 waittill ("movedone");
	wait 0.1;
	while(1)
	{

		object1 movey(188,4);
		object2 movey(-188,4);
		object3 movey(188,4);
		object4 movey(-188,4);
		object5 movey(188,4);
		object1 waittill ("movedone");
		wait 0.1;
		object1 movey(-188,4);
		object2 movey(188,4);
		object3 movey(-188,4);
		object4 movey(188,4);
		object5 movey(-188,4);
		object1 waittill ("movedone");
		wait 0.1;
	}
}

	trap6()
{
	trigger = getEnt ("trig_trap6","targetname");
	level endon("trigger");
	object = getEnt ("mover1","targetname");
	trigger waittill ("trigger", player );
//AUTO 	player braxi\_rank::giveRankXP("", 20);
	trigger SetHintString("^1Activated");
	trigger playSound("zap");
	object rotatepitch (180,2);
	object waittill ("movedone");
	wait 8;
	object rotatepitch (-180,2);
}

	trap7()
{
	trigger = getEnt ("trig_trap7","targetname");
	level endon("trigger");
	object1 = getEnt ("trap7","targetname");
	object2 = getEnt ("wallrun7","targetname");
	trap7_fx = getEnt ("trap7_fx","targetname");
	wait 1;
	object2 rotatepitch (110, 1);
	trigger waittill ("trigger", player );
//AUTO 	player braxi\_rank::giveRankXP("", 20);
	trigger SetHintString("^1Activated");
	trigger playSound("zap");
	playfx(level.cwplode,trap7_fx.origin);
	wait 0.1;
	object1 delete();
	object2 delete();
}

	trap8()
{
	trigger = getEnt ("trig_trap8","targetname");
	level endon("trigger");
	slide1 = getEnt ("trap_8_1","targetname");
	slide2 = getEnt ("trap_8_2","targetname");
	slide3 = getEnt ("trap_8_3","targetname");
	slide1 notSolid();
	slide2 notSolid();
	slide3 notSolid();
	trigger waittill ("trigger", player );
//AUTO 	player braxi\_rank::giveRankXP("", 20);
	trigger SetHintString("^1Activated");
	trigger playSound("zap");

	i = randomintrange( 0, 3 );
	if(i == 0)
	{
		slide1 Solid();
	}
	else if(i == 1)
	{
		slide2 Solid();
	}
	else if(i == 2)
	{
		slide3 Solid();
	}
}

	trap9()
{
	trigger = getEnt ("trig_trap9","targetname");
	level endon("trigger");
	object = getEnt ("trap9","targetname");
	fx_spot = getEnt ("trap9_fx","targetname");
	trigger waittill ("trigger", player );
//AUTO 	player braxi\_rank::giveRankXP("", 20);
	trigger SetHintString("^1Activated");
	playfx(level.platrip,fx_spot.origin);
	trigger playSound("zap");
	wait 0.3;
	object delete();
}

	trap10()
{
	trigger = getEnt ("trig_trap10","targetname");
	level endon("trigger");
	object = getEnt ("trap10","targetname");
	killtrig = getEnt ("trap10_killtrig","targetname");
	object movey (-1024,0.1);
	trigger waittill ("trigger", player );
//AUTO 	player braxi\_rank::giveRankXP("", 20);
	trigger SetHintString("^1Activated");
	trigger playSound("zap");
	killtrig enablelinkto();
	killtrig linkto (object);
	object movez (10,0.5);
	wait 5;
	object movez (-10,0.5);
}

	trap11()
{
	trigger = getEnt ("trig_trap11","targetname");
	level endon("trigger");
	bounce = getEnt ("trap11_1","targetname");
	rope = getEnt ("trap11_2","targetname");
	trigger waittill ("trigger", player );
//AUTO 	player braxi\_rank::giveRankXP("", 20);
	trigger SetHintString("^1Activated");
	trigger playSound("zap");

	i = randomintrange( 0, 2 );
	if(i == 0)
	{
		bounce hide();
	}
	else if(i == 1)
	{
		rope hide();
	}

}

	knifeplat()
{
	platf1 = getEnt ("knife_plat1","targetname");
	platf2 = getEnt ("knife_plat2","targetname");
	wait 1;
	platf1 rotateroll (90, 3);
	platf2 rotateroll (-90, 3);
}

	wruntest1()
{
	object = getEnt ("wallruntest1","targetname");
	wait 1;
	object rotatepitch (110, 1);
}

	actistep1()
{
	trigger = getEnt ("acti_step1","targetname");
	trigger waittill ("trigger", player );
//AUTO 	iprintln( "^91" );
	thread actistep2();
}

	actistep2()
{
	trigger = getEnt ("acti_step2","targetname");
	trigger waittill ("trigger", player );
//AUTO 	iprintln( "^92" );
	thread actistep3();
}

	actistep3()
{
	trigger = getEnt ("acti_step3","targetname");
	trigger waittill ("trigger", player );
//AUTO 	iprintln( "^93" );
	thread actistep4();
}

	actistep4()
{
	trigger = getEnt ("acti_step4","targetname");
	trigger waittill ("trigger", player );
//AUTO 	iprintln( "^94" );
	thread actistep5();
}

	actistep5()
{
	trigger = getEnt ("acti_step5","targetname");
	trigger waittill ("trigger", player );
//AUTO 	iprintln( "^95" );
	thread actistep6();
}

	actistep6()
{
	trigger = getEnt ("acti_step6","targetname");
	trigger waittill ("trigger", player );
//AUTO 	iprintln( "^96" );
	thread actistep7();
}

	actistep7()
{
	trigger = getEnt ("acti_step7","targetname");
	trigger waittill ("trigger", player );
//AUTO 	iprintln( "^97" );
	thread actistep8();
}

	actistep8()
{
	trigger = getEnt ("acti_step8","targetname");
	trigger waittill ("trigger", player );
//AUTO 	iprintln( "^98" );
	thread actistep9();
}

	actistep9()
{
	trigger = getEnt ("acti_step9","targetname");
	trigger waittill ("trigger", player );
//AUTO 	iprintln( "^99" );
	thread actistep10();
}

	actistep10()
{
	trigger = getEnt ("acti_step10","targetname");
	trigger waittill ("trigger", player );
//AUTO 	iprintln( "^910" );
	thread actistep11();
}

	actistep11()
{
	trigger = getEnt ("acti_step11","targetname");
	object = getEnt ("wall03","targetname");
	trigger waittill ("trigger", player );
//AUTO 	iprintln( "^911" );
	object notSolid();
	
}

	tap1()
{
	trigger = getEnt ("tap1","targetname");
	trigger waittill ("trigger", player );
	thread tap2();
}

	tap2()
{
	trigger = getEnt ("tap2","targetname");
	trigger waittill ("trigger", player );
	thread tap3();
}

	tap3()
{
	trig = getEnt ("tap3","targetname");
	end = getEnt ("tap4", "targetname");
	tap4_wat = getEnt ("tap4_wat","targetname");
	while(1)
    	{
        trig waittill ("trigger", player);
	tap4_wat Solid();          
	player SetOrigin(end.origin);
        player SetPlayerAngles( end.angles );
	}


}

jump_fail()
{
	failtrig=getent("jump_alltp","targetname");
	for(;;)
	{
		failtrig waittill("trigger",player);
		if(player.pers["team"]!="spectator")
		{
			if(player.pers["team"]=="allies")
			{
				switch(randomint(3))
				{
					case 0:
						player setplayerangles(getent("jump_jt_go1","targetname").angles);
						player setorigin(getent("jump_jt_go1","targetname").origin);
						break;
					case 1:
						player setplayerangles(getent("jump_jt_go2","targetname").angles);
						player setorigin(getent("jump_jt_go2","targetname").origin);
						break;
					case 2:
						player setplayerangles(getent("jump_jt_go3","targetname").angles);
						player setorigin(getent("jump_jt_go3","targetname").origin);
						break;
				}
			}
			else 
			{
				switch(randomint(3))
				{
					case 0:
						player setplayerangles(getent("jump_at_go1","targetname").angles);
						player setorigin(getent("jump_at_go1","targetname").origin);
						break;
					case 1:
						player setplayerangles(getent("jump_at_go2","targetname").angles);
						player setorigin(getent("jump_at_go2","targetname").origin);
						break;
					case 2:
						player setplayerangles(getent("jump_at_go3","targetname").angles);
						player setorigin(getent("jump_at_go3","targetname").origin);
						break;
				}
			}
		}
	}
}

jump_room_gun()
{
	trig=getent("jumproom_weapon","targetname");
	for(;;)
	{
		trig waittill("trigger",p);
//AUTO 		p giveweapon("remington700_mp");
//AUTO 		p givemaxammo("remington700_mp");
//AUTO 		p switchtoweapon("remington700_mp");
		wait 1;
	}
}

jump_room_gun2()
{
	trig=getent("jumproom_weapon2","targetname");
	for(;;)
	{
		trig waittill("trigger",p);
//AUTO 		p giveweapon("dsr50_mp");
//AUTO 		p givemaxammo("dsr50_mp");
//AUTO 		p switchtoweapon("dsr50_mp");
		wait 1;
	}
}

jump_room_battle()
{
    level.jump_trig=getent("jumproom_ent","targetname");
    level.jump_door=getent("jumproom_door","targetname");
 
    jump=getent("jumproom_go","targetname");
    acti=getent("jumproom_acti","targetname");
 
    while(1)
    {
        level.jump_trig waittill("trigger",player);

        thread jump_fail();
		thread jump_room_gun();
		thread jump_room_gun2();
		thread j_gun1();
		thread j_gun2();
        
        if(!isdefined(level.jump_trig)) return;
 
        if(!isdefined(level.entertext)||!level.entertext)
        {
            level.entertext=true;
           
            ambientstop();
//AUTO             ambientplay("bonfire");
            level.canPlaySound=false;

//AUTO             iprintln("^1Now playing:^7 Knife Party ^1-^7 Bonfire");
 
            level.old_trig delete();
            level.knife_trig delete();
            level.sgun_trig delete();
            level.sniper_trig delete();
            level.rpg_trig delete();
 
            level.old_door movex (-64, 0.1);
			level.snip_door movex (-64, 0.1);
			level.knife_door movex (-64, 0.1);
			level.rpg_door movex (-64, 0.1);
			level.sgun_door movex (-64, 0.1);
 
//AUTO             iprintlnbold("^1"+player.name+" ^7entered Jump room.");
        }
 
        player createroomport("knife_mp",undefined,1,jump,100);
        level.activ createroomport("knife_mp",undefined,1,acti,100);
 
        player thread countdown();
        level.activ thread countdown();
 
       	while(isalive(player)&&isdefined(player))
            wait 1;

//AUTO         iPrintlnBold("^1"+self.name+" ^7died^1!");
    }
}

sniper_room_battle()
{
    level.sniper_trig=getent("sniproom_ent","targetname");
    level.snip_door=getent("sniproom_door","targetname");
 
    jump=getent("sniproom_go","targetname");
    acti=getent("sniproom_acti","targetname");
 
    while(1)
    {
       level.sniper_trig waittill("trigger",player);

        thread walls_snip();
		thread s_gun1();
		thread s_gun2();

        if(!isdefined(level.sniper_trig)) return;
 
        if(!isdefined(level.entertext)||!level.entertext)
        {
            level.entertext=true;
           
            ambientstop();
//AUTO             ambientplay("sleaze");
            level.canPlaySound=false;

//AUTO             iprintln("^1Now playing:^7 Knife Party ^1-^7 Sleaze");
 
            level.old_trig delete();
			level.jump_trig delete();
			level.knife_trig delete();
			level.rpg_trig delete();
			level.sgun_trig delete();
 
            level.old_door movex (-64, 0.1);
			level.jump_door movex (-64, 0.1);
			level.knife_door movex (-64, 0.1);
			level.rpg_door movex (-64, 0.1);
			level.sgun_door movex (-64, 0.1);
 
//AUTO             iprintlnbold("^1"+player.name+" ^7entered Sniper room.");
        }
 
        player createroomport("dsr50_mp","remington700_mp",1,jump,100);
        level.activ createroomport("dsr50_mp","remington700_mp",1,acti,100);
 
        player thread countdown();
        level.activ thread countdown();
 
       	while(isalive(player)&&isdefined(player))
            wait 1;

//AUTO         iPrintlnBold("^1"+self.name+" ^7died^1!");
    }
}

rpg_room_battle()
{
    level.rpg_trig=getent("rpgroom_ent","targetname");
    level.rpg_door=getent("rpgroom_door","targetname");
 
    jump=getent("rpgroom_go","targetname");
    acti=getent("rpgroom_acti","targetname");
 
    while(1)
    {
       	level.rpg_trig waittill("trigger",player);
        if(!isdefined(level.rpg_trig)) return;
 
        if(!isdefined(level.entertext)||!level.entertext)
        {
            level.entertext=true;
           
            ambientstop();
//AUTO             ambientplay("memory");
            level.canPlaySound=false;

//AUTO             iprintln("^1Now playing:^7 The Glitch Mob ^1-^7 I need my Memory back");
 
            level.old_trig delete();
			level.jump_trig delete();
			level.knife_trig delete();
			level.sniper_trig delete();
			level.sgun_trig delete();
 
            level.old_door movex (-64, 0.1);
			level.snip_door movex (-64, 0.1);
			level.knife_door movex (-64, 0.1);
			level.jump_door movex (-64, 0.1);
			level.sgun_door movex (-64, 0.1);
 
//AUTO             iprintlnbold("^1"+player.name+" ^7entered RPG room.");
        }
 
        player createroomport("rpg_mp",undefined,1,jump,100);
        level.activ createroomport("rpg_mp",undefined,1,acti,100);
 
        player thread countdown();
        level.activ thread countdown();

        player thread refreshAmmo();
        level.activ thread refreshAmmo();
 
       	while(isalive(player)&&isdefined(player))
            wait 1;

//AUTO         iPrintlnBold("^1"+self.name+" ^7died^1!");
    }
}

sgun_room_battle()
{
   	level.sgun_trig=getent("sgunroom_ent","targetname");
    level.sgun_door=getent("sgunroom_door","targetname");
 
    jump=getent("sgunroom_go","targetname");
    acti=getent("sgunroom_acti","targetname");
 
    while(1)
    {
       	level.sgun_trig waittill("trigger",player);
        if(!isdefined(level.sgun_trig)) return;
 
        if(!isdefined(level.entertext)||!level.entertext)
        {
            level.entertext=true;
           
            ambientstop();
//AUTO             ambientplay("giveitup");
            level.canPlaySound=false;

//AUTO             iprintln("^1Now playing:^7 Knife Party ^1-^7 Give it up");
 
            level.old_trig delete();
			level.jump_trig delete();
			level.knife_trig delete();
			level.sniper_trig delete();
			level.rpg_trig delete();
 
            level.old_door movex (-64, 0.1);
			level.snip_door movex (-64, 0.1);
			level.knife_door movex (-64, 0.1);
			level.rpg_door movex (-64, 0.1);
			level.jump_door movex (-64, 0.1);
 
//AUTO             iprintlnbold("^1"+player.name+" ^7entered Shotgun room.");
        }
 
        player createroomport("winchester1200_mp",undefined,1,jump,100);
        level.activ createroomport("winchester1200_mp",undefined,1,acti,100);
 
        player thread countdown();
        level.activ thread countdown();

        player thread refreshAmmo();
        level.activ thread refreshAmmo();
 
       	while(isalive(player)&&isdefined(player))
            wait 1;

//AUTO         iPrintlnBold("^1"+self.name+" ^7died^1!");
    }
}

knife_room_battle()
{
    level.knife_trig=getent("kniferoom_ent","targetname");
    level.knife_door=getent("kniferoom_door","targetname");
 
    knife=getent("kniferoom_go","targetname");
    acti=getent("kniferoom_acti","targetname");
 
    while(1)
    {
        level.knife_trig waittill("trigger",player);
        if(!isdefined(level.knife_trig)) return;
 
        if(!isdefined(level.entertext)||!level.entertext)
        {
            level.entertext=true;
           
            ambientstop();
//AUTO             ambientplay("eminem1");
            level.canPlaySound=false;

//AUTO             iprintln("^1Now playing:^7 Eminem ^1-^7 Lose yourself");
 
            level.old_trig delete();
            level.jump_trig delete();
            level.sgun_trig delete();
            level.sniper_trig delete();
            level.rpg_trig delete();
 
            level.old_door movex (-64, 0.1);
            level.snip_door movex (-64, 0.1);
            level.jump_door movex (-64, 0.1);
            level.rpg_door movex (-64, 0.1);
            level.sgun_door movex (-64, 0.1);
 
            thread sidewayLyrics();
//AUTO             iprintlnbold("^1"+player.name+" ^7entered Knife room.");
        }

		wait 20.7;
 
        player createroomport("knife_mp",undefined,1,knife,100);
        level.activ createroomport("knife_mp",undefined,1,acti,100);
 
        player thread countdown();
        level.activ thread countdown();
 
       	while(isalive(player)&&isdefined(player))
            wait 1;

//AUTO          iPrintlnBold("^1"+self.name+" ^7died^1!");
    }
}

refreshAmmo()
{
	while(isalive(self)&&isdefined(self))
	{
//AUTO 		self givemaxammo("rpg_mp");
		wait 4;
	}
}

sidewayLyrics()
{
    wait 2.6;
//AUTO     iPrintlnBold( "^5Look" );
    wait 2.6;
//AUTO     iPrintlnBold( "^5If you had" );
    wait 2.3;
//AUTO     iPrintlnBold( "^5One shot" );
    wait 2;
//AUTO     iPrintlnBold( "^5Or one opportunity" );
    wait 2.5;
//AUTO     iPrintlnBold( "^5To seize everything you ever wanted" );
    wait 3;
//AUTO     iPrintlnBold( "^5One moment" );
    wait 2.2;
//AUTO     iPrintlnBold( "^5Would you capture it" );
    wait 2.1;
//AUTO     iPrintlnBold( "^5Or just let it slip?" );
    wait 1.4;
//AUTO     iPrintlnBold( "^1 YO" );
}

createroomport(weapon,weapon2,freeze,where,health)
{
//AUTO     self takeallweapons();
//AUTO     self giveweapon(weapon);
    if(isdefined(weapon2))
//AUTO     	self giveweapon(weapon2);
//AUTO     self switchtoweapon(weapon);
 
    self freezecontrols(freeze);
    self setorigin(where.origin);
    self setplayerangles(where.angles);
 
    self.health=health;
}

countdown()
{
//AUTO     self iprintlnbold("^33");
    wait 1;
//AUTO     self iprintlnbold("^32");
    wait 1;
//AUTO     self iprintlnbold("^31");
    wait 1;
//AUTO     self iprintlnbold("^5Fight!");
    wait 1;
    self freezecontrols(0);
}

old_room_battle()
{
    level.old_trig=getent("oldroom_ent","targetname");
    level.old_door=getent("oldroom_door","targetname");
 
    jump=getent("oldroom_go","targetname");

    while(1)
    {
        level.old_trig waittill("trigger",player);
 
        if(!isdefined(level.entertext)||!level.entertext)
        {
            level.entertext=true;
            level.canPlaySound=false;

//AUTO             iprintln("^1Now playing:^7 Eminem ^1-^7 Lose yourself");
 
            level.knife_trig delete();
			level.jump_trig delete();
			level.sgun_trig delete();
			level.sniper_trig delete();
			level.rpg_trig delete();
 
            level.jump_door movex (-64, 0.1);
			level.snip_door movex (-64, 0.1);
			level.knife_door movex (-64, 0.1);
			level.rpg_door movex (-64, 0.1);
			level.sgun_door movex (-64, 0.1);
 
//AUTO             iprintlnbold("^1"+player.name+" ^7entered Old room.");
        }
        player setorigin(jump.origin);
        player setplayerangles(jump.angles);
    }
}

secret_open()
{

	trigger = getEnt ("secret_s","targetname");
	trigger waittill ("trigger", player );
//AUTO 	iprintln( "^5S" );
	thread secret_open2();
}

secret_open2()
{

	trigger = getEnt ("secret_e","targetname");
	trigger waittill ("trigger", player );
//AUTO 	iprintln( "^5E" );
	thread secret_open3();
}

secret_open3()
{

	trigger = getEnt ("secret_c","targetname");
	trigger waittill ("trigger", player );
//AUTO 	iprintln( "^5C" );
	thread secret_open4();
}

secret_open4()
{
	trigger = getEnt ("secret_r","targetname");
	trigger waittill ("trigger", player );
//AUTO 	iprintln( "^5R" );
	thread secret_open5();
}

secret_open5()
{

	trigger = getEnt ("secret_e","targetname");
	trigger waittill ("trigger", player );
//AUTO 	iprintln( "^5E" );
	thread secret_open6();
}

secret_open6()
{

	trigger = getEnt ("secret_t","targetname");
	wall01 = getent ("wall01","targetname");
	secret = getent ("secret_wall01","targetname");
	trigger waittill ("trigger", player );
//AUTO 	iprintln( "^5T" );
	secret notSolid();
	wall01 rotateyaw (110,4);
	wall01 waittill ("rotatedone");
//AUTO 	iprintlnBold ("^6Secret opened!");
//AUTO 	player braxi\_rank::giveRankXP("", 50);
	thread secret_statue();
}

p_room()
{
	trigger = getEnt ("p_room","targetname");
	trigger waittill ("trigger", player );
//AUTO 	iPrintlnBold(" ^7Activator entered the ^6Porn room ");
}

creators()
{
	wait 9;
//AUTO 	iPrintlnBold("^7Map by ^5TheLixfe");
	wait 2;
//AUTO 	iprintln("^7Thanks to ^5Vistic Clan");
	wait 2;
//AUTO 	iprintln("^7Special thanks to ^5SuX Lolz ^7 for making the vistic text models");
	wait 5;
//AUTO 	iprintln("^7 Thanks to Sheep Wizard for helping me on music menu ");
	wait 15;
//AUTO 	iprintln("^7Map by ^5TheLixfe");
}

rings()
{
	trig = getEnt ("rings_trig", "targetname");
	end = getEnt ("rings_trig_go", "targetname");
	while(1)
    {
        trig waittill ("trigger", player);
//AUTO 		player iprintlnBold ("^3Use 333 fps!");          
		player SetOrigin(end.origin);
        player SetPlayerAngles( end.angles );
	}	
}

ring1()
{
	trigger = getEnt ("ring1","targetname");
	trigger waittill ("trigger", player );
//AUTO 	player braxi\_rank::giveRankXP("", 69);
//AUTO 	player iprintlnbold ("You got the ring ^61!");
//AUTO 	iprintln("Someone got the ring ^61");
}

	ring2()
{
	trigger = getEnt ("ring2","targetname");
	trigger waittill ("trigger", player );
//AUTO 	player braxi\_rank::giveRankXP("", 69);
//AUTO 	player iprintlnbold ("You got the ring ^62!");
//AUTO 	iprintln("Someone got the ring ^62");
}

	ring3()
{
	trigger = getEnt ("ring3","targetname");
	trigger waittill ("trigger", player );
//AUTO 	player braxi\_rank::giveRankXP("", 69);
//AUTO 	player iprintlnbold ("You got the ring ^63!");
//AUTO 	iprintln("Someone got the ring ^63");
}

	ring4()
{
	trigger = getEnt ("ring4","targetname");
	trigger waittill ("trigger", player );
//AUTO 	player braxi\_rank::giveRankXP("", 69);
//AUTO 	player iprintlnbold ("You got the ring ^64!");
//AUTO 	iprintln("Someone got the ring ^64");
}

	secret_statue()
{
        trigger = getEnt ( "trig_secret_wep", "targetname" );
	object = getEnt ( "secret_statue", "targetname" );
        while(1)
        {
                trigger waittill ( "trigger", player );
                wait 0.05;
//AUTO                 player giveWeapon ( "dsr50_mp" );
//AUTO                 player giveMaxAmmo ( "dsr50_mp" );
//AUTO                 player switchToWeapon ( "dsr50_mp" );
		object movez(12,0.5);
		object waittill ("movedone");
		object movez(-12,0.5);
        }
}

	j_gun1()
{
	trigger = getEnt ( "j_gun1", "targetname" );
	object = getEnt ( "ak_jgun1", "targetname" );
        trigger waittill ( "trigger", player );
        wait 0.05;
//AUTO 	player braxi\_rank::giveRankXP("", 100);
//AUTO         player giveWeapon ( "ak74u_mp" );
//AUTO         player switchToWeapon ( "ak74u_mp" );
//AUTO         player giveMaxAmmo ( "ak74u_mp" );
	object delete();
	trigger delete();
}

	j_gun2()
{
	trigger = getEnt ( "j_gun2", "targetname" );
	object = getEnt ( "ak_jgun2", "targetname" );
        trigger waittill ( "trigger", player );
        wait 0.05;
//AUTO 	player braxi\_rank::giveRankXP("", 100);
//AUTO         player giveWeapon ( "ak74u_mp" );
//AUTO         player switchToWeapon ( "ak74u_mp" );
//AUTO         player giveMaxAmmo ( "ak74u_mp" );
	object delete();
	trigger delete();
}

	s_gun1()
{
	trigger = getEnt ( "s_gun1", "targetname" );
	object = getEnt ( "snip_sgun1", "targetname" );
        trigger waittill ( "trigger", player );
        wait 0.05;
//AUTO 	player braxi\_rank::giveRankXP("", 100);
//AUTO         player giveWeapon ( "m40a3_mp" );
//AUTO         player switchToWeapon ( "m40a3_mp" );
//AUTO         player giveMaxAmmo ( "m40a3_mp" );
	object delete();
	trigger delete();
}

	s_gun2()
{
	trigger = getEnt ( "s_gun2", "targetname" );
	object = getEnt ( "snip_sgun2", "targetname" );
        trigger waittill ( "trigger", player );
        wait 0.05;
//AUTO 	player braxi\_rank::giveRankXP("", 100);
//AUTO         player giveWeapon ( "m40a3_mp" );
//AUTO         player switchToWeapon ( "m40a3_mp" );
//AUTO         player giveMaxAmmo ( "m40a3_mp" );
	object delete();
	trigger delete();
}

	walls_snip()
{
	object1 = getEnt ( "wall_s1", "targetname" );
	object2 = getEnt ( "wall_s2", "targetname" );
	object1 notSolid();
	object2 notSolid();
}

