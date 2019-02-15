main()
{
 maps\mp\_load::main();
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
 
 precacheItem("winchester1200_mp");
 precacheItem("skorpion_mp");
 precacheItem("m4_mp");
 precacheItem("remington700_acog_mp");
 precacheItem("m40a3_acog_mp");
 precacheItem("m4_mp");
 precacheItem("g3_mp");
//AUTO  precacheItem("ak47_mp");
 precacheItem("rpd_mp");
//AUTO  precacheItem("knife_mp");

 game["allies"] = "marines";
 game["axis"] = "opfor";
 game["attackers"] = "axis";
 game["defenders"] = "allies";
 game["allies_soldiertype"] = "desert";
 game["axis_soldiertype"] = "desert";

 setdvar( "r_specularcolorscale", "1" );
 setdvar("r_glowbloomintensity0",".25");
 setdvar("r_glowbloomintensity1",".25");
 setdvar("r_glowskybleedintensity0",".3");
 setdvar("compassmaxrange","1800");
	entTransporter = getentarray( "enter", "targetname" );
	if(isdefined(entTransporter))
		for( i = 0; i < entTransporter.size; i++ )
			entTransporter[i] thread transporter();



			
addTriggerToList( "trigger2" );
addTriggerToList( "trigger3" );
addTriggerToList( "trigger4" );
addTriggerToList( "trigger5" );
addTriggerToList( "trigger6" );
addTriggerToList( "trigger7" );
addTriggerToList( "trigger8" );
addTriggerToList( "trigger9" );
addTriggerToList( "trigger10" );
addTriggerToList( "trigger11" );
addTriggerToList( "trigger12" );
//AUTO addTriggerToList( "jumpweapon" );

thread ambient();
thread trap2();
thread trap3();
thread trap4a();
thread trap4b();
thread trap4c();
thread trap5();
thread trap6();
thread trap6b();
thread trap7();
thread trap8();
thread trap9();
thread trap10();
thread trap11();
thread teleport2();
//AUTO thread kniferoom();
//AUTO thread Jumproom();
thread LastmoveLeft();
thread LastmoveRight();
thread secretpeg();
thread secretup();
//AUTO thread guidsecret();
thread jumpfail();
thread jumpfail2();
//AUTO thread Jumpweapon();
//AUTO thread oldroom();
//AUTO thread sniperoom();
thread actisecret();
thread endteleport();
thread trap12();
thread ammo();
thread ammo2();
//AUTO thread room_random();
thread roundstart();
thread pff();
thread matrix();

}

pff()
{
trig = getent("pff", "targetname");


		trig waittill("trigger", player);
		thread secretwall();
//AUTO 		player iPrintln( "^5Nice Shot!" );
}

ambient()
{
//AUTO AmbientPlay ( "tyft" );
wait 5;
//AUTO iprintln("Now Playing: ^2Macklemore and Ryan Lewis - Wings");
}

roundstart()
{
object = getent("go", "targetname");

	wait 5;
	object movez (-250, 2);
	object waittill ("movedone");
}

matrix()
{
 trig = getent("matrix", "targetname");
 
	while(1)
	{
		trig waittill( "trigger", player );
		musicplay ("door");
		wait 10;
	}
}

transporter()
{
	for(;;)
	{
  		self waittill( "trigger", player );
  		entTarget = getEnt( self.target, "targetname" );
//AUTO   		wait (0.1);
  		player setOrigin( entTarget.origin );
  		player setplayerangles( entTarget.angles );
//AUTO  	 	wait (0.1);
//AUTO 		player GiveWeapon("deserteaglegold_mp");
//AUTO 		wait (0.05);
//AUTO 		player SwitchToWeapon("remington700_mp");
//AUTO 		wait (0.05);
   		self playsound("mp_enemy_obj_captured");
//AUTO    		iprintlnbold ("^1Dafuq?");
//AUTO 		player braxi\_rank::giveRankXP("", 5);
		
	}

}

trap6()
{
 object = getent("dickmove", "targetname");
 trigger = getent("trigger6", "targetname");

/* AUTO  trigger waittill("trigger",player);

  
 while (1)
 {
 object movez (-300,0.25);
 object waittill ("movedone");
 wait (0.1);
 object movez (300,0.25);
 object waittill ("movedone");
 wait (0.3);
 }
*/}

