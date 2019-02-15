RTDInditasa(trigger)
{
	thread HalalRTD();
	while (true)
	{
		trigger waittill("trigger", kivalto);
		if (IsDefined(kivalto.voltRTD) == false || kivalto.voltRTD == false)
		{
			kivalto.voltRTD = true;
			joesely = RandomIntRange(1, 101);
			random = 0;
			if (joesely < 40) random = RandomIntRange(1, 11);
			else if (joesely >= 40) random = RandomIntRange(10, 21);
//AUTO 			kivalto IPrintLnBold("^1Rolling ^2those ^1Dices ^2...");
//AUTO 			kivalto IPrintLnBold("^13");
			wait 1;
//AUTO 			kivalto IPrintLnBold("^32");
			wait 1;
//AUTO 			kivalto IPrintLnBold("^21");
			wait 1;
			HUDTisztito(kivalto, "bold");
			kivalto thread GiftSelector(random);
		}
//AUTO 		else kivalto IPrintLn("^3You cannot use ^1Roll ^2the ^1Dice ^3currently!");
	}
}

HalalRTD()
{
	level waittill("round_started", sorszam);
	while (true)
	{
		level waittill("player_killed", jatekos, eInflictor, attacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, psOffsetTime, deathAnimDuration);
		jatekos.voltRTD = false;
	}
}

GiftSelector(random)
{
	switch(random)
	{
		case 1:
			thread Gay(self);
		break;
		case 2:
			thread Headshot(self);
		break;
		case 3:
			thread DoSuicide(self);
		break;
		case 4:
			thread Restart(self);
		break;
		case 5:
			thread Freeze(self);
		break;
		case 6:
			thread MoveAway(self);
		break;
		case 7:
			thread Slow(self);
		break;
		case 8:
//AUTO 			thread DisallowSprint(self);
		break;
		case 9:
			thread Drunk(self);
		break;
		case 10:
			thread NoAmmo(self);
		break;
		case 11:
			thread Fast(self);
		break;
		case 12:
			thread IncreaseJump(self);
		break;
		case 13:
			thread GiveRPG(self);
		break;
		case 14:
			thread GiveBarrett(self);
		break;
		case 15:
			thread GiveGrenades(self);
		break;
		case 16:
			thread GiveHandWeapon(self);
		break;
		case 17:
			thread PlusLife(self);
		break;
		case 18:
			thread PlayerIsKing(self);
		break;
		case 19:
			thread Invisible(self);
		break;
		case 20:
			thread AnotherUsePlusGoodGift(self);
		break;
	}
}

Gay(who)
{
	int_text = RandomIntRange(1, 3);
    int_color = RandomIntRange(1, 3);
	string_msg = "   ";
	if(int_text == 1)
    {
        if (int_color == 1)
        {
            string_msg = "^6Oh, ^7I ^6see ^7a ^6nice ^7body... ^6I ^7always ^6loved ^7those ^6muscles ^7and ^6hairy ^7skin ^6with ^7a ^6huge ^5d!ck.";
        }
        else
        {
            string_msg = "^6Oh, I see a nice body... I always loved those muscles and hairy skin with a huge ^5d!ck.";
        }
    }
	else
    {
        if (int_color == 1)
        {
            string_msg = "^6Good ^7boy, ^6come ^7here ^6and ^7I ^6will ^7go ^6on ^7my ^6knees ^7to ^6handle ^7your ^5tool :)";
        }
        else
        {
            string_msg = "^6Good boy, come here and I will go on my knees to handle your ^5tool :)";
        }
    }
    hud_gayScreen = NewClientHudElem(who);
    hud_gayScreen.horzalign = "fullscreen";
	hud_gayScreen.vertalign = "fullscreen";
	hud_gayScreen.alpha = 0.5;
	hud_gayScreen.color = (1,0,1);
	hud_gayScreen SetShader( "white", 640, 480 );
//AUTO 	who SayAll(string_msg);
    who waittill("death");
    if(IsDefined(hud_gayScreen)) hud_gayScreen Destroy();
}

