/*
__________________________________________________
  /   /  ___/    __ /   ___// \ \_____/ / /  ___  \
 /   /  /__     /___   /__ / / \ \ __/ / /  /  /  /
/   /  ___/  __    /  ___// /   \ \ / / /  /  /  /
  _/  /__   /_/   /	 /__ / /     \ \ / /  /__/  /
___\____/________/\____//_/	      \_/ /________/

Credit: Blade, Wingzor

Give me credit if you use any of my scripts... thx...
*/
main()
{
	level._angel = loadfx("evangelion/angel");
	level.fx_airstrike_afterburner = loadfx ("fire/jet_afterburner");
	level.fx_airstrike_contrail = loadfx ("smoke/jet_contrail");
	level.trail1 = loadfx ("evangelion/trail");
	level.trail2 = loadfx ("evangelion/trail2");
	level.base_explo = loadfx("explosions/suitcase_explosion");
	level.gunfx1 = loadfx("gun_fx/wunderwaffe_trail");
	level.gunfx2 = loadfx("gun_fx/wunderwaffe_impact");

	precacheModel("vehicle_bmp_woodland_dsty");
	precacheModel("vehicle_bm21_mobile_cover_dstry_static");
	precacheModel("vehicle_cobra_helicopter_d");
	
	thread AngelAttack();
	thread xpboxes_setup();
	level.a1 = false;
	level.a2 = false;
	level.a3 = false;
	thread planes();
	thread trailtrig1();
	thread trailtrig2();
	thread secret_door();
	thread onroundstarts();
	thread save_loadpositions_setup();
	thread whenmapends();
}

onroundstarts()
{
	level waittill("round_started");
	players = getentarray("player","classname");
	for(i=0;i<=players.size;i++)
	{
		players[i].counter = 0; //for secret save/load systeam
		players[i].cheaker = 0; //cheaking if someone uses cuts
		players[i].insecret = false;
	}
}

planes()
{
	pos1 = getent("planemove1","targetname");
	pos2 = getent("planemove2","targetname");
	pos3 = getent("planemove3","targetname");
	trig = getent("trigplanes","targetname");
	trig waittill("trigger",player);
	{
		plane1 = spawn("script_model",(-3001, 9467.6, 2060.2));
		plane1 rotateYaw(-90,0.1);
		plane1 SetModel("vehicle_mig29_desert");
		plane1 moveto(pos1.origin,3);
		plane1 playloopsound("veh_mig29_dist_loop");
		plane1 thread playPlaneFx();

		plane2 = spawn("script_model",(-2281, 10331.6, 2060.2));
		plane2 rotateYaw(-90,0.1);
		plane2 SetModel("vehicle_mig29_desert");
		plane2 moveto(pos2.origin,3);
		wait .1;
		plane2 rotateRoll(360,3);
		plane2 playloopsound("veh_mig29_dist_loop");
		plane2 thread playPlaneFx();

		plane3 = spawn("script_model",(-3721, 10363.6, 2060.2));
		plane3 rotateYaw(-90,0.1);
		plane3 SetModel("vehicle_mig29_desert");
		plane3 moveto(pos3.origin,3);
		wait .1;
		plane3 rotateRoll(-360,3);
		plane3 playloopsound("veh_mig29_dist_loop");
		plane3 thread playPlaneFx();

		if(plane1.angels != (0,270,0) || plane2.angels != (0,270,0) || plane3.angels != (0,270,0))
		{
			plane1.angels = (0,270,0);
			plane2.angels = (0,270,0);
			plane3.angels = (0,270,0);
		}

		trig delete();

		plane1 waittill("movedone");
		plane1 delete();
		wait 0.1;
		plane2 delete();
		plane3 delete();
	}
}

playPlaneFx() //wingzor script - start
{
	self endon ( "death" );
	while(1)
	{
	playfxontag( level.fx_airstrike_afterburner, self, "tag_engine_right" );
	playfxontag( level.fx_airstrike_afterburner, self, "tag_engine_left" );
	playfxontag( level.fx_airstrike_contrail, self, "tag_right_wingtip" );
	playfxontag( level.fx_airstrike_contrail, self, "tag_left_wingtip" );
	wait 1;
	}
} // end

trailtrig1()
{
	trig = getent("trailtrig1","targetname");
	for(i=0;i<=2;i++)
	{
		trig waittill("trigger",player);

		if(player.usedfxtrig == true)
			return player;

		player thread trail1();
		player.usedfxtrig = true;
	}
}

trail1()
{
	self endon("death");
	while(1)
	{
		playfxontag( level.trail1, self, "tag_origin" );
		wait 0.25;
	}
}

