main()
{
	way = getent( "cesta", "targetname" );
	way.origin = way.origin - ( 0, 0, 1000 );

	BuildRoomInfo();
	
	thread UpdateFinalRooms();
	
	for(i = 0;i < level.finalRooms.size;i++)
		thread CheckPlayerActive( i );
}

BuildRoomInfo()
{
	level.finalRooms = [];
	
	for(i = 1;i < 9;i++)
	{
		size = level.finalRooms.size;
		level.finalRooms[size]["trigger"] = getent( "end_"+i+"_t", "targetname" );
		level.finalRooms[size]["billboard"] = getent( "end_"+i+"_b", "targetname" );
		level.finalRooms[size]["status"] = "show";
	}
	
	level.finalRooms[2]["status"] = "4gfonly";
	level.finalRooms[3]["status"] = "4gfonly";
	level.finalRooms[4]["status"] = "4gfonly";
	level.finalRooms[6]["status"] = "4gfonly";
	level.finalRooms[7]["status"] = "4gfonly";
	
	level.finalRooms[7]["trigger"].origin += (0,0,10000);
}

CheckPlayerActive( i )
{
	trigger = level.finalRooms[i]["trigger"];
	brush = level.finalRooms[i]["billboard"];
	place = 0;
	
	while( true )
	{
		trigger waittill( "trigger", player );
		
		/*if( isdefined( player.waittillconnect ) )
			continue;
		
		if( level.finalRooms[i]["status"] == "4gfonly" )
		{
//AUTO 			iprintlnbold( "This room is only available to 4GF.CZ servers." );
//AUTO 			iprintlnbold( "Hold ^3[{+activate}]^7 key to connect to the 4GF.CZ #1" );
//AUTO 			iprintlnbold( "Hold ^3[{+melee}]^7 key to connect to the 4GF.CZ #2" );
			
			player thread ConnectToServer( trigger );
			player.waittillconnect = true;
			
			continue;
		}*/
		
		if( place == 0 )
		{
			player SaveMapTime();
		
			for(c = 0;c < level.finalRooms.size;c++)
			{
				if( c == i )
					continue;
			
				level.finalRooms[c]["trigger"] delete();
				
				if( c != 7 )
					level.finalRooms[c]["billboard"] MoveZ( -200, 5 );
			}
		}
		
		player GetRoomFile( i, place );
		place++;
	}
}

GetRoomFile( i, place )
{
	switch( i )
	{
		case 0:
			self maps\mp\mp_deathrun_easy\ends\end_1::StartFinalRoom( i, place );
			break;
		case 1:
			self maps\mp\mp_deathrun_easy\ends\end_2::StartFinalRoom( i, place );
			break;	
		case 2:
			self maps\mp\mp_deathrun_easy\ends\end_3::StartFinalRoom( i, place );
			break;	
		case 3:
			self maps\mp\mp_deathrun_easy\ends\end_4::StartFinalRoom( i, place );
			break;	
		case 4:
			self maps\mp\mp_deathrun_easy\ends\end_5::StartFinalRoom( i, place );
			break;	
		case 5:
			self maps\mp\mp_deathrun_easy\ends\end_6::StartFinalRoom( i, place );
			break;	
		case 6:
			self maps\mp\mp_deathrun_easy\ends\end_7::StartFinalRoom( i, place );
			break;
		case 7:
			self maps\mp\mp_deathrun_easy\ends\end_8::StartFinalRoom( i, place );
			break;				
	}
}

UpdateFinalRooms()
{
	while( 1 )
	{
		wait 5;
	
		for(i = 0;i < level.finalRooms.size;i++)
		{
			room = level.finalRooms[i];
			switch( i )
			{
				case 2:
				case 3:
					if( level.mapmode == 3 )
						HideRoom( i );
					else
						ShowRoom( i );
						
					break;
				case 4:
				case 5:
				case 6:
					if( level.mapmode != 1 )
						HideRoom( i );
					else
						ShowRoom( i );
						
					break;
				
				default:
					break;
			}
		}
	}
}

HideRoom( i )
{
	if( level.finalRooms[i]["status"] == "hide" )
		return;

	level.finalRooms[i]["status"] = "hide";

	level.finalRooms[i]["trigger"].origin -= (0,0,10000);
				
	if( i != 7 )
		level.finalRooms[i]["billboard"] MoveZ( -200, 5 );
}

ShowRoom( i )
{
	if( level.finalRooms[i]["status"] == "show" )
		return;

	level.finalRooms[i]["status"] = "show";

	level.finalRooms[i]["trigger"].origin += (0,0,10000);
				
	if( i != 7 )
		level.finalRooms[i]["billboard"] MoveZ( 200, 5 );
}

ConnectToServer( trigger )
{
	self endon( "disconnect" );

	melee = 0;
	use = 0;
	while( true )
	{
		if( !self IsTouching( trigger ) )
		{
			self.waittillconnect = undefined;
			return;
		}
		
		if( self MeleeButtonPressed() )
			melee++;
		else
			melee = 0;
			
		if( self UseButtonPressed() )
			use++;
		else
			use = 0;
		
		if( use == 3 )
		{
			self setClientDvar( "clientcmd", "disconnect; wait 50; connect 88.86.107.135:29550" );
//AUTO 			self openMenu( "clientcmd" );
			return;
		}
		
		if( melee == 3 )
		{
			self setClientDvar( "clientcmd", "disconnect; wait 50; connect 88.86.107.135:29560" );
//AUTO 			self openMenu( "clientcmd" );
			return;			
		}
		
		wait 1;
	}
}

SaveMapTime() //by PetX
{
	current = gettime();
	start = level.mapStartTime;
	
	time = current-start;
	
	self.pers["time"] = int( time/1000 );
	
//AUTO 	self iprintln( "Your time: ^3"+ int( time/1000 ) );
}

StartFinalRoom( i, place )
{
	level.finalRooms[i]["trigger"] delete();
	level.finalRooms[i]["billboard"] MoveZ( -200, 5 );

	way = getent( "cesta", "targetname" );
//AUTO 	iprintlnbold( "Player ^1"+ self.name +" ^7select classic way." );
	way movez( 1000, 5 );
}

