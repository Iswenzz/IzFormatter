main()
{
	thread secrets();
}

secrets()
{
	thread rtd();
	thread xps();
	thread healths();
	thread life();
	thread uneedkey();
	thread keytrig();
	thread keyedbox1();
	thread keyedbox2();
	thread secret();
	thread secret_cheakpoints_setup();
	thread failtrigger();
	thread returntomap();
	thread bouncetrig();
}

keytrig()
{
	trig = getent("keytrig","targetname");
	level.key = getent("keybrush","targetname");
	for(;;)
	{
		trig waittill("trigger", player );
		player.key = true;
//AUTO 		player iprintlnbold("You Found A Key");
	}
}

uneedkey()
{
	uneedkey_trig = getent("uneedkey_trig","targetname");
	plat = getent("endplat","targetname");
	for(;;)
	{
		uneedkey_trig waittill("trigger", player );
		if(player.key == false)
		{
//AUTO 			player iprintlnbold("^1Acces Denied");
			continue;
		}
		else if(player.key == true)
		{
//AUTO 			player iprintlnbold("^2Acces Granted");
			plat movez(-128,1);
			wait 5;
			plat movez(128,1);
		}
	}
}

keyedbox1()
{
	keyedbox1_trig = getent("keyedbox1_trig","targetname");
	keyedbox1_trig sethintstring("Decres Activator Health");
	used=false;
	for(;;)
	{
	keyedbox1_trig waittill("trigger", player );
	d = randomint(50);
	h = level.activ.health;
	if(player.key == false)
	{
//AUTO 		player iprintlnbold("fuck off cheater... die..."); //aint gonna happen but what ever xD
		wait 1;
		player suicide();
		return player;
	}
	if(used == true && player.key == true)
	{
//AUTO 		player iprintlnbold("Box was already used");
		keyedbox1_trig sethintstring("Box was already used");
		return player;
	}
	if(player.key == true && used == false)
	{
		wait .1;
		level.activ finishPlayerDamage(level.activ, level.activ, d, 0, "MOD_UNKNOWN", "bounce", level.activ.origin, AnglesToForward(level.activ.angles), "none", 0);
		used = true;
	}
	all = h-d;
//AUTO 	player iprintlnbold("Activator got down to "+all+" Health");
	}
}

keyedbox2()
{
	keyedbox2_trig = getent("keyedbox2_trig","targetname");
	keyedbox2_trig sethintstring("Earn XP");
	used=false;
	for(;;)
	{
		keyedbox2_trig waittill("trigger", player);
		if (player.key == false)
		{
//AUTO 			player iprintlnbold("fuck off cheater... die..."); //aint gonna happen but what ever xD
			wait 1;
			player suicide();
			return player;
		}	
		if(used == true && player.key == true)
		{
//AUTO 		player iprintlnbold("Box was already used");
		keyedbox2_trig sethintstring("Box was already used");
		return player;
		}
		if(player.key == true && used == false)
		{
//AUTO 		player braxi\_rank::giveRankXp( undefined, 250 );
//AUTO 		player iprintlnbold("You got 250 xp");
		used = true;
		}
	}
}

life()
{
	trig = getent("life_s","targetname");
	hearth = getent("hearth","targetname");
	trig waittill("trigger", player );
	{
		trig delete();
		player braxi\_mod::giveLife();
//AUTO 		player iprintlnbold("^1> > ^3You Found ^5A Life ^1< <");
		hearth rotateYaw(720,2,0.5,1);
		hearth waittill("rotatedone");
		hearth delete();
	}
}

healths()
{
	trig = getent("health_s","targetname");
	trig waittill("trigger", player );
	{
		trig delete();
		h = randomint(100);
		player.health += h;
//AUTO 		player iprintlnbold("Your Health Is Incresed by: ^2"+h);
//AUTO 		player iprintlnbold("Total Health: "+player.health);
	}
}

xps()
{
	trig = getent("xps","targetname");
	xp_brush = getent("xp_brush","targetname");
	trig waittill("trigger", player );
	{
		trig delete();
		xp = 250;
//AUTO 		player braxi\_rank::giveRankXp( undefined, xp );
//AUTO 		player iprintlnbold("^1> > ^3You Found ^"+xp+" ^3XP ^1< <");
		xp_brush rotateYaw(720,2,0.5,1);
		xp_brush waittill("rotatedone");
		xp_brush delete();
	}
}

