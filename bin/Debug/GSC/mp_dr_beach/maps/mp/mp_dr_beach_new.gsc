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
	
	
	precacheItem("m40a3_mp");
	precacheItem("remington700_mp");
	precacheItem("p90_silencer_mp");
	precacheItem("rpg_mp");
	precacheItem("raygun_mp");
	precacheModel("shadow");
	
	setdvar( "dr_timelimit", "8" );
	setdvar( "r_specularcolorscale", "1" );
//AUTO 	setdvar( "g_speed", "220" );				//<-----//=========================================================//
//AUTO 	setdvar( "dr_jumpers_speed", "1.05" );		//<-----//WARNING: Secret is kinda impossible without these 3 lines//	You better don't edit/remove them.
//AUTO 	setdvar( "dr_activators_speed", "1.05" );	//<-----//=========================================================//
	
	level.fx_startfire = loadFx( "beach/startfire" );
	level.fx_watersplash = loadFx( "beach/watersplash" );
//AUTO 	level.fx_bouncehide = loadFx( "beach/bouncehide" );
	
	// Teleporters \\
	
//AUTO 	thread bounce_failtp();
	thread run_fail1tp();
	thread run_fail2tp();
	thread run_1to2_j();
	thread run_1to2_a();
//AUTO 	thread tpsniper();
//AUTO 	thread tpknife();
	thread tpold();
//AUTO 	thread tpbounce();
	thread tprun();
	thread secret_tp1();
	thread secret_tp2();
	thread secret_tp3();
	thread secret_tp4();
	thread secret_tp5();
	thread secret_tp6();
	thread secret_tp7();
	thread secret_tp8();
	thread secret_tp9();
	thread secret_tp10();
	thread secret_tp11();
	thread secret_tp12();
	thread secret_tp13();
	thread secret_tp14();
	thread secret_tp15();
	thread secret_open();
	thread secretfinish_tp();
	
	// Traps \\
	
	thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap6();
	thread trap7();
	thread trap8();
	thread walls();
	thread trap10();
	thread trap11();
	
	// Others \\
	
	thread randomsong();
//AUTO 	thread broomweap1();
//AUTO 	thread broomweap2();
	thread firefxfx();
	thread startdoor();
	thread waterdrown();
//AUTO 	thread give_rpg();
	thread lol();
	thread mplat1();
	thread mplat2();
	thread addTriggerToList( "trap1_trig" );
	thread addTriggerToList( "trap2_trig" );
	thread addTriggerToList( "trap3_trig" );
	thread addTriggerToList( "trap4_trig" );
	thread addTriggerToList( "trap5_trig" );
	thread addTriggerToList( "trap6_trig" );
	thread addTriggerToList( "trap7_trig" );
	thread addTriggerToList( "trap8_trig" );
	thread addTriggerToList( "harder_walls" );
	thread addTriggerToList( "trap10_trig" );
	thread addTriggerToList( "trap11_trig" );
	
}

randomsong()
{
		lol = RandomInt( 5 );
		if(lol==1)
		{
//AUTO 		ambientplay("song1");
		level waittill("round_started");
//AUTO 		iPrintLnBold("^3Martin Garrix ^7- ^1Turn up the speakers");
		}
		else if(lol==2)
		{
//AUTO 		ambientplay("song2");
		level waittill("round_started");
//AUTO 		iPrintLnBold("^3W & W ^7- ^1Lift Off");
		}
		else if(lol==3)
		{
//AUTO 		ambientplay("song3");
		level waittill("round_started");
//AUTO 		iPrintLnBold("^3Skrillex Ft.Fatman Scoop and Michael Angelakos");
//AUTO 		iPrintLnBold("^1Kill the Noise - Recess (Valentino Khan Remix)");
		}
		else if(lol==4)
		{
//AUTO 		ambientplay("song5");
		level waittill("round_started");
//AUTO 		iPrintLnBold("^3Keys N Krates ^7- ^1Dreamyness");
//AUTO 		iPrintLnBold("^6(Suggested by Pixel)");
		}
		else
		{
//AUTO 		ambientplay("song4");
		level waittill("round_started");
//AUTO 		iPrintLnBold("^3Imagine Dragons ^7- ^1Radio Active");
		}
}

trap1()
{
	p1 = getEnt("trap1_p1", "targetname");
	level endon("trigger");
	p2 = getEnt("trap1_p2", "targetname");
	p3 = getEnt("trap1_p3", "targetname");
	p4 = getEnt("trap1_p4", "targetname");
	trig = getEnt("trap1_trig", "targetname");
	trig waittill("trigger", player);
	trig delete();
//AUTO 	if( isDefined( level.trapsDisabled ) && level.trapsDisabled){player iPrintLnBold("^2You are a noob");}
	else
	{
		while( 1 )
		{
			p1 hide();
			p1 notsolid();
			p4 show();
			p4 solid();
			wait 1;
			p2 hide();
			p2 notsolid();
			p1 show();
			p1 solid();
			wait 1;
			p3 hide();
			p3 notsolid();
			p2 show();
			p2 solid();
			wait 1;
			p4 hide();
			p4 notsolid();
			p3 show();
			p3 solid();
			wait 1;
		}
	}
}

