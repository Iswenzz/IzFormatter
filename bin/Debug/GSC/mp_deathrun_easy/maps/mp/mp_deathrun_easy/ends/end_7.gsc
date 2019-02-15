main()
{
	origin = getent( "snip_bonus", "targetname" );
	maps\mp\mp_deathrun_easy\coins::AddItem( origin.origin, 8, "tag_hp_box" );
}

StartFinalRoom( i, place )
{
	self endon( "disconnect" );
	self endon( "death" );
	
	activator = GetActivator();
	
	if( !isdefined( activator ) )
		return;
		
	origin1 = getent( "snip_0", "targetname" );
	origin2 = getent( "snip_1", "targetname" );
	
	if( !place )
	{
		origin1 PlaceSpawnPoint();
		origin2 PlaceSpawnPoint();
	}
	
	if( RandomInt( 2 ) )
		weapon = "remington700_mp";
	else
		weapon = "m40a3_mp";
	
	activator FreezeControls( true );
	activator SetOrigin( origin1.origin );
	activator SetPlayerAngles( origin1.angles );
	activator TakeAllWeapons();
	activator GiveWeapon( weapon );
	activator.health = 100;
	
	self FreezeControls( true );
	self SetOrigin( origin2.origin );
	self SetPlayerAngles( origin2.angles );
	self TakeAllWeapons();
	self GiveWeapon( weapon );
	self.health = 100;
	
	ambientPlay("music_knife");
	
	for(i = 0;i < 5;i++)
		iprintlnbold( " " );
	
	iprintlnbold( "^1=== ^7Sniper Fight ^1===" );
	iprintlnbold( "^1"+ activator.name +"^7 vs ^1"+self.name );
	
	wait 3;
	
	activator FreezeControls( false );
	activator SwitchToWeapon( weapon );
	
	self FreezeControls( false );
	self SwitchToWeapon( weapon );
	
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