rtd()
{
	trig = getent("rtd_trig","targetname");
	for(;;)
	{
		trig waittill("trigger", player );
		if(player.rtdusedd == true)
		{wait 3; player thread rtdhud1(-500,-100,"^1>> Roll The Dice Already Used"); return player;}
		player.rtdusedd = true;

		x = randomint(11);
		switch(x)
		{
			case 0:
				player thread rtdhud1(-500,-100,">> Roll The Dice Activated");
				wait 1;
				player thread rtdhud2(500,-80,"You are Dead <<");
				wait 2;
				player suicide();
				break;
			case 1:
				player thread rtdhud1(-500,-100,">> Roll The Dice Activated");
				wait 1;
				player thread rtdhud2(500,-80,"AK-47 <<");
				wait 1;
//AUTO 				player giveweapon("ak47_mp");
				wait .1;
//AUTO 				player switchtoweapon("ak47_mp");
//AUTO 				player givemaxammo("ak47_mp");
				break;
			case 2:
				player thread rtdhud1(-500,-100,">> Roll The Dice Activated");
				wait 1;
				player thread rtdhud2(500,-80,"500 XP Boost <<");
				wait 1;
//AUTO 				player braxi\_rank::giveRankXp( undefined, 500 );
				break;
			case 3:
				player thread rtdhud1(-500,-100,">> Roll The Dice Activated");
				wait 1;
				player thread rtdhud2(500,-80,"Hands / Knife <<");
				wait 1;
//AUTO 				player TakeAllWeapons();
//AUTO 				player giveweapon("knife_mp");
				wait .1;
//AUTO 				player switchtoweapon("knife_mp");
				break;
			case 4:
				player thread rtdhud1(-500,-100,">> Roll The Dice Activated");
				wait 1;
				player thread rtdhud2(500,-80,"Time Bomb <<");
				wait 1;
				player thread timebomb();
				break;
			case 5:
				player thread rtdhud1(-500,-100,">> Roll The Dice Activated");
				wait 1;
				player thread rtdhud2(500,-80,"Higher Speed <<");
				wait 1;
//AUTO 				player SetMoveSpeedScale(2);
				break;
			case 6:
				player thread rtdhud1(-500,-100,">> Roll The Dice Activated");
				wait 1;
				player thread rtdhud2(500,-80,"1000 XP Boost <<");
				wait 1;
//AUTO 				player braxi\_rank::giveRankXp( undefined, 1000 );
				break;
			case 7:
				player thread rtdhud1(-500,-100,">> Roll The Dice Activated");
				wait 1;
				player thread rtdhud2(500,-80,"Deagle <<");
				wait 1;
//AUTO 				player giveweapon("deserteagle_mp");
				wait .1;
//AUTO 				player switchtoweapon("deserteagle_mp");
//AUTO 				player givemaxammo("deserteagle_mp");
				break;
			case 8:
				player thread rtdhud1(-500,-100,">> Roll The Dice Activated");
				wait 1;
				player thread rtdhud2(500,-80,"Nothing <<");
				player thread slap();
            	break;
            case 9:
            	player thread rtdhud1(-500,-100,">> Roll The Dice Activated");
            	wait 1;
				player thread rtdhud2(500,-80,"Nothing. <<");
				break;
			case 10:
				player thread rtdhud1(-500,-100,">> Roll The Dice Activated");
            	wait 1;
				player thread rtdhud2(500,-80,"Ghost <<");
				player thread ghost();
				break;
		}
	}
}

ghost()
{
	for(;;)
	{
		self hide();
		wait randomint(5);
		self show();
		wait randomint(5);
	}
}

slap()
{
wait randomint(20);
for(i=0;i<=10;i++)
{
self.health += 100;
self finishPlayerDamage(self, self, 100, 0, "MOD_UNKNOWN", "bounce", self.origin, AnglesToForward((-90,0,0)), "none", 0);
}
//AUTO self thread rtdhud2(500,0,"Just Kidding, eBc|Legend Kicked Your Ass");
}

