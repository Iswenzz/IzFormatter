main()
{

	precacheItem( "remington700_mp" );


	thread sniper();

}

sniper()
{
	ambient_fx = getEnt( "ambient_fx", "targetname" );

	mreza_old = getEnt( "mreza_old", "targetname" );
	mreza_w = getEnt( "mreza_w", "targetname" );
	mreza_s = getEnt( "mreza_s", "targetname" );

	mreza_old notSolid();
	mreza_w notSolid();
	mreza_s notSolid();

	mreza_old hide();
	mreza_w hide();
	mreza_s hide();


	level.enter_snip = getent ("trigg_sniper" , "targetname");

	level.enter_snip waittill ("trigger" , jumper);

	mreza_old Solid();
	mreza_w Solid();
	mreza_s Solid();
	mreza_old show();
	mreza_w show();
	mreza_s show();

//AUTO 	ambientPlay("mario_ambient3");
	fx = PlayLoopedFX( level._effect["snijeg_crveni2"], 1, ambient_fx.origin );

thread aktiv_teleport_snip();
jumper thread jumper_snip();
}

jumper_snip()
{
	enter_jumper_room = getent ("jumper_enter_snip" , "targetname");

	mreza_s = getEnt( "mreza_s", "targetname" );


self setorigin (enter_jumper_room.origin);
self setplayerangles (enter_jumper_room.angles);

//AUTO iprintlnbold ("^3---^1" + self.name + "^3--- ^2entered SNIPER room!");

//AUTO self TakeAllWeapons();
//AUTO self GiveWeapon("remington700_mp");
wait 0.01;
//AUTO self SwitchToWeapon("remington700_mp");

self SetWeaponAmmoStock( "remington700_mp", 900 );

self death();
self thread jumper_port();

//AUTO iprintlnbold ("^3---^1" + self.name + "^3--- ^2is dead!");
//AUTO iprintlnbold ("^2SNIPER ^3teleport is open!!");

	mreza_s notSolid();
	mreza_s hide();

}

death()
{
self endon("disconnect");

self waittill ("death");
}

jumper_port()
{

	mreza_s = getEnt( "mreza_s", "targetname" );

while(1)
{
level.enter_snip waittill ("trigger" ,jumper);

mreza_s Solid();
mreza_s show();

i = RandomIntRange(1,4);
enter_jumper_room2 = getent ("jumper_enter_snip2_"+i , "targetname");


jumper setorigin (enter_jumper_room2.origin);
jumper setplayerangles (enter_jumper_room2.angles);

//AUTO iprintlnbold ("^3---^1" + jumper.name + "^3--- ^2entered SNIPER room!");

//AUTO jumper TakeAllWeapons();
//AUTO jumper GiveWeapon("remington700_mp");
//AUTO wait 0.01;
//AUTO jumper SwitchToWeapon("remington700_mp");

self SetWeaponAmmoStock( "remington700_mp", 900 );

jumper death();

//AUTO iprintlnbold ("^3---^1" + jumper.name + "^3--- ^2is dead!");
//AUTO iprintlnbold ("^2SNIPER ^3teleport is opened!!");

mreza_s notSolid();
mreza_s hide();


}
}

aktiv_teleport_snip()
{
	players = getEntArray("player", "classname");
	for(i=0;i<players.size;i++)
	{
		if( IsAlive(players[i]))
		{
			if( players[i].pers["team"] == "axis" )
			{
				players[i] thread teleportiraj_aktivatora();
			}
		}
	}
}

teleportiraj_aktivatora()
{
enter_aktiv_room = getent ("aktivator_enter_snip" , "targetname");

self setorigin (enter_aktiv_room.origin);
self setplayerangles (enter_aktiv_room.angles);

//AUTO self TakeAllWeapons();
//AUTO self GiveWeapon("remington700_mp");
wait 0.01;
//AUTO self SwitchToWeapon("remington700_mp");

self SetWeaponAmmoStock( "remington700_mp", 900 );
}