trap6b()
{
 object = getent("dickmove2", "targetname");
 trigger = getent("trigger6", "targetname");

/* AUTO  trigger waittill("trigger",player);


  
 while (1)
 {
 object movez (-300,0.25);
 object waittill ("movedone");
 wait (0.1);
 object movez (300,0.25);
 object waittill ("movedone");
 wait (0.3);
 }

*/}

trap5()
{
 object = getent("squash1", "targetname");
 trig = getent("trigger5", "targetname");
 hurt = getent("squashin", "targetname");
 
 hurt enablelinkto();
 hurt linkto (object);
 
/* AUTO  trig waittill("trigger", player);
	while(1)
	 {
	   object movey (-1250,1);
	   object waittill ("movedone");
	   object movey (1250,1);
	   object waittill ("movedone");
	   wait 2;
	 }
*/}

trap7()
{
	trig = getent ("trigger7", "targetname");
	texture1 = getent( "texta", "targetname" );
	texture2 = getent( "textb", "targetname" );
	texture3 = getent( "textc", "targetname" );
	
		
		texture1 hide();
		texture2 hide();
		texture3 hide();
		
		
/* AUTO 		trig waittill("trigger", player);
		wait (0.2);
		player thread randomplat();

*/}

trap8()
{
	trig = getent ("trigger8", "targetname");
	objecta = getent ("launcha", "targetname");
	objectb = getent ("launchb", "targetname");

/* AUTO 		trig waittill("trigger", player);
		wait (0.2);
		objecta movez (20,0.1);
		objectb movez (220, 0.5);
		objecta waittill ("movedone");
		objectb waittill ("movedone");
		objectb notsolid();
		objecta movez (-20,2);
*/}

trap9()
{
	trig = getent ("trigger9", "targetname");
	solid = getent ("nosolid", "targetname");
	
/* AUTO 		trig waittill("trigger", player);
		wait (0.2);
		solid hide();
		solid notsolid();
*/}

trap10()
{
	trig = getent ("trigger10", "targetname");
	object = getent ("upup", "targetname");
	level.dermuh = "ffbb9d529c5fbeb275d1fcf8aedc2203";
	hurt = getent("bttm", "targetname");
 
	hurt enablelinkto();
	hurt linkto (object);
 
/* AUTO 	trig waittill("trigger", player);


	object movez (150,0.25);
	object waittill ("movedone");
	wait (1.0);
	object movez (-150,3);
	object waittill ("movedone");
	wait (1);
*/}

trap11()
{
	trig = getent ("trigger11", "targetname");
	object = getent ("slowtate", "targetname");
	
/* AUTO 	trig waittill ("trigger", player);
		
		while(1)
		    {
			object rotatepitch(360,5);
			object waittill ("rotatedone");
		    }
*/}

trap12()
{
	trig = getent ("trigger12", "targetname");
	ubject = getent ("enup", "targetname");
	dbject = getent ("endown", "targetname");
	
/* AUTO 	trig waittill ("trigger", player);
	
		while(1)
		    {
			ubject movez(100,1.5);
			dbject movez(-100,1.5);
			ubject waittill ("movedone");
			ubject movez(-100,1.5);
			dbject movez(100,1.5);
			ubject waittill ("movedone");
		    }
*/}

GetRandomPlat( num )
{
    if( num == 1 )
        return "a";
    else
    {
        x = 1+RandomInt(49);
        if( x < 10 )
            return "a";
        if( x > 9 && x < 20 )
            return "b";
        if( x > 20 && x < 30 )
            return "c";
        if( x > 30 && x < 40 )
            return "b";
        if( x > 40 && x < 50 )
            return "c";
        if( x >= 50 )
            return "b";
    }
}

