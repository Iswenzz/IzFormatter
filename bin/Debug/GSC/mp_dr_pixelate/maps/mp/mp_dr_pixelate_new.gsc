main()
{
    maps\mp\_load::main();
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
       
        game["allies"] = "marines";
        game["axis"] = "opfor";
        game["attackers"] = "axis";
        game["defenders"] = "allies";
        game["allies_soldiertype"] = "desert";
        game["axis_soldiertype"] = "desert";
    
    PreCacheItem("rpg_mp");
//AUTO 	thread bouncetrap1();
//AUTO 	thread bouncetrap2();
    thread trap1();
    thread trap2();
    thread trap3();
    thread teleport1();
    thread trap4();
    thread trap5();
    thread trap6();
    thread wiggle();
    thread trap8();
	thread trap9();
    thread teleport2();
	thread teleport4();
    thread teleport3();
	thread teleport5();
	thread teleport6();
	thread teleport7();
	thread teleport8();
	thread teleport9();
//AUTO     thread knife();
//AUTO     thread bounce();
//AUTO     thread sniper();
    thread sr();
    thread end_sr();
    thread credits();
//AUTO 	thread bounceteleport1();
//AUTO 	thread bounceteleport2();
	
    // Map info
    // Traps: 9
    // Size: Small - Medium
    // Difficulty: Medium/Hard
        // Lossy Was Here
}

trap1() // Moving blocks
{      
  trig = getEnt( "trap1_trig", "targetname" );
	level endon("trigger");
  brush = getEnt( "trap1_up", "targetname" );
 
  trig waittill( "trigger");
  trig setHintstring("^5T^7rap ^5A^7ctivated.");
 
  while(1)
  {
    brush moveX(-80, 0.5);
    brush waittill("movedone");
    wait .1;
    brush moveX(160, 0.5);
    brush waittill("movedone");
    wait .1;
    brush moveX(-160, 0.5);
    brush waittill("movedone");
    wait .1;
    brush moveX(80, 0.5);
    brush waittill("movedone");
  }
}

trap2() // Rotate
{
    trig = getEnt( "trap2_trig", "targetname" );
	level endon("trigger");
    brush = getEnt( "trap2_rotate", "targetname" );
 
    trig waittill( "trigger", who );
    trig delete();
 
    while( isDefined( brush ) )
    {
        brush rotateRoll( 180, 2 );
        wait .1;
    }
}

trap3() //Non Collision
{
        trig = getEnt( "trap3_trig", "targetname" );
	level endon("trigger");
        brushGroup1 = getEntArray( "trap3_dissapear_1", "targetname" );
        brushGroup2 = getEntArray( "trap3_dissapear_2", "targetname" );
 
        trig waittill( "trigger", who );
        trig delete();
       
        brushGroup1[randomInt(brushGroup1.size)] notSolid();
        brushGroup2[randomInt(brushGroup2.size)] notSolid();
}

teleport1()
{
        trig = getent("teleport8_trigger", "targetname");
        spawn = getent("teleport_target", "targetname");
       
 
        while (1)
        {
                trig waittill("trigger", player);
                player SetPlayerAngles ( spawn.angles );
                player SetOrigin ( spawn.origin );
//AUTO                 wait (0.05);
//AUTO                 player iPrintLnBold("^5T^7eleported!");
        }
}

trap4() //Spikes
{
 
	level endon("trigger");
    trig = getEnt( "trap4_trig", "targetname" );
    brush = getEnt( "trap4_spike", "targetname" );
        hurt = getEnt ("trap4_spikeshurt", "targetname");
 
        hurt enablelinkto();
        hurt linkto (brush);
       
    trig waittill( "trigger");
        trig setHintstring("^5T^7rap ^5A^7ctivated.");
 
 
        {
        brush moveZ (96,2);  
        wait 4;
        brush moveZ (-96,4.5);
        }
}

trap5() //Swinging Arms
{
        trig = getEnt( "trap5_trig", "targetname" );
	level endon("trigger");
        brush = getEnt( "trap5_rotate2", "targetname" );
 
        trig waittill( "trigger", who );
                trig setHintstring("^5T^7rap ^5A^7ctivated.");
 
       
        {
       while(1)
	   {
        brush rotatePitch(360,2);
        wait 2;
        brush rotatePitch(-360,2);
        wait 2;
        }
		}
}