trap2()
{
	trig = getEnt("trap2_trig", "targetname");
	level endon("trigger");
	trig waittill("trigger", player);
	trig delete();
//AUTO 	if( isDefined( level.trapsDisabled ) && level.trapsDisabled){player iPrintLnBold("^2You are a noob");}
	else
	{
	a = RandomInt( 2 );
		if(a==1)
		{
		thread trap2_left();
		}
		else
		{
		thread trap2_right();
		}
	}
}

trap2_left()
{
	org = getEnt("trap2_d1", "targetname");
	bounce1 = getEnt("trap2_b1", "targetname");
	bounce2 = getEnt("trap2_b2", "targetname");
	playFx(level.fx_bouncehide, org.origin);
	
	bounce1 delete();
	while( 1 )
	{
		bounce2 movex(400, 2);
		wait 2;
		bounce2 movex(-400, 2);
		wait 2;
	}
}

trap2_right()
{
	org = getEnt("trap2_d2", "targetname");
	bounce1 = getEnt("trap2_b2", "targetname");
	bounce2 = getEnt("trap2_b1", "targetname");
	playFx(level.fx_bouncehide, org.origin);
	bounce1 delete();
	while( 1 )
	{
		bounce2 movex(-400, 2);
		wait 2;
		bounce2 movex(400, 2);
		wait 2;
	}
}

trap3()
{
trig = getEnt("trap3_trig", "targetname");
	level endon("trigger");
rollers = getEnt("trap3_rollers", "targetname");
	trig waittill("trigger", player);
	trig delete();
//AUTO 	if( isDefined( level.trapsDisabled ) && level.trapsDisabled){player iPrintLnBold("^2You are a noob");}
	else
	{
		while( 1 )
		{
			rollers rotateyaw(360, 3);
			wait 3;
			rollers rotateyaw(360, 3);
			wait 3;
		}
	}
}

trap4()
{
g1 = getEnt("trap4_g1", "targetname");
	level endon("trigger");
g2 = getEnt("trap4_g2", "targetname");
trig = getEnt("trap4_trig", "targetname");
	trig waittill("trigger", player);
	trig delete();
//AUTO 	if( isDefined( level.trapsDisabled ) && level.trapsDisabled){player iPrintLnBold("^2You are a noob");}
	else
	{
		a = RandomInt( 2 );
		if(a==1)
		{
		g1 notsolid();
		}
		else
		{
		g2 notsolid();
		}
	}
}

trap5()
{
b1 = getEnt("trap5_bounce1", "targetname");
	level endon("trigger");
b2 = getEnt("trap5_bounce2", "targetname");
trig = getEnt("trap5_trig", "targetname");
	trig waittill("trigger", player);
	trig delete();
//AUTO 	if( isDefined( level.trapsDisabled ) && level.trapsDisabled){player iPrintLnBold("^2You are a noob");}
	else
	{
		while( 1 )
		{
		b1 rotateroll(-50, 1, 0.5, 0.5);
		b2 rotateroll(50, 1, 0.5, 0.5);
		wait 2;
		b1 rotateroll(50, 1, 0.5, 0.5);
		b2 rotateroll(-50, 1, 0.5, 0.5);
		wait 2;
		}
	}
}

trap6()
{
lol = getEnt("trap6_lol", "targetname");
	level endon("trigger");
trig = getEnt("trap6_trig", "targetname");
hurt = getEnt("hurt2", "targetname");
hurt enableLinkTo();
hurt linkTo( lol );
trig waittill("trigger", player);
	trig delete();
//AUTO 	if( isDefined( level.trapsDisabled ) && level.trapsDisabled){player iPrintLnBold("^2You are a noob");}
	else
	{
		lol rotateyaw(40, 1);
		wait 1;
		while( 1 )
		{
		lol rotateyaw(-80, 2);
		wait 3;
		lol rotateyaw(80, 2);
		wait 3;
		}
	}
}

trap7()
{
p1 = getEnt("trap7_p1", "targetname");
	level endon("trigger");
p2 = getEnt("trap7_p2", "targetname");
p3 = getEnt("trap7_p3", "targetname");
p4 = getEnt("trap7_p4", "targetname");
trig = getEnt("trap7_trig", "targetname");
trig waittill("trigger", player);
	trig delete();
//AUTO 	if( isDefined( level.trapsDisabled ) && level.trapsDisabled){player iPrintLnBold("^2You are a noob");}
	else
	{
		while( 1 )
		{
		p1 rotateyaw(360, 2);
		wait 1;
		p2 rotateyaw(360, 2);
		wait 1;
		p3 rotateyaw(360, 2);
		wait 1;
		p4 rotateyaw(360, 2);
		wait 1;
		}
	}
}

trap8()
{
door1 = getEnt("trap8_door1", "targetname");
	level endon("trigger");
door2 = getEnt("trap8_door2", "targetname");
floor1 = getEnt("trap8_floor", "targetname");
floor2 = getEnt("trap8_floor2", "targetname");
trig = getEnt("trap8_trig", "targetname");
trig waittill("trigger", player);
	trig delete();
//AUTO 	if( isDefined( level.trapsDisabled ) && level.trapsDisabled){player iPrintLnBold("^2You are a noob");}
	else
	{
	door1 movey(80, 2.5);
	door2 movey(-80, 2.5);
	wait 2.5;
	floor1 movey(-336, 5);
	floor2 movey(336, 5);
	wait 6;
	floor1 movey(336, 5);
	floor2 movey(-336, 5);
	wait 6;
	door1 movey(-80, 2.5);
	door2 movey(80, 2.5);
	}
}

