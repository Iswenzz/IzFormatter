main()
{
maps\mp\_load::main();
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
	
PreCacheItem("deserteaglegold_mp");
        PreCacheItem("winchester1200_mp");
        PreCacheItem("skorpion_mp");
        PreCacheItem("remington700_mp");
	
//AUTO 	ambientPlay("edward");

	
	addTriggerToList( "t1" );
		addTriggerToList( "t2" );
		addTriggerToList( "t3" );
		addTriggerToList( "t4" );
		addTriggerToList( "t5" );
		addTriggerToList( "t6" );
		addTriggerToList( "t7" );
		addTriggerToList( "t8" );
	
thread rotate();
thread trap1();
thread trap2();
thread trap3();
thread trap4();
thread trap5();
thread trap6();
thread trap7();
thread trap8();
//AUTO thread givesniper();
//AUTO thread sniper_room();
//AUTO thread knife_room();
}

givesniper()
{
        trigger = getEnt("wepsniper", "targetname");
        precacheItem("remington700_mp");    
        while(1)
        {
                trigger waittill("trigger", player);
//AUTO                 player takeallweapons();
//AUTO                 player GiveWeapon("remington700_mp");
//AUTO                 player SwitchToWeapon( "remington700_mp" );
        }
}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

trap1()
{
brush = getEnt ("b1", "targetname");
	level endon("trigger");
trig = getEnt ("t1", "targetname");
trig waittill ("trigger");
trig delete();

while(1)
{
brush rotateroll (360, 2);
		wait 2;
		}
	
}

trap2()
{
brush = getEnt ("b2", "targetname");
	level endon("trigger");
trig = getEnt ("t2", "targetname");
trig waittill ("trigger");
trig delete();

brush moveY (-544,1);
wait 2;
brush moveY (544,1);
}

trap3()
{
brush = getEnt ("b3", "targetname");
	level endon("trigger");
trig = getEnt ("t3", "targetname");
trig waittill ("trigger");
trig delete();

brush moveY (280,1);
wait 2;
brush moveY (-280,1);
}

trap4()
{
brush = getEnt ("b4", "targetname");
	level endon("trigger");
trig = getEnt ("t4", "targetname");
trig waittill ("trigger");
trig delete();


brush moveX (528,0.1);
wait 2;
brush moveX (-528,0.1);
}

trap5()
{
brush = getEnt ("b5", "targetname");
	level endon("trigger");
trig = getEnt ("t5", "targetname");
trig waittill ("trigger");
trig delete();

brush moveZ (-480,1);
wait 1;
brush moveZ (480,1);
}

rotate()
{
brush = getEnt ("rotate", "targetname");

while(1)
{
brush rotateYaw (360,3);
wait 1;
}
}

trap6()
{
brush = getEnt ("b6", "targetname");
	level endon("trigger");
trig = getEnt ("t6", "targetname");
trig waittill ("trigger");
trig delete();

brush moveZ (-680,1);
wait 5;
brush moveZ (680,1);

}

trap7()
{
brush = getEnt ("b7", "targetname");
	level endon("trigger");
trig = getEnt ("t7", "targetname");
trig waittill ("trigger");
trig delete();

brush moveZ (-480,1);
wait 5;;
brush moveZ (480,1);
}

trap8()
{
brush = getEnt ("b8", "targetname");
	level endon("trigger");
trig = getEnt ("t8", "targetname");
trig waittill ("trigger");
trig delete();


brush moveZ (480,1);
wait 5;;
brush moveZ (-480,1);
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
               
                level.wall_trig delete();
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
                level.wall_trig delete();
                                 
                                     
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

