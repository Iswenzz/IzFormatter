main()
{
maps\mp\_load::main();
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
setdvar( "r_specularcolorscale", "1" );

	setdvar("r_glowbloomintensity0",".25");
	setdvar("r_glowbloomintensity1",".25");
	setdvar("r_glowskybleedintensity0",".3");
	setdvar("compassmaxrange","1200");
	precacheItem("rpg_mp");
PreCacheItem("deserteaglegold_mp");
        PreCacheItem("winchester1200_mp");
        PreCacheItem("skorpion_mp");
        PreCacheItem("remington700_mp");
//AUTO 	ambientPlay("rock");
thread first_door();
thread tele1();
thread tele2();
thread tele3();
thread tele4();
thread tele5();
thread tele6();
thread tele7();
thread move();
thread trap1();
thread trap2();
thread trap3();
thread trap4();
thread trap5();
thread trap6();
thread trap7();
thread trap8();
thread trap9();
thread trap10();
thread jackpot();
//AUTO thread sniper_room();
//AUTO thread jump_room();
//AUTO thread knife_room();
//AUTO thread givexp();
addTriggerToList( "t1" );
		addTriggerToList( "t2" );
		addTriggerToList( "t3" );
		addTriggerToList( "t4" );
		addTriggerToList( "t5" );
		addTriggerToList( "t6" );
		addTriggerToList( "t7" );
		addTriggerToList( "t8" );
		addTriggerToList( "t9" );
		addTriggerToList( "t10" );
}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

jackpot()
{
trig = getEnt ("dafaq" , "targetname");
trig waittill ("trigger", player);
trig delete();

//AUTO      iPrintlnBold( "^1OoOOooO ^2ASomeone ^3Just found a jackpot!" );   
	 }

trap1()
{
trig = getEnt ("t1", "targetname");
b = getEnt ("b1", "targetname");
/* AUTO trig waittill ("trigger", player);
trig delete();

b moveZ (500,1);
wait 3;
b moveZ (-500,1);
wait 3;
*/}

trap2()
{
trig = getEnt ("t2", "targetname");
b = getEnt ("b2", "targetname");
/* AUTO trig waittill ("trigger", player);
trig delete();

b moveZ (100,1);
wait 3;
b moveZ (-100,1);
wait 3;
b moveZ (100,1);
wait 3;
b moveZ (-100,1);
wait 3;
*/}

trap3()
{
trig = getEnt ("t3", "targetname");
b = getEnt ("b3", "targetname");
/* AUTO trig waittill ("trigger", player);
trig delete();
while(1)
{
b moveZ (-300,1);
wait 3;
b moveZ (300,1);
wait 3;
}
*/}

 trap4()
{
   trig = getEnt ("t4" , "targetname");
   spikes = getEnt ("b4" ,"targetname" );
   hurt = getEnt ("hurtspike" , "targetname");
   hurt2= getEnt ("hurtspike2" , "targetname");
/* AUTO    trig waittill ("trigger", player);  
   trig delete();  
   
   hurt enablelinkto();
   hurt linkto (spikes);
   hurt2 enablelinkto();
   hurt2 linkto (spikes);
   
        spikes moveZ (20,1); 
        wait 5;
         spikes moveZ (-20,1); 
        wait 5;
    
*/}

trap5()
{
trig = getEnt ("t5", "targetname");
b = getEnt ("b5", "targetname");
/* AUTO trig waittill ("trigger", player);
trig delete();

b moveZ (-900,1);
wait 3;
*/}

trap6()
{
trig = getEnt ("t6", "targetname");
b = getEnt ("b6a", "targetname");
b2 = getEnt ("b6b", "targetname");
/* AUTO trig waittill ("trigger", player);
trig delete();


b moveZ (-300,1);
b2 moveZ (300,1);
wait 1;
b moveZ (300,1);
b2 moveZ (-300,1);
wait 1;
*/}

trap7()
{
trig = getEnt ("t7", "targetname");
b = getEnt ("b7", "targetname");
/* AUTO trig waittill ("trigger", player);
trig delete();

b rotateRoll (-360,1);
wait 1;
*/}

trap8()
{
trig = getEnt ("t8", "targetname");
b = getEnt ("b8a", "targetname");
b2 = getEnt ("b8b", "targetname");
/* AUTO trig waittill ("trigger", player);
trig delete();


b moveY (-190,1);
b2 moveY (190,1);
wait 1;
b moveY (190,1);
b2 moveY (-190,1);
wait 1;
*/}

trap9()
{
trig = getEnt("t9","targetname");
trap = getEnt("b9","targetname");
/* AUTO trig waittill("trigger");
trig delete();

while(1)
{
trap RotatePitch (360,2);
wait 5;
}
*/}

 trap10()
{
   trig = getEnt ("t10" , "targetname");
   spikes = getEnt ("b10" ,"targetname" );
   hurt = getEnt ("hurtlast" , "targetname");
/* AUTO    trig waittill ("trigger", player);  
   trig delete();  
   
   hurt enablelinkto();
   hurt linkto (spikes);
   
        spikes moveZ (240,1); 
        wait 10;
         spikes moveZ (-240,1); 
        wait 10;
    
*/}

