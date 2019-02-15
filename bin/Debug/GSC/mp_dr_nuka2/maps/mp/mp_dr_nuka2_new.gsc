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

//AUTO 	setdvar("g_speed" ,"190");
//AUTO 	setdvar("dr_jumpers_speed" ,"1");
	
	setdvar( "r_specularcolorscale", "1" );
	
	setdvar("r_glowbloomintensity0",".1");
	setdvar("r_glowbloomintensity1",".1");
	setdvar("r_glowskybleedintensity0",".1"); 

	thread startdoor();
	thread lift();
	
	thread secretopen();
	thread Teleport1();
	thread secrethard();
	thread secreteasy();
	
	//thread secreteasy_tele1();
	
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
	thread trap13();
	thread trap14();
	thread trap15();
	
	thread actielevator();
	thread actifastwalk();
	
	thread GetActivator();
	thread end();
	thread games();
	thread antiglitch();
	thread waitdead();
//AUTO 	thread sniper();
//AUTO 	thread sniper_sign();
//AUTO 	thread knife();
//AUTO 	thread knife_sign();
	//thread nade();
	//thread nadesign();
	thread nademoving();
	
//AUTO 	thread music();
	
	addTriggerToList( "trigger_trap1" );
	addTriggerToList( "trigger_trap2" );
	addTriggerToList( "trigger_trap3" );
	addTriggerToList( "trigger_trap4" );
	addTriggerToList( "trigger_trap5" );
	addTriggerToList( "trigger_trap6" );
	addTriggerToList( "trigger_trap7" );
	addTriggerToList( "trigger_trap8" );
	addTriggerToList( "trigger_trap9" );
	addTriggerToList( "trigger_trap10" );
	addTriggerToList( "trigger_trap11" );
	addTriggerToList( "trigger_trap12" );
	addTriggerToList( "trigger_trap13" );
	addTriggerToList( "trigger_trap14" );
	addTriggerToList( "trigger_trap15" );
	

}

