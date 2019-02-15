main()
{

	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
    level.flameFX = loadFX("deathrun/flamey");
    level.xenonFX = loadFX("deathrun/xenon");
	level.darmuhFX = loadFX("deathrun/darmuh");
	level.lossyFX = loadFX("deathrun/lossy");
	level.fearzFX = loadFX("deathrun/fearz");
	level.spiritFX = loadFX("deathrun/spirit");
	level.morgaanFX = loadFX("deathrun/morgaan");
	level.devilFX = loadFX("deathrun/devil");
	level.spinFX = loadFX("deathrun/spinny");
	level.laser = LoadFX("explosions/laser");
	level.explosion = loadFX("deathrun/explotion");
	level.leak = loadFX("deathrun/leak");
	level.splash = loadFX("deathrun/splash");
	level.plasma = loadFX("deathrun/plasma");
	level.coolfx = loadFX("deathrun/coolfx");
	level.fx_explosion = LoadFX( "deathrun/explosion" );
	
	level.abovehuman["fireball_charge"] = LoadFX("deathrun/shipcharge");
	level.abovehuman["fireball_tracer"] = LoadFX("deathrun/shiptracer");
	level.abovehuman["fireball_explosion"] = LoadFX("deathrun/shipimpact");
	
	PreCacheItem("barrett_acog_mp");
	PreCacheItem("saw_mp");
//AUTO 	PreCacheModel("weapon_raygun");
	precacheModel( "eliza_BR2" );
	precacheModel( "sonic" );
	preCacheShader("reticle_center_cross");
	
	maps\mp\_load::main();	
	maps\mp\drown::main();
	maps\mp\_teleport::main();
	
//AUTO 	//ambientplay( "space2" );	
	setdvar("r_distortion", " 1");
	setdvar("r_specular", " 0");
	
	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";
	
	addTriggerToList( "trigger_spin" );
	addTriggerToList( "trigger_spin2" );
	addTriggerToList( "trigger_spin3" );
	addTriggerToList( "trigger_path" );
//AUTO 	addTriggerToList( "trigger_bounce" );
//AUTO 	addTriggerToList( "trigger_bounce2" );
//AUTO 	addTriggerToList( "trigger_bounce3" );
	addTriggerToList( "trigger_cross1" );
	addTriggerToList( "trigger_cross2" );
	addTriggerToList( "trigger_cross3" );
	addTriggerToList( "trigger_crossdelete" );
	
	////---------------- This Part Was Made By Duffman-------------------
	
	level.shaders = strTok("ui_host;line_vertical;nightvision_overlay_goggles",";");
	for(i=0;i<level.shaders.size;i++)
		precacheShader(level.shaders[i]);
//AUTO 	level.map_vips["guid"] = [];
//AUTO 	level.map_vips["name"] = [];
//AUTO 	level.menuoption["name"] = [];
//AUTO 	level.menuoption["script"] = [];	
//AUTO 	//---------------------ViPs------------------------
//AUTO 	addVip("6547f97b","Xenon");
//AUTO 	addVip("fb93ac5f","Lossy");
//AUTO 	addVip("9dccdd78","3xP' DuffMan");
	//-------------------------------------------------
	
//AUTO 	//------------------Menu options-------------------
	//         Displayname    function
//AUTO 	addMenuOption("^4 DO NOT STACK OPTIONS !!");
//AUTO 	addMenuOption("^1Give Life",Braxi\_mod::GiveLife);
//AUTO 	addMenuOption("^1Respawn",braxi\_mod::respawn);
//AUTO 	addMenuOption("^1Splat !!",Braxi\_mod::gib_splat);
//AUTO 	addMenuOption("^1Juggernaut",maps\mp\mp_dr_detained::jugga);
//AUTO 	addMenuOption("^1Doggy Style",maps\mp\mp_dr_detained::dog);
//AUTO 	addMenuOption("^1Party in my pants bitches",maps\mp\mp_dr_detained::partymode);
//AUTO 	addMenuOption("^1Sonic Dafaq !!",maps\mp\mp_dr_detained::sonic);
//AUTO 	addMenuOption("^4 DO NOT STACK OPTIONS !!");
	////---------------- This Part Was Made By Duffman-------------------
	thread onPlayerConnected();
	
	/////------------Fx-----------------------------
	
	playLoopedFX(level.flameFX, 0.05, (-520, -2340, -1220));
	playLoopedFX(level.flameFX, 0.05, (-520, -2940, -1220));
	playLoopedFX(level.flameFX, 0.05, (-520, -3490, -1220));
	playLoopedFX(level.flameFX, 0.05, (-520, -2340, -1620));
	playLoopedFX(level.flameFX, 0.05, (-520, -2940, -1620));
	playLoopedFX(level.flameFX, 0.05, (-520, -3490, -1620));
	playLoopedFX(level.flameFX, 0.05, (-452, -6706, -1190));
	playLoopedFX(level.flameFX, 0.05, (-452, -7575, -1190));
	playLoopedFX(level.flameFX, 0.05, (-452, -8480, -1190));
	playLoopedFX(level.flameFX, 0.05, (-184, -9834, 1084));
	playLoopedFX(level.leak, 0.05, (184, -7488, -1368));
	playLoopedFX(level.leak, 0.05, (184, -7783, -1368));
	playLoopedFX(level.splash, 0.05, (184, -7488, -1680));
	playLoopedFX(level.splash, 0.05, (184, -7448, -1680));
	playLoopedFX(level.splash, 0.05, (184, -7783, -1680));
	playLoopedFX(level.splash, 0.05, (184, -7743, -1680));
	playLoopedFX(level.plasma, 0.05, (-512, -512, 800));
	playLoopedFX(level.plasma, 0.05, (162, -1736, -944));
	playLoopedFX(level.plasma, 0.05, (162, -2112, -944));
	playLoopedFX(level.plasma, 0.05, (162, -3582, -944));
	playLoopedFX(level.plasma, 0.05, (162, -3388, -944));
	playLoopedFX(level.plasma, 0.05, (-1200, -3582, -944));
	playLoopedFX(level.plasma, 0.05, (-1200, -3388, -944));
	playLoopedFX(level.plasma, 0.05, (-1200, -1736, -944));
	playLoopedFX(level.plasma, 0.05, (-1200, -2112, -944));
	playLoopedFX(level.plasma, 0.05, (-608, -5680, -1022));
	playLoopedFX(level.plasma, 0.05, (-608, -5872, -910));
	playLoopedFX(level.plasma, 0.05, (-608, -6080, -1022));
	playLoopedFX(level.plasma, 0.05, (218, -5714, -1022));
	playLoopedFX(level.plasma, 0.05, (218, -5872, -910));
	playLoopedFX(level.plasma, 0.05, (218, -6066, -1022));
	
	////---------------Threads-------------
	
	thread block();
	thread block2();
	thread block3();
	thread block4();
	thread door();
	thread door2();
	thread door3();
	thread door4();
	thread spin();
	thread spin2();
	thread spin3();
	thread pillar();
	thread pillar2();
	thread pillar3();
//AUTO 	thread bounce();
//AUTO 	thread bounce2();
//AUTO 	thread bounce3();
//AUTO 	thread givefire();
//AUTO 	thread addTestClients();
	thread blah();
	thread cross1();
	thread cross2();
	thread cross3();
	thread yeah();
	thread dave();
	thread crossdelete();
//AUTO 	thread printCredits();
//AUTO 	thread teleportsniper();
//AUTO 	thread teleportknife();
//AUTO 	thread teleportbounce();
//AUTO 	thread give_m40();
	thread teleportjump();
	thread way();
	thread finalFight();
	thread boom();
//AUTO 	thread givefire2();
//AUTO 	thread givefire3();
//AUTO 	thread givefire4();
//AUTO 	thread givefire5();
	thread poopoopoo();
	thread flyingpoo();
	thread flyingpoo2();
	thread KillOnEscape();
	thread getDamage();
	//thread mmm();
	
	}

