main()
{
	PreCacheModel( "4gf_special_model_dr" );
	//PreCacheModel( "prop_flag_neutral" );
	level.coinPrice = 10;
	
	thread AddEndMapBonus();
	
	for(i = 0;i < 21;i++)
		thread MonitorTrapTriggers( i );
}

AddEndMapBonus()
{
	trigger = getent( "trap_c_20", "targetname" );
	origin = getent( "bonus", "targetname" );
	
	trigger waittill( "trigger" );
	
	if( level.mapmode == 1 )
	{
		AddItem( origin.origin, 7, "tag_chest_r" );
		AddItem( origin.origin, 8, "tag_chest_r" );
	}
	else if( level.mapmode == 2 )
		AddItem( origin.origin, 7, "tag_chest_b" );
}

MonitorTrapTriggers( i )
{
	if( !isdefined( level.TrapMonitorTrigger ) )
	level endon("trigger");
		level.TrapMonitorTrigger = [];
		
	level.TrapMonitorTrigger[i] = getent( "trap_c_"+i, "targetname" );
	
	while( true )
	{
		level.TrapMonitorTrigger[i] waittill( "trigger", player );
		
		if( !isdefined( player.closedTraps ) )
			player.closedTraps = [];
		
		if( !isdefined( player.closedTraps[i] ) )
		{
			player.closedTraps[i] = SpawnStruct();
			player.closedTraps[i].time = GetTime();
		}
	}
}

AddItem( origin, type, tag )
{
	item = spawn( "script_model", origin );
	
	item.item = type;
	item.constant = true;
	
	item TagSystem( tag );
	
	item thread StartRotate();
	item thread WaitToGrab();
}

AddCoin( trap, price )
{
	if( level.freeRun )
		return;

	if( level.mapmode == 3 && RandomInt( 6 ) )
		return;
		
	if( level.mapmode == 2 && RandomInt( 3 ) == 0)
		return;
	
	if( !isdefined( level.TrapsTime ) )
		level.TrapsTime = [];
		
	level.TrapsTime[trap] = GetTime();
	
	origin = getent( "trap"+trap+"_coin", "targetname" ).origin;
	
	coin = spawn( "script_model", origin );
	
	if( level.mapmode == 1 && !RandomInt( 20 ) && !isdefined( level.lastroom ) )
	{
		coin.item = 50;
		coin.constant = true;
		tag = "tag_hardpoint_box";
	}
	else if( level.mapmode == 2 && !RandomInt( 30 ) && !isdefined( level.lastroom ) )
	{
		coin.item = 50;
		coin.constant = true;
		tag = "tag_hardpoint_box";
	}
	else if( RandomInt( 4 ) == 0 )
	{
		coin SetRandomItem( trap );
		tag = "tag_random_box";
	}
	else
	{
		price = int( ( price/level.mapmode )+trap );
		coin.price = price;
		tag = "tag_4gf_coin";
	}
	
	coin TagSystem( tag );
	
	coin thread StartRotate();
	coin thread WaitToGrab( 240, trap );
}

StartRotate()
{
	self endon( "delete" );

	while( 1 )
	{
		self RotateYaw( 360, 5 );
		self waittill( "rotatedone" );
	}
}

WaitToGrab( maxTime, trap )
{
	self endon( "delete" );

	startTime = getTime();
	
	minDist = 64;
	
	while( 1 )
	{
		wait 0.1;
	
		if( isdefined( maxTime ) && (getTime()-startTime)/1000 >= maxTime )
		{
//AUTO 			//iprintln( "delete time" );
			self thread GrabCoin();
		}
		
		players = getentarray( "player", "classname" );
		for(i = 0;i < players.size;i++)
		{
			player = players[i];
			
			if( isdefined( player ) && isplayer( player ) && isalive( player ) )
			{
				if( isdefined( distance( self.origin, player.origin ) ) && distance( self.origin, player.origin ) <= minDist )
				{
					if( isdefined( trap ) && isdefined( player.closedTraps ) && isdefined( player.closedTraps[trap] ) 
					&& isdefined( level.TrapsTime ) && isdefined( level.TrapsTime[trap] ) && ( player.closedTraps[trap].time >= level.TrapsTime[trap] ||  player IsTouching( level.TrapMonitorTrigger[trap] ) ) )
						self thread GrabCoin( player );
					else if( !isdefined( trap ) )
						self thread GrabCoin( player );
				}
			}
		}
	}
}

GrabCoin( player )
{
	self notify( "delete" );
	//self delete();
	
	if( isdefined( player ) && isplayer( player ) )
	{
		if( isdefined( self.price ) )
		{
//AUTO 			player braxi\_rank::giveRankXP( "coin", self.price );
//AUTO 			iprintlnbold( "Player "+ player.name +" found bonus coin ^1"+ self.price +" ^7XP." );
		}
		else if( isdefined( self.item ) )
		{
			player thread UseItem( self.item, self.origin, self.constant );
		}
	}
	
//AUTO 	//iprintln( "coin delete" );
	self delete();
}