randomplat()
{

x = 1+RandomInt(49);
plat = GetRandomPlat( x );

	if( (plat) == "a")
	{
	
	    object1 = getEnt( "platb", "targetname" );
	    object2 = getEnt( "platc", "targetname" );
	    texture2 = getent( "textb", "targetname" );
	    texture3 = getent( "textc", "targetname" );

	
	
		object1 notsolid();
		object1 hide();
		object2 notsolid();
		object2 hide();
		texture2 show();
		texture2 notsolid();
		texture3 show();
		texture3 notsolid();
		wait 0.5;
//AUTO 		self iprintlnbold ("Platforms B and C are not solid!");
	}
	else if( (plat) == "b" )
	{
	    object1 = getEnt( "plata", "targetname" );
	    object2 = getEnt( "platc", "targetname" );
	    texture1 = getent( "texta", "targetname" );
	    texture3 = getent( "textc", "targetname" );

	
	
		object1 notsolid();
		object1 hide();
		object2 notsolid();
		object2 hide();
		texture1 show();
		texture1 notsolid();
		texture3 show();
		texture3 notsolid();
		wait 0.5;
//AUTO 		self iprintlnbold ("Platforms A and C are not solid!");
	}

	else if( (plat) == "c" )
	{
	    object1 = getEnt( "plata", "targetname" );
	    object2 = getEnt( "platb", "targetname" );
	    texture1 = getent( "texta", "targetname" );
	    texture2 = getent( "textb", "targetname" );
	    

	
	
		object1 notsolid();
		object1 hide();
		object2 notsolid();
		object2 hide();
		texture1 show();
		texture1 notsolid();
		texture2 show();
		texture2 notsolid();
		wait 0.5;
//AUTO 		self iprintlnbold ("Platforms A and B are not solid!");
	}

}

trap4a()
{
 object = getent("SNS1", "targetname");
 trigger = getent("trigger4", "targetname");

/* AUTO  trigger waittill("trigger", player);



 while (1)
 {
  object movez (050,1);
  object waittill ("movedone");
  wait (0.2);
  object movez (-050,1);
  object waittill ("movedone");
  wait (0.2);
 }

*/}

trap4b()
{
 object = getent("SNS2", "targetname");
 trigger = getent("trigger4", "targetname");

/* AUTO  trigger waittill("trigger", player);


 while (1)
 {
  object movez (-050,1);
  object waittill ("movedone");
  wait (0.2);
  object movez (050,1);
  object waittill ("movedone");
  wait (0.2);
 }
*/}

trap4c()
{
 object = getent("spin1", "targetname");
 objct = getent("spin2", "targetname");
 trigger = getent("trigger4", "targetname");

/* AUTO  trigger waittill("trigger", player);


	while (1)
	{
	object rotateyaw (-180,1.5);
	objct rotateyaw (180,1.5);
	wait (2.5);
	object rotateyaw (180,1.5);
	objct rotateyaw (-180,1.5);
	wait (2.5);
	}
*/}

trap3()
{
 object = getent("MvingBs", "targetname");
 trigger = getent("trigger3", "targetname");
 
/* AUTO  trigger waittill("trigger", player);
 

 while (1)
 {
  object movex (140,1);
  object waittill ("movedone");
  wait (0.2);
  object movex (-140,1);
  object waittill ("movedone");
  wait (0.2);
 }

 

*/}

endteleport()
{
	trig = getent("backtomap", "targetname");
	spawn = getent("map", "targetname");
	

	while (1)
	{
		trig waittill("trigger", player);
		player SetPlayerAngles ( spawn.angles );
		player SetOrigin ( spawn.origin );
//AUTO 		wait (0.05);
	}
}

trap2()
{
 object = getent("firstblock", "targetname");
 trigger = getent("trigger2", "targetname");
 hurt = getent("b1link", "targetname");
 
	hurt enablelinkto();
	hurt linkto (object);
 
 
/* AUTO 	trigger waittill("trigger", player);


	object movez (300,0.25);
	object waittill ("movedone");
	wait (1.0);
	object movez (-300,3);
	object waittill ("movedone");
	wait (1);
*/}

teleport()
{
	trig = getent("gosecret", "targetname");
	spawn = getent("spot1", "targetname");
	

	while (1)
	{
		trig waittill("trigger", player);
		player SetPlayerAngles ( spawn.angles );
		player SetOrigin ( spawn.origin );
//AUTO 		wait (0.05);
//AUTO 		player iPrintLnBold("^2Welcome^7 to the ^5Secret ^7Room!");
	}
}

teleport2()
{
	trig = getent("ufailinsecret", "targetname");
	spawn = getent("spot1", "targetname");

	while (1)
	{
		trig waittill("trigger", player);
		player SetPlayerAngles ( spawn.angles );
		player SetOrigin ( spawn.origin );
//AUTO 		wait (0.05);
//AUTO 		player iPrintLnBold("^1HAHAHA ^7Seriously? You failed in ^2Secret?");
	}
}

