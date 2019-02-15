main()
{
precacheItem("rpg_mp");
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
PreCacheItem("deserteaglegold_mp");
        PreCacheItem("winchester1200_mp");
        PreCacheItem("skorpion_mp");
        PreCacheItem("remington700_mp");
thread trap1();
thread trap2();
thread trap3();
thread trap4();
thread trap5();
thread trap6();
thread trap7();
thread trap8();
//AUTO thread sniper_room();
//AUTO thread knife_room();
//AUTO thread wave_room();
//AUTO thread givewep();
//AUTO ambientPlay("epic");
addTriggerToList( "t1" );
		addTriggerToList( "t2" );
		addTriggerToList( "t3" );
		addTriggerToList( "t4" );
		addTriggerToList( "t5" );
		addTriggerToList( "t6" );
		addTriggerToList( "t7" );
		addTriggerToList( "t8" );
}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

givewep()
{
        trigger = getEnt("wepsniper", "targetname");
        precacheItem("deserteaglegold_mp");    
        while(1)
        {
                trigger waittill("trigger", player);
//AUTO                 player takeallweapons();
//AUTO                 player GiveWeapon("deserteaglegold_mp");
//AUTO                 player SwitchToWeapon( "deserteaglegold_mp" );
        }
}

trap1()
{
trap1a = getent ("b1a", "targetname");
	level endon("trigger");
trap1b = getent ("b1b", "targetname");
trig1 = getent ("t1", "targetname");

trig1 waittill ("trigger");
trig1 delete();

	for(;;)
	{
		trap1a rotateRoll (-360, 3);
		trap1b rotateRoll (360, 3);
		wait 3;
	}
}

trap2()
{
brush = getEnt ("b2", "targetname");
	level endon("trigger");
trig = getEnt ("t2", "targetname");
trig waittill ("trigger");
trig delete();

brush moveX (584,1);
wait 1;
brush moveX (-584,1);
wait 1;
}

trap3()
{
brush = getEnt ("b3", "targetname");
	level endon("trigger");
trig = getEnt ("t3", "targetname");
trig waittill ("trigger");
trig delete();

brush moveY (-480,1);
wait 1;
brush moveY (480,1);
wait 1;
}

trap4()
{
brush = getEnt ("b4", "targetname");
	level endon("trigger");
trig = getEnt ("t4", "targetname");
trig waittill ("trigger");
trig delete();

brush moveZ (-314,1);
wait 1;
brush moveZ (314,1);
wait 1;
}

trap5()
{
brush = getEnt ("b5", "targetname");
	level endon("trigger");
trig = getEnt ("t5", "targetname");
trig waittill ("trigger");
trig delete();

brush moveZ (-314,1);
wait 1;
brush moveZ (314,1);
wait 1;
}

trap6()
{
brush = getEnt ("b6", "targetname");
	level endon("trigger");
trig = getEnt ("t6", "targetname");
trig waittill ("trigger");
trig delete();

brush moveZ (-314,1);
wait 1;
brush moveZ (314,1);
wait 1;
}

 trap7()
{
   trig = getEnt ("t7" , "targetname");
	level endon("trigger");
   brush = getEnt ("b7trap" ,"targetname" );
   hurt = getEnt ("b7hurt" , "targetname");
   trig waittill ("trigger", player);  
   trig delete();  
   
   hurt enablelinkto();
   hurt linkto (brush);
  
    brush moveY (-710,5);
	wait 5;
    brush moveY (710,5);
	wait 5;
}

trap8()
{
brush = getEnt ("b8", "targetname");
	level endon("trigger");
trig = getEnt ("t8", "targetname");
trig waittill ("trigger");
trig delete();

brush moveZ (-314,1);
wait 1;
brush moveZ (314,1);
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
               
                level.wave_trig delete();
                level.knife_trig delete();
                                 
                                     
                player SetPlayerAngles( jump.angles );
                player setOrigin( jump.origin );
//AUTO                 player TakeAllWeapons();
//AUTO                 player GiveWeapon( "remington700_mp" );        
                level.activ setPlayerangles( acti.angles );
                level.activ setOrigin( acti.origin );
//AUTO                 level.activ TakeAllWeapons();
//AUTO                 level.activ GiveWeapon( "remington700_mp" );          
                wait 0.05;
//AUTO                 player switchToWeapon( "remington700_mp" );
//AUTO                 level.activ SwitchToWeapon( "remington700_mp" );
//AUTO                 iPrintlnBold( " ^6" + player.name + " has chosen snipe room!" );                //change it as you wish
                while( isAlive( player ) && isDefined( player ) )
                        wait 1;
        }
}              

knife_room()
{
    level.knife_trig = getEnt( "kroom", "targetname");
        jump = getEnt( "knife_jump", "targetname");
        acti = getEnt( "knife_acti", "targetname");
   
        while(1)
        {
                level.knife_trig waittill( "trigger", player );
                if( !isDefined( level.knife_trig ) )
                        return;
               
                level.sniper_trig delete();
                level.wave_trig delete();
                                 
                                     
                player SetPlayerAngles( jump.angles );
                player setOrigin( jump.origin );
//AUTO                 player TakeAllWeapons();
//AUTO                 player GiveWeapon( "tomahawk_mp" );            
                level.activ setPlayerangles( acti.angles );
                level.activ setOrigin( acti.origin );
//AUTO                 level.activ TakeAllWeapons();
//AUTO                 level.activ GiveWeapon( "tomahawk_mp" );              
                wait 0.05;
//AUTO                 player switchToWeapon( "tomahawk_mp" );
//AUTO                 level.activ SwitchToWeapon( "tomahawk_mp" );
//AUTO                 iPrintlnBold( " ^6" + player.name + " has chosen knife room" );                //change it as you wish
                while( isAlive( player ) && isDefined( player ) )
                        wait 1;
        }
}

 wave_room()
{
    level.wave_trig = getEnt( "wave_room", "targetname");
        jump = getEnt( "wave_jump", "targetname");
        acti = getEnt( "wave_acti", "targetname");
   
        while(1)
        {
                level.wave_trig waittill( "trigger", player );
                if( !isDefined( level.wave_trig ) )
                        return;
               
                level.sniper_trig delete();
                level.knife_trig delete();
                                 
                                     
                player SetPlayerAngles( jump.angles );
                player setOrigin( jump.origin );
//AUTO                 player TakeAllWeapons();
//AUTO                 player GiveWeapon( "rpg_mp" );            
                level.activ setPlayerangles( acti.angles );
                level.activ setOrigin( acti.origin );
//AUTO                 level.activ TakeAllWeapons();
//AUTO                 level.activ GiveWeapon( "rpg_mp" );              
                wait 0.05;
//AUTO                 player switchToWeapon( "rpg_mp" );
//AUTO                 level.activ SwitchToWeapon( "rpg_mp" );
//AUTO                 iPrintlnBold( " ^6" + player.name + " has chosen wave room" );                //change it as you wish
                while( isAlive( player ) && isDefined( player ) )
                        wait 1;
        }
}

