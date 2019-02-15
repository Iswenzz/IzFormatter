main()
{
thread rotor_2();
}
rotor_2()
{
	trig = getEnt( "trotor2", "targetname" );
	brush = getEnt( "rotor2", "targetname" );

	trig waittill( "trigger", who );
	trig delete();

	while( isDefined( brush ) )
	{
		brush rotateRoll( -180, 5 );
		wait 3;
	}
}