secretfail()
{
	trig = getent("jumpfail", "targetname");
	spawn = getent("jumpreset", "targetname");

	while (1)
	{
		trig waittill("trigger", player);
		player SetPlayerAngles ( spawn.angles );
		player SetOrigin ( spawn.origin );
//AUTO 		wait (0.05);
//AUTO 		player iPrintLnBold("^1HAHAHA ^7Seriously? You failed in ^2Secret?");
	}
}

kniferoom()
{
    level.knife_trig = getEnt( "Knife", "targetname");
    jump = getEnt( "jumper_enter_kniferoom", "targetname" );
    acti = getEnt( "activator_enter_kniferoom", "targetname" );
    
    while(1)
    {
        level.knife_trig waittill( "trigger", player );
        if( !isDefined( level.knife_trig ) )
            return;
        if(level.firstenter==true)
		{
		level.snipe_trig delete();
		level.old_trig delete();
		level.jump_trig delete();
		level.random_trigger delete();
		level.firstenter=false;
		}
		
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
//AUTO         player TakeAllWeapons();
//AUTO         player GiveWeapon( "knife_mp" );       
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
//AUTO         level.activ TakeAllWeapons();
//AUTO         level.activ GiveWeapon( "knife_mp" );        
//AUTO         wait 0.05;
//AUTO         player switchToWeapon( "knife_mp" );
//AUTO         level.activ SwitchToWeapon( "knife_mp" );
//AUTO         iPrintlnBold( " ^5" + player.name + " ^3 picked ^1knife^7!" );
        while( isAlive( player ) && isDefined( player ) )
//AUTO             wait 1;
    }
}

LastmoveLeft()
{
 object = getent("t5gl", "targetname");

 while (1)
 {
  object movey (-050,1);
  object waittill ("movedone");
  wait (0.2);
  object movey (050,1);
  object waittill ("movedone");
  wait (0.2);
 }
}

LastmoveRight()
{
 object = getent("t5gr", "targetname");

 while (1)
 {
  object movey (050,1);
  object waittill ("movedone");
  wait (0.2);
  object movey (-050,1);
  object waittill ("movedone");
  wait (0.2);
 }
}

secretpeg()
{
 object = getent("secretpeg", "targetname");

 while (1)
 {
 object movex (-250,1);
 object waittill ("movedone");
 wait (0.3);
 object movey (-250,1);
 object waittill ("movedone");
 wait (0.3);
 object movey (250,1);
 object waittill ("movedone");
 wait (0.3);
 object movex (250,1);
 object waittill ("movedone");
 wait (0.3);
 }
}

secretup()
{
 object = getent("sele", "targetname");
 origin = getent("selend", "targetname");
 start = getent("selert", "targetname");

 while (1)
 {
 object moveto ( origin.origin, 2 );
 object waittill ("movedone");
 object moveto ( start.origin, 2);
 object waittill ("movedone");
 }
}

bossbounce()
{
 trig = getent("bossbounce", "targetname");
 object = getent("sactit", "targetname");
 
	object notsolid();
		
		
  		trig waittill("trigger", player);
		wait (0.05);
//AUTO         	iPrintlnBold( " ^5" + player.name + " ^7is a ^1BOSS^7!" );
//AUTO 		player braxi\_rank::giveRankXP("", 50);	
}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

actisecret()
{
    level.secret_trig = getEnt( "datacti", "targetname");
    level.secret_trig waittill( "trigger", player );
	if( !isDefined( level.secret_trig ) )
            return;
        if(level.firstenter==true)
		{
        level.secret_trig delete();
		thread teleport();
		thread bossbounce();
//AUTO 		iPrintlnBold( "^1Activators ^7are supposed to ^1Activate^7..." );
		AmbientStop( 2 );
//AUTO 		AmbientPlay( "wonder" );
		wait 5;
//AUTO 		iprintln ("Now Playing: ^3Griz - Wonder Why");
		}
}

guidsecret()
{
 vip_trig = getent("Authorization", "targetname");
 org = getEnt( "lvl", "targetname" );	
 level.darmuh = "Darmuh"; //Darmuh

    
        vip_trig waittill( "trigger", player );
		tempGuid = player getGUID();
        
        {
            if( ( player.name == level.darmuh )  && ( tempGuid == level.dermuh ) )
            {
                player SetOrigin( org.origin );
				player SetPlayerAngles ( org.angles );
				wait (0.05);
//AUTO 				iprintlnbold ( " ^3Darmuh ^7is all up in dis bitch^5!" );
//AUTO 				player braxi\_rank::giveRankXP("", 50);
            }
            else
            {
				wait (1);
            }
        }
} 

