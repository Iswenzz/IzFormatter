main()
{
	PreCacheItem("ak47_mp");
	entTransporter = getentarray( "enter1", "targetname" );
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
		wait 0.1;
		player setOrigin( entTarget.origin );
		player setplayerangles( entTarget.angles );
		iprintlnbold("^1" + player.name + " ^7Has Finished The ^1Secret!");
		player TakeAllWeapons();
		player GiveWeapon( "ak47_mp" );
		player switchToWeapon( "ak47_mp" );
		wait 0.1;
	}
}