trap6() //Rotating Circles
{
        trig = getEnt( "trap6_trig", "targetname" );
	level endon("trigger");
        brush = getEnt( "trap6_spin", "targetname" );
 
        trig waittill( "trigger", who );
        trig setHintstring("^5T^7rap ^5A^7ctivated.");
       
        {
		while(1)
		{
        brush rotateYaw(360,.5);
        wait .5;
		}
		}
}

wiggle() // Wiggle Brush _ midair brushes
{
        trig = getEnt( "trig_wiggle", "targetname" );
        brush = getEnt( "wiggle", "targetname" );
        board = getEnt( "board", "targetname" );
 
        trig waittill( "trigger", who );
        trig setHintstring("^5T^7rap ^5A^7ctivated.");
       
        while(1)
        {
        brush moveY(-64,.5);
		board moveZ(64,.5);
		board waittill("movedone");
        wait .1;
        brush moveY(64,.5);
        board moveZ(-64,.5);
		board waittill("movedone");
        wait .1;
        brush moveY(-64,.5);
        }
}

trap8() // 2 Rotating Mini Platforms
{
        trig = getEnt( "trap8_trig", "targetname" );
	level endon("trigger");
        brush = getEnt( "trap8_rotateagain", "targetname" );
 
 
        trig waittill( "trigger", who );
        trig setHintstring("^5T^7rap ^5A^7ctivated.");
       
        while(1)
        {
        brush rotatePitch(360,5);
        wait 2;
        brush rotatePitch(360,5);
        wait 2;
        }
}

trap9() // One Block Delete
{
        trig = getent ("trap9_trig", "targetname");
	level endon("trigger");
		brush = getent ("trap9_blockdel", "targetname");
		
		trig waittill( "trigger", who );
		trig setHintstring("^5T^7rap ^5A^7ctivated.");
		
		brush delete();
}		

teleport2()
{
        trig = getent("teleport2_trigger", "targetname");
        spawn = getent("teleport2_target", "targetname");
       
 
        while (1)
        {
                trig waittill("trigger", player);
                player SetPlayerAngles ( spawn.angles );
                player SetOrigin ( spawn.origin );
//AUTO                 wait (0.05);
//AUTO                 player iPrintLnBold("^5T^7eleported!");
        }
}

teleport4()
{
        trig = getent("secret_tele", "targetname");
		spawn = getent("secretfinish", "targetname");
		
		
		while (1)
		{
		        trig waittill("trigger", player);
				player SetPlayerAngles ( spawn.angles );
				player SetOrigin ( spawn.origin );
//AUTO 				player GiveWeapon( "rpg_mp" );
//AUTO 				player GiveMaxAmmo("rpg_mp");
//AUTO                 player SwitchToWeapon( "rpg_mp" );
//AUTO 				wait (0.05);
//AUTO 				player iPrintLnBold("^5Use ^6125 / ^3250 / ^1333 ^7FPS ^2For ^4The ^6Secret ^5:)");
		}
}

teleport3()
{
        trig = getent("teleport3_trigger", "targetname");
        spawn = getent("teleport3_target", "targetname");
       
 
        while (1)
        {
                trig waittill("trigger", player);
                player SetPlayerAngles ( spawn.angles );
                player SetOrigin ( spawn.origin );
//AUTO                 wait (0.05);
//AUTO                 player iPrintLnBold("^5T^7eleported!");
        }
}

teleport5()
{
        trig = getent("codjumper_finish", "targetname");
		spawn = getent("codjumper_endrooms", "targetname");
		
		
		while (1)
		{
		        trig waittill("trigger", player);
				player SetPlayerAngles ( spawn.angles );
				player SetOrigin ( spawn.origin );
//AUTO 				wait (0.05);
//AUTO 				iPrintlnBold( " ^6" + player.name + " ^5 HAS FINISHED THE SECRET!");
		}
}

teleport6()
{
        trig = getent("codjumper_fail1", "targetname");
		spawn = getent("codjumper_fail1spawn", "targetname");
		
		
		while (1)
		{
		        trig waittill("trigger", player);
				player SetPlayerAngles ( spawn.angles );
				player SetOrigin ( spawn.origin );
//AUTO 				wait (0.05);
//AUTO 				player iPrintLnBold("^5T^7eleported!");

		}
}