Jumproom()
{
    level.jump_trig = getEnt( "Jump", "targetname");
    jump = getEnt( "jumper_enter_jumproom", "targetname" );
    acti = getEnt( "activator_enter_jumproom", "targetname" );
    while(1)
    {
        level.jump_trig waittill( "trigger", player );
        if(level.firstenter==true)
		{
		level.snipe_trig delete();
		level.old_trig delete();
		level.knife_trig delete();
		level.random_trigger delete();
		level.firstenter=false;
		}
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
//AUTO         player TakeAllWeapons();
//AUTO         player GiveWeapon( "knife_mp" );       
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
//AUTO         level.activ TakeAllWeapons();
//AUTO         level.activ GiveWeapon( "knife_mp" );        
//AUTO         wait 0.05;
//AUTO         player switchToWeapon( "knife_mp" );
//AUTO         level.activ SwitchToWeapon( "knife_mp" );
//AUTO         iPrintlnBold( " ^5" + player.name + " ^3 picked ^1JUMP^7!" );
//AUTO 		wait 0.05;
		AmbientStop( 2 );
//AUTO 		AmbientPlay( "jumproom" );
//AUTO 		wait 1;
        while( isAlive( player ) && isDefined( player ) )
//AUTO             wait 1;
    }
}

Jumpfail()
{
	trig = getent("jumpfail1", "targetname");
	jump = getEnt( "jumper_reset", "targetname" );
    acti = getEnt( "activator_reset", "targetname" );

	while (1)
	{
		trig waittill( "trigger", player );
		if(player == level.activ)
		{
//AUTO 		wait (0.05);
		level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
		}
		else
		{
//AUTO 		wait (0.05);
		player SetPlayerAngles ( jump.angles );
		player SetOrigin ( jump.origin );
		}
		
	}
}

Jumpfail2()
{
	trig = getent("jumpfail2", "targetname");
	jump = getEnt( "jump_reset", "targetname" );
    acti = getEnt( "acti_reset", "targetname" );

	while (1)
	{
		trig waittill( "trigger", player );
		if(player == level.activ)
		{
//AUTO 		wait (0.05);
		level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
		}
		else
		{
//AUTO 		wait (0.05);
		player SetPlayerAngles ( jump.angles );
		player SetOrigin ( jump.origin );
		}
		
	}
}

Jumpweapon()
{
	level.jwep_trig = getent( "jumpweapon", "targetname");
	
	while(1) 
	{
	
	level.jwep_trig waittill( "trigger", player );
	if(level.first==true)
		{
        level.jwep_trig delete();
	level.first=false;
		}
		if(player == level.activ)
		{
			wait (0.05);
//AUTO 			level.activ GiveWeapon( "rpd_mp");
			wait (0.05);
//AUTO 			level.activ switchToWeapon( "rpd_mp");
//AUTO 			iPrintlnBold( " ^1" + player.name + " ^7grabbed the ^1RPD^7!" );
			wait (0.05);
		}
		if(player != level.activ)
		{
		wait (0.05);
//AUTO 		player GiveWeapon( "rpd_mp");
		wait (0.05);
//AUTO         player switchToWeapon( "rpd_mp" );
//AUTO         iPrintlnBold( " ^5" + player.name + " ^7grabbed the ^1RPD^7!" );
		wait (0.05);
		}
	}
}

OldRoom()
{
    level.old_trig = getEnt( "Classic", "targetname");
	object = getent("doorsold", "targetname");
	trig = getent( "Classic", "targetname");
	
        level.old_trig waittill( "trigger", player );
        if( !isDefined( level.old_trig ) )
            return;
	
	if(level.firstenter==true)
		{
		level.snipe_trig delete();
		level.jump_trig delete();
		level.knife_trig delete();
		level.random_trigger delete();
		level.firstenter=false;
		}
	
		trig waittill( "trigger", player );
		object movez (175,5);
		object waittill ("movedone");
		wait (0.2);
//AUTO 		iPrintlnBold( " ^5" + player.name + " ^3 picked ^1Classic^7!" );
		wait (0.2);
		
}

secretwall()
{
 object = getent("notsolid", "targetname");
 
 object notsolid();
}

