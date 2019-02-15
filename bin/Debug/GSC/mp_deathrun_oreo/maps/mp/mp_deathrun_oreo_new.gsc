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
	 
//AUTO 	 precacheItem( "ak47_mp" );
	 precacheItem( "deserteaglegold_mp" );
	 precacheItem( "dragunov_acog_mp" );
	 precacheItem("deserteagle_mp");
	 precacheItem("tomahawk_mp");
	 precacheItem( "barrett_mp" );
	 precacheItem("m40a3_mp");
	 precacheItem("uzi_acog_mp");
	 precacheItem( "rpg_mp" );
    
     thread startdoor();
	 thread update();
	 thread secret();
	 thread secret2();
	 thread credits();
	 thread spicy();
	 thread tele1();
	 thread tele2();
	 thread trap1();
     thread trap2();
	 thread trap3();
	 thread trap4();
	 thread trap5();
	 thread trap6();
	 thread trap7();
	 thread ak();
	 thread baret();
//AUTO 	 thread sniper();
	 thread uzi();
	 thread rpg();
	 thread tomahawk();
//AUTO 	 thread deagle();
//AUTO 	 GiveJumpersWeapon();
	 
	 
}

GiveJumpersWeapon( weap )
{
	 if( !isDefined( weap ) || weap == "" )
		return;
 
	 players = getEntArray( "player", "classname" );
	 for( i=0; i<players.size; i++ )
	{
		 if( !isAlive( players[i] ) || players[i].pers["team"] != "allies" )
			continue;
			
//AUTO          players[i] TakeAllWeapons();
		 wait 0.01;
//AUTO 		 players[i] giveWeapon( weap );
//AUTO 		 players[i] giveMaxAmmo( weap );
		 players[i] setSpawnWeapon( weap );
		
	}
}

update()
{
wait 10;
	 level.xx5 = newHudElem();	
	 level.xx5.x = 0;	
	 level.xx5.y = 150;
	 level.xx5.horzAlign = "center";	
	 level.xx5.vertAlign = "middle";
	 level.xx5.alignX = "center";
	 level.xx5.alignY = "middle";
	 level.xx5.sort = 102;	
	 level.xx5.foreground = 1;	
	 level.xx5.archived = true;	
	 level.xx5 fadeOverTime(2);
	 level.xx5.alpha = 1;	
	 level.xx5.fontScale = 4.6;
	 level.xx5.hidewheninmenu = false;	
	 level.xx5.color = (236,60,134);	
	 level.xx5.glowColor = (0.3, 0.6, 0.7);
	 level.xx5.glowAlpha = 1;
	 level.xx5.label = &"Updated version";	
	 wait 4;
	 level.xx5 fadeOverTime(4);
	 level.xx5.alpha = 0;	
	 wait 10;
	 level.xx5 destroy();
}

secret()
{
    trig = getent ("secrettrig", "targetname");
	target = getent("secrettarget", "targetname");
	for(;;)
	{
	    trig waittill("trigger", player);
		player setOrigin(target.origin);
	}
}

secret2()
{
    trig = getent ("secrettrig2", "targetname");
	target = getent("secrettarget2", "targetname");
	for(;;)
	{
	    trig waittill("trigger", player);
		player setOrigin(target.origin);
	}
}

tele1()
{
    trig = getent ("teleport_trig1", "targetname");
	target = getent("teleport_target1", "targetname");
	for(;;)
	{
	    trig waittill("trigger", player);
		player setOrigin(target.origin);
	}
}

tele2()
{
    trig = getent ("teleport_trig2", "targetname");
	target = getent("teleport_target2", "targetname");
	for(;;)
	{
	    trig waittill("trigger", player);
		player setOrigin(target.origin);
	}
}

credits()
{
wait 5;
for(;;)
	 {
//AUTO 	 iPrintLn ("^1>>^3Map By Sheep Wizard");
	 wait 7;
//AUTO 	 iPrintLn ("^1>>^3Youtube: paap15");
	 wait 7;
//AUTO 	 iPrintLn ("^1>>^3Xfire: paap15");
	 wait 7;
//AUTO 	 iPrintLn ("^1>>^3Updated version of map");
	 wait 18;
	 }
}

