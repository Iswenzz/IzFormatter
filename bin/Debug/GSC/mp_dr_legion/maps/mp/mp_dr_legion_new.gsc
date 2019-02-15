main()
{
        
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);

	addTriggerToList("trap_1");
	addTriggerToList("trap_2");
	addTriggerToList("trap_3");
	addTriggerToList("trap_4");
	addTriggerToList("trap_5");
	addTriggerToList("trap_6");

	maps\mp\_teleport::main();
	maps\mp\_load::main();	
	
//AUTO //AUTO 	ambientplay("ambient_sound");//Play music
	
	thread set_solid();
 	thread move_plat_1();
	thread move_plat_2();
	thread move_elevator();
//AUTO 	thread kniferoom();
//AUTO 	thread bounceroom();
//AUTO 	thread sniperoom();
    thread oldactivate();
	thread snipeplat();
    thread trap_1();
    thread trap_2();
    thread trap_3();
    thread trap_4();
    thread trap_5();
    thread trap_6();
	thread playerjoin();

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


}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

playerjoin()
{
	level endon("game_ended");

	while(true)
	{
		level waittill("connected", player);
		wait 5;
//AUTO         	player iprintlnbold("^2Map ^1Created by ^3Solo.No0dle :D and Solo.TdF :D");
		
	}
}

