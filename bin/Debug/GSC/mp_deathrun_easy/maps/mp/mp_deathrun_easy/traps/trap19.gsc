main()
{
	trig = getEnt( "trap19", "targetname" );
	brush = getEnt( "trap19x", "targetname" );

	trig waittill( "trigger" );
	trig delete();
	
	maps\mp\mp_deathrun_easy\coins::AddCoin( 19, level.coinPrice );
	
	while( true )
	{
		if( RandomInt(2) )
			dir = 1;
		else
			dir = -1;
			
		if( RandomInt(2) )
			brush RotatePitch( 360*dir, RandomFloatRange( 3*level.mapmode, 4*level.mapmode ) );
		else
			brush RotateRoll( 360*dir, RandomFloatRange( 3*level.mapmode, 4*level.mapmode ) );
			
		brush waittill( "rotatedone" );
		wait RandomFloat( 2*level.mapmode );
	}
}