startdoor()
{
    
     door = getEnt("door", "targetname");
	 door2 = getEnt("door2", "targetname");
     wait(10);
//AUTO 	 iPrintLnBold (" ^2Game ^6will ^2start ^6in ^210 ^6second");
	 wait(1);
//AUTO 	 iPrintLnBold (" ^2Map by ^6Sheep Wizard");
	 wait(10);
//AUTO 	 iPrintLnBold ("Begin");
     door moveX(385,8);
	 door2 moveX(-385,8);
	 door waittill("movedone");
	 wait 2;
	 door delete();
	 door2 delete();	 
}

spicy()
{
      
	  spicy = getEnt("spicy", "targetname");
	  spicy waittill ("trigger", player);
	  spicy delete();
//AUTO 	  iPrintLnBold ("^3S^5picy ^3W^5einer's ^3T^5ingly ^3N^5ips");
	  
}

trap1()
{
     trig = getEnt("trap1_trig", "targetname");
	 move = getEnt("trap1_move", "targetname");
	 move2 = getEnt("trap1_move2", "targetname");
	 
/* AUTO 	 trig waittill ("trigger", player);
	 trig delete();
	 
	 while(1)
	 {
	     move moveX(448,1);
		 move waittill ("movedone");
	     move2 movex(-448,1);
	     move2 waittill ("movedone");
		 move moveX(-448,1);
		 move waittill ("movedone");
	     move2 movex(448,1);
	     move2 waittill ("movedone");
		}
*/}

trap2()
{
     trig = getEnt("trap2_trig", "targetname");
	 bounce = getEnt("trap2_bounce", "targetname");
	 
/* AUTO 	 trig waittill ("trigger", player);
	 trig delete();
	 
	 while(1)
	 {
	     bounce rotatepitch (180,11);
		 wait 11;
		}
*/}

trap3()
{
     trig = getEnt("trap3_trig", "targetname");
	 push = getEnt("trap3_push", "targetname");
	 
/* AUTO 	 trig waittill ("trigger", player);
	 trig delete();
	 
	 while(1)
	 {
	     push moveY(-448,0.5);
	     push waittill ("movedone");
	     wait 3;
	     push moveY(448,0.5);
		 push waittill ("movedone");
		 wait 3;
		}
*/}

trap4()
{
     trig = getEnt("trap4_trig", "targetname");
	 spin = getEnt("trap4_spin", "targetname");
	 spin2 = getEnt("trap4_spin2", "targetname");
	 spin3 = getEnt("trap4_spin3", "targetname");
	 spin4 = getEnt("trap4_spin4", "targetname");
	 
/* AUTO 	 trig waittill ("trigger", player);
	 trig delete();
	 
	 while(1)
	 {
	     spin rotateyaw (180,2);
		 spin2 rotateyaw(-180,2);
		 spin3 rotateyaw(180,2);
		 spin4 rotateyaw(-180,2);
		 wait 2;
		}
	 
*/}

trap5()
{
     trig = getEnt("trap5_trig","targetname");
	 pole = getEnt("trap5_pole", "targetname");
	 pole2 = getEnt("trap5_pole2", "targetname");
	 pole3 = getEnt("trap5_pole3", "targetname");
	 pole4 = getEnt("trap5_pole4", "targetname");
	 
/* AUTO 	 trig waittill ("trigger", player);
	 trig delete();
	 
     while(1)
	{
	     pole movey(-260, 1);
	     pole2 movez(-60, 1);
		 pole3 movey(260, 1);
		 pole4 movex (-260, 1);
	     wait 0.8;
	     pole movey(260, 1);
	     pole2 movez(60, 1);
		 pole3 movey(-260, 1);
		 pole4 movex (260, 1);
         wait 0.8;
	}
*/}

trap6()
{
     trig = getEnt("trap6_trig", "targetname");
	 baa = getEnt("trap6_baa", "targetname");
	 baa2 = getEnt("trap6_baa2", "targetname");
	 baa3 = getEnt("trap6_baa3", "targetname");
	 baa4 = getEnt("trap6_baa4", "targetname");
	 
/* AUTO 	 trig waittill ("trigger", player);
	 trig delete();
	 
	 baa movex (272, 1);
	 baa2 movex (272, 1);
	 baa3 movex (-272, 1);
	 baa4 movex (-272, 1);
	 
	 while (1)
	 {
	     wait 5;
		 baa movex (-544, 1);
	     baa2 movex (-544, 1);
	     baa3 movex (544, 1);
	     baa4 movex (544, 1);
		 wait 5;
		 baa movex (544, 1);
	     baa2 movex (544, 1);
	     baa3 movex (-544, 1);
	     baa4 movex (-544, 1);
		}
*/}