teleport7()
{
        trig = getent("codjumper_fail2", "targetname");
		spawn = getent("codjumper_fail2spawn", "targetname");
		
		
		while (1)
		{
		        trig waittill("trigger", player);
				player SetPlayerAngles ( spawn.angles );
				player SetOrigin ( spawn.origin );
//AUTO 				wait (0.05);
//AUTO 				player iPrintLnBold("^5T^7eleported!");

		}
}

teleport8()
{
        trig = getent("codjumper_fail3", "targetname");
		spawn = getent("codjumper_fail3spawn", "targetname");
		
		
		while (1)
		{
		        trig waittill("trigger", player);
				player SetPlayerAngles ( spawn.angles );
				player SetOrigin ( spawn.origin );
//AUTO 				wait (0.05);
//AUTO 				player iPrintLnBold("^5T^7eleported!");

		}
}

teleport9()
{
        trig = getent("codjumper_fail4", "targetname");
		spawn = getent("codjumper_fail4spawn", "targetname");
		
		
		while (1)
		{
		        trig waittill("trigger", player);
				player SetPlayerAngles ( spawn.angles );
				player SetOrigin ( spawn.origin );
//AUTO 				wait (0.05);
//AUTO 				player iPrintLnBold("^5T^7eleported!");

		}
}

credits()
{
        trig = getent ("credits", "targetname");
        {
//AUTO                 iPrintLnBold("Map Created By: ^1Pixel!");
//AUTO         iPrintLnBold("Scriped by: ^1Pixel");
//AUTO                 iPrintLnBold("Thanks To ^1Lossy ^7For Fixing Problems^1!");
        }
		
		trig delete();
}

 knife() // Fixed
{
    level.knife_trig = getEnt( "teleport7_trigger", "targetname");
    jump = getEnt( "teleport7_target", "targetname" );
    acti = getEnt( "acti_knife", "targetname" );
   
    while(1)
    {
        level.knife_trig waittill( "trigger", player );
        if( !isDefined( level.knife_trig ) )
            return;
       
        level.sniper_trig delete();
        level.bounce_trig delete();
		level.sr_trig delete();
               
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
//AUTO         player TakeAllWeapons();
//AUTO         player GiveWeapon( "tomahawk_mp" ); //jumper weapon        
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
//AUTO         level.activ TakeAllWeapons();
//AUTO         level.activ GiveWeapon( "tomahawk_mp" );        
        wait 0.05;
//AUTO         player switchToWeapon( "tomahawk_mp" ); //activator weapon
//AUTO         level.activ SwitchToWeapon( "tomahawk_mp" );
//AUTO         iPrintlnBold( " ^6" + player.name + " ^5 HAS CHOSEN ^7KNIFE^1!" );     //change to what you want it to be
        while( isAlive( player ) && isDefined( player ) )
            wait 1;
    }
}

bounce()
{
    level.bounce_trig = getEnt( "teleport6_trigger", "targetname");
    jump = getEnt( "teleport6_target", "targetname" );
    acti = getEnt( "acti_bounce", "targetname" );
   
    while(1)
    {
        level.bounce_trig waittill( "trigger", player );
        if( !isDefined( level.bounce_trig ) )
            return;
       
        level.knife_trig delete();
        level.sr_trig delete();
		level.sniper_trig delete();
 
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
//AUTO         player TakeAllWeapons();
//AUTO         player GiveWeapon( "tomahawk_mp" ); //jumper weapon            
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
//AUTO         level.activ TakeAllWeapons();
//AUTO         level.activ GiveWeapon( "tomahawk_mp" );        
        wait 0.05;
//AUTO         player switchToWeapon( "tomahawk_mp" ); //activator weapon
//AUTO         level.activ SwitchToWeapon( "tomahawk_mp" );
//AUTO         iPrintlnBold( " ^6" + player.name + " ^5 HAS CHOSEN BOUNCE^1!" );     //change to what you want it to be
        while( isAlive( player ) && isDefined( player ) )
            wait 1;
    }
}

