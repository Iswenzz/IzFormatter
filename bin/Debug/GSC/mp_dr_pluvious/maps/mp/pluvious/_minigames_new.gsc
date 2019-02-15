main()
{
	level.trig_old = getEnt("trig_old", "targetname");
	level.trig_minigameRoom = getEnt("trig_minigame_room", "targetname");
	level.trig_sniper = getEnt("trig_minigame_sniper", "targetname");
	level.trig_bounce = getEnt("trig_minigame_bounce", "targetname");
	level.trig_weapon = getEnt("trig_minigame_weapon", "targetname");
	level.trig_oneinthechamber = getEnt("trig_minigame_oneinthechamber", "targetname");
	level.firstEntry = true;

	thread oldWay();
	thread minigameRoom();
	thread sniperMinigame();
	thread bounceMinigame();
	thread weaponMinigame();
	thread weaponMinigameMovingBrushes();
	thread weaponMinigameJumperDoors();
	thread weaponMinigameActivatorDoors();
	thread oneInTheChamberMinigame();
	
	preCacheItem("m16_mp");
	preCacheItem("ak47_mp");
	preCacheItem("m14_mp");
	preCacheItem("ak74u_mp");
	preCacheItem("p90_mp");
	preCacheItem("rpd_mp");
	preCacheItem("winchester1200_mp");
	preCacheItem("barrett_mp");
	preCacheItem("rpg_mp");
	
	brush = getEntArray("rotate","targetname");
	if(isDefined(brush))
	{
		for(i = 0; i < brush.size; i++)
		{
			brush[i] thread rotateBrush();
		}
	}
}

oldWay()
{
	brush = getEnt("old_door", "targetname");
	level.trig_old waittill("trigger", user);
	level.trig_old delete();
	level.trig_minigameRoom delete();
//AUTO 	iPrintLn("Old way chosen by: ^2" + user.name + "^7.");
	brush moveY(352, 0.75);
	wait 1;
	brush delete();
}

minigameRoom()
{
	spawn = getEnt("orig_minigame_room", "targetname");
	for(;;)
	{
		level.trig_minigameRoom waittill("trigger", user);
		user setOrigin(spawn.origin);
		user setPlayerAngles(spawn.angles);
	}
}

sniperMinigame()
{
	for(;;)
	{
		trigger = getEnt("minigame_sniper_activator", "targetname");
		spawn = getEnt("orig_minigame_sniper_jumper", "targetname");
		level.trig_sniper waittill("trigger", user);
		level.trig_old delete();
		level.trig_bounce delete();
		level.trig_oneinthechamber delete();
//AUTO 		iPrintLn("Sniper room chosen by: ^2" + user.name + "^7.");
		user setOrigin(spawn.origin);
		//user setPlayerAngles((0, 90, 0));
		user setPlayerAngles(spawn.angles);
		user.health = user.maxHealth;
//AUTO 		user takeAllWeapons();
		user _weapon("remington700_mp");
		user _weapon("m40a3_mp");
		{
			if(getTeamPlayersAlive("axis") == 1)
			{
				player = getEntArray("player", "classname");
				for(i = 0; i < player.size; i++)
				{
					if(player[i].pers["team"] == "axis")
					{
						if(player[i] isTouching(trigger))
						{
							break;
						}
						else
						{
							player[i] setOrigin((-1536, 5056, 16));
							player[i] setPlayerAngles((0, 270, 0));
							player[i].health = player[i].maxHealth;
//AUTO 							player[i] takeAllWeapons();
							player[i] _weapon("remington700_mp");
							player[i] _weapon("m40a3_mp");
						}
					}
				}
			}
		}
	}
}

bounceMinigame()
{
	for(;;)
	{
		trigger = getEnt("minigame_bounce_activator", "targetname");
		spawn = getEnt("orig_minigame_bounce_jumper", "targetname");
		level.trig_bounce waittill("trigger", user);
		level.trig_old delete();
		level.trig_sniper delete();
		level.trig_oneinthechamber delete();
//AUTO 		iPrintLn("Knife room chosen by: ^2" + user.name + "^7.");
		user setOrigin(spawn.origin);
		//user setPlayerAngles((0, 0, 0));
		user setPlayerAngles(spawn.angles);
		user.health = user.maxHealth;
//AUTO 		user takeAllWeapons();
		user _weapon("knife_mp");
		{
			if(getTeamPlayersAlive("axis") == 1)
			{
				player = getEntArray("player", "classname");
				for(i = 0; i < player.size; i++)
				{
					if(player[i].pers["team"] == "axis")
					{
						if(player[i] isTouching(trigger))
						{
							break;
						}
						else
						{
							player[i] setOrigin((-1536, 8896, 16));
							player[i] setPlayerAngles((0, 270, 0));
							player[i].health = player[i].maxHealth;
//AUTO 							player[i] takeAllWeapons();
							player[i] _weapon("knife_mp");
						}
					}
				}
			}
		}
	}
}

weaponMinigame()
{
	for(;;)
	{
		spawn = getEnt("orig_minigame_weapon_jumper", "targetname");
		level.trig_weapon waittill("trigger", user);
		if(getTeamPlayersAlive("allies") == 1)
		{
			thread weaponMinigameActivator();
			user setOrigin(spawn.origin);
			//user setPlayerAngles((0, 90, 0));
			user setPlayerAngles(spawn.angles);
			user.health = user.maxHealth;
//AUTO 			iPrintLn("Weapon room chosen by: ^2" + user.name + "^7.");
//AUTO 			user takeAllWeapons();
			thread weaponMinigameWeaponList();
			user freezeControls(1);
//AUTO 			wait 2;
			user freezeControls(0);
		}
	}
}

