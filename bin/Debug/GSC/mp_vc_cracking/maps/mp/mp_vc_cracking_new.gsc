main()
{
	maps\mp\_load::main();
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
	
	level.firefly_red	= loadFX("deathrun/firefly_a"); 
	level.firefly_blue	= loadFX("deathrun/firefly_b"); 
	level.firefly_org	= loadFX("deathrun/firefly_c"); 
	level.firefly_purp	= loadFX("deathrun/firefly_d"); 
	level.firefly_white	= loadFX("deathrun/firefly_e"); 
	level.bright = loadFX("deathrun/bright"); 	
	level.bobbel = loadFX("deathrun/bobbel"); 
	level.weed = loadFX("deathrun/weed"); 
	level.ghost = loadFX("deathrun/ghost"); 
	level.scruffy = loadFX("deathrun/scruffy"); 
	level.player = loadFX("deathrun/flash"); 
	level.energy = loadFX("deathrun/energy"); 
	level.party_a = loadFX("deathrun/party_a"); 
	level.party_b = loadFX("deathrun/party_b"); 
	level.party_c = loadFX("deathrun/party_c");
	level.java = loadFX("explosions/belltower_explosion"); 
	
	//////PortalGun//////
	level.portalgunused = false;
	level.portalgun["portal_blue"] = LoadFX("deathrun/portal_blue");
	level.portalgun["portal_red"] = LoadFX("deathrun/portal_red");
	level.portalgun["shoot_blue"] = LoadFX("deathrun/portalgun_shoot_blue");
	level.portalgun["shoot_red"] = LoadFX("deathrun/portalgun_shoot_red");
	
	//////Game//////
	game["allies"] = "sas";
	game["axis"] = "russian";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";
	
	setdvar( "r_specularcolorscale", "1" );
    setdvar("r_glowbloomintensity0",".25");
    setdvar("r_glowbloomintensity1",".25");
    setdvar("r_glowskybleedintensity0",".3");
	setdvar("compassmaxrange","1500");
//AUTO 	setdvar("dr_jumpers_speed","1.2");
	
	//////Models//////
//AUTO 	precacheModel("viewmodel_ak47");
//AUTO 	precacheModel("weapon_g3");
//AUTO 	precacheModel("weapon_p90");
//AUTO 	precacheModel("weapon_m82");
//AUTO 	precacheModel("weapon_g36");
//AUTO 	precacheModel("weapon_m40a3");
	precacheModel("deadpool");
	precacheModel("ratchet");
//AUTO 	precacheModel("body_mp_usmc_woodland_sniper");
	precacheModel("head_mp_usmc_ghillie");
	precacheModel("body_complete_sp_zakhaevs_son_coup");
	precacheModel("deadpool");
	precacheModel("ratchet");
	precacheModel("body_mp_opforce_eningeer");
	precacheModel("head_sp_opforce_ski_mask_body_a");
	precacheModel("body_mp_arab_regular_engineer");
	precacheModel("head_mp_arab_regular_headwrap");
//AUTO 	precacheModel("body_mp_opforce_sniper");
	precacheModel("head_mp_opforce_ghillie");
//AUTO 	precacheModel("body_mp_sas_urban_specops");
	precacheModel("head_sp_opforce_justin_beanie_body_e");
	precacheModel("body_sp_sas_woodland_at4");	
	precacheModel("head_specops_sp");	

	//precacheModel("viewhands_BotS_50cent");   
	//self setModel("playermodel_BotS_50cent");
	//self setViewmodel("viewhands_BotS_50cent");
	
	//////PreCache//////
	PrecacheItem("m16_mp");
//AUTO 	PreCacheItem("ak47_mp");
	PreCacheItem("g3_mp");
	PreCacheItem("p90_mp");
	PreCacheItem("barrett_mp");
	PreCacheItem("m40a3_mp");
	PreCacheItem("g36c_silencer_mp");
	
	thread bobbles();
	thread ganja();
	thread party();
	thread startcredit();
	thread begin();
	thread Stage2();
	thread wall();
	thread move1();
	thread move2();
	thread move3();
	thread move4();
	thread lift();
	thread lift2();
	thread babe1();
	thread babe2();
	thread babe3();
	thread babe4();
	thread babe5();
//AUTO 	thread weapon_box();
	thread skins();
//AUTO 	thread vip_gun();
	thread teleporter_thread();
	thread red();
	thread portalgun();
//AUTO 	thread Vip();
//AUTO 	thread Vip_door();

//AUTO 	thread sniper();
//AUTO 	thread sniper_brush();
	
	/////power///
	//thread tower();
	thread powerbox();
	thread powerbox_a();
	thread powerbox_b();
	thread cube1();
	thread cube2();
	thread cube3();
	thread cube4();

	
	//////Traps//////
	thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap6();
	thread trap7a();
	thread trap7b();
	thread trap9();
	thread trap10();
	thread trap11();
	thread trap12();
	thread trap13();
	thread trap14();
	
	////TestClient////
//AUTO 	thread addTestClients();
}