blah()
{
    wait 2;
    
    players = getentarray("player", "classname");
    for(i=0;i<players.size;i++)                                                         
    {
        if( GetSubStr( players[i] GetGuid(), 24, 32 ) == "6547f97b" )
        {
            players[i] detachall();
            players[i] setmodel("eliza_BR2");
            wait 0.05;
            players[i] Setviewmodel("viewmodel_hands_zombie");
			wait 0.5;
           
        }
    }
}

raygun()
{
//AUTO    self TakeAllWeapons();
//AUTO    self GiveWeapon("barrett_acog_mp");
//AUTO    self GiveMaxAmmo("barrett_acog_mp");
   wait 0.05;
//AUTO    self SwitchToWeapon("barrett_acog_mp");
   wait 0.05;
   }

   jugga()
{
//AUTO     self TakeAllWeapons();
//AUTO     self SetMoveSpeedScale( 1.3 );
    self.maxhealth = 300;
    self.health = self.maxhealth;
	wait 0.5;
//AUTO 	self GiveWeapon("saw_mp");
//AUTO     self GiveMaxAmmo("saw_mp");
    wait 0.05;
//AUTO     self SwitchToWeapon("saw_mp");
    wait 0.05;
//AUTO 	self iprintlnbold ("^1You Are Now A Fucking Juggernaut !!"); 
}

