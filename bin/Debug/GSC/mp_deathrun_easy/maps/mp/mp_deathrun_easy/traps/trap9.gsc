main()
{
	trig = getent( "trap9", "targetname" );
	
	brush = getent( "trap9x", "targetname" );
	hurt = getent( "trap9x_kill", "targetname" );
	fxent = getent( "trap9x_fx", "targetname" );
	
	fx = PlayLoopedFX( level._effect[ "bridge" ], 60, fxent.origin );
	
	trig thread WaittillActivate( brush, hurt, fx, fxent );
}

WaittillActivate( brush, hurt, fx, fxent )
{
	self waittill( "trigger" );
	self delete();
	
	maps\mp\mp_deathrun_easy\coins::AddCoin( 9, level.coinPrice );
	
	while(1)
	{
		brush notsolid();
		hurt notify( "delete" );
		fx delete();
		
		wait RandomFloatRange( 1*level.mapmode, 5*level.mapmode );
		
		brush solid();
		hurt thread DamageAllPlayers();
		fx = PlayLoopedFX( level._effect[ "bridge" ], 60, fxent.origin );
		
		wait RandomFloatRange( 1*level.mapmode, 5*level.mapmode );
	}
}

DamageAllPlayers()
{
	self endon( "delete" );
	dmg = 2;

	while( true )
	{
		self waittill( "trigger", player );
		
		if( isalive( player ) )
		{
			if( player.health <= dmg )
			{
				if( !maps\mp\mp_deathrun_easy\death_counter::PartOfArray( level.DeathCounter[9].players, player ) )
				{
					size = level.DeathCounter[9].players.size;
					level.DeathCounter[9].players[size] = player;
					level.DeathCounter[9].count++;
					thread maps\mp\mp_deathrun_easy\death_counter::UpdateDeathCounter( 9 );
				}
				
				player suicide();
			}
			
			if( isalive( player ) )
				player FinishPlayerDamage( player, player, dmg, 0, "MOD_PROJECTILE", "rpg_mp", player.origin, vectornormalize(player.origin - player.origin), "none", 0);
		}
		
		wait 0.1;
	}
}