trailtrig2()
{
	trig = getent("trailtrig2","targetname");
	for(i=0;i<=2;i++)
	{
		trig waittill("trigger",player);
		
		if(player.usedfxtrig == true)
			return player;

		player thread trail2();
		player.usedfxtrig = true;
	}
}

trail2()
{
	self endon("death");
	while(1)
	{
		playfxontag( level.trail2, self, "tag_origin" );
		wait 0.1;
	}
}

AngelAttack()
{
	level waittill("round_started");

	if(game["roundsplayed"] == 1 || game["roundsplayed"] == 3 || game["roundsplayed"] == 5 || game["roundsplayed"] == 7 || game["roundsplayed"] == 9 || game["roundsplayed"] == 11 )//it says roundsplayed but thats the round they play at the moment
	{
		iprintln("^1[^2World^1]^2:^5Round ^1"+game["roundsplayed"]+"/"+level.dvar["round_limit"]+"^2 Angels Are Removed");
		return;
	}

	wait 5;

	x = randomint(3);
	switch(x)
	{
		case 0:
			iprintlnbold("^1!! Angel 01 Started The Attack !!\n!! Finish The Map Befor The End Base Is Destoryed !! ");
			level.a1=true;
			thread setup();
			break;

		case 1:
			wait 10;
			iprintlnbold("^1!! Angel 02 Started The Attack !!\n!! Finish The Map Befor You Are Drained Out of Health !! ");
			level.a2 = true;
			thread setup();
			break;

		case 2:
			iprintlnbold("^1!! Angel 03 Started The Attack !!\n!! Angel Entered The Base ^1Kill It^7 Befor ^1It Kills You^7  !! ");
			level.a3 = true;
			thread setup();
			break;
	}
	
}

setup()
{
	level.finished = false;
	players = getentarray("player","classname");
	trig = getent("saveround","targetname");

	if(level.a1 == true)
	{
		thread angelTimer();
		for(;;)
		{
			trig waittill("trigger",player);
			{
				level.finished = true;
				trig delete();
				level.angelTimer fadeovertime(2);
				level.angelTimer.alpha = 0;
				iprintlnbold(player.name+" saved the day");
				wait 2;
				level.angelTimer destroy();
			}
		}
	}

	if(level.a2 == true)
	{
		for(i=0;i<=players.size;i++)
		{
			players[i].savehealth = false;
			players[i] thread drainhealth();
		}
		level.activ.savehealth = true; //just in case

		for(;;)
		{
		trig waittill("trigger",player);
		{
			if(player.savehealth == true)
				return player;
			
			player.savehealth = true;
			player.health = 100;
			player iprintlnbold("Health Resotred");
		}
		wait .1;
		}
	}

	if(level.a3 == true)
	{
		thread angel3attack();
	}
}

drainhealth()
{
	while(self.savehealth == false && self != level.activ && self.sessionstate=="playing" && isdefined(self) && isalive(self) && self.pers["team"]=="allies")
	{
		self finishPlayerDamage(self,self, randomint(10)+5, 0, "MOD_FALLING", "rpg_mp", self.origin, self.angles, "none", 0);
		self PlayLocalSound("breathing_hurt");
		wait randomint(10)+5;
	}
}

angel3attack()
{
	level.activdamage = false;
	wall = getent("destroywall","targetname");
	wait randomint(10)+2;
	wall playsound("grenade_explode_layer");
	Earthquake( 2, 3, (-888, 1016, -24), 10000 );
	wait .001;
	wall delete();
	PlayFX(level.explosion,(-888, 1016, -24));
	wait 2;
	angel = spawn("script_model",(-888, 1016, -24));
	wait .01;
	angel SetModel("wraith");
	wait .01;
	PlayFXOnTag(level._angel, angel, "j_spineupper" );
	angel thread movetoplayer();
	angel thread angelstuff(); 
}

movetoplayer() //thx to blade for fixing the accuraci of the follow
{
	players=getentarray("player","classname");
	kill=players[randomint(players.size)];

	for(;;)
	{
		dist = Distance( kill.origin, self.origin );
		pos = kill getorigin();
	if(!(isdefined(kill)) || !(isalive(kill)) || level.activ == kill)
	{
		self thread movetoplayer();
		return;
	}
	else
	{
		if(pos == pos)
		self moveto(kill.origin,2);
		else
		self moveto(kill.origin,3);
	}

	if(dist <= 150)
	{
		level.activdamage = true;
		RadiusDamage( self.origin, 155, 50, 30 );
		wait 0.5;
	}
	else
	level.activdamage = false;

	wait 0.01;
	}
}