tele1()
{
        entTransporter = getentarray( "easy", "targetname" );
        if(isdefined(entTransporter))
                for( i = 0; i < entTransporter.size; i++ )
                        entTransporter[i] thread transporter1();
}

transporter1()
{
        for(;;)
        {
                self waittill( "trigger", player );
                entTarget = getEnt( self.target, "targetname" );
//AUTO                 wait 0.1;
                player setOrigin( entTarget.origin );
                player setplayerangles( entTarget.angles );
//AUTO                 wait 0.1;
        }
}

tele2()
{
        entTransporter = getentarray( "starttele", "targetname" );
        if(isdefined(entTransporter))
                for( i = 0; i < entTransporter.size; i++ )
                        entTransporter[i] thread transporter2();
}

transporter2()
{
        for(;;)
        {
                self waittill( "trigger", player );
                entTarget = getEnt( self.target, "targetname" );
//AUTO                 wait 0.1;
                player setOrigin( entTarget.origin );
                player setplayerangles( entTarget.angles );
//AUTO                 wait 0.1;
        }
}

tele3()
{
        entTransporter = getentarray( "wtf", "targetname" );
        if(isdefined(entTransporter))
                for( i = 0; i < entTransporter.size; i++ )
                        entTransporter[i] thread transporter3();
}

transporter3()
{
        for(;;)
        {
                self waittill( "trigger", player );
                entTarget = getEnt( self.target, "targetname" );
//AUTO                 wait 0.1;
                player setOrigin( entTarget.origin );
                player setplayerangles( entTarget.angles );
//AUTO                 wait 0.1;
        }
}

tele4()
{
        entTransporter = getentarray( "lol", "targetname" );
        if(isdefined(entTransporter))
                for( i = 0; i < entTransporter.size; i++ )
                        entTransporter[i] thread transporter4();
}

transporter4()
{
        for(;;)
        {
                self waittill( "trigger", player );
                entTarget = getEnt( self.target, "targetname" );
//AUTO                 wait 0.1;
                player setOrigin( entTarget.origin );
//AUTO 				iPrintlnBold( "^10ooo0 my ^0God" + player.name + " ^3Completed the ^1Hard" ); 
                player setplayerangles( entTarget.angles );
//AUTO                 wait 0.1;
        }
}

tele5()
{
        entTransporter = getentarray( "last", "targetname" );
        if(isdefined(entTransporter))
                for( i = 0; i < entTransporter.size; i++ )
                        entTransporter[i] thread transporter5();
}

transporter5()
{
        for(;;)
        {
                self waittill( "trigger", player );
                entTarget = getEnt( self.target, "targetname" );
//AUTO                 wait 0.1;
                player setOrigin( entTarget.origin );
                player setplayerangles( entTarget.angles );
//AUTO                 wait 0.1;
        }
}

tele6()
{
        entTransporter = getentarray( "jump3", "targetname" );
        if(isdefined(entTransporter))
                for( i = 0; i < entTransporter.size; i++ )
                        entTransporter[i] thread transporter6();
}

transporter6()
{
        for(;;)
        {
                self waittill( "trigger", player );
                entTarget = getEnt( self.target, "targetname" );
//AUTO                 wait 0.1;
                player setOrigin( entTarget.origin );
                player setplayerangles( entTarget.angles );
//AUTO                 wait 0.1;
        }
}

tele7()
{
        entTransporter = getentarray( "jump2", "targetname" );
        if(isdefined(entTransporter))
                for( i = 0; i < entTransporter.size; i++ )
                        entTransporter[i] thread transporter7();
}

transporter7()
{
        for(;;)
        {
                self waittill( "trigger", player );
                entTarget = getEnt( self.target, "targetname" );
//AUTO                 wait 0.1;
                player setOrigin( entTarget.origin );
                player setplayerangles( entTarget.angles );
//AUTO                 wait 0.1;
        }
}

move()
{
brush = getent ("movea", "targetname");
brush2 = getent ("moveb", "targetname");
while(1)
{
brush moveX (432,3);
brush2 moveX (-432,3);
wait 1;
brush moveX (-432,3);
brush2 moveX (432,3);
wait 1;
}
}

first_door()
{

	trig = getEnt("opendoor","targetname");
	brush = getEnt("openbrush","targetname");
	button = getEnt("button_door","targetname");
	
	trig waittill("trigger", user);
	trig delete();
	
	button moveY(8,2);
	wait 2;
	brush moveZ(-340,2);
	brush waittill("movedone");
	brush delete();
	
	hud_clock = NewHudElem();
	hud_clock.alignX = "center";
	hud_clock.alignY = "bottom";
	hud_clock.horzalign = "center";
	hud_clock.vertalign = "bottom";
	hud_clock.alpha = 1;
	hud_clock.x = 0;
	hud_clock.y = -150;
	hud_clock.font = "objective";
	hud_clock.fontscale = 2;
	hud_clock.glowalpha = 1.5;
	hud_clock.glowcolor = (1,1,0);
	hud_clock.label = &"Map by: Freek";
	hud_clock SetPulseFX( 40, 5400, 200 );
	wait 8;
	hud_clock = NewHudElem();
	hud_clock.alignX = "center";
	hud_clock.alignY = "bottom";
	hud_clock.horzalign = "center";
	hud_clock.vertalign = "bottom";
	hud_clock.alpha = 1;
	hud_clock.x = 0;
	hud_clock.y = -150;
	hud_clock.font = "objective";
	hud_clock.fontscale = 2;
	hud_clock.glowalpha = 1.5;
	hud_clock.glowcolor = (0,1,0);
	hud_clock.label = &"Map dedicated to RS and spartans clan";
	hud_clock SetPulseFX( 40, 5400, 200 );
	wait 6;
}

