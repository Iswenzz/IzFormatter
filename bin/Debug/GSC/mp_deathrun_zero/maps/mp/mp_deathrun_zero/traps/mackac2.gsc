main()
{
	thread mackac2();
}

mackac2()
{
	trig = getEnt( "tmackac2", "targetname" );
	brush = getEnt( "mackac2", "targetname" );

	trig waittill( "trigger", who );
	trig delete();

	brush moveX( -1350, 3 );
	wait 5;
	brush moveX( 1350, 3 );
}