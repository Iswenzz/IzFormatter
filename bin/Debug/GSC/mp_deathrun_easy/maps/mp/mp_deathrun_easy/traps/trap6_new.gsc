main()
{
	thread blesky();
}


blesky() {
	trig = getent( "trap6" , "targetname" ) ;
	trig waittill("trigger", player );
	trig delete();
	
	maps\mp\mp_deathrun_easy\coins::AddCoin( 6, level.coinPrice );
	
	b = [];
	for (i=0; i<int(10/level.mapmode); i++) {
		while(true) {
			x = RandomIntRange(1,16);
			
			f = false;
			for(j=0;j<b.size;j++) {
				if (b[j] == x) {
					f = true;
					break;
				}
			}
			
			if (!f) {
				b[b.size] = x;
				break;
			}
			wait 0.02;
		}
	}
	
	for(i=1;i<b.size;i++) {
		thread blesk(b[i]);
	}
	
	wait 3+level.mapmode;
	while(true) {
		thread blesk(RandomIntRange(1,16));
		wait 3+level.mapmode;
	}
}


blesk(index) {
	level endon("blesk_" + index); // timeout pre kill trigger
	
	level thread timeout_blesk(index); // timeout pre killt rigger
	
	b = getstructarray ( "blesky_"  + index, "targetname" );
	t = getent ( "bleskyd_" + index, "targetname" );
	
	
	playFx(level._effect[ "blesky1" ], b[0].origin); // urob efekt
	t playsound("blesky"); // zvuk z kill triggra
	
	// kill trigger
	while(true) {
		t waittill( "trigger", player );
		
		if ( isPlayer(player) && isAlive(player) ) 
		{
			if( !maps\mp\mp_deathrun_easy\death_counter::PartOfArray( level.DeathCounter[6].players, player ) )
			{
				size = level.DeathCounter[6].players.size;
				level.DeathCounter[6].players[size] = player;
				level.DeathCounter[6].count++;
				thread maps\mp\mp_deathrun_easy\death_counter::UpdateDeathCounter( 6 );
			}
		
			player suicide();
		}
		
	}
}

// zrus killtriger po X sekundach
timeout_blesk(index) {
	wait 2;
	level notify("blesk_" + index); // ukonci kill trigger
}

