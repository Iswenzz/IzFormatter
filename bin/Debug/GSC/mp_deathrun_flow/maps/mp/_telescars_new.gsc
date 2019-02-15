main()
{
	entTransporter = getentarray( "tele1", "targetname" );

	
	if(isdefined(entTransporter))
	{
		for( i = 0; i < entTransporter.size; i++ )
			entTransporter[i] thread transporter();
	}
}

transporter()
{

	self waittill( "trigger", player );
	entTarget = getEnt( self.target, "targetname" );
	self delete();
	wait 0.1;
	player setOrigin( entTarget.origin );
	player setplayerangles( entTarget.angles );
}

