main()
{
	//if(IsDefined(level.players))
	//{
		thread DoMagic();
	//}
}

DoMagic()
{
	digit1_roll = getent("zz_digit_1", "targetname");
	digit2_roll = getent("zz_digit_2", "targetname");
	
	digit1 = 0;
	digit2 = 0;
	last_player_number = 0;
	while(true)
	{
		//players = level.players;
		players = getentarray( "player", "classname" );
		
		if(players.size != last_player_number)
		{
			last_player_number = players.size;
			
			digit1_roll rotatePitch(digit1,0.1);
			digit2_roll rotatePitch(digit2,0.1);
			wait (0.2);
			
			digit1 = int(players.size * 0.1);
			digit2 = int(players.size % 10);
			digit1 *= 36;
			digit2 *= 36;
				
			digit1_roll rotatePitch(digit1,0.1);
			digit2_roll rotatePitch(digit2,0.1);
			digit1_roll playsound("clock");
			wait (0.2);
			digit1 *= -1;
			digit2 *= -1;
		}
		wait (5);
	}
}

