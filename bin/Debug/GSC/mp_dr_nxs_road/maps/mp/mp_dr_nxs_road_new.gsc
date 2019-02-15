main()
{
//AUTO 	AmbientPlay( "animals");	
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);

	thread creator();
	thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap5();
	thread cut();
	thread finish();
//AUTO 	thread knife();
	thread pistol();
//AUTO 	thread sniper();

	
		addTriggerToList("trap1_trig");
		addTriggerToList("trap2_trig");
		addTriggerToList("trap3_trig");
		addTriggerToList("trap4_trig");
		addTriggerToList("trap5_trig");
}

addTriggerToList( name )
{
	if( !isDefined( level.trapTriggers ) )
	level.trapTriggers = [];
	level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

creator()
{

	for(;;)
	{
	wait 10;
//AUTO 	iprintln ("^1>> ^5Map created by ^3kkk35 ^5for ^1Nexus Team");
	wait 10;
//AUTO 	iprintln ("^1>> ^5Good Luck & Have Fun :)");
	wait 10;
//AUTO 	iprintln ("^1>> ^5You playing on Beta version.");
	wait 10;
//AUTO 	iprintln ("^1>> ^5Thanks for playing on the map!");
	}
}

trap1()
{
	trig = getent("trap1_trig" ,"targetname");
	level endon("trigger");
	trap1_a = getent("trap1_a" ,"targetname");
	trap1_b = getent("trap1_b" ,"targetname");
	trap1_a_dmg = getent("trap1_a_dmg" ,"targetname");
	trap1_b_dmg = getent("trap1_b_dmg" ,"targetname");

	trap1_a_dmg enablelinkto();
	trap1_a_dmg linkto(trap1_a);
	trap1_b_dmg enablelinkto();
	trap1_b_dmg linkto(trap1_b);

	trig sethintstring("Press ^3&&1 ^7for activate.");
	trig waittill ("trigger", player);
	trig sethintstring("^1Activated^2!");

	while(1)
	{

	trap1_a moveY ( 620, 1.5);
	wait 0.5;
	trap1_b moveY ( 620, 1.5);
	wait 2;
	trap1_a rotateYaw ( 180, 1);
	wait 0.5;
	trap1_b rotateYaw ( 180, 1);
	wait 2;
	trap1_a moveY (-620, 1.5);
	wait 0.5;
	trap1_b moveY (-620, 1.5);
	wait 2;
	trap1_a rotateYaw ( 180, 1);
	wait 0.5;
	trap1_b rotateYaw ( 180, 1);
	wait 2;
}
}

trap2()
{
	trap2 = getent("trap2", "targetname");
	level endon("trigger");
	trig = getent("trap2_trig", "targetname");

	trig sethintstring("Press ^3&&1 ^7for activate.");
	trig waittill ("trigger", player);
	trig sethintstring("^1Activated^2!");
	
	trap2 moveZ ( 55, 1);
	wait 5;
	trap2 moveZ (-55, 1);
}

trap3()
{
	trap3_a = getent("trap3_a", "targetname");
	level endon("trigger");
	trap3_b = getent("trap3_b", "targetname");
	trig = getent("trap3_trig", "targetname");

	trig sethintstring("Press ^3&&1 ^7for activate.");
	trig waittill ("trigger", player);
	trig sethintstring("^1Activated^2!");

	trap3_a delete();
	trap3_b notsolid();
}

trap4()
{
	trap4_a = getent("trap4_a", "targetname");
	level endon("trigger");
	trap4_b = getent("trap4_b", "targetname");
	trap4_dmg = getent("trap4_dmg", "targetname");
	trig = getent("trap4_trig", "targetname");

	
	trap4_a Notsolid();
	trap4_a Hide();
	trap4_dmg enablelinkto();

	trap4_dmg Triggeroff();
	trap4_b NotSolid();
	trap4_b Hide();

	trig sethintstring("Press ^3&&1 ^7for activate.");
	trig waittill ("trigger", player);
	trig sethintstring("^1Activated^2!");

	trap4_a Show();
	trap4_a Solid();

	wait 3;

	trap4_dmg Triggeron();
	trap4_b Show();
	trap4_b Solid();
	trap4_dmg linkto(trap4_b);

	trap4_b moveX (-460, 1.5);
	wait 2;
	trap4_b moveX (460, 1.5);
	wait 2;
	trap4_b moveX (-460, 1.5);
	wait 2;
	trap4_b moveX (460, 1.5);
	wait 2;
	trap4_b moveX (-460, 1.5);
	wait 2;
	trap4_b moveX (460, 1.5);

	wait 5;
	
	trap4_dmg Unlink();
	trap4_a Notsolid();
	trap4_a Hide();

	trap4_dmg Triggeroff();
	trap4_b NotSolid();
	trap4_b Hide();
}

trap5()
{
	trap5 = getent("trap5", "targetname");
	level endon("trigger");
	trig = getent("trap5_trig", "targetname");

	trap5 Notsolid();
	trap5 Hide();

	trig sethintstring("Press ^3&&1 ^7for activate.");
	trig waittill ("trigger", player);
	trig sethintstring("^1Activated^2!");

	trap5 Solid();
	trap5 Show();	
}

finish()
{
	trig = getent ("finish", "targetname");
	end = getent ("finished", "targetname");

	while(1)
	{	
	trig waittill ("trigger", player);
	player SetOrigin (end.origin);
	player SetPlayerAngles (end.angles);
//AUTO 	wait 0.1;
	}
}

cut()
{
	trig = getent ("cut", "targetname");
	end = getent ("cutten", "targetname");

	while(1)
	{
	trig setHintstring("WTf? What do u do, m8?");	
	trig waittill ("trigger", player);
	player SetOrigin (end.origin);
	player SetPlayerAngles (end.angles);
//AUTO 	wait 0.1;
}
}

knife()
{
	level.knife_trig = getEnt( "knife_t", "targetname");
	jump = getEnt( "knife_j", "targetname" );
	acti = getEnt( "knife_a", "targetname" );
	
	while(1)
	{
		level.knife_trig SetHintstring ("Press ^3&&1 ^7for ^2Knife RooM!");
		level.knife_trig waittill( "trigger", player );
		level.knife_trig SetHintstring ("^1Wait!");
		if( !isDefined( level.knife_trig ) )
			return;

		level.sniper_trig delete();
		level.pistol_trig delete();

		player SetPlayerAngles( jump.angles );
		player setOrigin( jump.origin );
//AUTO 		player TakeAllWeapons();
//AUTO 		player GiveWeapon( "knife_mp" );
//AUTO 		player giveMaxAmmo( "knife_mp" );
		level.activ setPlayerangles( acti.angles );
		level.activ setOrigin( acti.origin );
//AUTO 		level.activ TakeAllWeapons();
//AUTO 		level.activ GiveWeapon( "knife_mp" );
//AUTO 		level.activ GiveMaxAmmo( "knife_mp" );
		player freezeControls(1);
		level.activ freezeControls(1);
		wait 0.05;
//AUTO 		player switchToWeapon( "knife_mp" );
//AUTO 		level.activ switchToWeapon( "knife_mp" );
		level.activ setclientDvar("cg_fovscale", 1.3);
		player setclientDvar("cg_fovscale", 1.3);
//AUTO   		iPrintLnBold("^1" + player.name + " ^3has choosen ^5Knife^7!");
		wait 1;
//AUTO 		iPrintLnBold("^3[3]");
		wait 1;
//AUTO 		iPrintLnBold("^2[2]");
		wait 1;
//AUTO 		iPrintLnBold("^1[1]");
		wait 1;
//AUTO 		iPrintLnBold("^5[FIGHT!]");
		player freezeControls(0);
		level.activ freezeControls(0);
	
	
            while( isAlive( player ) && isDefined( player ) )
		wait 1;
	}
}

pistol()
{
	level.pistol_trig = getEnt( "pistol_t", "targetname");
	jump = getEnt( "pistol_j", "targetname" );
	acti = getEnt( "pistol_a", "targetname" );
	
	while(1)
	{
		level.pistol_trig SetHintstring ("Press ^3&&1 ^7for ^2Pistol RooM!");
		level.pistol_trig waittill( "trigger", player );
		level.pistol_trig SetHintstring ("^1Wait!");
		if( !isDefined( level.pistol_trig ) )
			return;


		level.sniper_trig delete();
		level.knife_trig delete();

		player SetPlayerAngles( jump.angles );
		player setOrigin( jump.origin );
//AUTO 		player TakeAllWeapons();
//AUTO 		player GiveWeapon( "deserteagle_mp" );
//AUTO 		player GiveWeapon( "knife_mp" );
//AUTO 		player giveMaxAmmo( "deserteagle_mp" );
//AUTO 		player giveMaxAmmo( "knife_mp" );
		level.activ setPlayerangles( acti.angles );
		level.activ setOrigin( acti.origin );
//AUTO 		level.activ TakeAllWeapons();
//AUTO 		level.activ GiveWeapon( "deserteagle_mp" );
//AUTO 		level.activ GiveWeapon( "knife_mp" );
//AUTO 		level.activ GiveMaxAmmo( "deserteagle_mp" );
//AUTO 		level.activ GiveMaxAmmo( "knife_mp" );
		player freezeControls(1);
		level.activ freezeControls(1);
		wait 0.05;
//AUTO 		player switchToWeapon( "deserteagle_mp" );
//AUTO 		player switchToWeapon( "knife_mp" );
//AUTO 		level.activ SwitchToWeapon( "deserteagle_mp" );
//AUTO 		level.activ switchToWeapon( "knife_mp" );
		level.activ setclientDvar("cg_fovscale", 1.3);
		player setclientDvar("cg_fovscale", 1.3);
//AUTO   		iPrintLnBold("^1" + player.name + " ^3has choosen ^5Pistol War^7!");
		wait 1;
//AUTO 		iPrintLnBold("^33");
		wait 1;
//AUTO 		iPrintLnBold("^22");
		wait 1;
//AUTO 		iPrintLnBold("^11");
		wait 1;
//AUTO 		iPrintLnBold("^5FIGHT!");
		player freezeControls(0);
		level.activ freezeControls(0);
	
	
            while( isAlive( player ) && isDefined( player ) )
		wait 1;
	}
}

sniper()
{
	level.sniper_trig = getEnt( "sniper_t", "targetname");
	jump = getEnt( "sniper_j", "targetname" );
	acti = getEnt( "sniper_a", "targetname" );
	
	while(1)
	{
		level.sniper_trig SetHintstring ("Press ^3&&1 ^7for ^2Sniper RooM!");
		level.sniper_trig waittill( "trigger", player );
		level.sniper_trig SetHintstring ("^1Wait!");
		if( !isDefined( level.sniper_trig ) )
			return;

		level.knife_trig delete();
		level.pistol_trig delete();

		player SetPlayerAngles( jump.angles );
		player setOrigin( jump.origin );
//AUTO 		player TakeAllWeapons();
//AUTO 		player GiveWeapon( "remington700_mp" );
//AUTO 		player GiveWeapon( "m40a3_mp" );
//AUTO 		player giveMaxAmmo( "remington700_mp" );
//AUTO 		player giveMaxAmmo( "m40a3_mp" );
		level.activ setPlayerangles( acti.angles );
		level.activ setOrigin( acti.origin );
//AUTO 		level.activ TakeAllWeapons();
//AUTO 		level.activ GiveWeapon( "remington700_mp" );
//AUTO 		level.activ GiveWeapon( "m40a3_mp" );
//AUTO 		level.activ GiveMaxAmmo( "remington700_mp" );
//AUTO 		level.activ GiveMaxAmmo( "m40a3_mp" );
		player freezeControls(1);
		level.activ freezeControls(1);
		wait 0.05;
//AUTO 		player switchToWeapon( "remington700_mp" );
//AUTO 		player switchToWeapon( "m40a3_mp" );
//AUTO 		level.activ SwitchToWeapon( "remington700_mp" );
//AUTO 		level.activ switchToWeapon( "m40a3_mp" );
		level.activ setclientDvar("cg_fovscale", 1.3);
		player setclientDvar("cg_fovscale", 1.3);
//AUTO   		iPrintLnBold("^1" + player.name + " ^3has choosen ^5Sniper^7!");
		wait 1;
//AUTO 		iPrintLnBold("^33");
		wait 1;
//AUTO 		iPrintLnBold("^22");
		wait 1;
//AUTO 		iPrintLnBold("^11");
		wait 1;
//AUTO 		iPrintLnBold("^5FIGHT!");
		player freezeControls(0);
		level.activ freezeControls(0);
	
	
            while( isAlive( player ) && isDefined( player ) )
		wait 1;
	}
}

