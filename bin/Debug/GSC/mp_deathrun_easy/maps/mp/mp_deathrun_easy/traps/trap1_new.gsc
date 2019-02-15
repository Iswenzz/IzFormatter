main()
{
	trig = getent( "trap1", "targetname" );
	
	brush = getent( "trap1x", "targetname" );
	multiple = getent( "trap1x_kill", "targetname" );

	trig thread WaittillActivate( brush, multiple );
}

WaittillActivate( brush, multiple )
{
	self waittill( "trigger" );
	self delete();
	
	maps\mp\mp_deathrun_easy\coins::AddCoin( 1, level.coinPrice );
	
	start = brush.angles + ( 0, 0, 90 );
	end = brush.angles + ( 0, 0, 180 );
	
	time = level.mapmode;
	
	brush RotateRoll( 180, time );
	Earthquake( time, 1.5, brush.origin, 900 );
	
	wait (time/4)*3;
	
	multiple thread SuicideAllPlayers();
	
	wait time/4;
	
	brush.angles = end;
	
	multiple notify( "delete" );
	
	while(1)
	{
		wait RandomFloatRange( 1*level.mapmode, 5*level.mapmode );
		
		brush RotateTo( start, time );
		Earthquake( 0.5, time, brush.origin, 900 );
		
		wait time;
		
		brush.angles = start;
		
		wait RandomFloatRange( 5*level.mapmode, 10*level.mapmode );
		
		brush RotateTo( end, time/2 );
		Earthquake( 1, time, brush.origin, 900 );
		wait time/4;
	
		multiple thread SuicideAllPlayers();
	
		wait time/4;
		
		brush.angles = end;
		
		multiple notify( "delete" );
	}
}

SuicideAllPlayers()
{
	self endon( "delete" );
	
	while(1)
	{
		self waittill( "trigger", player );
		
		if( !maps\mp\mp_deathrun_easy\death_counter::PartOfArray( level.DeathCounter[1].players, player ) )
		{
			size = level.DeathCounter[1].players.size;
			level.DeathCounter[1].players[size] = player;
			level.DeathCounter[1].count++;
			thread maps\mp\mp_deathrun_easy\death_counter::UpdateDeathCounter( 1 );
		}
		
		player suicide();
	}
}

