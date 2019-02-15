main()
{
	thread MoveDoors();
}

MoveDoors()
{
	door = getent( "door_start", "targetname" );
	
	level waittill( "player_spawn" );
	wait 10;
	
	door movez( -180, 4 );
}