sniper_room()
{
    level.sniper_trig = getEnt( "sniper_room", "targetname");
        jump = getEnt( "sniper_jump", "targetname" );
        acti = getEnt( "sniper_acti", "targetname");
   
        while(1)
        {
                level.sniper_trig waittill( "trigger", player );
                if( !isDefined( level.sniper_trig ) )
                        return;
               
                level.jump_trig delete();
                level.knife_trig delete();
                                 
                                     
                player SetPlayerAngles( jump.angles );
                player setOrigin( jump.origin );
//AUTO                 player TakeAllWeapons();
//AUTO                 player GiveWeapon( "remington700_mp" );        
                level.activ setPlayerangles( acti.angles );
                level.activ setOrigin( acti.origin );
//AUTO                 level.activ TakeAllWeapons();
//AUTO                 level.activ GiveWeapon( "remington700_mp" );          
//AUTO                 wait 0.05;
//AUTO                 player switchToWeapon( "remington700_mp" );
//AUTO                 level.activ SwitchToWeapon( "remington700_mp" );
//AUTO                 iPrintlnBold( " ^6LoL" + player.name + " ^4 has chosen ^1snipe room!" );                //change it as you wish
                while( isAlive( player ) && isDefined( player ) )
//AUTO                         wait 1;
        }
}              

knife_room()
{
    level.knife_trig = getEnt( "knife_room", "targetname");
        jump = getEnt( "knife_jump", "targetname");
        acti = getEnt( "knife_acti", "targetname");
   
        while(1)
        {
                level.knife_trig waittill( "trigger", player );
                if( !isDefined( level.knife_trig ) )
                        return;
               
                level.sniper_trig delete();
                level.jump_trig delete();
                                 
                                     
                player SetPlayerAngles( jump.angles );
                player setOrigin( jump.origin );
//AUTO                 player TakeAllWeapons();
//AUTO                 player GiveWeapon( "tomahawk_mp" );            
                level.activ setPlayerangles( acti.angles );
                level.activ setOrigin( acti.origin );
//AUTO                 level.activ TakeAllWeapons();
//AUTO                 level.activ GiveWeapon( "tomahawk_mp" );              
//AUTO                 wait 0.05;
//AUTO                 player switchToWeapon( "tomahawk_mp" );
//AUTO                 level.activ SwitchToWeapon( "tomahawk_mp" );
//AUTO                 iPrintlnBold( " ^6LoL" + player.name + " ^3has chosen ^1knife room" );                //change it as you wish
                while( isAlive( player ) && isDefined( player ) )
//AUTO                         wait 1;
        }
}

jump_room()
{
    level.jump_trig = getEnt( "jump_room", "targetname");
        jump = getEnt( "jump_jump", "targetname");
        acti = getEnt( "jump_acti", "targetname");
   
        while(1)
        {
                level.jump_trig waittill( "trigger", player );
                if( !isDefined( level.jump_trig ) )
                        return;
               
                level.sniper_trig delete();
                level.knife_trig delete();
                                 
                                     
                player SetPlayerAngles( jump.angles );
                player setOrigin( jump.origin );
//AUTO                 player TakeAllWeapons();
//AUTO                 player GiveWeapon( "tomahawk_mp" );            
                level.activ setPlayerangles( acti.angles );
                level.activ setOrigin( acti.origin );
//AUTO                 level.activ TakeAllWeapons();
//AUTO                 level.activ GiveWeapon( "tomahawk_mp" );              
//AUTO                 wait 0.05;
//AUTO                 player switchToWeapon( "tomahawk_mp" );
//AUTO                 level.activ SwitchToWeapon( "tomahawk_mp" );
//AUTO                 iPrintlnBold( " ^6 LoL" + player.name + " ^3has chosen ^1Jump room" );                //change it as you wish
                while( isAlive( player ) && isDefined( player ) )
//AUTO                         wait 1;
        }
}

givexp()
{
	trig = getent("givexp", "targetname");
	
	while(1)
	{
		trig waittill ( "trigger", player );
		trig delete();
		if(!isDefined(player.gotCherryXP))
		{
//AUTO 			player braxi\_rank::giveRankXP("", 200);
//AUTO 			 iprintlnbold ( player.name + "^3got^1xp!!!" );
			player.gotCherryXP = true;
		}
	}

	}