angelstuff()
{
	trig = getent("dmgtrig","targetname");
	trig enablelinkto();
	trig linkto(self);
	wait .1;
	health = 2000;
	dmg = 0;
	shotsneeded = 0;
	while(dmg < health)
	{
		trig waittill("damage",dmgd);
		if(level.activdamage == true)//radius damage "fix" for angel
		{
			dmg -= 50;
		}
		shotsneeded++;
		dmg += dmgd; 
		if(dmg >= health)
		{
			PlayFX(level.explosion,self.origin);
			Earthquake( 2, 3, self.origin, 10000 );
			self playsound("grenade_explode_layer");
			self delete();
			iprintln("Shots Needed:^2 "+shotsneeded);
			iprintln("Total damage:^2 "+dmg);
			iprintlnbold("Angel Destroyed !!");
		}
	}
}

angelTimer()
{
	level.time = 90;
	level.angelTimer = NewHudElem();
	level.angelTimer.alignX = "left";
	level.angelTimer.alignY = "center";
	level.angelTimer.horzalign = "left";
	level.angelTimer.vertalign = "center";
	level.angelTimer.alpha = 1;
	level.angelTimer.x = 0;
	level.angelTimer.y = 0;
	level.angelTimer.font = "objective";
	level.angelTimer.fontscale = 2;
	level.angelTimer.glowalpha = 1;
	level.angelTimer.glowcolor = (1,0,0);
	level.angelTimer.label = &"> >Time Left: &&1";
	level.angelTimer moveovertime(1);
	level.angelTimer.y = 100;
	wait 1.1;
	while(level.finished == false)
	{	
		if(level.time == 0)
		{
			level.angelTimer fadeovertime(0.5);
			level.angelTimer.alpha = 0;
			thread destroybase();
			players = getentarray("player","classname");
			for(i=0;i<=players.size;i++)
			{
				players[i] suicide();
			}
			iprintlnbold(">> Time Runed Out\nNo One Finished <<");
			wait .5;
			level.angelTimer destroy();
		}

		level.angelTimer setValue(level.time);
		level.time-=1;
		wait 1;
	}
}

destroybase()
{
	cars = [];
	explo = [];
	cars[0] = getent("car0","targetname");
	cars[1] = getent("car1","targetname");
	cars[2] = getent("car2","targetname");
	cars[3] = getent("car3","targetname");
	cars[4] = getent("car4","targetname");
	cars[5] = getent("car5","targetname");
	cars[6] = getent("heli","targetname");
	explo[0] = getent("explo0","targetname");
	explo[1] = getent("explo1","targetname");
	explo[2] = getent("explo2","targetname");
	for(i=0;i<=cars.size;i++)
	{
		cars[i] thread destroycars(i);
	}
	for(i=0;i<=explo.size;i++)
	{
		explo[i] thread explofx();
	}
}

destroycars(num)
{
	if(num<=2)
	{
		self SetModel("vehicle_bm21_mobile_cover_dstry_static");
		PlayFX(level.explosion,(self.origin));
		self playsound("car_explode_close");
	}
	if(num >= 3 && num <= 5)
	{
		self SetModel("vehicle_bmp_woodland_dsty");
		PlayFX(level.explosion,(self.origin));
		self playsound("car_explode_close");
	}
	if( num == 6 )
	{
		self SetModel("vehicle_cobra_helicopter_d");
		PlayFX(level.explosion,(self.origin));
		self playsound("car_explode_close");
	}
	wait .1;
}

explofx()
{
	PlayFX(level.base_explo,(self.origin));
	self playsound("fuselage_breach_explosion");
}

xpboxes_setup()
{
	for(i=1;i<6;i++)
	{
		thread xpboxes(i);
	}
}

xpboxes(num)
{	
	x = randomint(10);

	box = getent("xpbox_"+num,"targetname");
	trig = getent("xpboxes_trig_"+num,"targetname");
	if(x == 0 ||x == 1 || x == 3 || x == 5 || x == 7 || x == 9)
	{
		box delete();
		trig delete();
	}
	if( x == 2 || x == 4 || x == 6 || x == 8 || x == 10)
	{
		box notsolid();
		box thread rotation();
		trig waittill("trigger",player);
		{
			trig delete();
			box delete();
			player thread boxsurprise();
		}
	}
}

rotation()
{
	for(;;)
	{
		self rotateYaw(360,5);
		wait 5;
	}
}