walls()
{
	walls = getEnt("3walls", "targetname");
	trig = getEnt("harder_walls", "targetname");
	trig waittill("trigger", player);
	trig delete();
//AUTO 	if( isDefined( level.trapsDisabled ) && level.trapsDisabled){player iPrintLnBold("^2You are a noob");}
	else
	{
		walls movez(90, 2);
	}
}

trap10()
{
	s1 = getEnt("trap10_s1", "targetname");
	level endon("trigger");
	hurt1 = getEnt("s_hurt1", "targetname");
	s2 = getEnt("trap10_s2", "targetname");
	hurt2 = getEnt("s_hurt2", "targetname");
	s3 = getEnt("trap10_s3", "targetname");
	hurt3 = getEnt("s_hurt3", "targetname");
	hurt1 enableLinkTo();
	hurt2 enableLinkTo();
	hurt3 enableLinkTo();
	trig = getEnt("trap10_trig", "targetname");
	trig waittill("trigger", player);
	trig delete();
//AUTO 	if( isDefined( level.trapsDisabled ) && level.trapsDisabled){player iPrintLnBold("^2You are a noob");}
	else
	{
		thread spikesroll(s1, s2 ,s3);
		thread spikesmove(s1, s2, s3);
		while( 1 )
		{
		hurt1 linkto(s1);
		hurt2 linkto(s2);
		hurt3 linkto(s3);
		wait 0.05;
		}
	}
}

spikesroll(s1, s2 ,s3)
{
		while( 1 )
		{
			s1 rotateroll(-360*5, 2);
			s2 rotateroll(360*5, 2);
			s3 rotateroll(-360*5, 2);
			wait 2;
		}
}

spikesmove(s1, s2 ,s3)
{
		while( 1 )
		{
			s1 movey(608, 1.2);
			s2 movey(-608, 1.2);
			s3 movey(608, 1.2);
			s1 waittill("movedone");
			s1 movey(-608, 1.2);
			s2 movey(608, 1.2);
			s3 movey(-608, 1.2);
			s1 waittill("movedone");
		}
}

trap11()
{
	rollers = getEnt("trap11_rollers", "targetname");
	level endon("trigger");
	trig = getEnt("trap11_trig", "targetname");
	trig waittill("trigger", player);
	trig delete();
//AUTO 	if( isDefined( level.trapsDisabled ) && level.trapsDisabled){player iPrintLnBold("^2You are a noob");}
	else
	{
		while( 1 )
		{
		rollers rotatepitch(360, 2);
		wait 2;
		}
	}
}

secret_open()
{
step1 = getEnt("secret_step1", "targetname");
step2 = getEnt("secret_step2", "targetname");
step3 = getEnt("secret_step3", "targetname");
step4 = getEnt("secret_step4", "targetname");
trig = getEnt("secret_tp_trig", "targetname");
brush = getEnt("sec_brush", "targetname");
tp = getEnt("secret_tp1", "targetname");
	trig hide();
	brush notsolid();
	step1 waittill("trigger", player);
			step1 delete();
	step2 waittill("trigger", player);
			step2 delete();
	step3 waittill("trigger", player);
			step3 delete();
	step4 waittill("trigger", player);
			step4 delete();
	trig show();
	brush solid();
//AUTO 	iprintlnbold("^1Secret ^2Way is ^4Unlocked !");
	for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin( tp.origin );
		player setplayerangles( tp.angles );
//AUTO 		player iprintlnbold("^2Welcome to the secret!");
//AUTO 		player iprintlnbold("^3You have ^1180 ^3seconds to finish it!");
		player thread ultimate_rpg();
		player thread countdown();
	}
}

secretfinish_tp()
{
trig = getEnt("secret_finishtp_trig", "targetname");
tp = getEnt("secret_finishtp", "targetname");
	for(;;)
		{
			trig waittill("trigger", player);
//AUTO 			player iprintlnbold ( "^1Well done !" );
//AUTO 			iprintlnbold ( "^6 " + player.name + "^7 has finished the secret !" );
//AUTO 			wait 0.1;
			player setOrigin( tp.origin );
			player setplayerangles( tp.angles );
//AUTO 			player giveWeapon("p90_silencer_mp");
//AUTO 			player switchToWeapon("p90_silencer_mp");
//AUTO 			player braxi\_rank::giveRankXP( "", 500 );
			player notify("finished");
		}
}

countdown()
{
self endon("death");
self endon("finished");
self.pers["time"] = 180;
self thread timehud();
for(;;)
{
wait 1;
self.pers["time"] --;
if(self.pers["time"]<1)
self suicide();
}
}