Headshot(who)
{
//AUTO 	who IPrintLnBold("^2I forgot to take my pills... and everybody hates me...");
    wait 2;
//AUTO 	who IPrintLnBold("^2The only way out... is... a ^9headshot^2!");
    wait 2;
    entity_killer = Spawn("script_origin", who GetOrigin());
	who FinishPlayerDamage(entity_killer, entity_killer, 9999, 0, "MOD_PISTOL_BULLET", "barrett_mp", who.origin, who.angles, "head", 0);
}

DoSuicide(who)
{
//AUTO 	who SayAll("^5I couldn't take it anymore, because I'm too noob for it... I'm sorry.");
    wait 1;
	who Suicide();
}

Restart(who)
{
//AUTO     who IPrintLnBold("^5You were a bad, bad kid... ^8You must restart the map!");
    wait 2;
	entity_spawn = GetEntArray("mp_jumper_spawn", "classname");
    who SetPlayerAngles(entity_spawn[50].angles);
    wait 0.3;
    who SetOrigin(entity_spawn[50].origin);
}

Freeze(who)
{
//AUTO     who IPrintLnBold("^2Ouch...");
//AUTO     who IPrintLnBold("^2I forgot to ^3piss ^2before... and it really ^9hurts ^2now!");
    wait 2;
	who FreezeControls(true);
    who waittill("death");
    who FreezeControls(false);
}

MoveAway(who)
{
	who endon("death");
	
//AUTO     who IPrintLnBold("I saw a nice girl somewhere...");
    wait 1;
//AUTO     who IPrintLnBold("^3I ^9must ^3find where she is! I need a phone number!");
    wait 1;
	
	currweap = who GetCurrentWeapon();
	wait 0.05;
	who DisableWeapons(); //don't let jumpers to get to the activator through a wall and kill him
	
    orig1 = Spawn("script_origin", who.origin);
	who EnableLinkTo();
	who LinkTo(orig1);
	orig1 MoveX(120, 0.3);
	wait 1;
	who UnLink();
	wait 4;
	
	orig2 = Spawn("script_origin", who.origin);
	who LinkTo(orig2);
	orig2 MoveY(-180, 0.3);
	wait 1;
	who UnLink();
	wait 1;
	
	orig3 = Spawn("script_origin", who.origin);
	who LinkTo(orig3);
	orig3 MoveX(-120, 0.3);
	wait 1;
	who UnLink();
	wait 5;
	
	orig4 = Spawn("script_origin", who.origin);
	who LinkTo(orig4);
	orig4 MoveY(180, 0.3);
	wait 1;
	who UnLink();
	
	who EnableWeapons();
	wait 0.05;
//AUTO 	who SwitchToWeapon(currweap);
	
	orig1 Delete();
	orig2 Delete();
	orig3 Delete();
	orig4 Delete();
}

Slow(who)
{
//AUTO 	who IPrintLnBold("^5I am a slow, old man... cannot move any faster :(");
//AUTO     who SetMoveSpeedScale(0.5);
    who waittill("death");
//AUTO     who SetMoveSpeedScale(GetDVAR("dr_jumpers_speed"));
}

DisallowSprint(who)
{
//AUTO 	who SayTeam("OMG! I CAN NOT RUN?! LOL -.-''");
//AUTO     who AllowSprint(false);
    who waittill("death");
//AUTO     who AllowSprint(true);
}

Drunk(who)
{
	who endon("death");
	who thread Drunk_Cleanup(who);
	
//AUTO 	who SayAll("OmG, i drnuk so mcuh, that i can''t eevn pla.y dethrun!!!444!!");
    who.hud_drunkScreen = NewClientHudElem(who);
    who.hud_drunkScreen.horzalign = "fullscreen";
	who.hud_drunkScreen.vertalign = "fullscreen";
	who.hud_drunkScreen.color = (0.7, 0.7, 0.7);
	who.hud_drunkScreen SetShader( "white", 640, 480 );
	for (i = 0; i <= 0.99; i += 0.01)
	{
		who.hud_drunkScreen.alpha = i;
		wait 0.2;
	}
    who waittill("death");
    if (IsDefined(who.hud_drunkScreen)) who.hud_drunkScreen Destroy();
}

Drunk_Cleanup(who)
{
	who waittill("death");
	wait 0.05;
	if (IsDefined(who.hud_drunkScreen)) who.hud_drunkScreen Destroy();
}