dog()
{
    self detachall();
//AUTO     self TakeAllWeapons();
//AUTO 	self iPrintln( "^1You're a dog now!" );
//AUTO 	self takeallweapons();
//AUTO 	self giveweapon( "dog_mp" );
//AUTO 	self switchtoweapon( "dog_mp" );
	self setModel("german_sheperd_dog");
}

    partymode()
{
	for(;;)
	{	
	
	    AmbientStop( 2 );
		
		SetExpFog(256, 900, 1, 0, 0, 0.1); 
        wait .5; 
        SetExpFog(256, 900, 0, 1, 0, 0.1); 
         wait .5; 
        SetExpFog(256, 900, 0, 0, 1, 0.1); 
		wait .5; 
        SetExpFog(256, 900, 0.4, 1, 0.8, 0.1); 
         wait .5; 
        SetExpFog(256, 900, 0.8, 0, 0.6, 0.1); 
         wait .5; 
        SetExpFog(256, 900, 1, 1, 0.6, 0.1); 
         wait .5; 
        SetExpFog(256, 900, 1, 1, 1, 0.1); 
         wait .5; 
        SetExpFog(256, 900, 0, 0, 0.8, 0.1); 
         wait .5; 
        SetExpFog(256, 900, 0.2, 1, 0.8, 0.1); 
         wait .5; 
        SetExpFog(256, 900, 0.4, 0.4, 1, 0.1); 
         wait .5; 
        SetExpFog(256, 900, 0, 0, 0, 0.1); 
         wait .5; 
        SetExpFog(256, 900, 0.4, 0.2, 0.2, 0.1); 
         wait .5; 
        SetExpFog(256, 900, 0.4, 1, 1, 0.1); 
        wait .5; 
        SetExpFog(256, 900, 0.6, 0, 0.4, 0.1); 
       wait .5; 
        SetExpFog(256, 900, 1, 0, 0.8, 0.1); 
         wait .5; 
        SetExpFog(256, 900, 1, 1, 0, 0.1); 
         wait .5; 
        SetExpFog(256, 900, 0.6, 1, 0.6, 0.1); 
         wait .5; 
        SetExpFog(256, 900, 1, 0, 0, 0.1); 
         wait .5; 
        SetExpFog(256, 900, 0, 1, 0, 0.1); 
        wait .5; 
        SetExpFog(256, 900, 0, 0, 1, 0.1); 
         wait .5; 
        SetExpFog(256, 900, 0.4, 1, 0.8, 0.1); 
        wait .5; 
        SetExpFog(256, 900, 0.8, 0, 0.6, 0.1); 
         wait .5; 
        SetExpFog(256, 900, 1, 1, 0.6, 0.1); 
        wait .5; 
        SetExpFog(256, 900, 1, 1, 1, 0.1); 
         wait .5; 
        SetExpFog(256, 900, 0, 0, 0.8, 0.1); 
         wait .5; 
        SetExpFog(256, 900, 0.2, 1, 0.8, 0.1); 
        wait .5; 
        SetExpFog(256, 900, 0.4, 0.4, 1, 0.1); 
         wait .5; 
        SetExpFog(256, 900, 0, 0, 0, 0.1); 
        wait .5; 
        SetExpFog(256, 900, 0.4, 0.2, 0.2, 0.1); 
       wait .5; 
        SetExpFog(256, 900, 0.4, 1, 1, 0.1); 
        wait .5; 
        SetExpFog(256, 900, 0.6, 0, 0.4, 0.1); 
         wait .5; 
        SetExpFog(256, 900, 1, 0, 0.8, 0.1); 
         wait .5; 
        SetExpFog(256, 900, 1, 1, 0, 0.1); 
         wait .5; 
        SetExpFog(256, 900, 0.6, 1, 0.6, 0.1); 
	}
}

   dave()
{
	creator_trig = getEnt( "dave", "targetname" );
	org = getEnt( "davemas", "targetname" );

	level.accepted1 = "3411b6e369a4218caddeda636547f97b"; // Xenon biatch
	level.accepted2 = "b17ea990e1ba4d8fe5feb364fb93ac5f"; //Lossy was here
	
	while (1)
	{
		creator_trig waittill( "trigger", player );
		tempGuid = player getGUID();
		
		if(player isTouching(creator_trig) && player useButtonPressed())
		{
			if((tempGuid == level.accepted1) || (tempGuid == level.accepted2)) 
			{
				player SetOrigin( org.origin );
//AUTO 				iprintlnbold( "^1" + player.name + "^0is the creator of this map !!!");
			}
            else
            {
//AUTO                 wait 0.5;
//AUTO                 player iprintlnbold ("^1You ^0 are not the creator of this map Go away <3 ;)");
            }
        }
        else
        {
//AUTO             wait 0.5;
        }
	}
}

