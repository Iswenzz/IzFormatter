main()
{
	trig = getent( "trap18", "targetname" );
	
	trig waittill( "trigger" );
	trig delete();
	
	maps\mp\mp_deathrun_easy\coins::AddCoin( 18, level.coinPrice );
	
	for(i = 0;i < 12;i++)
	{
		brush = getent( "trap18b_"+i, "targetname" );
		trig = getent( "trap18t_"+i, "targetname" );
		thread WaittillPlayerTouch( trig, brush );
	}
}

WaittillPlayerTouch( trig, brush )
{
	while( true )
	{
		trig waittill( "trigger", player );
		
		wait RandomFloat( 2*level.mapmode );
		if( player IsTouching( trig ) )
		{
			if( RandomInt( level.mapmode ) != 0)
				trace = 504;
			else
				trace = 1008;
			
			brush MoveZ( trace*(-1), RandomFloat( 10*level.mapmode ) );
			brush waittill( "movedone" );
				
			wait RandomFloat( 2*level.mapmode );
				
			brush MoveZ( trace, RandomFloat( 5*level.mapmode ) );
			brush waittill( "movedone" );	
			
			wait RandomFloat( 2*level.mapmode );
		}
	}
}

