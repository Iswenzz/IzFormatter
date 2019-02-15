main()
{
}

StartFinalRoom( i, place )
{
	self endon( "disconnect" );
	self endon( "death" );
	
	activator = GetActivator();
	
	if( !isdefined( activator ) )
		return;
		
	origin1 = getent( "oknife_0", "targetname" );
	origin2 = getent( "oknife_1", "targetname" );
	
	if( !place )
	{
		origin1 PlaceSpawnPoint();
		origin2 PlaceSpawnPoint();
	}
	
	activator FreezeControls( true );
	activator SetOrigin( origin1.origin );
	activator SetPlayerAngles( origin1.angles );
	activator TakeAllWeapons();
	activator GiveWeapon( "knife_mp" );
	activator.health = 100;
	
	self FreezeControls( true );
	self SetOrigin( origin2.origin );
	self SetPlayerAngles( origin2.angles );
	self TakeAllWeapons();
	self GiveWeapon( "knife_mp" );
	self.health = 100;
	
	ambientPlay("music_knife");
	
	for(i = 0;i < 5;i++)
		iprintlnbold( " " );
	
	iprintlnbold( "^1=== ^7Knife Fight ^1===" );
	iprintlnbold( "^1"+ activator.name +"^7 vs ^1"+self.name );
	
	wait 3;
	
	activator FreezeControls( false );
	activator SwitchToWeapon( "knife_mp" );
	
	self FreezeControls( false );
	self SwitchToWeapon( "knife_mp" );
	
	activator waittill( "death" );
}

GetActivator()
{
	players = getentarray( "player", "classname" );
	
	for(i = 0;i < players.size;i++)
	{
		player = players[i];
		
		if( isdefined( player ) && isplayer( player ) && isalive( player ) && player.pers["team"] == "axis"	)
			return player;
	}
	
	return undefined;
}