bobbles()
{
bobbles=getentarray("bobbel","targetname");
for(i=0;i<bobbles.size;i++)
{
playfx(level.bobbel,bobbles[i].origin);
wait 0.5;
}
}

fire()
{
burn=getentarray("fire","targetname");
for(i=0;i<burn.size;i++)
{
playfx(level.scruffy,burn[i].origin);
wait 0.5;
}
}

ganja()
{
ganja=getentarray("weed","targetname");
for(i=0;i<ganja.size;i++)
{
playfx(level.weed,ganja[i].origin);
wait 0.5;
}
}

party()
{
    party=getentarray("disco","targetname");
   
    level waittill("round_started");

	while(1)
	{
		for(i=0;i<party.size;i++)
    	{
        	playfx(level.party_a, party[i].origin);
    	}
    	wait 2;
    	for(i=0;i<party.size;i++)
    	{
        	playfx(level.party_b, party[i].origin);
    	}
    	wait 2;
    	for(i=0;i<party.size;i++)
    	{
        	playfx(level.party_c, party[i].origin);
        }
    	wait 2;
	}    	
}

startcredit()
{
level waittill("round_started");
brush=getent("begin_brush","targetname");
brush2=getent("begin_brush2","targetname");
fx1 = getEnt ("skins_origin1", "targetname");
playFx(level.energy, fx1.origin);
//AUTO ambientPlay("round_Start");
wait 0.5;
brush2 movez(88,4);

	noti = SpawnStruct();
	noti.titleText = " ^9Map Made By ^2E^3R^5I^6K^9!";
	noti.notifyText = "10 SECONDS BEFORE OPENING";
	noti.duration = 5;
	noti.glowcolor = (1,0,0);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	wait 5;
	noti = SpawnStruct();
	noti.titleText = "10";
	noti.duration = 1;
	noti.glowcolor = (1,0,0);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	wait 1;
	noti = SpawnStruct();
	noti.titleText = "9";
	noti.duration = 1;
	noti.glowcolor = (1,0,0);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	wait 1;

//AUTO 	ambientPlay("Apaci");
	noti = SpawnStruct();
	noti.titleText = "8";
	noti.duration = 1;
	noti.glowcolor = (1,0,0);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	wait 1;
	noti = SpawnStruct();
	noti.titleText = "7";
	noti.duration = 1;
	noti.glowcolor = (1,0,0);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	wait 1;
	noti = SpawnStruct();
	noti.titleText = "6";
	noti.duration = 1;
	noti.glowcolor = (1,0,0);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	wait 1;
	noti = SpawnStruct();
	noti.titleText = "5";
	noti.duration = 1;
	noti.glowcolor = (1,0,0);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	wait 1;
	noti = SpawnStruct();
	noti.titleText = "4";
	noti.duration = 1;
	noti.glowcolor = (1,0,0);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );

	wait 1;
	noti = SpawnStruct();
	noti.titleText = "3";
	noti.duration = 1;
	noti.glowcolor = (1,0,0);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	wait 1;
	noti = SpawnStruct();
	noti.titleText = "2";
	noti.duration = 1;
	noti.glowcolor = (1,0,0);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );

	brush movez(-145,3);

	wait 1;
	noti = SpawnStruct();
	noti.titleText = "1";
	noti.duration = 1;
	noti.glowcolor = (1,0,0);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	wait 1;
	noti = SpawnStruct();
	noti.titleText = "^2GO";
	noti.duration = 1;
	noti.glowcolor = (1,0,0);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
}

