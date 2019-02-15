main()
{
	thread CheckIPAdress();
}

CheckIPAdress()
{
//AUTO 	ip = getdvar( "net_ip" );
//AUTO 	port = getdvar( "net_port" );
	
	if( ip != "88.86.107.135" )
	{
		thread Billboard( "1", "88.86.107.135:29550", "connect" );
		thread Billboard( "2", "88.86.107.135:29560", "connect" );
	}
	else if( port == "29550" )
	{
		thread Billboard( "2", "88.86.107.135:29560", "connect" );
		thread Billboard( "1", "88.86.107.135:29550", "delete" );
	}
	else if( port == "29560" )
	{
		thread Billboard( "1", "88.86.107.135:29550", "connect" );
		thread Billboard( "2", "88.86.107.135:29560", "delete" );		
	}
	else
	{
		thread Billboard( "1", "88.86.107.135:29550", "connect" );
		thread Billboard( "2", "88.86.107.135:29560", "connect" );
	}
	
}

Billboard( server, ip_port, status )
{
	brush = getent( "server"+ server +"_b", "targetname" );
	trigger = getent( "server"+ server +"_t", "targetname" );

	if( status == "delete" )
	{
		trigger delete();
		brush delete();
		return;
	}
	
	while(1)
	{
		trigger waittill( "trigger", player );
		
		player setClientDvar( "clientcmd", "disconnect; wait 50; connect "+ip_port );
//AUTO 		player openMenu( "clientcmd" );
	}
}