rtdhud1(x,y,text)
{
	self.rtdhud1 = NewClientHudElem(self);
	self.rtdhud1.alignX = "center";
	self.rtdhud1.alignY = "middle";
	self.rtdhud1.horzalign = "center";
	self.rtdhud1.vertalign = "middle";
	self.rtdhud1.alpha = 1;
	self.rtdhud1.x = x;
	self.rtdhud1.y = y;
	self.rtdhud1.font = "default";
	self.rtdhud1.fontscale = 2;
	self.rtdhud1.glowalpha = 1;
	self.rtdhud1.glowcolor = level.glowcolor;
	self.rtdhud1.color = level.glowcolor+1;
	self.rtdhud1 setText( text );
	self.rtdhud1 moveovertime(1);
	self.rtdhud1.x = -100;
	wait 1;
	self.rtdhud1 moveovertime(2);
	self.rtdhud1.x = 100;
	wait 2;
	self.rtdhud1 moveovertime(1);
	self.rtdhud1.x = 500;
	wait 1;
	self.rtdhud1 destroy();
}

rtdhud2(x,y,text)
{
	self.rtdhud2 = NewClientHudElem(self);
	self.rtdhud2.alignX = "center";
	self.rtdhud2.alignY = "middle";
	self.rtdhud2.horzalign = "center";
	self.rtdhud2.vertalign = "middle";
	self.rtdhud2.alpha = 1;
	self.rtdhud2.x = x;
	self.rtdhud2.y = y;
	self.rtdhud2.font = "default";
	self.rtdhud2.fontscale = 2;
	self.rtdhud2.glowalpha = 1;
	self.rtdhud2.glowcolor = level.glowcolor;
	self.rtdhud2.color = level.glowcolor+1;
	self.rtdhud2 setText( text );
	self.rtdhud2 moveovertime(1);
	self.rtdhud2.x = 100;
	wait 1;
	self.rtdhud2 moveovertime(2);
	self.rtdhud2.x = -100;
	wait 2;
	self.rtdhud2 moveovertime(1);
	self.rtdhud2.x = -500;
	wait 1;
	self.rtdhud2 destroy();
}

timebomb()
{
	self.timebombtime = 60;
	self.timebomb = NewClientHudElem(self);
	self.timebomb.alignX = "center";
	self.timebomb.alignY = "bottom";
	self.timebomb.horzalign = "center";
	self.timebomb.vertalign = "bottom";
	self.timebomb.alpha = 1;
	self.timebomb.x = 0;
	self.timebomb.y = -30;
	self.timebomb.font = "objective";
	self.timebomb.fontscale = 1.5;
	self.timebomb.glowalpha = 1;
	self.timebomb.glowcolor = level.glowcolor;
	self.timebomb.color = level.glowcolor+1;
	self.timebomb.owner = self;
	self.timebomb thread removeifdead();
	self.timebomb.label = &"Explode in: &&1";
	self.exp = false;

	while(self.timebombtime >= 0)
	{
		if(self.exp == true)
		return self;

		if(self.timebombtime == 0)
		{
			self PlaySound("explo_metal_rand");
			self suicide();
			self.timebomb destroy();
			PlayFX(level.explosionfx,self.origin);
			self.exp = true;
		}

		self.timebomb setvalue( self.timebombtime );
		wait 1;
		self.timebombtime--;
		}
}

removeifdead() 
{
    self endon ("death");
    self endon ("disconnect");
    self.owner waittill("death", player);
    self.timebomb destroy();
    self.exp = true;
    self destroy(); 
}

secret()
{
	trig1 = getent("secrettrig1","targetname");
	trig2 = getent("secrettrig2","targetname");
	trig3 = getent("secrettrig3","targetname");
	spot = getEnt("secretstartspot","targetname");
	for(;;)
	{
		trig1 waittill("trigger", player );
		trig2 waittill("trigger", player );
		trig3 waittill("trigger", player );
		player setorigin(spot.origin);
//AUTO 		player iprintlnbold("^1<< ^5Welcome To Secret ^1>>");
	}
}

secret_cheakpoints_setup()
{
	for(i=1;i<=5;i++)
	{
		thread secret_cheakpoints(i);
	}
}

