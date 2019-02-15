main()
{
	thread platform1 ();
	thread platform2 ();

	trig = getent( "trap11", "targetname" );
	rotate = [];
	for(i = 0;i < 1;i++)
	{
		rotate[i] = getent( "trapx_11_"+i, "targetname" );
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
	for(i = 0;i < 1;i++)
		angles[i] = rotate[i].angles;

	self waittill( "trigger" );
	self delete();
	
	maps\mp\mp_deathrun_easy\coins::AddCoin( 11, level.coinPrice );
	
	for(i = 0;i < 1;i++)
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

platform1 ()
{
	plat = getEnt ("trapx_11_1" , "targetname");
	while (1)
	{
	plat moveX (200 , 2*level.mapmode );
	wait 2*level.mapmode ;
	plat moveX (-200 , 2*level.mapmode );
	wait 2*level.mapmode ;
	}
}

platform2 ()
{
	plat = getEnt ("trapx_11_2" , "targetname");
	while (1)
	{
	plat moveX (-200 , 2*level.mapmode );
	wait 2*level.mapmode ;
	plat moveX (200 , 2*level.mapmode );
	wait 2*level.mapmode ;
	}
}

