main()
{
	level.mapmode = 3;
	level.LastChangeTime = GetTime();
	
	/*
	1 = hard
	2 = normal
	3 = easy
	*/
	
	thread GetAllTriggers();
	thread PrintMode();
}

GetAllTriggers()
{
	for(i = 0;i < 3;i++)
	{
		trig = getent( "game_set_"+i, "targetname" );
		trig thread CheckSetMode( i );
	}
}

CheckSetMode( i )
{
	while( 1 )
	{
		self waittill( "trigger" );
		level notify( "change_map_mode" );
		
		switch( i )
		{
			case 0:
				if( level.mapmode == 3 )
					break;
					
				level.mapmode = 3;
				thread NotifyChangeMod();
				break;
			case 1:
				if( level.mapmode == 2 )
					break;
					
				level.mapmode = 2;
				thread NotifyChangeMod();
				break;
			case 2:
				if( level.mapmode == 1 )
					break;
					
				level.mapmode = 1;
				thread NotifyChangeMod();
				break;
		}
	}
}

NotifyChangeMod()
{
	level endon( "change_map_mode" );
	
	while( GetTime()-level.LastChangeTime < 5000 )
		wait 0.5;
	
	level.LastChangeTime = GetTime();
			
	string = GetMapModString( level.mapmode );
	iprintln( "Activator set the difficulty to "+string+"." );
	thread drawInformation( 800, 0.8, 1, "^7Map difficulty set to "+string+"." );	
}

GetMapModString( i )
{
	switch( i )
	{
		case 3:
			return "^2EASY^7";
		case 2:
			return "^3MEDIUM^7";
		case 1:
			return "^1HARD^7";
	}
}

drawInformation( start_offset, movetime, mult, text )
{
	start_offset *= mult;
	hud = new_ending_hud( "center", 0.1, start_offset, 90 );
	hud setText( text );
	hud moveOverTime( movetime );
	hud.x = 0;
	wait( movetime );
	wait( 3 );
	hud moveOverTime( movetime );
	hud.x = start_offset * -1;

	wait movetime;
	hud destroy();
}

new_ending_hud( align, fade_in_time, x_off, y_off )
{
	hud = newHudElem();
    hud.foreground = true;
	hud.x = x_off;
	hud.y = y_off;
	hud.alignX = align;
	hud.alignY = "middle";
	hud.horzAlign = align;
	hud.vertAlign = "middle";

 	hud.fontScale = 3;

	hud.color = (0.8, 1.0, 0.8);
	hud.font = "objective";
	hud.glowColor = (0.3, 0.6, 0.3);
	hud.glowAlpha = 1;

	hud.alpha = 0;
	hud fadeovertime( fade_in_time );
	hud.alpha = 1;
	hud.hidewheninmenu = true;
	hud.sort = 10;
	return hud;
}

PrintMode()
{
	level waittill( "game started" );
	thread NotifyChangeMod();
}