main()
{
	level.DeathCounter = [];

	for(i = 0;i < 22;i++)
	{
		level.DeathCounter[i] = SpawnStruct();
		level.DeathCounter[i].players = [];
		level.DeathCounter[i].count = 0;
		level.DeathCounter[i].billboard = getent( "trap_h_"+i, "targetname" );
		UpdateDeathCounter( i );
	
		if( i != 1 )
			thread MonitorTriggers( i );
	}
}

MonitorTriggers( i )
{
	trigger = getent( "trap_dc_"+i, "targetname" );
	
	while( true )
	{
		trigger waittill( "trigger", player );
		
		if( !PartOfArray( level.DeathCounter[i].players, player ) )
		{
			size = level.DeathCounter[i].players.size;
			level.DeathCounter[i].players[size] = player;
			level.DeathCounter[i].count++;
			thread UpdateDeathCounter( i );
		}
	}
}

UpdateDeathCounter( i )
{
	billboard = level.DeathCounter[i].billboard;
	number = level.DeathCounter[i].count;
		
	first = int( number/10 );
	second = number - first*10;
	
	billboard ShowAllParts();
		
	for(n = 0;n < 2;n++)
	{
		if( !n )
		{
			num = first;
			tag = "tag_b";
		}
		else
		{
			num = second;
			tag = "tag_a";
		}
		
		
		for(b = 0;b < 10;b++)
		{
			if( b != num )
				billboard HidePart( tag+""+b, "4gf_hodiny2" );
		}
	}
	
	billboard PlaySound( "cash" );
}

PartOfArray( array, part )
{
	for(i = 0;i < array.size;i++)
	{
		if( array[i] == part )
			return true;
	}
	
	return false;
}

