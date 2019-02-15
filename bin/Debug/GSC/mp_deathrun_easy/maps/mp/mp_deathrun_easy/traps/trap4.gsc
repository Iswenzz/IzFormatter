/*
//    +========================================================================+
//    I                    ___  _____  _____                                   I
//    I                   /   !!  __ \!  ___!                                  I
//    I                  / /! !! !  \/! !_          ___  ____                  I
//    I                 / /_! !! ! __ !  _!        / __!!_  /                  I
//    I                 \___  !! !_\ \! !      _  ! (__  / /                   I
//    I                     !_/ \____/\_!     (_)  \___!/___!                  I
//    I========================================================================I
//    I                                 trap                                   I
//    I========================================================================I
//    I                       scripted: PetX                                   I
//    I                       updated:  mnaauuu@4gf.cz                         I
//    I                         website: www.4GF.cz                            I
//    +========================================================================+
*/

main()
{
	trig = getent( "trap4", "targetname" );
	brush = getent( "trap4x", "targetname" );
	
	start = brush.origin;
	end = ( start[0], start[1]-384, start[2] );
	speed = 300;
	maxspeed = 800;
	minspeed = 100;
	
	brush thread NormalMoving( start, end, speed );
	trig thread WaittillActive( brush, start, end, maxspeed, minspeed );
}

NormalMoving(start, end, speed)
{
	self endon( "active" );

	while(1)
	{
		time = distance(start, end)/(speed/level.mapmode);
	
		if( self.origin == start )
			self moveto( end, time );
		else
			self moveto( start, time );
			
		self waittill( "movedone" );
	}
}

WaittillActive( brush, start, end, maxspeed, minspeed )
{
	self waittill( "trigger" );
	self delete();
	
	maps\mp\mp_deathrun_easy\coins::AddCoin( 4, level.coinPrice );
	
	brush notify( "active" );
	
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
