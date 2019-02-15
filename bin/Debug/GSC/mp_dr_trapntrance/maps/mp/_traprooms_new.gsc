main()
{
	thread trapsniper();
	thread trapknife();
	thread trapshotgun();
	thread trapdeagle();

    level.exploderoom = LoadFX("shiet/orb_explosion");
    level.orbs = LoadFX("shiet/magic_orbs");
}

trapsniper()
{

	level endon("trigger");
	level.sniper_trigger = getEnt( "trapsniper", "targetname");
    jump = getEnt ("rooms_vol1_j", "targetname");
    acti = getEnt ("rooms_vol1_a", "targetname");
    explode = getEnt("roomorigin1", "targetname");
    level.sniper_trigger setHintString("[^1USE^7] to enter ^1Sniper");

     while(1)
    {
    	level.sniper_trigger setHintString("[^1USE^7] to enter ^1Sniper");
        level.sniper_trigger waittill( "trigger", player );
        if( !isDefined( level.sniper_trigger ) )
            return;

		level.shotgun_trigger delete();
		level.knife_trigger delete();
		level.deagle_trigger delete();    
		
		player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );

		wait 0.5;
        ambientStop( 1.5 );
//AUTO         ambientPlay("traproom");

//AUTO 		player takeallweapons();
//AUTO 		player GiveWeapon( "m40a3_mp" );
//AUTO 		player GiveWeapon( "remington700_mp" );
//AUTO         player SwitchtoWeapon( "m40a3_mp" );

//AUTO         level.activ takeallweapons();
//AUTO 		level.activ GiveWeapon( "m40a3_mp" );
//AUTO 		level.activ GiveWeapon( "remington700_mp" );
//AUTO         level.activ SwitchtoWeapon( "m40a3_mp" );

        player FreezeControls(1);
		level.activ FreezeControls(1);

		noti = SpawnStruct();
            noti.titleText = "Trap Sniper";
            noti.notifyText = level.activ.name + " ^1VS^7 " + player.name;
            noti.duration = 6;
            noti.glowcolor = (0, 0, 1.0);
            players = getEntArray("player", "classname");
            for(i=0;i<players.size;i++)
            players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
            wait 2;

        playFx ( level.exploderoom, explode.origin );
        playFX ( level.orbs, (-7160, 3256, 1864));

        wait 5;

//AUTO         iPrintLnBold("Fight!");

		player FreezeControls(0);
		level.activ FreezeControls(0);


        while( isAlive( player ) && isDefined( player ) )
            wait 1;

    }
}

trapshotgun()
{

	level endon("trigger");
	level.shotgun_trigger = getEnt( "trapshotgun", "targetname");
    jump = getEnt ("rooms_vol1_j", "targetname");
    acti = getEnt ("rooms_vol1_a", "targetname");
    explode = getEnt("roomorigin1", "targetname");
    level.shotgun_trigger setHintString("[^1USE^7] to enter ^1Shotgun");

     while(1)
    {
    	level.shotgun_trigger setHintString("[^1USE^7] to enter ^1Shotgun");
        level.shotgun_trigger waittill( "trigger", player );
        if( !isDefined( level.shotgun_trigger ) )
            return;

        level.deagle_trigger delete();
		level.sniper_trigger delete();
		level.knife_trigger delete();   

		player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );

		wait 0.5;
        ambientStop( 1.5 );
//AUTO         ambientPlay("traproom");

//AUTO 		player takeallweapons();
//AUTO 		player GiveWeapon( "winchester1200_mp" );
//AUTO         player SwitchtoWeapon( "winchester1200_mp" );

//AUTO         level.activ takeallweapons();
//AUTO 		level.activ GiveWeapon( "winchester1200_mp" );
//AUTO         level.activ SwitchtoWeapon( "winchester1200_mp" );

        player FreezeControls(1);
		level.activ FreezeControls(1);

		noti = SpawnStruct();
            noti.titleText = "Trap Shotgun";
            noti.notifyText = level.activ.name + " ^1VS^7 " + player.name;
            noti.duration = 6;
            noti.glowcolor = (0, 0, 1.0);
            players = getEntArray("player", "classname");
            for(i=0;i<players.size;i++)
            players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
            wait 2;

        playFx ( level.exploderoom, explode.origin );
        playFX ( level.orbs, (-7160, 3256, 1864));

        wait 5;

//AUTO         iPrintLnBold("Fight!");

		player FreezeControls(0);
		level.activ FreezeControls(0);

        while( isAlive( player ) && isDefined( player ) )
            wait 1;

    }
}