ammo()
{
 ammo = getent("ammo2", "targetname");

	while(1)
	    {
		ammo waittill( "trigger", player );
//AUTO 		player givemaxammo ( "m40a3_mp" );
//AUTO 		player givemaxammo ( "remington700_mp" );
//AUTO 		player iprintlnbold ("^3AMMO REPLENISHED");
	    }    
}

ammo2()
{
 trig = getent("ammo1", "targetname");
 
 	while(1)
	    {
		trig waittill( "trigger", player );
//AUTO 		player givemaxammo ( "m40a3_mp" );
//AUTO 		player givemaxammo ( "remington700_mp" );
//AUTO 		player iprintlnbold ("^3AMMO REPLENISHED");
	    }
}

sniperoom()
{
    level.snipe_trig = getEnt( "sniperoom", "targetname");
    jump = getEnt( "jumpsnipe", "targetname" );
    acti = getEnt( "actisnipe", "targetname" );
    full = getent( "sfullz", "targetname" );
    
    while(1)
    {
        level.snipe_trig waittill( "trigger", player );
        if( !isDefined( level.snipe_trig ) )
            return;
			
		if(level.firstenter==true)
		{
		level.jump_trig delete();
		level.old_trig delete();
		level.knife_trig delete();
		level.random_trigger delete();
		level.firstenter=false;
		}
//AUTO         iPrintlnBold( " ^5" + player.name + " ^3 picked ^1SHNIPAH WAR^7!" );
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
	full solid();
//AUTO         player TakeAllWeapons();
//AUTO 	level.activ TakeAllWeapons();
//AUTO 	iprintlnbold ( "^33" );
//AUTO 	wait 1;
//AUTO         player GiveWeapon( "M40A3_mp" );
//AUTO         level.activ GiveWeapon( "m40a3_mp" );
//AUTO 	iprintlnbold ( "^22" );
//AUTO 	wait 1;
//AUTO 	player GiveWeapon( "remington700_mp" );
//AUTO 	level.activ GiveWeapon( "remington700_mp" );
//AUTO 	iprintlnbold ( "^11" );
//AUTO 	wait 1;
	full notsolid();
//AUTO 	iprintlnbold ( "^7GO^5!" );
//AUTO 	player switchToWeapon( "m40a3_mp" );
//AUTO         level.activ SwitchToWeapon( "m40a3_mp" );
        while( isAlive( player ) && isDefined( player ) )
//AUTO             wait 1;
    }
}

room_random()
{
	level.random_trigger = getent ("dontcare", "targetname");

	while(1)
	    {
		level.random_trigger waittill("trigger", player);
		wait (0.2);
//AUTO 		iprintlnbold ( " ^5" + player.name + " ^3 picked ^1RANDOM^5!" );
		wait (0.2);
		player thread randomroom();
		while( isAlive( player ) && isDefined( player ) )
		    wait 1;
	    }

}

GetRandomRoom( num )
{
    if( num == 1 )
        return "sniperoom";
    else
    {
        x = 1+RandomInt(49);
        if( x < 10 )
            return "kniferoom";
        if( x > 9 && x < 20 )
            return "kniferoom";
        if( x > 20 && x < 30 )
            return "sniperoom";
        if( x > 30 && x < 40 )
            return "sniperoom";
        if( x > 40 && x < 50 )
            return "jump";
        if( x >= 50 )
            return "jump";
    }
}