sniper()
{
    level.sniper_trig = getEnt( "teleport5_trigger", "targetname");
    jump = getEnt( "teleport5_target", "targetname" );
    acti = getEnt( "acti_sniper", "targetname" );
   
    while(1)
    {
        level.sniper_trig waittill( "trigger", player );
        if( !isDefined( level.sniper_trig ) )
            return;
       
        level.bounce_trig delete();
        level.sr_trig delete();
        level.knife_trig delete();
		
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
//AUTO         player TakeAllWeapons();
//AUTO         player GiveWeapon( "m40a3_mp" ); //jumper weapon              
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
//AUTO         level.activ TakeAllWeapons();
//AUTO         level.activ GiveWeapon( "m40a3_mp" );        
        wait 0.05;
//AUTO         player switchToWeapon( "m40a3_mp" ); //activator weapon
//AUTO         level.activ SwitchToWeapon( "m40a3_mp" );
//AUTO         iPrintlnBold( " ^6" + player.name + " ^5 HAS CHOSEN SNIPAH^1!" );     //change to what you want it to be
        while( isAlive( player ) && isDefined( player ) )
            wait 1;
    }
}

sr()
{
    level.sr_trig = getEnt( "auto1", "targetname");
    jump = getEnt( "auto2", "targetname" );
    acti = getEnt( "actitele_sr", "targetname" );
   
    while(1)
    {
        level.sr_trig waittill( "trigger", player );
        if( !isDefined( level.sr_trig ) )
            return;
       
        level.bounce_trig delete();
        level.sniper_trig delete();
        level.knife_trig delete();
		
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
//AUTO         player TakeAllWeapons();
//AUTO         player GiveWeapon( "tomahawk_mp" ); //jumper weapon            
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
//AUTO         level.activ TakeAllWeapons();
//AUTO         level.activ GiveWeapon( "tomahawk_mp" );        
        wait 0.05;
//AUTO         player switchToWeapon( "tomahawk_mp" ); //activator weapon
//AUTO         level.activ SwitchToWeapon( "tomahawk_mp" );
//AUTO         iPrintlnBold( " ^6" + player.name + " ^5 HAS CHOSEN SpeedRun^1!" );     //change to what you want it to be
        while( isAlive( player ) && isDefined( player ) )
            wait 1;
    }
}      

end_sr()
{
    trig = getent ("end_sr", "targetname");
    trig waittill ("trigger", player);
    trig delete();
        {
//AUTO     iPrintLnBold("^1"+ player.name + " " + "^3" + "Has FINISHED the SpeedRun at first place! Now KILL!");
//AUTO 	iPrintLnBold("^1"+ player.name + " " + "^3" + "Speedrun idea originally created by Pixel!");
//AUTO         //player braxi\_rank::giveRankXP("", 200);      // Disable this when compile reflections - Lossy
        }
}

bounceteleport1()
{
        trig = getent("bounce_teleport1", "targetname");
		spawn = getent("bouncefail_teleport1", "targetname");
		trig waittill ("trigger", player);
		
		
		while (1)
		{
		        trig waittill("trigger", player);
				player SetPlayerAngles ( spawn.angles );
				player SetOrigin ( spawn.origin );
				wait (0.05);

		}
}

bounceteleport2()
{
        trig = getent("bounce_teleport2", "targetname");
		spawn = getent("bouncefail_teleport2", "targetname");
		trig waittill ("trigger", player);
		
		
		while (1)
		{
		        trig waittill("trigger", player);
				player SetPlayerAngles ( spawn.angles );
				player SetOrigin ( spawn.origin );
				wait (0.05);

		}
}

bouncetrap1() // bounce acti
{
        trig = getent("bounce_trap1", "targetname");
	level endon("trigger");
		brush = getent("bounce_brush2", "targetname");
		hurt = getent("bounce_hurt2", "targetname");
		
		hurt enablelinkto();
		hurt linkto (brush);
		
		trig waittill("trigger",player);
//AUTO 		iPrintLnBold( player.name + "^6 Has Defeated The Jumper!");
		
		{
		brush moveX (2100,2);
		wait 0.5;
		brush moveX (-2100,2);
		}
}

bouncetrap2() // bounce jumper
{
        trig = getent("bounce_trap2","targetname");
	level endon("trigger");
		brush = getent("bounce_brush1","targetname");
		hurt = getent("bounce_hurt1","targetname");
		
		hurt enablelinkto();
		hurt linkto (brush);
		
		trig waittill("trigger",player);
//AUTO 		iPrintLnBold( player.name + "^6 Has Defeated The Activator!");
		
		{
		brush moveX (-2000,2);
		wait 0.5;
		brush moveX (2000,2);
		}
}