failtrigger()
{
	trig = getent("secret_failtrig","targetname");
	level.fail1 = getent("fail1","targetname"); //origins
	fail2 = getent("fail2","targetname");
	fail3 = getent("fail3","targetname");
	fail4 = getent("fail4","targetname");
	fail5 = getent("fail5","targetname");
	for(;;)
	{
		trig waittill("trigger", player );
		if(player.sc == 1)
		{
			player setorigin(level.fail1.origin);
			player freezeControls(true);
//AUTO 			player iprintln("^1<<^5 Position Loaded:^2 "+player.sc);
//AUTO 			wait .1;
			player freezeControls(false);
		}
		if(player.sc == 2)
		{
			player setorigin(fail2.origin);
			player freezeControls(true);
//AUTO 			player iprintln("^1<< ^5Position Loaded:^2 "+player.sc);
//AUTO 			wait .1;
			player freezeControls(false);
		}
		if(player.sc == 3)
		{
			player setorigin(fail3.origin);
			player freezeControls(true);
//AUTO 			player iprintln("^1<<^5 Position Loaded:^2 "+player.sc);
//AUTO 			wait .1;
			player freezeControls(false);
		}
		if(player.sc == 4)
		{
			player setorigin(fail4.origin);
			player freezeControls(true);
//AUTO 			player iprintln("^1<<^5 Position Loaded:^2 "+player.sc);
//AUTO 			wait .1;
			player freezeControls(false);
		}
		if(player.sc == 5)
		{
			player setorigin(fail5.origin);
			player freezeControls(true);
//AUTO 			player iprintln("^1<<^5 Position Loaded:^2 "+player.sc);
//AUTO 			wait .1;
			player freezeControls(false);
		}
	}
}

secret_cheakpoints(num)
{
	trig = getent("secret_cheakpoint_"+num,"targetname");
	for(;;)
	{
		trig waittill("trigger", player);
		if(player.c < player.sc)
		{
//AUTO 			player iprintlnbold("Shortcuts will not be tolerated");
//AUTO 			player iprintlnbold("Cheakpoints Restarted");
			player setorigin(level.fail1.origin);
			player.sc = 1;
		}
		if(player.sc < num)
		{
		player.sc = num;
//AUTO 		player iprintln("^1<<^3 Position Saved: ^5"+num);
		player.c++;
		}
		else if (player.sc >= num)
		{
			player.sc = player.sc;
		}

	}
}

returntomap()
{
	trig = getent("returntomap_trig","targetname");
	spot = getent("s_spot","targetname");
	for(;;)
	{
		trig waittill("trigger", player );
		if(player.sc == 5)
		{
			player setorigin(spot.origin);
			player setplayerangles(spot.angles);
			player freezeControls(1);
//AUTO 			wait .01;
			player freezeControls(0);
			player.sc = 1;
		}
		else if(player.sc < 5)
		{
//AUTO 			player iprintlnbold("Short cuts will not be tolerated");
			player.sc = -1; //he wount be able to pass secret in this round anymore...
			player suicide();
		}
	}
}

bouncetrig()
{  
	level.knockback = getDvarInt("g_knockback");

	bounce   = getEntArray("bounce", "targetname");
	for(i = 0;i < bounce.size;i++)
		bounce[i] thread bounce();
}

bounce()
{
	for(;;)
	{
		self waittill("trigger", p);

		if(!isDefined(p.bouncing))
			p thread player_bounce(self);
	}
}

player_bounce(trigger)
{
	self.bouncing = true;

	vel = self getVelocity();

	temp0 = (((vel[0] < 350 && vel[0] > 0) || (vel[0] > -350 && vel[0] < 0)));
	temp1 = (((vel[1] < 350 && vel[1] > 0) || (vel[1] > -350 && vel[1] < 0)));

	if((!temp0 && !temp1) || vel[2] > -350)
	{
		wait 1;

		self.bouncing = undefined;
		return;
	}

	health    = self.health;
	maxHealth = self.maxHealth;
	self.health    = 1000000;
	self.maxhealth = 1000000;

	setDvar("g_knockback", (vel[2]*-9)-500);
	self finishPlayerDamage(self, self, 1000, 0, "MOD_UNKNOWN", "bounce", self.origin, (0,0,1) , "none", 0);

	wait 0.05;
	setDvar("g_knockback", level.knockback);

	self.health    = health;
	self.maxhealth = maxHealth;

	while(self isTouching(trigger))
		wait 0.05;

	self.bouncing = undefined;
}