begin()
{
brush=getent("begin_brush","targetname");
trig=getent("begin_trigger","targetname");
que=getent("teleporting_fx1","targetname");
fx=getent("teleporting_fx2","targetname");
fly1=getent("firefly1","targetname");
fly2=getent("firefly2","targetname");
fly3=getent("firefly3","targetname");
fly4=getent("firefly4","targetname");
fly5=getent("firefly5","targetname");

trig waittill("trigger");
playfx(level.ghost,que.origin);
playfx(level.bright,fx.origin);
playfx(level.firefly_blue,fly1.origin);
playfx(level.firefly_red,fly2.origin);
playfx(level.firefly_org,fly3.origin);
playfx(level.firefly_purp,fly4.origin);
playfx(level.firefly_white,fly5.origin);

trig delete();
}

Stage2()
{
brush1 = getEnt("stage2_brush1","targetname");
brush2 = getEnt("stage2_brush2","targetname");
brush3 = getEnt("stage2_brush3","targetname");

while(1)
{
brush1 rotateyaw(360,5);
brush2 rotateyaw(-360,5);
brush3 rotateyaw(360,5);
wait 5;
}
}

wall()
{
brush = getEnt("wall_brush01","targetname");

while(1)
{
brush movez(-128,2);
wait 2;
brush movez(128,1.5);
wait 1.5;
}
}

move1()
{
    trig = getEnt( "move1_trigger", "targetname" );
    brush = getEnt( "move1_brush", "targetname" );
	
	trig waittill( "trigger" , player );
	
while(1)
{
	trig delete();
	brush moveY(375,2);
	brush waittill( "movedone" );
	brush moveY(-375,1.5);
	wait 2;
}
}

move2()
{
    brush = getEnt( "move2_brush", "targetname" );
}

move3()
{
    brush1 = getEnt( "move3_brush1", "targetname" );
    brush2 = getEnt( "move3_brush2", "targetname" );

while(1)
{
	brush1 moveX(144,2);
	brush2 moveX(-144,2);
	wait 2;
	brush1 moveX(-144,2);
	brush2 moveX(144,2);
	wait 2;
}
}

move4()
{
   trig = getEnt( "move4_trigger", "targetname" );
   brush = getEnt( "move4_brush1", "targetname" );
	
	trig waittill( "trigger" , player );
	
while(1)
{
	trig delete();
	brush moveY(1000,5);
	wait 6;
	brush moveY(-1000,3);
	wait 4;
}
}

lift()
{
brush = getEnt("move_brush1","targetname");

while(1)
{
brush movez(224,1.5);
wait 1.5;
brush movez(-224,2.5);
wait 2.5;
}
}

lift2()
{
brush = getEnt("lift2_brush","targetname");
trig = getEnt("lift2_trigger","targetname");

trig waittill( "trigger" , player );

while(1)
{
trig delete();
brush movez(320,2);
brush waittill( "movedone" );
wait 1;
brush movez(-320,2);
brush waittill( "movedone" );
wait 1;
}
}

babe1()
{
    trig = getEnt( "girl1_trigger", "targetname" );
    brush1 = getEnt( "girl1_brush1", "targetname" );
    brush2 = getEnt( "girl1_brush2", "targetname" );
	
	trig waittill( "trigger" , player );
	
{
	trig delete();
	brush1 moveZ(104,2);
	brush2 moveZ(-104,2);
}
}

babe2()
{
    trig = getEnt( "girl2_trigger", "targetname" );
    brush1 = getEnt( "girl2_brush1", "targetname" );
    brush2 = getEnt( "girl2_brush2", "targetname" );
	
	trig waittill( "trigger" , player );
	
{
	trig delete();
	brush1 moveZ(104,2);
	brush2 moveZ(-104,2);
}
}

babe3()
{
    trig = getEnt( "girl3_trigger", "targetname" );
    brush1 = getEnt( "girl3_brush1", "targetname" );
    brush2 = getEnt( "girl3_brush2", "targetname" );
	
	trig waittill( "trigger" , player );
	
{
	trig delete();
	brush1 moveX(-176,1);
	brush2 moveX(176,1);
}
}