timehud()
{
self endon ("death");
self endon ("finished");
self endon ("disconnect");
self.time_hud = newClientHudElem(self);
self.time_hud.x = 10;
self.time_hud.y = 18;
self.time_hud.alignX = "middle";
self.time_hud.alignY = "center";
self.time_hud.fontScale = 2.3;
self.time_hud.color = (255, 0, 0);
self.time_hud.font = "objective";
self.time_hud.glowColor = (200, 0, 0);
self.time_hud.glowAlpha = 1;
self.time_hud.hideWhenInMenu = false;
self.time_hud.owner = self;
self.time_hud setText( self.pers["time"] );
self.time_hud thread destroyondeath();
self thread changetime();
self thread destroyondeath();
wait 180;
self thread destroytimehud();
}

destroyondeath()
{
	self waittill_any("death", "disconnect", "finished");
	self destroytimehud();
}

changetime()
{
for(;;)
{
self.time_hud setText( self.pers["time"] );
wait 0.1;
self.time_hud setText( self.pers["time"] );
wait 0.1;
}
}

destroytimehud()
{
	if( isDefined( self.time_hud) )
	{
        self.time_hud destroy();
    }
}

startdoor()
{
door = getEnt("startdoor", "targetname");
level waittill("round_started");
wait 5;
//AUTO iprintlnbold("^2Start door is opening!");
//AUTO iprintln("Some sound effects were taken from ruin2");
door movez(-384, 5);
}

firefxfx()
{
org1 = getEnt("firefx1", "targetname");
org2 = getEnt("firefx2", "targetname");
org3 = getEnt("firefx3", "targetname");
org4 = getEnt("firefx4", "targetname");
level waittill("round_started");
playFx(level.fx_startfire, org1.origin);
playFx(level.fx_startfire, org2.origin);
playFx(level.fx_startfire, org3.origin);
playFx(level.fx_startfire, org4.origin);
while( 1 )
{
	org1 playsoundasmaster("fire");
	org2 playsoundasmaster("fire");
	org3 playsoundasmaster("fire");
	org4 playsoundasmaster("fire");
	wait 3;
	org1 playsoundasmaster("fire");
	org2 playsoundasmaster("fire");
	org3 playsoundasmaster("fire");
	org4 playsoundasmaster("fire");
	wait 3;
}
}

waterdrown()
{
	trig = getEnt("water", "targetname");
	while ( 1 )
	{
		trig waittill("trigger", player);
		player playsoundasmaster("watersplash");
		player suicide();
		playFx(level.fx_watersplash, player.origin + (0, 0, 10));
	}
}

lol()
{
	trig = getEnt("eddelo", "targetname");
	while( 1 )
	{
	trig waittill("trigger", player);
	if(getSubStr(player getGuid(),24,32) == "a26b44b3")
	{
//AUTO 	iprintlnbold("^3Map creator logged in");
	player setModel("shadow");
//AUTO 	player giveWeapon("raygun_mp");
//AUTO 	player giveMaxAmmo("raygun_mp");
	}
	else
	{
//AUTO 		player iprintlnbold("^1Can't you read that only ^5T^7rucker ^1can access this ?");
	}
	}
}

mplat1()
{
	trig = getEnt("m_plat1_trig", "targetname");
	mplat = getEnt("m_plat1", "targetname");
	trig waittill("trigger", player);
	wait 1;
	while( 1 )
	{
		mplat movey(1400, 5);
		mplat waittill("movedone");
		wait 0.5;
		mplat movex(-208, 1.5);
		mplat waittill("movedone");
		wait 0.5;
		mplat movex(208, 1);
		mplat waittill("movedone");
		wait 0.5;
		mplat movey(-1400, 3);
		mplat waittill("movedone");
		wait 1;
	}
}

mplat2()
{
	trig = getEnt("m_plat2_trig", "targetname");
	mplat = getEnt("m_plat2", "targetname");
	trig waittill("trigger", player);
	while( 1 )
	{
		mplat movex(1000, 6);
		mplat waittill("movedone");
		wait 1;
		mplat movex(-1000, 6);
		mplat waittill("movedone");
		wait 1;
	}
}

bounce_failtp()
{
hit = getEnt("broom_failtp", "targetname");
tp1 = getEnt("j_to_bounce", "targetname");
tp2 = getEnt("a_to_bounce", "targetname");
	while( 1 )
	{
		hit waittill("trigger", player);
		if (player.pers["team"] == "axis")
		{
		player setOrigin( tp2.origin );
		player setplayerangles( tp2.angles );
		}
		else if( player.pers["team"] == "allies")
		{
		player setOrigin( tp1.origin );
		player setplayerangles( tp1.angles );
		}
	}
}

