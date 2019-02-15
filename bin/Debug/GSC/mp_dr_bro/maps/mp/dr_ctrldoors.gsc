/*
###############################
                       _  __ ##
 ____           ____  | |/ / ##
|  _ \   / \   |  _ \ | ' /  ##
| | | | / _ \  | |_) ||  <   ##
| |_| |/ ___ \ |  _ <|| . \  ##
|____//_/   \_\|_| \_\|_|\_\ ##
###############################
*/
main()
{
	thread porta1(); 
	thread porta2();
	thread porta3();
	thread porta4();
	thread porta5();
	thread porta6();
	thread porta7();
	thread porta8();
	thread premi();
} 
 
porta1()
{ 
	door_sx=getent( "door1_sx", "targetname" );
	door_dx=getent( "door1_dx", "targetname" );
	trig = getent( "diaglift_tigger", "targetname" ); 	
	
	while(true) 
	{ 
		trig waittill ("trigger"); 
		door_sx movex (-40,1,0);	
		door_dx movex (40,1,0);
		door_dx waittill ("movedone"); 
		wait (5); 
		trig waittill ("trigger"); 
		door_sx movex (40,1,0);
		door_dx movex (-40,1,0);
		door_dx waittill ("movedone"); 
		wait (5); 
	}
}

porta2() 
{ 
	drawbridge = getent( "drawbridge", "targetname" ); 
	trig = getent( "lower_bridge", "targetname" ); 
 
while(true) 
{ 
	trig waittill ("trigger"); 
	drawbridge rotateto( (0,-90,0),6); 
	drawbridge waittill ("rotatedone"); 
	wait 3; 
	trig waittill ("trigger"); 
	drawbridge rotateto( (0,0,0),6); 
	drawbridge waittill ("rotatedone"); 
	} 
}
porta3() 
{ 
	liftpad = getent( "liftpad", "targetname" ); 
	trig = getent( "lift_trigger", "targetname" );
 
	while(true) 
	{
		trig waittill ("trigger"); 
		//wait 4; 
		liftpad movez (100,5,0,0.6); 
		liftpad waittill ("movedone"); 
		wait 4; 
		trig waittill ("trigger"); 
		liftpad movez (-100,5,0,0.6); 
		liftpad waittill ("movedone"); 
	} 
}
porta4() 
{ 
	door = getent( "door", "targetname" ); 
	trig = getent( "doortrig", "targetname" ); 
 
	while(true) 
	{ 
		trig waittill ( "trigger" ); 
		//wait 4; 
		door movez ( 94, 5, 0, 0.6 ); 
		door waittill ( "movedone" ); 
		wait 4; 
		trig waittill ("trigger"); 
		door movez( -94, 4, 0, 0.6 ); 
		door waittill ( "movedone" ); 
	} 
}
porta5() 
{ 
	slidedoor = getent( "slidedoor", "targetname" ); 
	trig      = getent( "slidetrig", "targetname" ); 
 
	while(true) 
	{ 
		trig waittill ("trigger"); 
		//wait 4; 
		slidedoor movey ( -64, 2, 0.5, 0.5); 
		slidedoor waittill ("movedone"); 
		wait 4; 
		trig waittill ("trigger"); 
		slidedoor movey( 64, 2, 0.5, 0.5); 
		slidedoor waittill ("movedone"); 
	} 
}
porta6() 
{ 
	train = getent( "train", "targetname"); 
	trig  = getent( "traintrig", "targetname"); 
 
	while(true) 
	{ 
		trig waittill ("trigger"); 
		//wait 4; 
		train movex ( -50, 8, 0.3, 0.3); 
		train waittill ("movedone"); 
		wait 4; 
		trig waittill ("trigger"); 
		train movex( 50, 8, 0.3, 0.3); 
		train waittill ("movedone"); 
	} 
}
porta7() 
{ 
	door = getent( "traindoor", "targetname" ); 
	trig = getent( "traindoortrig", "targetname" ); 
 
	while(true) 
	{ 
		trig waittill ("trigger"); 
		door moveY ( 2, 1, 0.5, 0.5 ); 
		door waittill ("movedone");
 
		wait 1; 
		door moveX ( -50, 4, 1, 1 ); 
		door waittill ("movedone"); 
 
		wait 4; 
		door moveX ( 50, 4, 1, 1 ); 
		door waittill ("movedone");
 
		wait 1; 
		door moveY ( -2, 1, 0.5, 0.5 ); 
		door waittill ("movedone"); 
	} 
}
porta8() 
{ 
	trapdoor = getent( "trapdoor", "targetname" ); 
	trig     = getent( "trapdoortrig", "targetname" ); 
 
	while(true) 
	{ 
		trig waittill ("trigger"); 
		trapdoor rotateto( ( 0, 0, -90 ), 0.3); 
		trapdoor waittill ("rotatedone"); 
 
		wait 3; 
		trapdoor rotateto( ( 0, 0, 0 ), 1.7); 
		trapdoor waittill ("rotatedone"); 
	} 
}

premi()
{ 
	rooms = getentarray("long_doors", "targetname" );
	if(isdefined(rooms))
		{
			for(i=0;i<rooms.size;i++)
			{
				num = RandomInt(4);
				rooms[i] thread prendi_premi(num);
			}
		}
}
prendi_premi(premio) 
{ 	
	while(true) 
	{ 
		self waittill ("trigger",who);
			if ( premio != 1 )
			{
			who iprintlnbold("^1No luck!!! try another time");
			wait 3; 
			who suicide();
			continue;
			}else{
			who iprintlnbold("^4Today is your lucky day!!!");
			//who braxi\_mod::giveLife();
			wait 1; 
			//who braxi\_rank::giveRankXP( "activator" );
			wait 1; 
			}
		break;
 
	} 
 
} 

