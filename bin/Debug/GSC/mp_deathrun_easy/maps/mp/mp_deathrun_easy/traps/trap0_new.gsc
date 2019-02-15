main()
{
	pads1 = [];
    pads1[0] = getent( "solid_0", "targetname" );
	pads1[1] = getent( "solid_1", "targetname" );
	pads2 = [];
    pads2[0] = getent( "solid_2", "targetname" );
	pads2[1] = getent( "solid_3", "targetname" );
    trig = getent("trap0", "targetname");
    
    trig waittill("trigger");
	trig delete();
    
	maps\mp\mp_deathrun_easy\coins::AddCoin( 0, level.coinPrice );
	
	if( RandomInt( level.mapmode ) == 0 )
		pads1[randomint( pads1.size )] notsolid();
	if( RandomInt( level.mapmode ) == 0 )
		pads2[randomint( pads2.size )] notsolid();
}