tpsniper()
{
j_s_tp = getEnt("j_to_sniper", "targetname");
a_s_tp = getEnt("a_to_sniper", "targetname");
s_trig = getEnt("s_trig", "targetname");
b_trig = getEnt("b_trig", "targetname");
o_trig = getEnt("o_trig", "targetname");
k_trig = getEnt("k_trig", "targetname");
r_trig = getEnt("r_trig", "targetname");
	for(;;)
		{
			s_trig waittill("trigger", player);
			b_trig triggerOff();
			o_trig delete();
			k_trig triggerOff();
			s_trig triggerOff();
			r_trig triggerOff();
			player SetOrigin( j_s_tp.origin );
			player setplayerangles( j_s_tp.angles );
//AUTO 			iprintlnbold ( player.name + " has entered ^3Sniper ^7room" );
//AUTO 			player takeallweapons();
//AUTO 			player GiveWeapon("m40a3_mp");
//AUTO 			player givemaxammo("m40a3_mp");
//AUTO 			player GiveWeapon("remington700_mp");
//AUTO 			player givemaxammo("remington700_mp");
//AUTO 			player SwitchToWeapon( "m40a3_mp" );
			level.activ SetOrigin( a_s_tp.origin );
			level.activ setplayerangles( a_s_tp.angles );
//AUTO 			level.activ takeallweapons();
//AUTO 			level.activ GiveWeapon("m40a3_mp");
//AUTO 			level.activ givemaxammo("m40a3_mp");
//AUTO 			level.activ GiveWeapon("remington700_mp");
//AUTO 			level.activ givemaxammo("remington700_mp");
//AUTO 			level.activ SwitchToWeapon( "m40a3_mp" );
			player freezeControls(1);
			level.activ freezeControls(1);
			wait 0.3;
//AUTO 			player iprintlnbold("^5Get ready for the ^1BATTLE !");
//AUTO 			level.activ iprintlnbold("^5Get ready for the ^1BATTLE !");
			wait 1;
//AUTO 			player iprintlnbold("^33");
//AUTO 			level.activ iprintlnbold("^33");
			wait 1;
//AUTO 			player iprintlnbold("^22");
//AUTO 			level.activ iprintlnbold("^22");
			wait 1;
//AUTO 			player iprintlnbold("^11");
//AUTO 			level.activ iprintlnbold("^11");
			wait 1;
			player freezeControls(0);
			level.activ freezeControls(0);			
			player death();
//AUTO 			iprintlnbold( "^2 " + player.name + " ^7is ^1DEAD !");
			s_trig triggerOn();
			b_trig triggerOn();
			k_trig triggerOn();
			r_trig triggerOn();
		}
}

tpbounce()
{
j_b_tp = getEnt("j_to_bounce", "targetname");
a_b_tp = getEnt("a_to_bounce", "targetname");
b_trig = getEnt("b_trig", "targetname");
o_trig = getEnt("o_trig", "targetname");
k_trig = getEnt("k_trig", "targetname");
s_trig = getEnt("s_trig", "targetname");
r_trig = getEnt("r_trig", "targetname");
	for(;;)
		{
			b_trig waittill("trigger", player);
			s_trig triggerOff();
			o_trig delete();
			k_trig triggerOff();
			b_trig triggerOff();
			r_trig triggerOff();
			player SetOrigin( j_b_tp.origin );
			player setplayerangles( j_b_tp.angles );
//AUTO 			iprintlnbold ( player.name + " has entered ^3Bounce ^7room" );
//AUTO 			player takeallweapons();
//AUTO 			player GiveWeapon("tomahawk_mp");
//AUTO 			player SwitchToWeapon( "tomahawk_mp" );
			level.activ SetOrigin( a_b_tp.origin );
			level.activ setplayerangles( a_b_tp.angles );
//AUTO 			level.activ takeallweapons();
//AUTO 			level.activ GiveWeapon("tomahawk_mp");
//AUTO 			level.activ SwitchToWeapon( "tomahawk_mp" );
			player freezeControls(1);
			level.activ freezeControls(1);
			wait 0.3;			
//AUTO 			player iprintlnbold("^5Get ready for the ^1BATTLE !");
//AUTO 			level.activ iprintlnbold("^5Get ready for the ^1BATTLE !");
//AUTO 			player iprintlnbold("^51 Fail ^7= ^1GG");
//AUTO 			level.activ iprintlnbold("^51 Fail ^7= ^1GG");
			wait 1;
//AUTO 			player iprintlnbold("^33");
//AUTO 			level.activ iprintlnbold("^33");
			wait 1;
//AUTO 			player iprintlnbold("^22");
//AUTO 			level.activ iprintlnbold("^22");
			wait 1;
//AUTO 			player iprintlnbold("^11");
//AUTO 			level.activ iprintlnbold("^11");
			wait 1;
			player freezeControls(0);
			level.activ freezeControls(0);
			player death();
//AUTO 			iprintlnbold( "^2 " + player.name + " ^7is ^1DEAD !");
			b_trig triggerOn();
			s_trig triggerOn();
			k_trig triggerOn();
			r_trig triggerOn();
		}
}