sonic()
{
			self detachAll();
			self setModel("sonic"); 
			wait 0.5;
//AUTO 			self iprintlnbold ("^1You Are Now Sonic !!"); 
			while(isAlive(self))
	{
		playFx( level.flameFX , self.origin );
		wait .1;
	}
}

	givefire()
{
	trigger = getEnt ("give_efx", "targetname");
	
	
	trigger waittill ("trigger", player);
	trigger delete();
	
	while(isAlive(player))
	{
		playFx( level.xenonFX , player.origin );
		wait .1;
	}
}

givefire2()
{
	trigger = getEnt ("give_efx2", "targetname");
	
	
	trigger waittill ("trigger", player);
	trigger delete();
	
	while(isAlive(player))
	{
		playFx( level.darmuhFX , player.origin );
		wait .1;
	}
}

givefire3()
{
	trigger = getEnt ("give_efx3", "targetname");
	
	
	trigger waittill ("trigger", player);
	trigger delete();
	
	while(isAlive(player))
	{
		playFx( level.coolfx , player.origin );
		wait .1;
	}
}

givefire4()
{
	trigger = getEnt ("give_efx4", "targetname");
	
	
	trigger waittill ("trigger", player);
	trigger delete();
	
	while(isAlive(player))
	{
		playFx( level.Lossyfx , player.origin );
		wait .1;
	}
}

givefire5()
{
	trigger = getEnt ("give_efx5", "targetname");
	
	
	trigger waittill ("trigger", player);
	trigger delete();
	
	while(isAlive(player))
	{
		playFx( level.SpiritFX , player.origin );
		wait .1;
	}
}