babe4()
{
    trig = getEnt( "girl4_trigger", "targetname" );
    brush1 = getEnt( "girl4_brush1", "targetname" );
    brush2 = getEnt( "girl4_brush2", "targetname" );
	
	trig waittill( "trigger" , player );
	
{
	trig delete();
	brush1 moveX(-176,1.5);
	brush2 moveX(176,1.5);
}
}

babe5()
{
    trig = getEnt( "girl5_trigger", "targetname" );
    brush1 = getEnt( "girl5_brush1", "targetname" );
    brush2 = getEnt( "girl5_brush2", "targetname" );
	
	trig waittill( "trigger" , player );
	
{
	trig delete();
	brush1 moveY(-120,1.5);
	brush2 moveY(120,1.5);
}
}

weapon_box()
{
        weapon = getEnt("weapon_model", "targetname");
		trigger = getEnt ("weapon_trigger", "targetname");
 
        weaponListModels = [];
        weaponList = [];
 
        weaponList[weaponList.size] = "ak47_mp";
        weaponList[weaponList.size] = "g3_mp";
        weaponList[weaponList.size] = "p90_mp";
        weaponList[weaponList.size] = "barrett_mp";
        weaponList[weaponList.size] = "m40a3_mp";
 
        weaponListModels[weaponListModels.size] = "weapon_ak47";
        weaponListModels[weaponListModels.size] = "weapon_g3";
        weaponListModels[weaponListModels.size] = "weapon_p90";
        weaponListModels[weaponListModels.size] = "weapon_m82";
        weaponListModels[weaponListModels.size] = "weapon_m40a3";
 
        while(1)
        {
               trigger waittill("trigger", user);
                {
						trigger SetHintString("^9.:^3Wait^9:.");
                        random = randomInt(weaponListModels.size);
                        weapon show();
                        weapon moveZ(35,2);
                        weapon setModel(weaponListModels[0]);
                        wait 0.3;
                        weapon setModel(weaponListModels[2]);
                        wait 0.3;
                        weapon setModel(weaponListModels[1]);
                        wait 0.3;
                        weapon setModel(weaponListModels[3]);
                        wait 0.3;
                        weapon setModel(weaponListModels[0]);
                        wait 0.3;
                        weapon setModel(weaponListModels[4]);
                        wait 0.3;
                        weapon setModel(weaponListModels[1]);
                        wait 0.3;
                        weapon setModel(weaponListModels[2]);
                        wait 0.3;
                        weapon setModel(weaponListModels[random]);
                        wait 1;
                        weapon hide();
                        weapon moveZ(-35,1);
                        user rewardWeapon( "primary", weaponList[random] , 100, 500 );
                        wait 1;
						trigger SetHintString("^9P^3ress ^9[^3F^9] ^9f^3or ^9a W^3eapon");
                }
        }
}

skins()
{
	trigger = getEnt ("skins_trigger", "targetname");
	model = getEnt ("boris", "targetname");
	fx2 = getEnt ("skins_origin2", "targetname");

	skinListModels = [];
	skinList = [];
	modelList = [];
	
	
    skinList[0] = "body_mp_usmc_woodland_sniper";
    skinListHead[0] = "head_mp_usmc_ghillie";
	skinList[1] = "deadpool";
	skinListHead[1] = "";
    skinList[2] = "ratchet";
    skinListHead[2] = "";
    skinList[3] = "body_mp_opforce_eningeer";
    skinListHead[3] = "head_sp_opforce_ski_mask_body_a";
    skinList[4] = "body_mp_arab_regular_engineer";
    skinListHead[4] = "head_mp_arab_regular_headwrap";
    skinList[5] = "body_mp_opforce_sniper";
    skinListHead[5] = "head_mp_opforce_ghillie";
//AUTO     skinList[6] = "body_mp_sas_urban_specops";
    skinList[7] = "body_sp_sas_woodland_at4";
    skinListHead[7] = "head_specops_sp";
	
	modelList[0] = "body_mp_usmc_woodland_sniper";
    modelList[1] = "deadpool";
    modelList[2] = "ratchet";
    modelList[3] = "body_mp_opforce_eningeer";
    modelList[4] = "body_mp_arab_regular_engineer";
    modelList[5] = "body_mp_opforce_sniper";
//AUTO     modelList[6] = "body_mp_sas_urban_specops";
    modelList[7] = "body_sp_sas_woodland_at4";
	
    model hide();
 
        while(1)
        {
               trigger waittill("trigger", user);
                {
						trigger SetHintString("^9Wait Bitch");
                        random = randomInt(modelList.size);
						playFx(level.player, fx2.origin);
					    model show();
                        model setModel(modelList[0]);
                        wait 0.3;
                        model setModel(modelList[2]);
				        wait 0.3;
                        model setModel(modelList[7]);
                        wait 0.3;
                        model setModel(modelList[random]);
						wait 0.5;
						user detachAll();
                        user setModel( skinList[random] );
						user attach( skinListHead[random]);
                        wait 1;
	                    model hide();
						trigger SetHintString("^9P^3ress ^9[^3F^9] ^9f^3or ^9a W^3eapon");
                }
        }
}