tpknife()
{
j_k_tp = getEnt("j_to_knife", "targetname");
a_k_tp = getEnt("a_to_knife", "targetname");
b_trig = getEnt("b_trig", "targetname");
o_trig = getEnt("o_trig", "targetname");
k_trig = getEnt("k_trig", "targetname");
s_trig = getEnt("s_trig", "targetname");
r_trig = getEnt("r_trig", "targetname");
	for(;;)
		{
			k_trig waittill("trigger", player);
			s_trig triggerOff();
			o_trig delete();
			b_trig triggerOff();
			k_trig triggerOff();
			r_trig triggerOff();
			player SetOrigin( j_k_tp.origin );
			player setplayerangles( j_k_tp.angles );
//AUTO 			iprintlnbold ( player.name + " has entered ^3Knife ^7room" );
//AUTO 			player takeallweapons();
//AUTO 			player GiveWeapon("knife_mp");
//AUTO 			player SwitchToWeapon( "knife_mp" );
			level.activ SetOrigin( a_k_tp.origin );
			level.activ setplayerangles( a_k_tp.angles );
//AUTO 			level.activ takeallweapons();
//AUTO 			level.activ GiveWeapon("knife_mp");
//AUTO 			level.activ SwitchToWeapon( "knife_mp" );
			player freezeControls(1);
			level.activ freezeControls(1);
			wait 0.3;
//AUTO 			player iprintlnbold("^5Get ready for the ^1BATTLE !");
//AUTO 			level.activ iprintlnbold("^5Get ready for the ^1BATTLE !");
			wait 1;
//AUTO 			player iprintlnbold("^33");
//AUTO 			level.activ iprintlnbold("^33");
			wait 1;
//AUTO 			player iprintlnbold("^22");
//AUTO 			level.activ iprintlnbold("^22");
			wait 1;
//AUTO 			player iprintlnbold("^11");
//AUTO 			level.activ iprintlnbold("^11");
			wait 1;
			player freezeControls(0);
			level.activ freezeControls(0);
			player death();
//AUTO 			iprintlnbold( "^2 " + player.name + " ^7is ^1DEAD !");
			k_trig triggerOn();
			s_trig triggerOn();
			b_trig triggerOn();
			r_trig triggerOn();
		}
}

tprun()
{
j_b_tp = getEnt("j_to_run", "targetname");
a_b_tp = getEnt("a_to_run", "targetname");
b_trig = getEnt("b_trig", "targetname");
o_trig = getEnt("o_trig", "targetname");
k_trig = getEnt("k_trig", "targetname");
s_trig = getEnt("s_trig", "targetname");
r_trig = getEnt("r_trig", "targetname");
	for(;;)
		{
			r_trig waittill("trigger", runner);
			runner.finishedRunRoom = false;
			level.activ.finishedRunRoom = false;
			thread run_finishtp_j(runner);
			thread run_finishtp_a(runner);
			s_trig triggerOff();
			o_trig delete();
			k_trig triggerOff();
			b_trig triggerOff();
			r_trig triggerOff();
			runner SetOrigin( j_b_tp.origin );
			runner setplayerangles( j_b_tp.angles );
//AUTO 			iprintlnbold ( runner.name + " has entered ^3Run ^7room" );
//AUTO 			runner takeallweapons();
//AUTO 			runner GiveWeapon("knife_mp");
//AUTO 			runner SwitchToWeapon( "knife_mp" );
			level.activ SetOrigin( a_b_tp.origin );
			level.activ setplayerangles( a_b_tp.angles );
//AUTO 			level.activ takeallweapons();
//AUTO 			level.activ GiveWeapon("knife_mp");
//AUTO 			level.activ SwitchToWeapon( "knife_mp" );
			runner freezeControls(1);
			level.activ freezeControls(1);
//AUTO 			wait 0.3;			
//AUTO 			runner iprintlnbold("^5Get ready!");
//AUTO 			level.activ iprintlnbold("^5Get ready!");
//AUTO 			wait 1;
//AUTO 			runner iprintlnbold("^33");
//AUTO 			level.activ iprintlnbold("^33");
//AUTO 			wait 1;
//AUTO 			runner iprintlnbold("^22");
//AUTO 			level.activ iprintlnbold("^22");
//AUTO 			wait 1;
//AUTO 			runner iprintlnbold("^11");
//AUTO 			level.activ iprintlnbold("^11");
//AUTO 			wait 1;
			runner freezeControls(0);
			level.activ freezeControls(0);
			runner death();
//AUTO 			iprintlnbold( "^2 " + runner.name + " ^7is ^1DEAD !");
			b_trig triggerOn();
			s_trig triggerOn();
			k_trig triggerOn();
			r_trig triggerOn();
		}
}

tpold()
{
j_o_tp = getEnt("j_to_old", "targetname");
b_trig = getEnt("b_trig", "targetname");
o_trig = getEnt("o_trig", "targetname");
k_trig = getEnt("k_trig", "targetname");
s_trig = getEnt("s_trig", "targetname");
r_trig = getEnt("r_trig", "targetname");
block = getEnt("old_block", "targetname");
block_trig = getEnt("old_block_trig", "targetname");
	for(;;)
		{
			o_trig waittill("trigger", player);
			s_trig delete();
			b_trig delete();
			k_trig delete();
			r_trig delete();
			player SetOrigin( j_o_tp.origin );
			player setplayerangles( j_o_tp.angles );
//AUTO 			iprintlnbold ( player.name + " has entered ^3Old ^7way" );
			block notsolid();
			block_trig setHintString("");
		}
}

death()
{
self waittill_any("death", "disconnect", "joined_spectator");
}

broomweap1()
{
trig = getEnt("broom_weap1", "targetname");
trig setHintString("Get a ^2Sniper");
	while(1)
	{
		trig waittill("trigger", player);
//AUTO 		player takeallweapons();
//AUTO 		player giveWeapon("m40a3_mp");
//AUTO 		player givemaxammo("m40a3_mp");
//AUTO 		player switchtoweapon("m40a3_mp");
	}
}

