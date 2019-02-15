main()
{
	trig = getent( "trap12", "targetname" );
	
	trig waittill( "trigger" );
	trig delete();
	
	maps\mp\mp_deathrun_easy\coins::AddCoin( 12, level.coinPrice );
	
	for(i = 0;i < 3;i++)
	{
		brush = getent( "trap12x_"+i , "targetname" );
		brush thread StartRotate();
	}
}

StartRotate()
{
	while( true )
	{
		if( RandomInt(2) )
			self RotatePitch( 360, RandomFloat( 3*level.mapmode ) );
		else
			self RotatePitch( -360, RandomFloat( 3*level.mapmode ) );
			
		self waittill( "rotatedone" );
		wait RandomFloatRange( 5*level.mapmode, 10*level.mapmode );
	}
}