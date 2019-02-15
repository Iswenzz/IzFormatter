main()
{
	trig = getent( "trap13", "targetname" );
	
	for(i = 0;i < 3;i++)
	{
		brush = getent( "trap13x_"+i, "targetname" );
	
		start = ( brush.origin[0], brush.origin[1]+96, brush.origin[2] );
		end = ( brush.origin[0], brush.origin[1]-96, brush.origin[2] );
		maxspeed = 500;
		minspeed = 100;
		
		trig thread WaittillActive( brush, start, end, maxspeed, minspeed, i );
	}
}

WaittillActive( brush, start, end, maxspeed, minspeed, i )
{
	self waittill( "trigger" );
	
	if( !i )
	{
		maps\mp\mp_deathrun_easy\coins::AddCoin( 13, level.coinPrice );
		self delete();
	}
	
	while(1)
	{
		speed = RandomIntRange( int(minspeed/level.mapmode), int(maxspeed/level.mapmode) );
	
		if( brush.origin == start )
			brush moveto( end, distance( start, end )/speed );
		else if( brush.origin == end )
			brush moveto( start, distance( start, end )/speed );
		else if( randomint(2) )
			brush moveto( start, distance( brush.origin, start )/speed );
		else
			brush moveto( end, distance( brush.origin, end )/speed );
			
		brush waittill( "movedone" );
	}
}