broomweap2()
{
trig = getEnt("broom_weap2", "targetname");
trig setHintString("Get a ^2Sniper");
	while(1)
	{
		trig waittill("trigger", player);
//AUTO 		player giveWeapon("remington700_mp");
//AUTO 		player givemaxammo("remington700_mp");
//AUTO 		player switchtoweapon("remington700_mp");
	}
}

run_fail1tp()
{
hit = getEnt("rroom_floor1_failtp", "targetname");
tp1 = getEnt("j_to_run", "targetname");
tp2 = getEnt("a_to_run", "targetname");
	while(1)
		{
			hit waittill("trigger", player);
			if (player.pers["team"] == "axis")
			{
			player setOrigin( tp2.origin );
			player setplayerangles( tp2.angles );
			}
			else if( player.pers["team"] == "allies")
			{
			player setOrigin( tp1.origin );
			player setplayerangles( tp1.angles );
			}
		}
}

run_fail2tp()
{
hit = getEnt("rroom_floor2_failtp", "targetname");
tp1 = getEnt("j_to_run2", "targetname");
tp2 = getEnt("a_to_run2", "targetname");
	while(1)
		{
			hit waittill("trigger", player);
			if (player.pers["team"] == "axis")
			{
			player setOrigin( tp2.origin );
			player setplayerangles( tp2.angles );
			}
			else if( player.pers["team"] == "allies")
			{
			player setOrigin( tp1.origin );
			player setplayerangles( tp1.angles );
			}
		}
}

give_rpg()
{
	trig = getEnt("rpg_trig", "targetname");
	while( 1 )
	{
		trig waittill("trigger", player);
//AUTO 		player giveWeapon("rpg_mp");
//AUTO 		player giveMaxAmmo("rpg_mp");
//AUTO 		player switchToWeapon("rpg_mp");
	}
}

ultimate_rpg()
{
	self endon ( "disconnect" );
    self endon ( "death" );
 
	while ( 1 )
	{
	currentWeapon = self getCurrentWeapon();
	if ( currentWeapon == "rpg_mp" )
	{
	self setWeaponAmmoClip( currentWeapon, 9999 );
//AUTO 	self GiveMaxAmmo( currentWeapon );
	}
	wait 0.05;
	}
}

run_finishtp_j(runner)
{
hit = getEnt("rroom_finishtp_j", "targetname");
tp1 = getEnt("j_to_run3", "targetname");
tp2 = getEnt("a_to_run3", "targetname");
	while(1)
		{
			hit waittill("trigger", player);
			player setOrigin( tp1.origin );
			player setplayerangles( tp1.angles );
//AUTO 			player takeallweapons();
//AUTO 			player GiveWeapon("m40a3_mp");
//AUTO 			player givemaxammo("m40a3_mp");
//AUTO 			player GiveWeapon("remington700_mp");
//AUTO 			player givemaxammo("remington700_mp");
//AUTO 			player SwitchToWeapon( "m40a3_mp" );
			runner.FinishedRunRoom = true;
//AUTO 			if(level.activ.finishedRunRoom == false){level.activ iPrintlnbold("^3The jumper finished and you have ^23 to the ^1LOSS");}
//AUTO 			wait 1;
//AUTO 			if(level.activ.finishedRunRoom == false){level.activ iPrintlnbold("^23");}
//AUTO 			wait 1;
//AUTO 			if(level.activ.finishedRunRoom == false){level.activ iPrintlnbold("^32");}
//AUTO 			wait 1;
//AUTO 			if(level.activ.finishedRunRoom == false){level.activ iPrintlnbold("^11");}
//AUTO 			wait 1;
			if(level.activ.finishedRunRoom == false)
			{
//AUTO 			level.activ iPrintlnbold("^1YOU LOST :<");
			level.activ setOrigin( tp2.origin );
			level.activ setplayerangles( tp2.angles );
//AUTO 			level.activ takeallweapons();
			level.activ freezeControls(1);
			}
		}
}

run_finishtp_a(runner)
{
hit = getEnt("rroom_finishtp_a", "targetname");
tp1 = getEnt("j_to_run3", "targetname");
tp2 = getEnt("a_to_run3", "targetname");
	while(1)
		{
			hit waittill("trigger", player);
			level.activ setOrigin( tp2.origin );
			level.activ setplayerangles( tp2.angles );
//AUTO 			level.activ takeallweapons();
//AUTO 			level.activ GiveWeapon("m40a3_mp");
//AUTO 			level.activ givemaxammo("m40a3_mp");
//AUTO 			level.activ GiveWeapon("remington700_mp");
//AUTO 			level.activ givemaxammo("remington700_mp");
//AUTO 			level.activ SwitchToWeapon( "m40a3_mp" );
			level.activ.FinishedRunRoom = true;
//AUTO 			if(runner.finishedRunRoom == false){runner iPrintlnbold("^3The activator finished and you have ^23 to the ^1LOSS");}
//AUTO 			wait 1;
//AUTO 			if(runner.finishedRunRoom == false){runner iPrintlnbold("^23");}
//AUTO 			wait 1;
//AUTO 			if(runner.finishedRunRoom == false){runner iPrintlnbold("^32");}
//AUTO 			wait 1;
//AUTO 			if(runner.finishedRunRoom == false){runner iPrintlnbold("^11");}
//AUTO 			wait 1;
			if(runner.finishedRunRoom == false)
			{
//AUTO 			runner iPrintlnbold("^1YOU LOST :<");
			runner setOrigin( tp1.origin );
			runner setplayerangles( tp1.angles );
//AUTO 			runner takeallweapons();
			runner freezeControls(1);
			}
		}
}

