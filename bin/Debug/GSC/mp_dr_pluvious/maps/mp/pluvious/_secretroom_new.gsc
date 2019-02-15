main()
{
	thread secretRoomTriggers();
	thread secretRoomEnter();
	thread secretRoomReturn();
	thread secretRoomCredits();
	thread secretRoomSpeed();
	thread secretRoomEarthquake();
	thread secretRoomSpam();
}

secretRoomTriggers()
{
	trigger1 = getEnt("trig_secret_1", "targetname");
	trigger2 = getEnt("trig_secret_2", "targetname");
	trigger3 = getEnt("trig_secret_3", "targetname");
	trigger4 = getEnt("trig_secret_enter", "targetname");
	brush1 = getEnt("secret_platform", "targetname");
	brush2 = getEnt("infy_texture", "targetname");
	brush1 hide();
	brush1 notSolid();
	brush2 hide();
	trigger4 thread maps\mp\_utility::triggerOff();
	level waittill("round_started");
	wait 15;
	brush2 show();
	trigger1 waittill("trigger", user1);
	trigger1 delete();
//AUTO 	user1 iPrintLn("Secret trigger: 1/3.");
//AUTO 	user1 braxi\_rank::giveRankXP("kill", 50);
	trigger2 waittill("trigger", user2);
	trigger2 delete();
//AUTO 	user2 iPrintLn("Secret trigger: 2/3.");
//AUTO 	user2 braxi\_rank::giveRankXP("kill", 50);
	trigger3 waittill("trigger", user3);
	trigger3 delete();
//AUTO 	user3 iPrintLn("Secret trigger: 3/3.");
//AUTO 	user3 braxi\_rank::giveRankXP("kill", 50);
	trigger4 thread maps\mp\_utility::triggerOn();
	brush1 show();
	brush1 solid();
//AUTO 	iPrintLn("^3" + user3.name + "^7 opened the secret!");
}

secretRoomEnter()
{
	for(;;)
	{
		trigger = getEnt("trig_secret_enter", "targetname");
		spawn = getEnt("orig_secret", "targetname");
		trigger waittill("trigger", user);
//AUTO 		iPrintLn("^2" + user.name+ "^7 entered the secret!");
		user setOrigin(spawn.origin);
		//user setPlayerAngles((0, 270, 0));
		user setPlayerAngles(spawn.angles);
//AUTO 		user braxi\_rank::giveRankXP("kill", 50);
//AUTO 		user giveWeapon("ak74u_mp");
//AUTO 		user switchToWeapon("ak74u_mp");
//AUTO 		user iPrintLnBold("Shhh... don't tell anyone about the secret! ;)");
	}
}

secretRoomReturn()
{
	for(;;)
	{
		trigger = getEnt("trig_secret_return", "targetname");
		spawn = getEnt("orig_secret_return", "targetname");
		trigger setHintString("Press ^3&&1^7 to leave.");
		trigger waittill("trigger", user);
		user setOrigin(spawn.origin);
		//user setPlayerAngles((0, 90, 0));
		user setPlayerAngles(spawn.angles);
	}
}

secretRoomCredits()
{
	for(;;)
	{
		trigger = getEnt("trig_secret_credits", "targetname");
		trigger setHintString("Press ^3&&1^7 to view credits.");
		trigger waittill("trigger", user);
//AUTO 		user iPrintLn("Wait 15 seconds to re-use.");
//AUTO 		iPrintLnBold("Thanks to:");
		wait 1;
//AUTO 		iPrintLnBold("^2Callan^7, ^2Eli^7, ^2van van^7, ^2Zantheq^7, ^2solzzz^7, ^2Redemption^7, ^2Zye^7, ^2Spinifex^7 and ^2s8n.");
		wait 1;
//AUTO 		iPrintLnBold("for beta testing!");
		wait 13;
	}
}

secretRoomSpeed()
{
	for(;;)
	{
		trigger = getEnt("trig_secret_speed", "targetname");
		trigger setHintString("Press ^3&&1^7 to double your speed.");
		trigger waittill("trigger", user);
		user thread secretRoomSpeedUser();
//AUTO 		user iPrintLnBold("Your speed has been doubled for 1 minute.");
	}
}

secretRoomSpeedUser()
{
	for(i = 0; i < 60; i++)
	{
//AUTO 		self setMoveSpeedScale(2);
		wait 1;
		if(i == 59)
		{
//AUTO 			self setMoveSpeedScale(1);
			if(isAlive(self))
			{
//AUTO 				self iPrintLnBold("Your speed has been reset.");
			}
		}
	}
}

secretRoomEarthquake()
{
	for(;;)
	{
		trigger = getEnt("trig_secret_quake", "targetname");
		quakeLocation = getEnt("orig_quake", "targetname");
		soundLocation = getEnt("orig_quake_sound", "targetname");
		trigger setHintString("Press ^3&&1^7 to set off an earthquake.");
		trigger waittill("trigger", user);
//AUTO 		user iPrintLn("Wait 15 seconds to re-use.");
		earthquake(2, 7.5, quakeLocation.origin, 25000);
		soundLocation playSound("elm_quake_sub_rumble");
//AUTO 		iPrintLnBold("^2" + user.name + "^7 set off an earthquake!");
		wait 15;
	}
}

secretRoomSpam()
{
	for(;;)
	{
		trigger = getEnt("trig_secret_spam", "targetname");
		trigger setHintString("Press ^3&&1^7 to spam everyone's screen.");
		trigger waittill("trigger", user);
//AUTO 		user iPrintLn("Wait 15 seconds to re-use.");
//AUTO 		user sayAll("I am a faggot for spamming :)");
//AUTO 		iPrintLnBold("^2" + user.name + " ^1is better than you.");
//AUTO 		iPrintLnBold("^2" + user.name + " ^2is better than you.");
//AUTO 		iPrintLnBold("^2" + user.name + " ^3is better than you.");
//AUTO 		iPrintLnBold("^2" + user.name + " ^4is better than you.");
//AUTO 		iPrintLnBold("^2" + user.name + " ^5is better than you.");
		wait 8;
//AUTO 		iPrintLnBold("^2" + user.name + " ^6is better than you.");
//AUTO 		iPrintLnBold("^2" + user.name + " ^7is better than you.");
//AUTO 		iPrintLnBold("^2" + user.name + " ^8is better than you.");
//AUTO 		iPrintLnBold("^2" + user.name + " ^9is better than you.");
//AUTO 		iPrintLnBold("^2" + user.name + " ^0is better than you.");
		wait 7;
	}
}