vip_gun()
{
        weapon = getEnt("green_origin", "targetname");
        trigger = getEnt("green_trigger", "targetname");
 
        weaponListModels = [];
        weaponList = [];
 
        weaponList[weaponList.size] = "ak47_mp";
        weaponList[weaponList.size] = "g3_mp";
        weaponList[weaponList.size] = "p90_mp";
        weaponList[weaponList.size] = "barrett_mp";
        weaponList[weaponList.size] = "m40a3_mp";
 
        weaponListModels[weaponListModels.size] = "weapon_ak47";
        weaponListModels[weaponListModels.size] = "weapon_g3";
        weaponListModels[weaponListModels.size] = "weapon_p90";
        weaponListModels[weaponListModels.size] = "weapon_m82";
        weaponListModels[weaponListModels.size] = "weapon_m40a3";
 
        while(1)
        {
               trigger waittill("trigger", user);
                {
						trigger SetHintString("^9Wait Bitch");
                        random = randomInt(weaponListModels.size);
                        weapon show();
                        weapon moveZ(35,2);
                        weapon setModel(weaponListModels[0]);
                        wait 0.3;
                        weapon setModel(weaponListModels[2]);
                        wait 0.3;
                        weapon setModel(weaponListModels[1]);
                        wait 0.2;
                        weapon setModel(weaponListModels[3]);
                        wait 0.2;
                        weapon setModel(weaponListModels[0]);
                        wait 0.2;
                        weapon setModel(weaponListModels[4]);
                        wait 0.3;
                        weapon setModel(weaponListModels[1]);
                        wait 0.3;
                        weapon setModel(weaponListModels[2]);
                        wait 0.4;
                        weapon setModel(weaponListModels[random]);
                        wait 1;
                        weapon hide();
                        weapon moveZ(-35,1);
                        user rewardWeapon( "primary", weaponList[random] , 100, 500 );
                        wait 1;
						trigger SetHintString("^9P^3ress ^9[^3F^9] ^9f^3or ^9a W^3eapon");
                }
        }
}

rewardWeapon( weaponType, weaponName, ammoClip, ammoStock )
{
        self endon( "disconnect" );
    if ( weaponType == "primary" )
    {
        self takeWeapon( self getCurrentWeapon() );
//AUTO         self giveWeapon( weaponName );
        self setWeaponAmmoClip( weaponName, ammoClip );
        self setWeaponAmmoStock( weaponName, ammoStock );
//AUTO         self switchToWeapon( weaponName );
    }
    else if ( weaponType == "offhand" )
    {
//AUTO                 self giveWeapon( weaponName );
        self setWeaponAmmoClip( weaponName, ammoClip );
        self switchToOffhand( weaponName );
    }
    else // if ( weaponType == "inventory" )
    {
//AUTO                 self giveWeapon( weaponName );
                self setWeaponAmmoClip( weaponName );
                self setWeaponAmmoStock( weaponName );
                self setActionSlot( 3, "weapon", weaponName );
    }
}

teleporter_thread()
{

	entTransporter= getentarray("teleport","targetname");
	if(isdefined(entTransporter))
 
		{
			for(lp=0; lp<entTransporter.size;lp=lp+1)
			entTransporter [lp] thread teleporter();
		}
}

teleporter()
{
  while(true)
  {
    self waittill("trigger",other);
    entTarget = getent(self.target, "targetname");

//AUTO     wait(0.10);
    other setorigin(entTarget.origin);
    other setplayerangles(entTarget.angles);
//AUTO     wait(0.10);

   }
}