run_1to2_a()
{
hit = getEnt("rroom_1to2_a", "targetname");
tp = getEnt("a_to_run2", "targetname");
	while(1)
	{
	hit waittill("trigger", player);
	player setOrigin( tp.origin );
	player setplayerangles( tp.angles );
	}
}

run_1to2_j()
{
hit = getEnt("rroom_1to2_j", "targetname");
tp = getEnt("j_to_run2", "targetname");
	while(1)
	{
	hit waittill("trigger", player);
	player setOrigin( tp.origin );
	player setplayerangles( tp.angles );
	}
}

secret_tp1()
{
hit = getEnt("secret_tp1_trig", "targetname");
tp = getEnt("secret_tp1", "targetname");
	while(1)
	{
	hit waittill("trigger", player);
	player setOrigin( tp.origin );
	player setplayerangles( tp.angles );
	}
}

secret_tp2()
{
hit = getEnt("secret_tp2_trig", "targetname");
tp = getEnt("secret_tp2", "targetname");
	while(1)
	{
	hit waittill("trigger", player);
	player setOrigin( tp.origin );
	player setplayerangles( tp.angles );
	}
}

secret_tp3()
{
hit = getEnt("secret_tp3_trig", "targetname");
tp = getEnt("secret_tp3", "targetname");
	while(1)
	{
	hit waittill("trigger", player);
	player setOrigin( tp.origin );
	player setplayerangles( tp.angles );
	}
}

secret_tp4()
{
hit = getEnt("secret_tp4_trig", "targetname");
tp = getEnt("secret_tp4", "targetname");
	while(1)
	{
	hit waittill("trigger", player);
	player setOrigin( tp.origin );
	player setplayerangles( tp.angles );
	}
}

secret_tp5()
{
hit = getEnt("secret_tp5_trig", "targetname");
tp = getEnt("secret_tp5", "targetname");
	while(1)
	{
	hit waittill("trigger", player);
	player setOrigin( tp.origin );
	player setplayerangles( tp.angles );
	}
}

secret_tp6()
{
hit = getEnt("secret_tp6_trig", "targetname");
tp = getEnt("secret_tp6", "targetname");
	while(1)
	{
	hit waittill("trigger", player);
	player setOrigin( tp.origin );
	player setplayerangles( tp.angles );
	}
}

secret_tp7()
{
hit = getEnt("secret_tp7_trig", "targetname");
tp = getEnt("secret_tp7", "targetname");
	while(1)
	{
	hit waittill("trigger", player);
	player setOrigin( tp.origin );
	player setplayerangles( tp.angles );
	}
}

secret_tp8()
{
hit = getEnt("secret_tp8_trig", "targetname");
tp = getEnt("secret_tp8", "targetname");
	while(1)
	{
	hit waittill("trigger", player);
	player setOrigin( tp.origin );
	player setplayerangles( tp.angles );
	}
}

secret_tp9()
{
hit = getEnt("secret_tp9_trig", "targetname");
tp = getEnt("secret_tp9", "targetname");
	while(1)
	{
	hit waittill("trigger", player);
	player setOrigin( tp.origin );
	player setplayerangles( tp.angles );
	}
}

secret_tp10()
{
hit = getEnt("secret_tp10_trig", "targetname");
tp = getEnt("secret_tp10", "targetname");
	while(1)
	{
	hit waittill("trigger", player);
	player setOrigin( tp.origin );
	player setplayerangles( tp.angles );
	}
}

secret_tp11()
{
hit = getEnt("secret_tp11_trig", "targetname");
tp = getEnt("secret_tp11", "targetname");
	while(1)
	{
	hit waittill("trigger", player);
	player setOrigin( tp.origin );
	player setplayerangles( tp.angles );
	}
}

secret_tp12()
{
hit = getEnt("secret_tp12_trig", "targetname");
tp = getEnt("secret_tp12", "targetname");
	while(1)
	{
	hit waittill("trigger", player);
	player setOrigin( tp.origin );
	player setplayerangles( tp.angles );
	}
}

secret_tp13()
{
hit = getEnt("secret_tp13_trig", "targetname");
tp = getEnt("secret_tp13", "targetname");
	while(1)
	{
	hit waittill("trigger", player);
	player setOrigin( tp.origin );
	player setplayerangles( tp.angles );
	}
}

secret_tp14()
{
hit = getEnt("secret_tp14_trig", "targetname");
tp = getEnt("secret_tp14", "targetname");
	while(1)
	{
	hit waittill("trigger", player);
	player setOrigin( tp.origin );
	player setplayerangles( tp.angles );
	}
}

secret_tp15()
{
hit = getEnt("secret_tp15_trig", "targetname");
tp = getEnt("secret_tp15", "targetname");
	while(1)
	{
	hit waittill("trigger", player);
	player setOrigin( tp.origin );
	player setplayerangles( tp.angles );
	}
}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