addTriggerToList( name )
{
	if( !isDefined( level.trapTriggers ) )
		level.trapTriggers = [];
	level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

createhud(messages)
{
hud_start = NewHudElem();
hud_start.alignX = "center";
hud_start.alignY = "middle";
hud_start.horzalign = "center";
hud_start.vertalign = "middle";
hud_start.alpha = 1;
hud_start.x = 0;
hud_start.y = -150;
hud_start.font = "objective";
hud_start.fontscale = 2;
hud_start.glowalpha = 1;
hud_start.glowcolor = (1,0,0);
hud_start setText(messages);
hud_start SetPulseFX( 100, 4000, 500 );
wait 7;
if(isdefined(hud_start))
	hud_start destroy();
}

startdoor()
{
lootje = getent("startdoor","targetname");
{
wait 15;
lootje delete();
//AUTO iprintlnbold("^8Start door opened. ^5:>");
wait 2;
}
}

lift()
{

        lift=getent("lift","targetname");
	lift_trigger=getent("lift_trigger","targetname");
	


	while(1)
	{
		
                 
                lift_trigger waittill ("trigger");

                lift movey (720,4,1,1);

                wait(5);

		lift movey (-720,4,1,1);

                wait(2);
		
		
               	        

	}
}

Teleport1()
{
	trig = getEnt("trigger_teleport1", "targetname");
	tele1 = getEnt("origin_teleport1", "targetname");
	
	while(1)
	{
		trig waittill("trigger",player);
		player SetPlayerAngles( tele1.angles );
		player setOrigin(tele1.origin);
	}
}

secretopen()
{
	trig1 = getEnt("trigger_nepo1", "targetname");
	trig2 = getEnt("trigger_nepo2", "targetname");
	platform = getEnt("platform", "targetname");
	secretwall = getEnt("secretwall", "targetname");
	
	platform notsolid();
	trig2 hide();
	secretwall hide();
	secretwall notsolid();
	
	trig1 waittill ("trigger", player);
//AUTO 	iPrintLnBold("^2What now^5? ^2c:");
	trig2 show();
	trig2 waittill("trigger", player);
//AUTO 	iPrintLnBold("^2You can now enter^5. ^2:p");
	
	platform solid();
	secretwall solid();
	secretwall show();
	wait 50;
//AUTO 	iPrintLnBold("^6Alot of credit goes to Nepo!");
	wait 5;
//AUTO 	iPrintLnBold("^6She gave me idea about her name ontop ^5:>");
}

secrethard()
{
	trig = getEnt("trigger_secrethard", "targetname");
	tele1 = getEnt("origin_secrethard", "targetname");
	
	while(1)
	{
		trig waittill("trigger",player);
		player SetPlayerAngles( tele1.angles );
		player setOrigin(tele1.origin);
	}
}

secreteasy()
{
	trig = getEnt("trigger_secreteasy", "targetname");
	tele1 = getEnt("origin_secreteasy", "targetname");
	
	while(1)
	{
		trig waittill("trigger",player);
		player SetPlayerAngles( tele1.angles );
		player setOrigin(tele1.origin);
	}
}

secreteasy_tele1()
{
	trig = getEnt("trigger_easy_tp1", "targetname");
	tele1 = getEnt("origin_secreteasy","targetname");
	
	while(1)
	{
		trig waittill("trigger",player);
		player SetPlayerAngles( tele1.angles );
		player setOrigin(tele1.origin);
	}
}

trap1()
{
	trig = getEnt( "trigger_trap1", "targetname" );
	level endon("trigger");
	brushGroup1 = getent( "trap1_1", "targetname" );
	brushGroup2 = getent( "trap1_2", "targetname" );

	trig SetHintString("^5Activate");
	trig waittill( "trigger", player );
	trig delete();
	
	brushGroup1[randomInt(brushGroup1.size)] notSolid();
	brushGroup2[randomInt(brushGroup2.size)] notSolid();
}

trap2()
{
	trig = getEnt("trigger_trap2", "targetname");
	level endon("trigger");
	trap = getEnt("trap2", "targetname");
	secret = getEnt("actisecret", "targetname");
	trig SetHintString("^5Activate");
	trig waittill("trigger", player);
	
	secret notsolid();
	trig delete();
	
	trap hide();
	trap notsolid();
	wait 5;
	trap show();
	trap solid();
}

trap3()
{
	trig = getEnt("trigger_trap3", "targetname");
	level endon("trigger");
	platform = getEnt("trap3", "targetname");
	trig SetHintString("^5Activate");
	trig waittill("trigger", player);
	
	trig delete();
	
	platform hide();
	platform notsolid();
	wait 5;
	platform show();
	platform solid();
}

trap4()
{
	trig = getEnt("trigger_trap4", "targetname");
	level endon("trigger");
	platform = getEnt("trap4", "targetname");
	trig SetHintString("^5Activate");
	trig waittill("trigger", player);
	
	trig delete();
	
	for(;;)
    {
		platform rotateRoll (-360, 3);
		wait 8;
	}
}

trap5()
{
	trig = getEnt("trigger_trap5", "targetname");
	level endon("trigger");
	platform = getEnt("trap5", "targetname");
	trig SetHintString("^5Activate");
	trig waittill("trigger", player);
	
	trig delete();
	
	for(;;)
	{
		platform rotateRoll (-360, 3);
		wait 10;
		platform rotateRoll (360, 3);
		wait 10;
		platform rotatePitch (-360, 3);
		wait 10;
		platform rotatePitch (360, 3);
	}
}

trap6()
{
	trig = getEnt("trigger_trap6", "targetname");
	level endon("trigger");
	platform = getEnt("trap6", "targetname");
	//death = getEnt("trap6death", "targetname");
	trig SetHintString("^5Activate");
	trig waittill("trigger", player);
	
	trig delete();
	
	for(;;)
	{
		platform rotatePitch (-360, 4);
		//death rotatePitch (-360, 4);
		wait 1;
	}
}

trap7()
{
	trig = getEnt("trigger_trap7", "targetname");
	level endon("trigger");
	trap_a = getEnt("trap7a", "targetname");
	trap_b = getEnt("trap7b", "targetname");
	trap_c = getEnt("trap7c_test", "targetname");
	trap_d = getEnt("trap7d", "targetname");
	trap_e = getEnt("trap7e", "targetname");
	
	trig SetHintString("^5Activate");
	trig waittill("trigger", player);
	
	trig delete();
	
	trap_a hide();
	trap_a notsolid();
	wait 0.05;
	trap_b hide();
	trap_b notsolid();
	wait 0.1;
	trap_c hide();
	trap_c notsolid();
	wait 0.15;
	trap_d hide();
	trap_d notsolid();
	wait 0.2;
	trap_e hide();
	trap_e notsolid();
	wait 2.5;
	
	trap_e show();
	trap_e solid();
	wait 0.2;
	trap_d show();
	trap_d solid();
	wait 0.15;
	trap_c show();
	trap_c solid();
	wait 0.1;
	trap_b show();
	trap_b solid();
	wait 0.5;
	trap_a show();
	trap_a solid();
	wait 2.5;
	
	
	for(;;)
	{
	trap_a hide();
	trap_a notsolid();
	wait 1;
	trap_b hide();
	trap_b notsolid();
	wait 1;
	trap_c hide();
	trap_c notsolid();
	wait 1;
	trap_d hide();
	trap_d notsolid();
	wait 1;
	trap_e hide();
	trap_e notsolid();
	wait 1;
	
	trap_e show();
	trap_e solid();
	wait 1;
	trap_d show();
	trap_d solid();
	wait 1;
	trap_c show();
	trap_c solid();
	wait 1;
	trap_b show();
	trap_b solid();
	wait 1;
	trap_a show();
	trap_a solid();
	wait 1;
	}
}

trap8()
{
	trig = getEnt("trigger_trap8", "targetname");
	level endon("trigger");
	trap = getEnt("trap8", "targetname");
	trap_red = getEnt("trap8_red", "targetname");
	trig SetHintString("^5Activate");
	trig waittill("trigger", player);
	
	trig delete();
	
	trap_red notsolid();
	trap hide();
	trap notsolid();
	wait 10;
	trap_red solid();
}

trap9()
{
	trig = getEnt("trigger_trap9", "targetname");
	level endon("trigger");
	trap_a = getEnt("trap9a", "targetname");
	trap_b = getEnt("trap9b", "targetname");
	trig SetHintString("^5Activate");
	trig waittill("trigger", player);
	
	trig delete();
	
	for(;;)
	{
		trap_a rotateRoll(360, 3);
		trap_b rotateRoll(-360, 3);
		wait 6;
	}
}

trap10()
{
	trig = getEnt("trigger_trap10", "targetname");
	level endon("trigger");
	trap_a = getEnt("trap10a", "targetname");
	trap_b = getEnt("trap10b", "targetname");
	trap_c = getEnt("trap10c", "targetname");
	
	trap_a_2 = getEnt("trap10a_2", "targetname");
	trap_b_2 = getEnt("trap10b_2", "targetname");
	trap_c_2 = getEnt("trap10c_2", "targetname");
	
	trap_a_3 = getEnt("trap10a_3", "targetname");
	trap_b_3 = getEnt("trap10b_3", "targetname");
	trap_c_3 = getEnt("trap10c_3", "targetname");
	
	trig SetHintString("^5Activate");
	trig waittill("trigger", player);
	
	trig delete();
	
	while(1)
	{
		trap_a rotateyaw (360, 1);
		trap_b rotateyaw (360, 1);
		trap_c rotateyaw (360, 1);
		trap_a_3 rotateyaw (360, 1);
		trap_b_3 rotateyaw (360, 1);
		trap_c_3 rotateyaw (360, 1);
		trap_a waittill ("rotatedone");
		
		trap_a_2 rotateyaw (360, 1);
		trap_b_2 rotateyaw (360, 1);
		trap_c_2 rotateyaw (360, 1);
		trap_a_2 waittill ("rotatedone");
	}
}

trap11()
{
	trig = getEnt("trigger_trap11", "targetname");
	level endon("trigger");
	trap = getEnt("trap11death", "targetname");
	trapwater = getEnt("trap11water", "targetname");
	trig SetHintString("^5Activate");
	trig waittill("trigger", player);
	
	trig delete();
	
	trap movez (65, 1);
	trapwater movez (100, 1);
	wait 4;
	trap movez (-65, 1);
	trapwater movez (-100, 1);
}

trap12()
{
	trig = getEnt("trigger_trap12", "targetname");
	level endon("trigger");
	
	trap_a_1 = getEnt("trap12a_1", "targetname");
	trap_a_2 = getEnt("trap12a_2", "targetname");
	
	trap_b_1 = getEnt("trap12b_1", "targetname");
	trap_b_2 = getEnt("trap12b_2", "targetname");
	
	trap_c_1 = getEnt("trap12c_1", "targetname");
	trap_c_2 = getEnt("trap12c_2", "targetname");
	
	trig SetHintString("^5Activate");
	trig waittill("trigger", player);
	
	trig delete();
	
	for(;;)
	{
		trap_a_1 rotateyaw (360, 1);
		trap_a_2 rotateyaw (-360, 1);
		trap_b_1 rotateyaw (-360, 1);
		trap_b_2 rotateyaw (360, 1);
		trap_c_1 rotateyaw (360, 1);
		trap_c_2 rotateyaw (-360, 1);
		trap_a_1 waittill ("rotatedone");
	}
}

trap13()
{
	trig = getEnt("trigger_trap13", "targetname");
	level endon("trigger");
	
	trapa = getEnt("trap13a", "targetname");
	trapb = getEnt("trap13b", "targetname");
	
	trig SetHintString("^5Activate");
	trig waittill("trigger", player);
	
	trig delete();
	
	for(;;)
	{
		trapa rotateyaw (360, 1);
		trapa rotatepitch (360, 1);
		trapb rotateyaw (-360, 1);
		trapb rotatepitch (-360, 1);
		trapa waittill ("rotatedone");
		wait 5;
	}
}

trap14()
{
	trig = getEnt("trigger_trap14", "targetname");
	level endon("trigger");
	
	trapa = getEnt("trap14a", "targetname");
	trapb = getEnt("trap14b", "targetname");
	
	trig SetHintString("^5Activate");
	trig waittill("trigger", player);
	
	trig delete();
	
	for(;;)
	{
		trapa rotateRoll (360, 3);
		wait 1;
		trapb rotateRoll (-360, 3);
		trapa waittill ("rotatedone");
	}
}

trap15()
{
	trig = getEnt("trigger_trap15", "targetname");
	level endon("trigger");
	trap = getEnt("trap15", "targetname");
	
	trig SetHintString("^5Activate");
	trig waittill("trigger", player);
	
	trig delete();
	
	for(;;)
	{
		trap rotateRoll (360, 4);
		trap waittill ("rotatedone");
	}
}

actielevator()
{
	trig = getEnt("trigger_acti_elevatorup", "targetname");
	platform = getEnt("acti_elevator", "targetname");
	wall = getEnt("acti_elevator_wall", "targetname");
	
	wall notsolid();
	
	while(1)
	{
		trig waittill ("trigger");
		trig hide();
		wall solid();
		platform movez (304,2,1,1);
		wait(5);
		platform movez (-304,3,1,1);
		wait(4);
		trig show();
		wall notsolid();
	}
}

actifastwalk()
{
	trig = getEnt("trigger_acti_fast_walk", "targetname");
	platform = getEnt("acti_fast_walk", "targetname");
	white = getEnt("acti_fast_walk_white", "targetname");
	
	while(1)
	{
		trig waittill ("trigger");
		trig hide();
		white hide();
		white notsolid();
		platform movex (-2416,3,1,1);
		platform waittill ("movedone");
		wait(5);
		platform movex (2416,6,1,1);
		platform waittill ("movedone");
		white show();
		white solid();
		wait(4);
		trig show();
	}
}

GetActivator()
{
	players = getentarray( "player", "classname" );
	
	for(i = 0;i < players.size;i++)
	{
		player = players[i];
		
		if( isdefined( player ) && isplayer( player ) && isalive( player ) && player.pers["team"] == "axis"	)
			return player;
	}
	
	return "Noactivator";
}

end()
{
trigger = GetEnt( "end", "targetname" );
	{
	trigger waittill ("trigger", user);
		{
//AUTO 		iprintlnbold( "^7 " + user.name + " ^5 has finished first !");
		wait 0.1;
		}
	}
}

games()
{
level.games_trig = getEnt( "minigames", "targetname");
games = getEnt( "minigames_ori", "targetname" );

while(1)
{
level.games_trig waittill( "trigger", player );
if( !isDefined( level.games_trig ) )
return;

player SetPlayerAngles( games.angles );
player setOrigin( games.origin );
//AUTO iPrintlnBold( " ^5" + player.name + " ^7has entered ^7the ^5game ^7selection !!!" );
//AUTO player TakeAllWeapons();
player antiglitch();


while( isAlive( player ) && isDefined( player ) )
if( isDefined( level.activ ) && isAlive( level.activ ) )
wait 1;
}
}

antiglitch()
{ 
self common_scripts\utility::waittill_any("death","disconnect");
//AUTO iPrintlnBold("^5"+self.name+" ^7has ^1DIED"); 
//AUTO iPrintlnBold("^5Selection Room ^7is ^7now ^1OPEN^7!!"); 
}

waitdead() //ng2
{
bounce = getent("bounce_trig", "targetname");
sniper = getent("sniper_trig", "targetname");
knife = getent("knife_trig", "targetname");
nade = getent("nade_trig", "targetname");

//bounce triggerOff();
sniper hide();
knife hide();
//nade triggerOff();

self common_scripts\utility::waittill_any("death","disconnect");
activator = GetActivator();
activator freezeControls(false);

//bounce triggerOn();
sniper show();
knife show();
//nade triggerOn();
}

sniper()
{
	sniper = getent("sniper_trig","targetname");
	jumper = getent("origin_jumper_snip","targetname");
	acti = getent("origin_acti_snip","targetname");
	//noobsnip = getEnt("trigger_noob_snip", "targetname");
	for(;;)
	{
		sniper waittill("trigger", player);
		player thread waitdead();
		activator = GetActivator();
		
		player freezeControls(true);
		player setorigin(jumper.origin);
		player setPlayerAngles(jumper.angles);
		
		activator freezeControls(true);
		activator setorigin(acti.origin);
		activator setPlayerAngles(acti.angles);
		
//AUTO 		player takeallweapons();
//AUTO 		activator takeallweapons();
		
//AUTO 		player giveweapon("m40a3_mp");
//AUTO 		activator giveweapon("m40a3_mp");
//AUTO 		player giveweapon("remington700_mp");
//AUTO 		activator giveweapon("remington700_mp");
		
		thread createhud(player.name + " ^5selected ^7snipah ^4war!");
		//noobsnip triggerOn();
		wait 5;
//AUTO 		player iprintlnbold("^5FIGHT ^7!!!");
//AUTO 		activator iprintlnbold("^5FIGHT ^7!!!");
		
		player freezeControls(false);
		activator freezeControls(false);
		
//AUTO 		player switchtoweapon("m40a3_mp");
//AUTO 		activator switchtoweapon("m40a3_mp");
//AUTO 		player switchtoweapon("remington700_mp");
//AUTO 		activator switchtoweapon("r700_mp_mp");
		
//AUTO 		player givemaxammo("m40a3_mp");
//AUTO 		activator givemaxammo("m40a3_mp");
//AUTO 		player givemaxammo("remington700_mp");
//AUTO 		activator givemaxammo("remington700_mp");
	}
}

sniper_sign()
{
	sign = getent("sniper_sign", "targetname");
	
	for(;;)
	{
		sign rotateYaw(360, 3);
		wait 3;
	}
}

knife() //Knife room lel
{
	knife = getent("knife_trig","targetname");
	jumper = getent("origin_jumper_knife","targetname");
	acti = getent("origin_acti_knife","targetname");
	for(;;)
	{
		knife waittill("trigger", player);
		player thread waitdead();
		activator = GetActivator();
		
//AUTO 		player takeallweapons();
//AUTO 		activator takeallweapons();
		
		player freezeControls(true);
		player setorigin(jumper.origin);
		player setPlayerAngles(jumper.angles);
		activator freezeControls(true);
		activator setorigin(acti.origin);
		activator setPlayerAngles(acti.angles);
		
//AUTO 		activator giveweapon("tomahawk_mp");
//AUTO 		player giveweapon("tomahawk_mp");
		thread createhud(player.name + " ^5Selected ^7Knife ^5room^7!!");
		wait 5;
		
		player freezeControls(false);
		activator freezeControls(false);
//AUTO 		player switchtoweapon("tomahawk_mp");
//AUTO 		activator switchtoweapon("tomahawk_mp");
	}
}

knife_sign()
{
	sign = getent("knife_sign", "targetname");
	for(;;)
	{
		sign rotateYaw(-360, 3);
		wait 3;
	}
}

//knife_secret()
//{
	//redline = getent("line", "targetname");
	//trig = getent("trig_knife_secret", "targetname");
	//wall = getent("knifewall", "targetname");
	
	//trig waittill("trigger", player);
	
	//while(1)
	//{
		//redline notsolid();
		//wait 5;
		//redline solid();
		//wall notsolid();
		//wait 7;
		//wall solid();
	//}
//}

nademoving()
{
	vertikali1 = getEnt("nade_vertikali1", "targetname");
	vertikali2 = getEnt("nade_vertikali2", "targetname");
	
	vertikali3 = getEnt("nade_vertikali3", "targetname");
	vertikali4 = getEnt("nade_vertikali4", "targetname");
	
	vertikali5 = getEnt("nade_vertikali5", "targetname");
	vertikali6 = getEnt("nade_vertikali6", "targetname");
	
	horizontali1 = getEnt("nade_horizontali1", "targetname");
	horizontali2 = getEnt("nade_horizontali2", "targetname");
	
	horizontali3 = getEnt("nade_horizontali3", "targetname");
	horizontali4 = getEnt("nade_horizontali4", "targetname");
	
	horizontali5 = getEnt("nade_horizontali5", "targetname");
	horizontali6 = getEnt("nade_horizontali6", "targetname");
	
	horizontali7 = getEnt("nade_horizontali7", "targetname");
	horizontali8 = getEnt("nade_horizontali8", "targetname");
	
	horizontali9 = getEnt("nade_horizontali9", "targetname");
	horizontali10 = getEnt("nade_horizontali10", "targetname");
	
	horizontali11 = getEnt("nade_horizontali11", "targetname");
	horizontali12 = getEnt("nade_horizontali12", "targetname");
	wait 30;

	for(;;)
	{
		vertikali1 movez (26, 2);
		vertikali2 movez (-26, 2);
		horizontali7 movex (54, 2);
		horizontali8 movex (-54, 2);
		wait 2.5;
		vertikali1 movez (-26, 2);
		vertikali2 movez (26, 2);
		horizontali7 movex (-54, 2);
		horizontali8 movex (54, 2);
		wait 2.5;
		vertikali5 movex (-98, 2);
		vertikali6 movex (98, 2);
		horizontali9 movex (14, 2);
		horizontali10 movex (-14, 2);
		wait 2.5;
		vertikali5 movex (98, 2);
		vertikali6 movex (-98, 2);
		horizontali9 movex (-14, 2);
		horizontali10 movex (14, 2);
		wait 2.5;
	}
}

music()
{

    level waittill( "round_started" );
    
    wait 1;
    
//AUTO     ambientPlay( "song1" );
}