NoAmmo(who)
{
//AUTO 	who IPrintLnBold("^1You have run out of ammo...");
	who SetWeaponAmmoStock(who GetCurrentWeapon(), 0);
	who SetWeaponAmmoClip(who GetCurrentWeapon(), 0);
}

Fast(who)
{
//AUTO 	who IPrintLnBold("^2 Yumm, that energy drink was tasty!");
//AUTO 	who IPrintLnBold("^2 I can run significantly faster! *.*");
//AUTO     who SetMoveSpeedScale(1.5);
    who waittill("death");
//AUTO     who SetMoveSpeedScale(GetDVAR("dr_jumpers_speed"));
}

IncreaseJump(who)
{
	who endon("death");
	
	oldpos = who.origin;
	jumped = false;
//AUTO 	who IPrintLnBold("^3You can jump much higher, but ^9big power ^3comes ^9big responsibility^3!");
	while (true)
	{
		if ((who.origin[2] - oldpos[2] ) > 10  && !who IsOnGround() && !jumped)
		{
			if (jumped)
				continue;
			strenght = 1;
			for (i=0;i<strenght;i++)
			{
				who.health += 100;
				who finishPlayerDamage(who, level.jumpattacker, 100, 0, "MOD_FALLING", "jump_mp", who.origin, AnglesToForward((-90,0,0)), "none", 0);
			}
			jumped = true;
		}
		else if (oldpos[2] > who.origin[2] && who IsOnGround() && jumped)
			jumped = false;
		oldpos = who.origin;
		wait 0.1;
	}
}

GiveRPG(who)
{
//AUTO 	who IPrintLnBold("^1I stole an RPG-7 from the server admin... haha!");
//AUTO     who GiveWeapon("rpg_mp");
    who GiveStartAmmo("rpg_mp");
//AUTO     who SwitchToWeapon("rpg_mp");
}

GiveBarrett(who)
{
//AUTO 	who IPrintLnBold("^1I stole a Barrett from the server admin... haha!");
//AUTO 	who GiveWeapon("barrett_mp");
    who GiveStartAmmo("barrett_mp");
//AUTO     who SwitchToWeapon("barrett_mp");
}

GiveGrenades(who)
{
//AUTO 	who IPrintLnBold("^1I stole some Grenades from the server admin... haha!");
//AUTO 	who GiveWeapon("frag_grenade_mp");
    who GiveStartAmmo("frag_grenade_mp");
//AUTO     who SwitchToWeapon("frag_grenade_mp");
}

GiveHandWeapon(who)
{
//AUTO     who IPrintLnBold("^1N^2o^3w ^4I ^5a^6m ^7t^8h^9e ^1c^2l^3o^4s^5e^6s^7t ^8t^9h^1i^2n^3g ^4t^5o ^6G^7o^8d^9!");
//AUTO     who IPrintLnBold("^1A^2n^3d ^4c^5a^6n ^7k^8i^9l^1l ^2w^3i^4t^5h ^6j^7u^8s^9t ^1m^2y ^3h^4a^5n^6d^7s^8.^9.^1.");
//AUTO 	who GiveWeapon("defaultweapon_mp");
    who GiveStartAmmo("defaultweapon_mp");
//AUTO     who SwitchToWeapon("defaultweapon_mp");
}

PlusLife(who)
{
//AUTO 	who IPrintLnBold("^2Additional Life!");
	who thread braxi\_mod::giveLife();
}

PlayerIsKing(who)
{
//AUTO 	IPrintLnBold("^3THE ^9KING ^3OF THIS SERVER IS ^9" + who.name);
    wait 2;
//AUTO     IPrintLnBold("^2THE BEST OF THE BESTS^3!!!");
    wait 4;
//AUTO     IPrintLnBold("/at least for now/");
}

Invisible(who)
{
//AUTO 	IPrintLnBold("^3" + who.name + " ^7is ^9invisible^7 for 30 seconds!");
	who Hide();
	wait 30;
	who Show();
//AUTO 	who IPrintLnBold("^2You are visible again!");
}

AnotherUsePlusGoodGift(who)
{
//AUTO     who IPrintLnBold("^8You will get a random gift from only the good ones ;)");
    wait 1;
//AUTO     who IPrintLnBold("^5And then you can use RTD a second time!");
    wait 2;
	int_random = RandomIntRange(11, 21);
	who thread GiftSelector(int_random);
    who.voltRTD = false;
}

