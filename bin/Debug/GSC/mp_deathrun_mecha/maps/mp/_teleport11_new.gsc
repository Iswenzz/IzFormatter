main()
{       
 	entTransporter = getentarray( "enter11", "targetname" );
	if(isdefined(entTransporter))
		for( i = 0; i < entTransporter.size; i++ )
			entTransporter[i] thread transporter();
}

transporter()
{
	for(;;)
	{
		self waittill( "trigger", player );
		entTarget = getEnt( self.target, "targetname" );
//AUTO 		wait 0.1;
		player setOrigin( entTarget.origin );
		player setplayerangles( entTarget.angles );
//AUTO 		wait 0.1;
//AUTO 		Player iprintlnbold(" ^3Not ^2So Fast Ha-Ha");
//AUTO 		wait 0.1;
	}
}

