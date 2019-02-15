main()
{
	StartTime = GetTime();

	wait 0.1;
	thread MapModeBillboard();
	thread PlayerBillboard( StartTime );
}

PlayerBillboard( StartTime )
{
	billboards = getentarray( "player_count", "targetname" );

	while( true )
	{
		number = getentarray( "player", "classname" ).size;
		
		first = int( number/10 );
		second = number - first*10;
		
		for(i = 0;i < billboards.size;i++)
		{
			billboard = billboards[i];
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
						billboard HidePart( tag+""+b, "4gf_hodiny" );
				}
			}
			
			if( GetTime()-StartTime >= 5000 )
				billboard PlaySound( "clock" );
		}
			
		ConnectOrDisconnect();
	}
}

ConnectOrDisconnect()
{
	level endon( "disconnected" );
	
	level waittill( "connected" );
}

MapModeBillboard()
{
	billboards = getentarray( "map_status", "targetname" );
	
	while( true )
	{
		for(i = 0;i < billboards.size;i++)
		{
			billboard = billboards[i];
			
			billboard ShowAllParts();
			switch( level.mapmode )
			{
				case 1:
					billboard HidePart( "tag_easy", "4gf_map_status" );
					billboard HidePart( "tag_medium", "4gf_map_status" );
					break;
				case 2:
					billboard HidePart( "tag_easy", "4gf_map_status" );
					billboard HidePart( "tag_hard", "4gf_map_status" );
					break;
				case 3:
					billboard HidePart( "tag_hard", "4gf_map_status" );
					billboard HidePart( "tag_medium", "4gf_map_status" );
					break;
			}
		}

		level waittill( "change_map_mode" );
	}
}

