
#include common_scripts\utility;

main()
{
	thread blesky();
}
//tblesky1 aktivacni triger
//blesky_1  cislo 1 az 16 script_struct pro efekty efekt: blesky1
//bleskyd_1  cislo 1 az 16 zabijeci trigery
//aktivace vsech po 3 sec off pak random po jednom po 3 sec


blesky() {
	trig = getent( "tblesky1" , "targetname" ) ;
	trig waittill("trigger", player );
	
	for(i=1;i<17;i++) {
		thread blesk(i);
	}
	
	wait 2;
	while(true) {
		thread blesk(RandomIntRange(1,16));
		wait 2;
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
		
		if ( isPlayer(player) && isAlive(player) ) {
			player suicide();
		}
		
	}
}

// zrus killtriger po X sekundach
timeout_blesk(index) {
	wait 2.5;
	level notify("blesk_" + index); // ukonci kill trigger
}