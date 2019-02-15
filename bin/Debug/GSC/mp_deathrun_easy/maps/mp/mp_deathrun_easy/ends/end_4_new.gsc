main()
{
	PreCacheItem( "beretta_mp" );
	PreCacheItem( "colt45_mp" );
	PreCacheItem( "deserteagle_mp" );
	PreCacheItem( "deserteaglegold_mp" );
	PreCacheItem( "usp_mp" );
	PreCacheItem( "frag_grenade_mp" );
	PreCacheItem( "rpg_mp" );
	PreCacheItem( "winchester1200_mp" );
	PreCacheItem( "saw_mp" );
	PreCacheItem( "ak47_mp" );
	PreCacheItem( "g3_mp" );
	PreCacheItem( "gl_m4_mp" );
}

StartFinalRoom( i, place )
{
	self endon( "disconnect" );
	self endon( "death" );
	
	activator = GetActivator();
	
	if( !isdefined( activator ) )
		return;
	
	if( RandomInt( 3 ) == 0 )
	{
		pistol = true;
		origin1 = getent( "knif_1", "targetname" );
		origin2 = getent( "knif_0", "targetname" );
	}
	else
	{
		pistol = false;
		origin1 = getent( "snip_0", "targetname" );
		origin2 = getent( "snip_1", "targetname" );
	}
	
	if( !place )
	{
		origin1 PlaceSpawnPoint();
		origin2 PlaceSpawnPoint();
	}
	
	if( pistol )
	{
		weapons = [];
		weapons[weapons.size] = "beretta_mp";
		weapons[weapons.size] = "colt45_mp";
		weapons[weapons.size] = "deserteagle_mp";
		weapons[weapons.size] = "deserteaglegold_mp";
		weapons[weapons.size] = "usp_mp";
	}
	else
	{
		weapons = [];
		weapons[weapons.size] = "frag_grenade_mp";
		weapons[weapons.size] = "rpg_mp";
		weapons[weapons.size] = "winchester1200_mp";
		weapons[weapons.size] = "saw_mp";
		weapons[weapons.size] = "ak47_mp";
		weapons[weapons.size] = "g3_mp";
		weapons[weapons.size] = "gl_m4_mp";
	}
	
	weapon = weapons[RandomInt( weapons.size )];
	
	activator FreezeControls( true );
	activator SetOrigin( origin1.origin );
	activator SetPlayerAngles( origin1.angles );
//AUTO 	activator TakeAllWeapons();
//AUTO 	activator GiveWeapon( weapon );
	activator.health = 100;
	
	self FreezeControls( true );
	self SetOrigin( origin2.origin );
	self SetPlayerAngles( origin2.angles );
//AUTO 	self TakeAllWeapons();
//AUTO 	self GiveWeapon( weapon );
	self.health = 100;
	
//AUTO 	ambientPlay("music_knife");
	
	for(i = 0;i < 5;i++)
//AUTO 		iprintlnbold( " " );
	
//AUTO 	iprintlnbold( "^1=== ^7Fight ^1===" );
//AUTO 	iprintlnbold( "^1"+ activator.name +"^7 vs ^1"+self.name );
	
	wait 3;
	
	activator FreezeControls( false );
//AUTO 	activator SwitchToWeapon( weapon );
	
	self FreezeControls( false );
//AUTO 	self SwitchToWeapon( weapon );
	
	if( pistol )
	{
		ent = spawn( "script_origin", (0,0,0) );
		activator LinkTo( ent );
		self LinkTo( ent );
	}
	else
	{
		self WeaponChangeCycle( activator, weapon, weapons );
	}
	
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

WeaponChangeCycle( activator, last, weapons )
{
	self endon( "disconnect" );
	self endon( "death" );
	activator endon( "death" );
	
	while( true )
	{
		wait 15;
		
		new = weapons[ RandomInt( weapons.size ) ];
		while( new == last )
			new = weapons[ RandomInt( weapons.size ) ];
			
		last = new;
		
//AUTO 		self TakeAllWeapons();
//AUTO 		self GiveWeapon( new );
		wait 0.01;
//AUTO 		self SwitchToWeapon( new );
		
//AUTO 		activator TakeAllWeapons();
//AUTO 		activator GiveWeapon( new );
		wait 0.01;		
//AUTO 		activator SwitchToWeapon( new );
	}
}