boxsurprise()
{
	xp = randomint(50)+10;
	x = randomint(10);
	switch(x)
	{
		case 0: 
			self braxi\_rank::giveRankXp( undefined, xp );
			iprintln("[^0Box^7]: "+self.name+" Found "+xp+" XP");
			break;

		case 1:
			self giveweapon("deserteagle_mp");
			self switchtoweapon("deserteagle_mp");
			self givemaxammo("deserteagle_mp");
			iprintln("[^0Box^7]: ^1"+self.name+" ^7Found Desert Eagle");
			break;

		case 2:
			self.health = 200;
			iprintln("[^0Box^7]: ^1"+self.name+" ^7Found Health Boost");
			break;

		case 3:
			self freezeControls(true);
			iprintln("[^0Box^7]: ^1"+self.name+" ^7Found A Freeze");
			break;

		case 4:
			iprintln("[^0Box^7]: ^1"+self.name+" ^7Found Nothing");
			break;

		case 5:
			self setMoveSpeedScale(2);
			iprintln("[^0Box^7]: ^1"+self.name+" ^7Found Higher Speed");
			break;

		case 6:
			self thread trail2();
			iprintln("[^0Box^7]: ^1"+self.name+" ^7Found A Trail[^01^7]");
			break;

		case 7:
			self thread trail1();
			iprintln("[^0Box^7]: ^1"+self.name+" ^7Found A Trail[^02^7]");
			break;

		case 8:
			iprintln("[^0Box^7]: ^1"+self.name+" ^7Found Nothing");
			break;

		case 9:
			iprintln("[^0Box^7]: ^1"+self.name+"^7 Got Disarmed");
			self takeallweapons();
			break;
	}
}

secret_door()
{
	door = getent("opendoor","targetname");
	trig = getent("secret_door_trig","targetname");
	rucka = getent("rucka","targetname");
	trig waittill("trigger",p);
	{
		trig delete();
		rucka rotateRoll(45,2);
		door playsound("ele_door");
		door moveZ(112,2,1);
		thread secret();
		thread backtomap();
		p iprintlnbold("Secret Door Is Open");
	}
}

secret()
{
	trig = getent("secret_trig","targetname");
	spot = getent("spawn_secret","targetname");
	for(;;)
	{
		trig waittill("trigger",player);
		player.insecret = true;
		player setorigin(spot.origin);
		player setplayerangles(spot.angels);
		player thread secretcounter();
		player thread restart();
		player iprintlnbold("Every fail reduses time for 5 secounds!");
		wep = player GetCurrentWeapon();
		player takeallweapons(); //just in case if someone wants to spawn in secret on some other position - inserction
		wait .05;
		player giveweapon(wep);
		player switchtoweapon(wep);
		player givemaxammo(wep);
		wait .05;
	}
}

secretcounter()
{
	self endon ("death");
	self endon ("disconnect");
	self.secrettime = 120;
	self.secretcounter = NewClientHudElem(self);
	self.secretcounter.alignX = "left";
	self.secretcounter.alignY = "center";
	self.secretcounter.horzalign = "left";
	self.secretcounter.vertalign = "center";
	self.secretcounter.alpha = 1;
	self.secretcounter.x = 7;
	self.secretcounter.y = 100;
	self.secretcounter.font = "default";
	self.secretcounter.fontscale = 1.5;
	self.secretcounter.glowalpha = 1;
	self.secretcounter.glowcolor = (1,0,0);
	self.secretcounter.label = &"Secret Timer: &&1";
	self.secretcounter.owner = self;
	self.secretcounter thread ifsuicide();
	while(self.insecret == true)
	{
		if(self.secrettime <= 0)
		{
			self suicide();
			self.secretcounter destroy();
		}
		self.secretcounter setValue(self.secrettime);
		wait 1;
		self.secrettime--;
	}
}

restart()
{
	self waittill("death");
	if( isDefined(self) )
	{
		self.counter = 0;
		self.cheaker = 0;
	}
}

ifsuicide() 
{
	self endon ("death");
	self.owner waittill("death");
	
	if( isDefined( self ) )
	{
        self destroy();
    }
}

save_loadpositions_setup()
{
	for(i=1;i<=8;i++)
	{
		thread save_loadtrigs(i);
	}
	thread failtrig();
}

save_loadtrigs(num)
{
	trig = getent("save_loadtrig_"+num,"targetname");
	for(;;)
	{
		trig waittill("trigger",player);
		if(player.counter<num)
		{
		player.counter = num;
		player.cheaker++;
		player iprintln("^3Position: ^1"+num+" ^3Saved");
		}
		else if(player.counter>=num)
		{
			player.counter = player.counter;
		}
		if(player.cheaker != player.counter)
		{
			player suicide();
			player iprintlnbold("Shortcuts will not be tolerated");
			player.counter = 0;
    		player.cheaker = 0;
		}
		wait .1;
	}
}

