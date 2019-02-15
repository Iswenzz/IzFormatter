/* 
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||                 
||| |||| ||| |||   |||       || |||   |||||||||||   ||| |||||||  |||| ||||| |||
||| |||| ||| || ||| ||||| ||||| || ||| ||||||||| ||| || |||||| || |||   ||| |||
||| |||| ||| || ||||||||| ||||| || ||||||||||||| |||||| ||||| |||| || || || |||
||| |||| ||| |||   |||||| ||||| || ||||||    ||| |||||| ||||| |||| || || || |||
||| |||| ||| |||||| ||||| ||||| || ||||||||||||| |||||| |||||      || ||  | |||
|||| || |||| |||||| ||||| ||||| || ||| ||||||||| ||| || ||||| |||| || ||| | |||
|||||  ||||| ||    |||||| ||||| |||   |||||||||||   |||    || |||| || ||||  |||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

------------- Map       :   mp_dr_trapntrance - 
------------- Mapper    :   VC' Blade (bladetk17)
------------- Server    :   VC' Deathrun: 62.75.222.118:28960
------------- xFire     :   bladetk17
------------- Homepage  :   visticdeathrun.x10.mx [Update Soon]
*/
main()
{
	thread trancesniper();
	thread tranceknife();
	thread tranceshotgun();
	thread trancedeagle();

    level.exploderoom = LoadFX("shiet/orb_explosion");
    level.orbs = LoadFX("shiet/magic_orbs");
    //-7160 3256 1864
}

trancesniper()
{

	level.sniper_trigger = getEnt( "trancesniper", "targetname");
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
        ambientPlay("tranceroom");

		player takeallweapons();
		player GiveWeapon( "m40a3_mp" );
		player GiveWeapon( "remington700_mp" );
        player SwitchtoWeapon( "m40a3_mp" );

        level.activ takeallweapons();
		level.activ GiveWeapon( "m40a3_mp" );
		level.activ GiveWeapon( "remington700_mp" );
        level.activ SwitchtoWeapon( "m40a3_mp" );

        player FreezeControls(1);
		level.activ FreezeControls(1);

		noti = SpawnStruct();
            noti.titleText = "Trance Sniper";
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

        iPrintLnBold("Fight!");

		player FreezeControls(0);
		level.activ FreezeControls(0);


        while( isAlive( player ) && isDefined( player ) )
            wait 1;

    }
}

tranceshotgun()
{

	level.shotgun_trigger = getEnt( "tranceshotgun", "targetname");
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
        ambientPlay("tranceroom");

		player takeallweapons();
		player GiveWeapon( "winchester1200_mp" );
        player SwitchtoWeapon( "winchester1200_mp" );

        level.activ takeallweapons();
		level.activ GiveWeapon( "winchester1200_mp" );
        level.activ SwitchtoWeapon( "winchester1200_mp" );

        player FreezeControls(1);
		level.activ FreezeControls(1);

		noti = SpawnStruct();
            noti.titleText = "Trance Shotgun";
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

        iPrintLnBold("Fight!");

		player FreezeControls(0);
		level.activ FreezeControls(0);

        while( isAlive( player ) && isDefined( player ) )
            wait 1;

    }
}

tranceknife()
{

	level.knife_trigger = getEnt( "tranceknife", "targetname");
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
        ambientPlay("tranceroom");

		player takeallweapons();
		player GiveWeapon( "knife_mp" );
        player SwitchtoWeapon( "knife_mp" );

        level.activ takeallweapons();
		level.activ GiveWeapon( "knife_mp" );
        level.activ SwitchtoWeapon( "knife_mp" );

        player FreezeControls(1);
		level.activ FreezeControls(1);

		noti = SpawnStruct();
            noti.titleText = "Trance Knife";
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

        iPrintLnBold("Fight!");

		player FreezeControls(0);
		level.activ FreezeControls(0);

        while( isAlive( player ) && isDefined( player ) )
            wait 1;

    }
}

trancedeagle()
{

	level.deagle_trigger = getEnt( "trancedeagle", "targetname");
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
        ambientPlay("tranceroom");

		player takeallweapons();
		player GiveWeapon( "deserteagle_mp" );
        player GiveWeapon( "deserteaglegold_mp" );
        player SwitchtoWeapon( "deserteagle_mp" );

        level.activ takeallweapons();
		level.activ GiveWeapon( "deserteagle_mp" );
        level.activ GiveWeapon( "deserteaglegold_mp" );
        level.activ SwitchtoWeapon( "deserteagle_mp" );

        player FreezeControls(1);
		level.activ FreezeControls(1);

		noti = SpawnStruct();
            noti.titleText = "Trance Deagle";
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

        iPrintLnBold("Fight!");    

		player FreezeControls(0);
		level.activ FreezeControls(0);

        while( isAlive( player ) && isDefined( player ) )
            wait 1;

    }
}