TagSystem( tag )
{
	self endon( "delete" );

	self.origin += (0,0,10000);
	self setModel( "4gf_special_model_dr" );

	/*
	? tag_4gf_coin   ( 0.00, 0.00, 0.00)
    ? tag_ammo_box   ( 0.00, 0.00, 0.00)
    ? tag_chest_b   ( 0.00, 0.00, 0.00)
    ? tag_chest_r   ( 0.00, 0.00, 0.00)
    ? tag_hardpoint_box   ( 0.00, 0.00, 0.00)
    ? tag_hp_box   ( 0.00, 0.00, 0.00)
    ? tag_random_box   ( 0.00, 0.00, 0.00)
	*/
	
	tags = [];
	tags[tags.size] = "tag_chest_b"; // dt bedna modra - finish
	tags[tags.size] = "tag_chest_r"; // dt bedna ruda - finish
	tags[tags.size] = "tag_random_box"; // box s otaznikom - kazda past, 1/5 ze padne -
	tags[tags.size] = "tag_4gf_coin"; // peniaz - normal
	tags[tags.size] = "tag_ammo_box"; // ammo box
	tags[tags.size] = "tag_hp_box"; // lekarnicka
	tags[tags.size] = "tag_hardpoint_box"; // box s lebkou s random HP -

	
	self.tags = tags;
	
	for(i = 0;i < tags.size;i++)
	{
		if( tags[i] != tag)
			self HidePart( tags[i], "4gf_special_model_dr" );
	}
	
	wait 0.001;
	
	self.origin -= (0,0,10000);
}

SetRandomItem( trap )
{
	if( trap <= 0 )
	{
		self.item = 0;
		return;
	}
	
	self.item = RandomInt( trap );
}

UseItem( item, origin, constant )
{
	if( !isdefined( constant ) )
	{
		if( RandomInt( 2 ) )
			item = RandomInt( 12 );
		
		if( level.mapmode == 3 && !RandomInt( 10 ) )
			item = 2;
			
		if( level.mapmode == 1 && !RandomInt( 10 ) )
			item = 0;
	}
	
	switch( item )
	{
		case 0:
			if( level.mapmode != 3 )
			{
				level.mapmode++;
				level notify( "change_map_mode" );	
//AUTO 				iprintlnbold( "Player ^1"+ self.name +"^7 found ^5MapMode ^1DOWN^7." );
			}
			
			break;
		case 1:
			//FinishPlayerDamage( <Inflictor>, <Attacker>, <Damage>, <Damage Flags>, <Means of Death>, <Weapon>, <Direction>, <Hit Loc>, <OffsetTime> )
			PlayFX( level._effect[ "pulse" ], origin );
			
			players = getentarray( "player", "classname" );
			for(i = 0;i < players.size;i++)
			{
				player = players[i];
				if( isdefined(player) && isplayer(player) && isalive(player) && player.pers["team"] == "allies" && isdefined( distance( player.origin, origin ) ) && distance( player.origin, origin ) <= 300 )
				{
					i = 0;
					while( isdefined(player) && isplayer(player) && isalive(player) && player.pers["team"] == "allies" && isdefined( distance( player.origin, origin ) ) && distance( player.origin, origin ) <= 300 && i < 10 )
					{
						player.health += 4000000;
						player FinishPlayerDamage( player, player, 4000000, 0, "MOD_PROJECTILE", "rpg_mp", origin, vectornormalize(player.origin - origin), "none", 0);
						wait 0.001;
						i++;
					}
				}
			}
			
//AUTO 			iprintlnbold( "Player ^1"+ self.name +"^7 found ^5ShockBomb^7." );
			break;
		case 2:
			if( level.mapmode != 1 )
			{
				level.mapmode--;
				level notify( "change_map_mode" );
//AUTO 				iprintlnbold( "Player ^1"+ self.name +"^7 found ^5MapMode ^1UP^7." );
			}
			
			break;			
		case 3:
			speed = level.dvar["allies_speed"]*1.2;
//AUTO 			self setMoveSpeedScale( speed );
//AUTO 			iprintlnbold( "Player ^1"+ self.name +"^7 found ^4Speed ^1HACK^7." );
			break;
		case 4:
		case 5:
			checkpoint = origin;
			lifes = self.pers["lifes"];
			self thread CheckPointSystem( checkpoint, lifes );
			
//AUTO 			iprintlnbold( "Player ^1"+ self.name +"^7 found ^2Checkpoint^7." );
			break;
		case 6:
		case 7:
//AUTO 			self braxi\_rank::giveRankXP( "coin", 50 );
//AUTO 			iprintlnbold( "Player ^1"+ self.name +"^7 found ^3XP bonus^7." );
			break;
		case 50:
			if( !isdefined( level.lastroom ) )
			{
				level.lastroom = true;
				level.finalRooms[7]["trigger"].origin -= (0,0,10000);
				
				origin = getent( "end_8_o", "targetname" );
				PlayFX( level._effect["m_resp"], origin.origin );
			}
//AUTO 			iprintlnbold( "Player ^1"+ self.name +"^7 found ^1KEY ^2to the last room^7." );
			break;
		default:
			self braxi\_mod::giveLife();
//AUTO 			iprintlnbold( "Player ^1"+ self.name +"^7 found ^2Life^7." );
			break;
	}
}

CheckPointSystem( checkpoint, lifes )
{
	self waittill( "death" );
	
	self waittill( "spawned_player" );
	
	if( self.pers["lifes"] < lifes )
	{
		self SetOrigin( checkpoint );
		ent = spawn( "script_origin", self.origin );
		
//AUTO 		self iprintlnbold( "Now use the ^1Checkpoint^7." );
		self LinkTo( ent );
		wait 4;
//AUTO 		self iprintlnbold( "^1!! ^7GO ^1!!" );
		self unLink();
		ent delete();
	}
}

