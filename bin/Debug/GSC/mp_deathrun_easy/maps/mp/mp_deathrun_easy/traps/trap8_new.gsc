main()
{
	trig = getent( "trap8", "targetname" );
	rotate = [];
	for(i = 0;i < 3;i++)
	{
		rotate[i] = getent( "trap8x_"+i, "targetname" );
		rotate[i] thread NormalRotate( );
	}
	
	trig thread WaittillActivate( rotate );
}

NormalRotate()
{
	self endon( "activate" );
	
	angles = self.angles;
	
	while(1)
	{
		if( RandomInt(2) )
			self RotateRoll( 360, RandomFloatRange( 10*level.mapmode, 20*level.mapmode ) );
		else
			self RotateRoll( -360, RandomFloatRange( 10*level.mapmode, 20*level.mapmode ) );
			
		self waittill( "rotatedone" );
		
		self.angles = angles;
	}
}

WaittillActivate( rotate )
{
	angles = [];
	for(i = 0;i < 3;i++)
		angles[i] = rotate[i].angles;

	self waittill( "trigger" );
	self delete();
	
	maps\mp\mp_deathrun_easy\coins::AddCoin( 8, level.coinPrice );
	
	for(i = 0;i < 3;i++)
		rotate[i] thread StartRotating( angles[i] );
}

StartRotating( angles )
{
	self notify( "activate" );

	self RotateTo( angles, 0.5 );
	self waittill( "rotatedone" );
	self.angles = angles;
	
	wait RandomFloat( 2*level.mapmode );
	
	while(1)
	{
		if( randomint( 2 ) )
			self RotateRoll( 360, RandomFloatRange( 0.75*level.mapmode, 3*level.mapmode ) );
		else
			self RotateRoll( -360, RandomFloatRange( 0.75*level.mapmode, 3*level.mapmode ) );
			
		self waittill("rotatedone");
		self.angles = angles;
		
		wait RandomFloat( 2*level.mapmode );
	}
}