trap7()
{
     trig = getEnt("trap7_trig", "targetname");
	 strip = getEnt("trap7_strip", "targetname");
	 strip2 = getEnt("trap7_strip2", "targetname");
	 strip3 = getEnt("trap7_strip3", "targetname");

	 
/* AUTO 	 trig waittill ("trigger", player);
	 trig delete();
	 
	 while(1)
	 {
	     strip rotateroll (180,0.5);
		 strip2 rotateroll(-180,0.5);
		 strip3 rotateroll(180,0.5);
		 wait 0.5;
		}
	 
*/}

ak()
{
     ak = getEnt("ak", "targetname");
	 baret = getEnt("baret", "targetname");
	 sniper = getEnt("sniper", "targetname");
	 uzi = getEnt("uzi", "targetname");
	 rpg = getEnt("rpg", "targetname");
	 tomahawk = getEnt("tomahawk", "targetname");
	 deagle = getEnt("deagle", "targetname");
	 door9 = getEnt("door9", "targetname");
	 finaldoor = getEnt("finaldoor", "targetname");
	 ak waittill ("trigger", player); 
	 baret delete();
	 sniper delete();
	 uzi delete();
	 rpg delete();
	 tomahawk delete();
	 deagle delete();
	 door9 delete();
	 
	 GiveJumpersWeapon( "ak47_mp" );
//AUTO 	 level.activ TakeAllWeapons();
//AUTO 	 level.activ giveWeapon ("ak47_mp" );
//AUTO 	 level.activ SwitchToWeapon("ak47_mp");
//AUTO 	 iprintlnbold("^3"+ player.name + " "+ "entered ^5Ak47 ^3fight!");
	 wait 4;
	 finaldoor moveZ (-272, 5);
}

baret()
{
     ak = getEnt("ak", "targetname");
	 baret = getEnt("baret", "targetname");
	 sniper = getEnt("sniper", "targetname");
	 uzi = getEnt("uzi", "targetname");
	 rpg = getEnt("rpg", "targetname");
	 tomahawk = getEnt("tomahawk", "targetname");
	 deagle = getEnt("deagle", "targetname");
	 door8 = getEnt("door8", "targetname");
	 finaldoor = getEnt("finaldoor", "targetname");
	 
	 baret waittill ("trigger", player);
	 
	 ak delete();
	 sniper delete();
	 uzi delete();
	 rpg delete();
	 tomahawk delete();
	 deagle delete();
	 door8 delete();
	 
	 GiveJumpersWeapon( "barrett_mp" );
//AUTO 	 level.activ TakeAllWeapons();
//AUTO 	 level.activ giveWeapon ("barrett_mp" );
//AUTO 	 level.activ SwitchToWeapon("barrett_mp");
//AUTO 	 iprintlnbold("^3"+ player.name + " "+ "entered ^5Barrett ^3fight!");
	 wait 4;
	 finaldoor moveZ (-272, 5);
}

sniper()
{
     ak = getEnt("ak", "targetname");
	 baret = getEnt("baret", "targetname");
	 sniper = getEnt("sniper", "targetname");
	 uzi = getEnt("uzi", "targetname");
	 rpg = getEnt("rpg", "targetname");
	 tomahawk = getEnt("tomahawk", "targetname");
	 deagle = getEnt("deagle", "targetname");
	 door3 = getEnt("door3", "targetname");
	 finaldoor = getEnt("finaldoor", "targetname");
	 
	 sniper waittill ("trigger", player);
	 
	 ak delete();
	 baret delete();
	 uzi delete();
	 rpg delete();
	 tomahawk delete();
	 deagle delete();
	 door3 delete();
	 
	 GiveJumpersWeapon("m40a3_mp" );
//AUTO 	 level.activ TakeAllWeapons();
//AUTO 	 level.activ giveWeapon ("m40a3_mp" );
//AUTO 	 level.activ SwitchToWeapon("m40a3_mp");
//AUTO 	 iprintlnbold("^3"+ player.name + " "+ "entered ^5m40a3 ^3fight!");
	 wait 4;
	 finaldoor moveZ (-272, 5);
}

