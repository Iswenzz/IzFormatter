main()
{
	entTransporter = getentarray( "enter", "targetname" );
 
	if(isdefined(entTransporter))
	{
		for( i = 0; i < entTransporter.size; i++ )
			entTransporter[i] thread transporter();
	}
}
 
transporter()
{
	while(true)
	{
		self waittill( "trigger", player );
		entTarget = getEnt( self.target, "targetname" );
		wait 0.1;
		player setOrigin( entTarget.origin );
		player setplayerangles( entTarget.angles );
		wait 0.1;
	}
}

model()
{
        precacheModel( "eliza_BR2" );
		wait 0.5;
		self detachAll();
		self setModel( "eliza_BR2" );
		self setViewModel( "viewmodel_hands_zombie" );
		
}

gun()
{
    PreCacheModel("weapon_raygun");
	PreCacheItem("barrett_acog_mp");
    wait .5;
	self GiveWeapon("barrett_acog_mp");
    self GiveMaxAmmo("barrett_acog_mp");
    wait .5;
    self SwitchToWeapon("barrett_acog_mp");
	wait .5;
}