failtrig()
{
	load1 = getent("load1origin","targetname");
	load2 = getent("load2origin","targetname");
	load3 = getent("load3origin","targetname");
	load4 = getent("load4origin","targetname");
	load5 = getent("load5origin","targetname");
	load6 = getent("load6origin","targetname");
	load7 = getent("load7origin","targetname");
	load8 = getent("load8origin","targetname");
	trig = getent("secret_fail_trig","targetname");
	for(;;)
	{
		trig waittill("trigger",player);
		if(player.counter == 1)
		{
			player setorigin(load1.origin);
			player setplayerangles(load1.angels);
			player freezeControls(true);
			player iprintln("^3Position: ^1"+player.counter+" ^3Loaded");
			wait 0.1;
			player freezeControls(false);
			if(player.secrettime > 15)
			{player.secrettime -= 5;}
		}
		if(player.counter == 2)
		{
			player setorigin(load2.origin);
			player setplayerangles(load2.angels);
			player freezeControls(true);
			player iprintln("^3Position: ^1"+player.counter+" ^3Loaded");
			wait 0.1;
			player freezeControls(false);
			if(player.secrettime > 15)
			{player.secrettime -= 5;}
		}
		if(player.counter == 3)
		{
			player setorigin(load3.origin);
			player setplayerangles(load3.angels);
			player freezeControls(true);
			player iprintln("^3Position: ^1"+player.counter+" ^3Loaded");
			wait 0.1;
			player freezeControls(false);
			if(player.secrettime > 15)
			{player.secrettime -= 5;}
		}
		if(player.counter == 4)
		{
			player setorigin(load4.origin);
			player setplayerangles(load4.angels);
			player freezeControls(true);
			player iprintln("^3Position: ^1"+player.counter+" ^3Loaded");
			wait 0.1;
			player freezeControls(false);
			if(player.secrettime > 15)
			{player.secrettime -= 5;}
		}
		if(player.counter == 5)
		{
			player setorigin(load5.origin);
			player setplayerangles(load5.angels);
			player freezeControls(true);
			player iprintln("^3Position: ^1"+player.counter+" ^3Loaded");
			wait 0.1;
			player freezeControls(false);
			if(player.secrettime > 15)
			{player.secrettime -= 5;}
		}
		if(player.counter == 6)
		{
			player setorigin(load6.origin);
			player setplayerangles(load6.angels);
			player freezeControls(true);
			player iprintln("^3Position: ^1"+player.counter+" ^3Loaded");
			wait 0.1;
			player freezeControls(false);
			if(player.secrettime > 15)
			{player.secrettime -= 5;}
		}
		if(player.counter == 7)
		{
			player setorigin(load7.origin);
			player setplayerangles(load7.angels);
			player freezeControls(true);
			player iprintln("^3Position: ^1"+player.counter+" ^3Loaded");
			wait 0.1;
			player freezeControls(false);
			if(player.secrettime > 15)
			{player.secrettime -= 5;}
		}
		if(player.counter == 8)
		{
			player setorigin(load8.origin);
			player setplayerangles(load8.angels);
			player freezeControls(true);
			player iprintln("^3Position: ^1"+player.counter+" ^3Loaded");
			wait 0.1;
			player freezeControls(false);
			if(player.secrettime > 15)
			{player.secrettime -= 5;}
		}
		wait .05;
	}
}

backtomap()
{
	trig = getent("backtomap_trig","targetname");
	point = getent("backtomap_point","targetname");
	for(;;)
	{
		trig waittill("trigger",player);
		player setorigin(point.origin);
		player setplayerangles(point.angels);
		player.insecret = false;
		player.secretcounter fadeovertime(1);
		player.secretcounter.alpha = 0;
		finishedin = (120-player.secrettime);
		iprintlnbold(player.name+" ^5Finished Secret");
		player braxi\_rank::giveRankXp( undefined, 200 );
		wait .05;
	}
}

whenmapends()
{
	level waittill("game over");
	players = getentarray("player","classname");
	iprintlnbold("^5* * ^3 Map Created by ^2Legend^5 * *\n* * Thanks on playing * *");
	for(i=0;i<=players.size;i++)
	{
		players[i] thread randomxpdrop();
	}

}

randomxpdrop()
{
	randomxp = randomint(100)+50;
	self iprintlnbold("^5* * ^2You Recived Additional ^3"+randomxp+" ^2XP ^5* *");
	self braxi\_rank::giveRankXp( undefined, randomxp );		
}