randomroom()
{

x = 1+RandomInt(49);
room = GetRandomRoom( x );

	if( (room) == "kniferoom")
	{
	    level.knife_trig = getEnt( "Knife", "targetname");
	    kjump = getEnt( "jumper_enter_kniferoom", "targetname" );
	    kacti = getEnt( "activator_enter_kniferoom", "targetname" );
	
	
		    
		if(level.firstenter==true)
			{
			level.snipe_trig delete();
			level.old_trig delete();
			level.jump_trig delete();
			level.knife_trig delete();
			level.firstenter=false;
			}
			
		self SetPlayerAngles( kjump.angles );
		self setOrigin( kjump.origin );
//AUTO 		self TakeAllWeapons();
//AUTO 		self GiveWeapon( "knife_mp" );       
		level.activ setPlayerangles( kacti.angles );
		level.activ setOrigin( kacti.origin );
//AUTO 		level.activ TakeAllWeapons();
//AUTO 		level.activ GiveWeapon( "knife_mp" );        
		wait 0.05;
//AUTO 		self switchToWeapon( "knife_mp" );
//AUTO 		level.activ SwitchToWeapon( "knife_mp" );
//AUTO 		iPrintlnBold( "^1knife^5!" );
	}
	else if( (room) == "sniperoom")
	{
	    level.snipe_trig = getEnt( "sniper", "targetname");
	    jump = getEnt( "jumpsnipe", "targetname" );
	    acti = getEnt( "actisnipe", "targetname" );
	    full = getent( "sfullz", "targetname" );
			
		if(level.firstenter==true)
		{
		level.old_trig delete();
		level.knife_trig delete();
		level.jump_trig delete();
		level.snipe_trig delete();
		level.firstenter=false;
		}
        
//AUTO 			iPrintlnBold( "^1SHNIPAH WAR^7!" );
			self SetPlayerAngles( jump.angles );
			self setOrigin( jump.origin );
			level.activ setPlayerangles( acti.angles );
			level.activ setOrigin( acti.origin );
			full solid();
//AUTO 			self TakeAllWeapons();
//AUTO 			level.activ TakeAllWeapons();
//AUTO 			iprintlnbold ( "^33" );
			wait 1;
//AUTO 			self GiveWeapon( "M40A3_mp" );
//AUTO 			level.activ GiveWeapon( "m40a3_mp" );
//AUTO 			iprintlnbold ( "^22" );
			wait 1;
//AUTO 			self GiveWeapon( "remington700_mp" );
//AUTO 			level.activ GiveWeapon( "remington700_mp" );
//AUTO 			iprintlnbold ( "^11" );
			wait 1;
//AUTO 			iprintlnbold ( "^7GO^5!" );
			full notsolid();
//AUTO 			self switchToWeapon( "m40a3_mp" );
//AUTO 			level.activ SwitchToWeapon( "m40a3_mp" );
	}
	
	else if( (room) == "jump" )
	{
	
    level.jump_trig = getEnt( "Jump", "targetname");
    jump = getEnt( "jumper_enter_jumproom", "targetname" );
    acti = getEnt( "activator_enter_jumproom", "targetname" );

    
        if(level.firstenter==true)
		{
		level.snipe_trig delete();
		level.old_trig delete();
		level.knife_trig delete();
		level.firstenter=false;
		level.jump_trig delete();
		}
        self SetPlayerAngles( jump.angles );
        self setOrigin( jump.origin );
//AUTO         self TakeAllWeapons();
//AUTO         self GiveWeapon( "knife_mp" );       
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
//AUTO         level.activ TakeAllWeapons();
//AUTO         level.activ GiveWeapon( "knife_mp" );        
        wait 0.05;
//AUTO         self switchToWeapon( "knife_mp" );
//AUTO         level.activ SwitchToWeapon( "knife_mp" );
//AUTO         iPrintlnBold( "^1JUMP^7!" );
		wait 0.05;
		AmbientStop( 2 );
//AUTO 		AmbientPlay( "jumproom" );
		wait 5;
//AUTO 		iprintln( "Now Playing: ^3Flux Pavilion & SKisM - Jump Back (Ft. Foreign Beggars)");
	}
	else
	{
		    level.knife_trig = getEnt( "Knife", "targetname");
	    kjump = getEnt( "jumper_enter_kniferoom", "targetname" );
	    kacti = getEnt( "activator_enter_kniferoom", "targetname" );
	
	
		    
		if(level.firstenter==true)
			{
			level.snipe_trig delete();
			level.old_trig delete();
			level.jump_trig delete();
			level.knife_trig delete();
			level.firstenter=false;
			}
			
		self SetPlayerAngles( kjump.angles );
		self setOrigin( kjump.origin );
//AUTO 		self TakeAllWeapons();
//AUTO 		self GiveWeapon( "knife_mp" );       
		level.activ setPlayerangles( kacti.angles );
		level.activ setOrigin( kacti.origin );
//AUTO 		level.activ TakeAllWeapons();
//AUTO 		level.activ GiveWeapon( "knife_mp" );        
		wait 0.05;
//AUTO 		self switchToWeapon( "knife_mp" );
//AUTO 		level.activ SwitchToWeapon( "knife_mp" );
//AUTO 		iPrintlnBold( "^1knife^5!" );
	}
}