//mmm()
//{
	////trigger = getent ("eliza","targetname");
	//for(;;)
	//{
	//	trigger waittill ("trigger",player);     
		//	player detachAll();
		//	player setModel("eliza_BR2"); 
	//		wait 1;
//AUTO 	//	player iPrintLn("^4 You Are Now An Alien !!! ");
	//}
//}

give_m40()
{
trigger = getent ("give_m40_trig","targetname");
while(1)
{
trigger waittill ("trigger",user);
wait(0.2);
//AUTO user iprintlnbold("You Have Taken [^4m40a3^7]");
wait(0.1);	
//AUTO user giveWeapon( "m40a3_mp");
//AUTO user giveMaxammo("m40a3_mp");
wait 0.1;
//AUTO user switchToWeapon("m40a3_mp");
wait 0.1;
trigger delete();
}
}

addTestClients()
{
    setDvar("scr_testclients", "");
    wait 1;
    for(;;)
    {
        if(getdvarInt("scr_testclients") > 0)
            break;
        wait 1;
    }
    testclients = getdvarInt("scr_testclients");
    setDvar( "scr_testclients", 0 );
    for(i=0;i<testclients;i++)
    {
        ent[i] = addtestclient();
 
        if (!isdefined(ent[i]))
        {
//AUTO             println("Could not add test client");
            wait 1;
            continue;
        }
        ent[i].pers["isBot"] = true;
        ent[i] thread TestClient("autoassign");
    }
    thread addTestClients();
}

TestClient(team)
{
    self endon( "disconnect" );
 
    while(!isdefined(self.pers["team"]))
        wait .05;
       
    self notify("menuresponse", game["menu_team"], team);
    wait 0.5;
}


onPlayerConnected() {
	for(;;) {
		level waittill("connected",player);
		if(isVip(player)) {
			if(!isDefined(player.pers["wlced"])) { 
				player.pers["wlced"] = true;
//AUTO 				iPrintln("^1Welcome ^3ViP " + player.name + " ^1to the server!");
			}
			player braxi\_common::clientCmd("bind P openscriptmenu y vipmenu");
			player thread OnMenuResponse();
		}
	}
}

}
addVip(guid,name) {
	level.map_vips["guid"][level.map_vips["guid"].size] = guid;
	level.map_vips["name"][level.map_vips["guid"].size] = name;
}

}
isVip(player) {
	for(i=0;i<level.map_vips["guid"].size;i++)
		if(level.map_vips["guid"][i] == getSubStr(player getGuid(),24,32))
			return true;
	return false;
}

}
OnMenuResponse() {
	self endon("disconnect");
	self.invipmenu = false;
	for(;;wait .05) {
		self waittill("menuresponse", menu, response);
		if(!self.invipmenu && response == "vipmenu") {
			self.invipmenu = true;
			for(;self.sessionstate == "playing" && !self isOnGround();wait .05){}
			self thread VipMenu();
			self disableWeapons();
			self freezeControls(true);			
			self allowSpectateTeam( "allies", false );
			self allowSpectateTeam( "axis", false );
			self allowSpectateTeam( "none", false );			
		}
		else if(self.invipmenu && response == "vipmenu") self endMenu();	
	}
}

}
endMenu() {
	self notify("close_vip_menu");
	for(i=0;i<self.vipmenu.size;i++) self.vipmenu[i] thread FadeOut(1,true);
	self thread Blur(2,0);
	self.vipmenubg thread FadeOut(1);
	self.invipmenu = false;
	self enableWeapons();
	self freezeControls(false);
	self allowSpectateTeam( "allies", true );
	self allowSpectateTeam( "axis", true );
	self allowSpectateTeam( "none", true );
}

}
addMenuOption(name,script) {
	level.menuoption["name"][level.menuoption["name"].size] = name;
	level.menuoption["script"][level.menuoption["name"].size] = script;
}