uzi()
{
     ak = getEnt("ak", "targetname");
	 baret = getEnt("baret", "targetname");
	 sniper = getEnt("sniper", "targetname");
	 uzi = getEnt("uzi", "targetname");
	 rpg = getEnt("rpg", "targetname");
	 tomahawk = getEnt("tomahawk", "targetname");
	 deagle = getEnt("deagle", "targetname");
	 door4 = getEnt("door4", "targetname");
	 finaldoor = getEnt("finaldoor", "targetname");
	 
	 uzi waittill ("trigger", player);
	 
	 ak delete();
	 baret delete();
	 sniper delete();
	 rpg delete();
	 tomahawk delete();
	 deagle delete();
	 door4 delete();
	 
	 GiveJumpersWeapon("uzi_acog_mp" );
//AUTO 	 level.activ TakeAllWeapons();
//AUTO 	 level.activ giveWeapon ("uzi_acog_mp" );
//AUTO 	 level.activ SwitchToWeapon("uzi_acog_mp");
//AUTO 	 iprintlnbold("^3"+ player.name + " "+ "entered ^5Uzi ^3fight!");
	 wait 4;
	 finaldoor moveZ (-272, 5);
}

rpg()
{
     ak = getEnt("ak", "targetname");
	 baret = getEnt("baret", "targetname");
	 sniper = getEnt("sniper", "targetname");
	 uzi = getEnt("uzi", "targetname");
	 rpg = getEnt("rpg", "targetname");
	 tomahawk = getEnt("tomahawk", "targetname");
	 deagle = getEnt("deagle", "targetname");
	 door5 = getEnt("door5", "targetname");
	 finaldoor = getEnt("finaldoor", "targetname");
	 
	 rpg waittill ("trigger", player);
	 
	 ak delete();
	 baret delete();
	 sniper delete();
	 uzi delete();
	 tomahawk delete();
	 deagle delete();
	 door5 delete();
	 
	 GiveJumpersWeapon( "rpg_mp" );
//AUTO 	 level.activ TakeAllWeapons();
//AUTO 	 level.activ giveWeapon ("rpg_mp");
//AUTO 	 level.activ SwitchToWeapon("rpg_mp");
//AUTO 	 iprintlnbold("^3"+ player.name + " "+ "entered ^5RPG ^3fight!");
	 wait 4;
	 finaldoor moveZ (-272, 5);
}

tomahawk()
{
     ak = getEnt("ak", "targetname");
	 baret = getEnt("baret", "targetname");
	 sniper = getEnt("sniper", "targetname");
	 uzi = getEnt("uzi", "targetname");
	 rpg = getEnt("rpg", "targetname");
	 tomahawk = getEnt("tomahawk", "targetname");
	 deagle = getEnt("deagle", "targetname");
	 door6 = getEnt("door6", "targetname");
	 finaldoor = getEnt("finaldoor", "targetname");
	 
	 tomahawk waittill ("trigger", player);
	 
	 ak delete();
	 baret delete();
	 sniper delete();
	 uzi delete();
	 rpg delete();
	 deagle delete();
	 door6 delete();
	 
	 GiveJumpersWeapon( "tomahawk_mp" );
//AUTO 	 level.activ TakeAllWeapons();
//AUTO 	 level.activ giveWeapon ("tomahawk_mp" );
//AUTO 	 level.activ SwitchToWeapon("tomahawk_mp");
//AUTO 	 iprintlnbold("^3"+ player.name + " "+ "entered ^5Knife ^3fight!");
	 wait 4;
	 finaldoor moveZ (-272, 5);
}

deagle()
{
     ak = getEnt("ak", "targetname");
	 baret = getEnt("baret", "targetname");
	 sniper = getEnt("sniper", "targetname");
	 uzi = getEnt("uzi", "targetname");
	 rpg = getEnt("rpg", "targetname");
	 tomahawk = getEnt("tomahawk", "targetname");
	 deagle = getEnt("deagle", "targetname");
	 door7 = getEnt("door7", "targetname");
	 finaldoor = getEnt("finaldoor", "targetname");
	 
	 deagle waittill ("trigger", player);
	 
	  ak delete();
	 baret delete();
	 sniper delete();
	 uzi delete();
	 rpg delete();
	 tomahawk delete();
	 door7 delete();
	 
     GiveJumpersWeapon( "deserteagle_mp" );
//AUTO 	 level.activ TakeAllWeapons();
//AUTO 	 level.activ giveWeapon ("deserteagle_mp" );
//AUTO 	 level.activ SwitchToWeapon("deserteagle_mp");
//AUTO 	 iprintlnbold("^3"+ player.name + " "+ "entered ^5Deagle ^3fight!");
	 wait 4;
	 finaldoor moveZ (-272, 5);

}

