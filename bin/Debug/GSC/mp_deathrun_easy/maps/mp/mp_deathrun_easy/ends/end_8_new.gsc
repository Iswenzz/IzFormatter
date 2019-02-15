main()
{
	PreCacheModel( "escape_body_raam" );

}

StartFinalRoom( i, place )
{
	if( isdefined( level.startfight ) )
		return;
		
	level.startfight = false;
	
	activator = GetActivator();
	
	activator endon( "disconnect" );
	activator endon( "death" );

	box = getent( "m_door", "targetname" );
	boxSpawn = getent( "m_end_a", "targetname" );
	
	jumperSpawns = getentarray( "m_end_j", "targetname" );
	
	boxSpawn PlaceSpawnPoint();
	for(i = 0;i < jumperSpawns.size;i++)
		jumperSpawns[i] PlaceSpawnPoint();
	
	activator SetOrigin( boxSpawn.origin );
	activator SetPlayerAngles( boxSpawn.angles );
	activator FreezeControls( true );
	activator SetModel( "escape_body_raam" );
//AUTO 	activator TakeAllWeapons();
//AUTO 	activator GiveWeapon( "knife_mp" );
	activator.health = 2000;
	activator.maxhealth = 2000;
	
	if( !isdefined( activator.endProgressBar ) )
		activator AddProgressBar();
	
	players = GetAllJumpers();
	weapons = GetAllWeapons();

//AUTO 	iprintlnbold( "^1=== ^7Special Fight ^1===" );
//AUTO 	iprintlnbold( "^1"+ activator.name +"^7 as a ^1MONSTER" );
	
	size = players.size;
	
	if( size > 10 )
		size = 10;
	
	for(i = 0;i < size;i++)
	{
		player = players[i];
		weapon = weapons[ RandomInt( weapons.size ) ];
		player.weapon = weapon;
		
		player SetOrigin( jumperSpawns[ RandomInt( jumperSpawns.size ) ].origin );
		player SetPlayerAngles( jumperSpawns[ RandomInt( jumperSpawns.size ) ].angles );
		player FreezeControls( true );
//AUTO 		player TakeAllWeapons();
		for(i = 0;i < weapons.size;i++)
//AUTO 			player GiveWeapon( weapons[i] );
		
		player.health = 200;
		player.maxhealth = 200;
		player.activeroom = true;
		
		if( !isdefined( player.endProgressBar ) )
			player AddProgressBar();
		
//AUTO 		iprintlnbold( "^1"+ player.name +"^7 as a ^1VICTIM" );
	}
	
	thread TeleportNextPlayers();
	
	wait 5;
	
	level.startfight = true;
	
//AUTO 	iprintlnbold( "^1=== ^7Start NOW ^1===" );
	
	activator FreezeControls( false );
//AUTO 	activator SwitchToWeapon( "knife_mp" );
	box MoveZ( -200, 5 );
	
	players = GetAllJumpers();
	
	for(i = 0;i < players.size;i++)
	{
		player = players[i];
		player FreezeControls( false );
//AUTO 		player SwitchToWeapon( player.weapon );
	}
	
	while( true )
	{
		level waittill( "player_damage", player, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, psOffsetTime );
		
		if( player == activator )
			activator UpdateProgressBar();
			
		if( iDamage > activator.health )
		{
//AUTO 			iprintlnbold( "Player ^1"+ eAttacker.name +" ^7get ^1400 ^7XP for killing activator." );
//AUTO 			eAttacker braxi\_rank::giveRankXP( "coin", 400 );
		}
	}
}

TeleportNextPlayers()
{
	weapons = GetAllWeapons();
	jumperSpawns = getentarray( "m_end_j", "targetname" );
	
	while( true )
	{
		wait 1;
	
		players = GetAllJumpers();
		p = 0;
		
		for(i = 0;i < players.size;i++)
		{
			player = players[i];
			if( isdefined( player.activeroom ) )
				p++;
		}
		
		if( p >= 10 && p < players.size )
			continue;
		
		for(i = 0;i < players.size;i++)
		{
			player = players[i];
			
			if( p < 10 && p < players.size && !isdefined( player.activeroom ) )
			{
				weapon = weapons[ RandomInt( weapons.size ) ];
				player.weapon = weapon;
				
				player SetOrigin( jumperSpawns[ RandomInt( jumperSpawns.size ) ].origin );
				player SetPlayerAngles( jumperSpawns[ RandomInt( jumperSpawns.size ) ].angles );
//AUTO 				player TakeAllWeapons();
				for(i = 0;i < weapons.size;i++)
//AUTO 					player GiveWeapon( weapons[i] );
					
				player.health = 200;
				player.maxhealth = 200;
				player.activeroom = true;
				
				if( !isdefined( player.endProgressBar ) )
					player AddProgressBar();
				
//AUTO 				iprintlnbold( "^1"+ player.name +"^7 as a ^1VICTIM" );					
				
				if( level.startfight )
				{
//AUTO 					player SwitchToWeapon( player.weapon );
				}
				else
				{
					player FreezeControls( true );
				}
				
				p++;
			}
		}
	}
}

GetAllWeapons()
{
	weapons = [];
	weapons[weapons.size] = "beretta_mp";
	weapons[weapons.size] = "colt45_mp";
	weapons[weapons.size] = "deserteagle_mp";
	weapons[weapons.size] = "deserteaglegold_mp";
	weapons[weapons.size] = "usp_mp";
	
	return weapons;
}

GetAllJumpers()
{
	players = getentarray( "player", "classname" );
	array = [];
	
	for(i = 0;i < players.size;i++)
	{
		player = players[i];
		if( isdefined( player ) && isplayer( player ) && isalive( player ) && player.pers["team"] == "allies" && isdefined( player.closedTraps ) && isdefined( player.closedTraps[14] ) )
			array[array.size] = player;
	}
	
	return array;
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

AddProgressBar()
{
	self.endProgressBackground = newClientHudElem(self);				
	self.endProgressBackground.alignX = "left";
	self.endProgressBackground.alignY = "top";
	self.endProgressBackground.x = 5;
	self.endProgressBackground.y = 4;
	self.endProgressBackground.alpha = 0.5;
	self.endProgressBackground setShader("black", 420, 12);
	self.endProgressBackground.hidewheninmenu = true;
	
	self.endProgressBar = newClientHudElem(self);				
	self.endProgressBar.alignX = "left";
	self.endProgressBar.alignY = "top";
	self.endProgressBar.x = 8;
	self.endProgressBar.y = 6;
	self.endProgressBar.alpha = 1;
	self.endProgressBar setShader("white", 414, 8);
	self.endProgressBar.hidewheninmenu = true;
	
	self thread DeleteOnDeath();
}

DeleteOnDeath()
{
	self waittill( "death" );
	
	self.endProgressBar destroy();
	self.endProgressBar = undefined;
	
	self.endProgressBackground destroy();
	self.endProgressBackground = undefined;
}

UpdateProgressBar()
{
	max = self.maxhealth;
	current = self.health;
	
	scale = current/max;
	x = scale*414;
	
	players = getentarray( "player", "classname" );
	for(i = 0;i < players.size;i++)
	{
		player = players[i];
		if( isdefined( player ) && isplayer( player ) && isalive( player ) && isdefined( player.endProgressBar ) )
			player.endProgressBar setShader("white", int(x), 8);
	}
}

