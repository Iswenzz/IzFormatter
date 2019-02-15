main()
{
	trig = getent( "trap10", "targetname" );
	brush = getent( "trap10x", "targetname" );
	
	trig thread WaittillActivate( brush );
}

WaittillActivate( brush )
{
	self waittill( "trigger" );
	self delete();
	
	maps\mp\mp_deathrun_easy\coins::AddCoin( 10, level.coinPrice );
	
	brush delete();
}