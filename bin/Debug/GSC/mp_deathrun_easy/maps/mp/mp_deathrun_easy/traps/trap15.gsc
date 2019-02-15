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
	trig = getent( "trap15" , "targetname" );
	
	trig waittill( "trigger" );
	trig delete();
	
	maps\mp\mp_deathrun_easy\coins::AddCoin( 15, level.coinPrice );
	
	for(i = 0;i < 3;i++)
	{
		brush = getent( "trap15x_"+i, "targetname" );
		brush thread StartRotate();
	}
}

StartRotate()
{
	while( true )
	{
		if( RandomInt(2) )
			self RotateYaw( 360, RandomFloatRange( 1*level.mapmode, 5*level.mapmode ) );
		else
			self RotateYaw( -360, RandomFloatRange( 1*level.mapmode, 5*level.mapmode ) );
		
		self waittill( "rotatedone" );
		
		wait RandomFloat( 5*level.mapmode );
	}
}