trapknife()
{

	level endon("trigger");
	level.knife_trigger = getEnt( "trapknife", "targetname");
    jump = getEnt ("rooms_vol2_j", "targetname");
    acti = getEnt ("rooms_vol2_a", "targetname");
    explode = getEnt("roomorigin2", "targetname");
    level.knife_trigger setHintString("[^1USE^7] to enter ^1Knife");

     while(1)
    {
    	level.knife_trigger setHintString("[^1USE^7] to enter ^1Knife");
        level.knife_trigger waittill( "trigger", player );
        if( !isDefined( level.knife_trigger ) )
            return;

        level.sniper_trigger delete();
		level.shotgun_trigger delete();
		level.deagle_trigger delete();
		
		player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );

		wait 0.5;
        ambientStop( 1.5 );
//AUTO         ambientPlay("traproom");

//AUTO 		player takeallweapons();
//AUTO 		player GiveWeapon( "knife_mp" );
//AUTO         player SwitchtoWeapon( "knife_mp" );

//AUTO         level.activ takeallweapons();
//AUTO 		level.activ GiveWeapon( "knife_mp" );
//AUTO         level.activ SwitchtoWeapon( "knife_mp" );

        player FreezeControls(1);
		level.activ FreezeControls(1);

		noti = SpawnStruct();
            noti.titleText = "Trap Knife";
            noti.notifyText = level.activ.name + " ^1VS^7 " + player.name;
            noti.duration = 6;
            noti.glowcolor = (0, 0, 1.0);
            players = getEntArray("player", "classname");
            for(i=0;i<players.size;i++)
            players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
            wait 2;

        playFx ( level.exploderoom, explode.origin );
        playFX ( level.orbs, (2048, 4576, -152));

        wait 5;

//AUTO         iPrintLnBold("Fight!");        

		player FreezeControls(0);
		level.activ FreezeControls(0);

        while( isAlive( player ) && isDefined( player ) )
            wait 1;

    }
}

trapdeagle()
{

	level endon("trigger");
	level.deagle_trigger = getEnt( "trapdeagle", "targetname");
    jump = getEnt ("rooms_vol2_j", "targetname");
    acti = getEnt ("rooms_vol2_a", "targetname");
    explode = getEnt("roomorigin2", "targetname");
    level.deagle_trigger setHintString("[^1USE^7] to enter ^1Deagle");

     while(1)
    {
    	level.deagle_trigger setHintString("[^1USE^7] to enter ^1Deagle");
        level.deagle_trigger waittill( "trigger", player );
        if( !isDefined( level.deagle_trigger ) )
            return;

        level.sniper_trigger delete();
		level.shotgun_trigger delete();
		level.knife_trigger delete();
		
		player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );

		wait 0.5;
        ambientStop( 1.5 );
//AUTO         ambientPlay("traproom");

//AUTO 		player takeallweapons();
//AUTO 		player GiveWeapon( "deserteagle_mp" );
//AUTO         player GiveWeapon( "deserteaglegold_mp" );
//AUTO         player SwitchtoWeapon( "deserteagle_mp" );

//AUTO         level.activ takeallweapons();
//AUTO 		level.activ GiveWeapon( "deserteagle_mp" );
//AUTO         level.activ GiveWeapon( "deserteaglegold_mp" );
//AUTO         level.activ SwitchtoWeapon( "deserteagle_mp" );

        player FreezeControls(1);
		level.activ FreezeControls(1);

		noti = SpawnStruct();
            noti.titleText = "Trap Deagle";
            noti.notifyText = level.activ.name + " ^1VS^7 " + player.name;
            noti.duration = 6;
            noti.glowcolor = (0, 0, 1.0);
            players = getEntArray("player", "classname");
            for(i=0;i<players.size;i++)
            players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
            wait 2;

        playFx ( level.exploderoom, explode.origin );
        playFX ( level.orbs, (2048, 4576, -152));

        wait 5;

//AUTO         iPrintLnBold("Fight!");

		player FreezeControls(0);
		level.activ FreezeControls(0);

        while( isAlive( player ) && isDefined( player ) )
            wait 1;

    }
}

