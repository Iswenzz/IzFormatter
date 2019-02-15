/*
//    +========================================================================+
//    I                    ___  _____  _____                                   I
//    I                   /   !!  __ \!  ___!                                  I
//    I                  / /! !! !  \/! !_          ___  ____                  I
//    I                 / /_! !! ! __ !  _!        / __!!_  /                  I
//    I                 \___  !! !_\ \! !      _  ! (__  / /                   I
//    I                     !_/ \____/\_!     (_)  \___!/___!                  I
//    I========================================================================I
//    I                      random pad move generator                         I
//    I========================================================================I
//    I                       scripted:  mnaauuu@4gf.cz                        I
//    I                         website: www.4GF.cz                            I
//    +========================================================================+
*/

main()
{
	trig = getent( "trap14", "targetname" );
	
	trig waittill( "trigger" );
	trig delete();
	
	maps\mp\mp_deathrun_easy\coins::AddCoin( 14, level.coinPrice );
	
	for(i = 1;i < 17;i++)
	{
		ent = getent( "padrx_"+ i, "targetname" );
		ent thread RandomMove();
	}
}

RandomMove()
{
	while( true )
	{
		wait RandomFloat( 5*level.mapmode );
		
		self MoveZ( 208, RandomFloatRange( 1*level.mapmode, 5*level.mapmode ) );
		self waittill( "movedone" );
		
		wait RandomFloat( 5*level.mapmode );
		
		self MoveZ( -208, RandomFloatRange( 1*level.mapmode, 5*level.mapmode ) );
		self waittill( "movedone" );		
	}
}