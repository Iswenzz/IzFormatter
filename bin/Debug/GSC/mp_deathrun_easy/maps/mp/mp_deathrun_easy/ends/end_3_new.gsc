main()
{
}

StartMoving()
{
	brush = getent( "knife_kolo", "targetname" );
	start = brush.origin;
	
	while( 1 )
	{
		value = RandomFloat( 450 );
		
		brush MoveZ( value * (-1), RandomFloatRange( value/500, value/50 ) );
		brush waittill( "movedone" );
		
		brush MoveZ( value, RandomFloatRange( value/500, value/50 ) );
		brush waittill( "movedone" );
		
		brush.origin = start;
	}
}

StartRotate()
{
	brush = getent( "knife_kolo", "targetname" );

	while( true )
	{
		if( RandomInt(2) )
			dir1 = 1;
		else
			dir1 = -1;
			
		if( RandomInt(2) )
			dir2 = 1;
		else
			dir2 = -1;		
		
		value1 = RandomIntRange( 1, 361 );
		value2 = RandomIntRange( 1, 10 );
		value3 = RandomIntRange( 1, 10 );
		
		angles = ( value2*dir1, value1, value3*dir2 );
		
		brush RotateTo( angles, RandomFloatRange( 1, 10 ) );
		brush waittill( "rotatedone" );
	}
}

StartFinalRoom( i, place )
{
	self endon( "disconnect" );
	self endon( "death" );
	
	activator = GetActivator();
	
	if( !isdefined( activator ) )
		return;
		
	origin1 = getent( "cknife_0", "targetname" );
	origin2 = getent( "cknife_1", "targetname" );
	
	if( !place )
	{
		origin1 PlaceSpawnPoint();
		origin2 PlaceSpawnPoint();
	}
	
	activator FreezeControls( true );
	activator SetOrigin( origin1.origin );
	activator SetPlayerAngles( origin1.angles );
//AUTO 	activator TakeAllWeapons();
//AUTO 	activator GiveWeapon( "knife_mp" );
	activator.health = 100;
	
	self FreezeControls( true );
	self SetOrigin( origin2.origin );
	self SetPlayerAngles( origin2.angles );
//AUTO 	self TakeAllWeapons();
//AUTO 	self GiveWeapon( "knife_mp" );
	self.health = 100;
	
//AUTO 	ambientPlay("music_knife");
	
	for(i = 0;i < 5;i++)
//AUTO 		iprintlnbold( " " );
	
//AUTO 	iprintlnbold( "^1=== ^7Knife Fight ^1===" );
//AUTO 	iprintlnbold( "^1"+ activator.name +"^7 vs ^1"+self.name );
	
	wait 3;
	
	activator FreezeControls( false );
//AUTO 	activator SwitchToWeapon( "knife_mp" );
	
	self FreezeControls( false );
//AUTO 	self SwitchToWeapon( "knife_mp" );
	
	if( !place )
	{
		thread StartRotate();
		thread StartMoving();
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

