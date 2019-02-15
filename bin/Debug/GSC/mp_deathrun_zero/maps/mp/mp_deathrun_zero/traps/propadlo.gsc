main()
{
thread propadlo1 ();
thread propadlo2 ();
}

propadlo1 () 
{
	trig1 = getent ( "tpropadlo1" , "targetname" ) ;
	half_1= getentarray ( "propadlo1","targetname" ) ;
	half_2 = getentarray ( "propadlo11" , "targetname");
	trig1 waittill ("trigger", player );
	trig1 delete ();
	if ( randomInt(2) == 1)
        half_1[0] delete();
		else
        half_2[0] delete();
}

propadlo2 () 
{
	trig1 = getent ( "tpropadlo2" , "targetname" ) ;
	half_1= getentarray ( "propadlo2","targetname" ) ;
	half_2 = getentarray ( "propadlo22" , "targetname");
	trig1 waittill ("trigger", player );
	trig1 delete ();
	if ( randomInt(2) == 1)
        half_1[0] delete();
		else
        half_2[0] delete();
}