kniferoom()
{
    level.knife_trig = getEnt( "knife", "targetname");
    jump = getEnt( "jumper_kniferoom", "targetname" );
    acti = getEnt( "activator_kniferoom", "targetname" );
    
    while(1)
    {
        level.knife_trig waittill( "trigger", player );
        if( !isDefined( level.knife_trig ) )
            return;
        if(level.firstenter==true)
  {
                level.snipe_trig delete();
                level.oldtrigger delete();
   level.bounce_trig delete();
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
//AUTO         iPrintlnBold( " ^3" + player.name + " picked ^1KNIFE^7!" );
        while( isAlive( player ) && isDefined( player ) )
//AUTO             wait 1;
    }
}

bounceroom()
{
    level.bounce_trig = getEnt( "bounce_1", "targetname");
    jump = getEnt( "jumper_bounce_1", "targetname" );
    acti = getEnt( "activator_bounce_1", "targetname" );
    while(1)
    {
        level.bounce_trig waittill( "trigger", player );
        if(level.firstenter==true)
  {
                level.snipe_trig delete();
                level.oldtrigger delete();
  level.knife_trig delete();
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
//AUTO         iPrintlnBold( " ^1" + player.name + " picked ^2BOUNCE Room^1!" );
//AUTO   wait 0.1;
        while( isAlive( player ) && isDefined( player ) )
//AUTO             wait 1;
    }
}

sniperoom()
{
    level.snipe_trig = getEnt( "sniperoom", "targetname");
    jump = getEnt( "jumpsnipe", "targetname" );
    acti = getEnt( "actisnipe", "targetname" );

    
    while(1)
    {
        level.snipe_trig waittill( "trigger", player );
        if( !isDefined( level.snipe_trig ) )
            return;
   
  if(level.firstenter==true)
  {
                level.oldtrigger delete();
  level.bounce_trig delete();
  level.knife_trig delete();
  level.firstenter=false;
  }
//AUTO         iPrintlnBold( " ^1" + player.name + " picked ^9SNIPER^1!" );
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
//AUTO         player TakeAllWeapons();
//AUTO  level.activ TakeAllWeapons();
//AUTO  wait 0.1;
//AUTO         player GiveWeapon( "remington700_mp" );
//AUTO         level.activ GiveWeapon( "remington700_mp" );
//AUTO  wait 0.1;
//AUTO  player GiveWeapon( "M40A3_mp" );
//AUTO  level.activ GiveWeapon( "M40A3_mp" );
//AUTO  wait 0.1;;
//AUTO  player switchToWeapon( "remington700_mp" );
//AUTO         level.activ SwitchToWeapon( "remington700_mp" );
        while( isAlive( player ) && isDefined( player ) )
//AUTO             wait 1;
    }
}

set_solid()
{
	trigger = getent("set_solid", "targetname"); //trigger
	blocker = getent("setsolid", "targetname"); //brush
        blocker solid(); 
	trigger waittill ("trigger", player);
        blocker notsolid(); 
//AUTO 	iprintlnbold(" ^1Wh00t? ^2" + player.name + " opened ^3Secret");
	
	
	
} 

move_plat_1()
{
 	object = getent( "plat_1" , "targetname" );	
	while(1)

{	
	object movey(-528,3,3,0);
	wait(3);
	object movey(528,3,3,0);
	wait(3);
}
}

move_plat_2()
{
 	object = getent( "platplat" , "targetname" );	
	while(1)

{	
	object movey(-640,4,2,2);
	wait(4);
	object movey(640,4,2,2);
	wait(4);
}
}


move_elevator(){
	object = getent("elevator" , "targetname" );
	trigger = getent("trigger_elevator" , "targetname" );
	trigger waittill("trigger");
	trigger delete();
	while(1){	
		object movez(882,5,5,0);
		wait(6);
		object movez(-882,5,5,0);
		wait(6);
	}
}

}
oldactivate(){
    level.oldtrigger = getent("oldtrig","targetname");
    object = getent("olddoor","targetname");
    level.oldtrigger waittill("trigger", player);
//AUTO     iPrintlnBold( " ^1" + player.name + " has chosen the OLD way!" );
    level.oldtrigger delete();
    level.bounce_trig delete();
    level.knife_trig delete();
    level.snipe_trig delete();
    object movez(1000,6,6,0);
    wait(6);
}

trap_1()
{
	trigger = getent("trap_1", "targetname"); //trigger
	blocker = getent("elevator", "targetname"); //brush
        blocker solid(); 
/* AUTO 	trigger waittill ("trigger");
        trigger delete();
        blocker notsolid(); 
	wait(1);	
*/}

trap_2()
{
	trigger = getent("trap_2", "targetname"); //trigger
	object = getent("plat_trap_2", "targetname"); //brush
/* AUTO 	trigger waittill ("trigger");
        trigger delete();
        object movex(400,1,1,0);
		wait(3);
		object movex(-400,1,1,0);
		wait(3);
*/}

trap_3()
{
	trigger = getent("trap_3", "targetname"); //trigger
	object = getent("plat_trap_3", "targetname"); //brush
/* AUTO 	trigger waittill ("trigger");
        trigger delete();
        object delete();
	wait(1);	
*/}

trap_4()
{
	trigger = getent("trap_4", "targetname"); //trigger
	object = getent("brush_trap_4", "targetname"); //brush
/* AUTO 	trigger waittill ("trigger");
        trigger delete();
        object movex(-960,1,1,0);
        wait(5);
        object movex(960,1,1,0);
        wait(5);	
*/}

trap_5()
{
	trigger = getent("trap_5", "targetname"); //trigger
	objecta = getent("b1_trap_5", "targetname"); //brush
        objectb = getent("b2_trap_5", "targetname"); //brush
/* AUTO 	trigger waittill ("trigger");
        trigger delete();
        objectb movez(-192,3,3,0);
	objecta movez(192,3,3,0);
        wait(3.5);
	while(1){
	objectb movez(2*192,3,3,0);
	objecta movez(-2*192,3,3,0);
        wait(3.5);
	objectb movez(-2*192,3,3,0);
	objecta movez(2*192,3,3,0);
        wait(3.5);
	}	
*/}

trap_6()
{
	trigger = getent("trap_6", "targetname"); //trigger
	object = getent("spikes_trap_6", "targetname"); //brush
	killtrigger = getent("killtrig", "targetname");
/* AUTO 	trigger waittill ("trigger");
	trigger delete();
        killtrigger enablelinkto ();
	killtrigger linkto (object);
        object movez(100,0.5,0.5,0);
        wait(2.5);
        object movez(-100,0.5,0.5,0);
        wait(2.5);
*/}

snipeplat()
{
	object = getent("platforms","targetname");
	while(1)
	{
		object movez(512,6,3,3);
		wait(6.5);
		object movez(-512,6,3,3);
		wait(6.5);
	}

}