weaponMinigameActivator()
{
	if(getTeamPlayersAlive("axis") == 1)
	{
		player = getEntArray("player", "classname");
		for(i = 0; i < player.size; i++)
		{
			if(player[i].pers["team"] == "axis")
			{
				player[i] setOrigin((-1536, 11488, -240));
				player[i] setPlayerAngles((0, 270, 0));
				player[i].health = player[i].maxHealth;
//AUTO 				player[i] takeAllWeapons();
				thread weaponMinigameWeaponList();
				player[i] freezeControls(1);
				wait 2;
				player[i] freezeControls(0);
			}
		}
	}
}

weaponMinigameWeaponList()
{
	player = getEntArray("player", "classname");
	x = randomInt(12);
	for(i = 0; i < player.size; i++)
	{
		if(x == 0)
			player[i] _weapon("knife_mp");
		if(x == 1)
			player[i] _weapon("deserteagle_mp");
		if(x == 2)
			player[i] _weapon("colt44_mp");
		if(x == 3)
			player[i] _weapon("m16_mp");
		if(x == 4)
			player[i] _weapon("ak47_mp");
		if(x == 5)
			player[i] _weapon("m14_mp");
		if(x == 6)
			player[i] _weapon("ak74u_mp");
		if(x == 7)
			player[i] _weapon("p90_mp");
		if(x == 8)
			player[i] _weapon("rpd_mp");
		if(x == 9)
			player[i] _weapon("winchester1200_mp");
		if(x == 10)
			player[i] _weapon("barrett_mp");
		if(x == 11)
			player[i] _weapon("rpg_mp");
	}
}

weaponMinigameMovingBrushes()
{
	brush = getEnt("minigame_weapon_moveup", "targetname");
	while(1)
	{
		brush moveZ(-176, 0.75);
		brush waittill("movedone");
		wait 1;
		brush moveZ(176, 0.75);
		brush waittill("movedone");
		wait 1;
	}
}

weaponMinigameJumperDoors()
{
	trigger = getEnt("trig_weapon_minigame_jumper_doors", "targetname");
	brush1 = getEnt("weapon_minigame_jumper_door_1", "targetname");
	brush2 = getEnt("weapon_minigame_jumper_door_2", "targetname");
	trigger setHintString("Press ^3&&1^7 to open the doors.");
	trigger waittill("trigger");
	brush1 rotateYaw(90, 1);
	brush2 rotateYaw(-90, 1);
	wait 1;
	brush1 delete();
	brush2 delete();
	trigger delete();
}

weaponMinigameActivatorDoors()
{
	trigger = getEnt("trig_weapon_minigame_activator_doors", "targetname");
	brush1 = getEnt("weapon_minigame_activator_door_1", "targetname");
	brush2 = getEnt("weapon_minigame_activator_door_2", "targetname");
	trigger setHintString("Press ^3&&1^7 to open the doors.");
	trigger waittill("trigger");	
	brush1 rotateYaw(90, 1);
	brush2 rotateYaw(-90, 1);
	wait 1;
	brush1 delete();
	brush2 delete();
	trigger delete();
}

oneInTheChamberMinigame()
{
	for(;;)
	{
		spawn = getEnt("orig_minigame_weapon_jumper", "targetname");
		level.trig_oneinthechamber waittill("trigger", user);
		thread oneInTheChamberMinigameActivator();
		if(level.firstEntry == true)
		{
			level.trig_old delete();
			level.trig_sniper delete();
			level.trig_bounce delete();
			level.firstEntry = false;
		}
//AUTO 		iPrintLn("One In The Chamber room chosen by: ^2" + user.name + "^7.");
		user setOrigin(spawn.origin);
		//user setPlayerAngles((0, 90, 0));
		user setPlayerAngles(spawn.angles);
		user.health = 1;
//AUTO 		user takeAllWeapons();
//AUTO 		user giveWeapon("deserteagle_mp");
		user setWeaponAmmoClip("deserteagle_mp", 3);
		user setWeaponAmmoStock("deserteagle_mp", 0);
//AUTO 		user switchToWeapon("deserteagle_mp");
		_oneInTheChamberMinigameDeath(user);
	}
}

oneInTheChamberMinigameActivator()
{
	if(getTeamPlayersAlive("axis") == 1)
	{
		player = getEntArray("player", "classname");
		for(i = 0; i < player.size; i++)
		{
			if(player[i].pers["team"] == "axis")
			{
				player[i] setOrigin((-1536, 11488, -240));
				player[i] setPlayerAngles((0, 270, 0));
				player[i].health = 1;
//AUTO 				player[i] takeAllWeapons();
//AUTO 				player[i] giveWeapon("deserteagle_mp");		
				player[i] setWeaponAmmoClip("deserteagle_mp", 3);
				player[i] setWeaponAmmoStock("deserteagle_mp", 0);
//AUTO 				player[i] switchToWeapon("deserteagle_mp");
			}
		}
	}
}

rotateBrush()
{
	if(!isDefined(self.speed))
	self.speed = 10;
	if(!isDefined(self.script_noteworthy))
	self.script_noteworthy = "z";
	while(1)
	{
		if(self.script_noteworthy == "z")
		self rotateYaw(360, self.speed);
		else if(self.script_noteworthy == "x")
		self rotateRoll(360, self.speed);
		else if(self.script_noteworthy == "y")
		self rotatePitch(360, self.speed);
		wait ((self.speed)-0.1);
	}
}

_weapon(weapon)
{
//AUTO 	self giveWeapon(weapon); self giveMaxAmmo(weapon); self switchToWeapon(weapon);
}

_oneInTheChamberMinigameDeath(player)
{
//AUTO 	player endon("disconnect"); player waittill("death"); iPrintLn("One In The Chamber room is now open.");
}

