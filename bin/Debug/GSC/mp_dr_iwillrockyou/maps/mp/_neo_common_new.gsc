TobbTriggerFigyeles(trigger, uzenet, melyik)
{
	while (true)
	{
		trigger waittill("trigger", kivalto);
		level notify(uzenet, melyik, kivalto);
	}
}

KulonbozoRandom(min, max, alapveletlen)
{
	veletlen = RandomIntRange(min, max);
	while (true)
	{
		if (veletlen == alapveletlen) veletlen = RandomIntRange(min, max);
		else break;
	}
	return veletlen;
}

KulonbozoRandomTomb(min, max, mennyi)
{
	if (((max - min) - 1) < mennyi) return;
	
	veltomb = [];
	veltomb[0] = RandomIntRange(min, max);
	
	for (i = 1; i < mennyi; i++)
	{
		while (true)
		{
			uj = RandomIntRange(min, max);
			if (!KulonbozoRandomTomb_Seged(veltomb, uj))
			{
				veltomb[i] = uj;
				break;
			}
		}
	}
	return veltomb;
}

KulonbozoRandomTomb_Seged(tomb, veletlen)
{
	talalat = false;
	for (i = 0; i < tomb.size; i++)
	{
		if (tomb[i] == veletlen) talalat = true;
	}
	return talalat;
}

Lebegteto(lebego, magassag, irany)
{
	szog = 0;
	if (irany == "jobb") szog = 360;
	else if (irany == "bal") szog = -360;
	lebego thread Lebegteto_Seged(magassag);
	while (true)
	{
		lebego RotateYaw(szog, 4);
		wait 4;
	}
}

Lebegteto_Seged(magassag)
{
	magassag_le = 0 - magassag;
	while (true)
	{
		self MoveZ(magassag, 2);
		self waittill("movedone");
		self MoveZ(magassag_le, 2);
		self waittill("movedone");
	}
}

NeoSpam(uzenet)
{
	while (true)
	{
//AUTO 		IPrintLn(uzenet);
		wait 30;
	}
}

NeoConnect()
{
	while (true)
	{
		level waittill("connected", jatekos);
		jatekos.namesteal = false;
		wait 10;
		jatekos thread NamestealCheck();
		if (GetSubStr(jatekos GetGUID(), 16, 24) == "70c428fe" && IsSubStr(SzinEltavolito(ToLower(jatekos.name)), "neo"))
		{
			neoconnect1 = NewHudElem();
			neoconnect1.font = "objective";
			neoconnect1.fontScale = 3;
			neoconnect1 SetText("^3Map maker ^2Neo ^3connected to the server!");
			neoconnect1.alignX = "center";
			neoconnect1.alignY = "top";
			neoconnect1.horzAlign = "center";
			neoconnect1.vertAlign = "top";
			neoconnect1.x = 0;
			neoconnect1.y = -30;
			neoconnect1.sort = -1;
			neoconnect1.alpha = 1;
			neoconnect1.glowColor = (0.1, 0.8, 0);
			neoconnect1.glowAlpha = 1;
			neoconnect1.foreground = true;
			neoconnect2 = NewHudElem();
			neoconnect2.font = "objective";
			neoconnect2.fontScale = 3;
			neoconnect2 SetText("^3Map maker ^2Neo ^3connected to the server!");
			neoconnect2.alignX = "center";
			neoconnect2.alignY = "top";
			neoconnect2.horzAlign = "center";
			neoconnect2.vertAlign = "top";
			neoconnect2.x = 0;
			neoconnect2.y = 500;
			neoconnect2.sort = -1;
			neoconnect2.alpha = 1;
			neoconnect2.glowColor = (0.1, 0.8, 0);
			neoconnect2.glowAlpha = 1;
			neoconnect2.foreground = true;
			
			neoconnect1 MoveOverTime(3);
			neoconnect1.y = 250;
			neoconnect2 MoveOverTime(3);
			neoconnect2.y = 250;
			wait 5;
			neoconnect1 MoveOverTime(1);
			neoconnect1.y = 500;
			neoconnect2 MoveOverTime(1);
			neoconnect2.y = -40;
			wait 2;
			neoconnect1 Destroy();
			neoconnect2 Destroy();
		}
	}
}

NamestealCheck()
{
	self endon("disconnect");
	
	while (true)
	{
		if (IsSubStr(SzinEltavolito(ToLower(self.name)), "neo") && GetSubStr(self GetGUID(), 16, 24) != "70c428fe" && self.namesteal == false)
		{
			self.namesteal = true;
			self thread NamestealAnnoy();
		}
		else if (!IsSubStr(SzinEltavolito(ToLower(self.name)), "neo") && self.namesteal == true)
		{
			self.namesteal = false;
			wait 10;
			self NamestealCleaner();
		}
		wait 1;
	}
}

NamestealAnnoy()
{
//AUTO 	IPrintLnBold("^1" + self.name + " ^2tried to steal the map maker's name...");
	wait 2;
//AUTO 	IPrintLnBold("^9Now he will suffer...");
	wait 1;
//AUTO 	self SayAll("^3I am a dumbass namestealer...");
	wait 2;
	self.stealhud = NewClientHudElem(self);
    self.stealhud.horzalign = "fullscreen";
	self.stealhud.vertalign = "fullscreen";
	self.stealhud.alpha = 0.1;
	self.stealhud.color = (0.1, 0.1, 0.1);
	self.stealhud SetShader("white", 640, 480);
	while (self.namesteal)
	{
//AUTO 		self SetMoveSpeedScale(0.5);
//AUTO 		self AllowSprint(false);
		self AllowJump(false);
		self.stealhud.alpha = 0.1;
		R = RandomInt(2);
		G = RandomInt(2);
		B = RandomInt(2);
		self.stealhud.color = (R, G, B);
		for(i = 1; i < 10;  i++)
		{
			self.stealhud.alpha += 0.1;
//AUTO 			self IPrintLnBold("^" + i + "You are not the real Neo - change your name!");
//AUTO 			self IPrintLn("^" + i + "You are not the real Neo - change your name!");
			wait 1;
		}
		wait 1;
	}
}

NamestealCleaner()
{
	if (IsDefined(self.stealhud)) self.stealhud Destroy();
//AUTO 	self SetMoveSpeedScale(1);
//AUTO 	self AllowSprint(true);
	self AllowJump(true);
}

KorVegeHang(gyozelem, vereseg, ace)
{
	level waittill("round_ended", szoveg, nyertes);
	if (nyertes == "jumpers")
	{
		jatekosok = GetEntArray("player", "classname");
//AUTO 		level.activ PlayLocalSound(vereseg);
		for (i = 0; i < jatekosok.size; i++)
		{
//AUTO 			if (jatekosok[i] != level.activ) jatekosok[i] PlayLocalSound(gyozelem);
		}
	}
	else if (nyertes == "activators")
	{
		if (level.melyikEnd == "heavy" || level.melyikEnd == "old")
		{
			HangMindenJatekoson(ace);
		}
		else
		{
			jatekosok = GetEntArray("player", "classname");
//AUTO 			level.activ PlayLocalSound(gyozelem);
			for (i = 0; i < jatekosok.size; i++)
			{
//AUTO 				if (jatekosok[i] != level.activ) jatekosok[i] PlayLocalSound(vereseg);
			}
		}
	}
}

HalalHang(hang)
{
	level waittill("round_started", sorszam);
	wait 3;
	while (true)
	{
		level waittill("player_killed", jatekos, eInflictor, attacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, psOffsetTime, deathAnimDuration);
//AUTO 		jatekos PlayLocalSound(hang);
	}
}

KillingSpreeHang()
{
	while (true)
	{
		level waittill("player_killed", jatekos, eInflictor, attacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, psOffsetTime, deathAnimDuration);
		if (attacker == level.activ && IsDefined(level.activ.killingspree))
		{
			level.activ.killingspree++;
			switch(level.activ.killingspree)
			{
				case 0:
				break;
				case 1:
				break;
				case 2:
					HangMindenJatekoson("doublekill");
				break;
				case 3:
					HangMindenJatekoson("triplekill");
				break;
				case 4:
					HangMindenJatekoson("quadrakill");
				break;
				case 5:
					HangMindenJatekoson("pentakill");
				break;
				case 6:
					HangMindenJatekoson("rampage");
				break;
				case 7:
					HangMindenJatekoson("dominating");
				break;
				case 8:
					HangMindenJatekoson("legendary");
				break;
				case 9:
					HangMindenJatekoson("godlike");
				break;
				default:
					vel = RandomIntRange(0, 2);
					if (vel == 0) HangMindenJatekoson("godlike");
					else HangMindenJatekoson("legendary");
				break;
			}
		}
	}
}

HangMindenJatekoson(hang)
{
	jatekosok = GetEntArray("player", "classname");
	for (i = 0; i < jatekosok.size; i++)
	{
//AUTO 		jatekosok[i] PlayLocalSound(hang);
	}
}

SzinEltavolito(karakterlanc)
{
	szintelen = "";

	for (i = 0; i < karakterlanc.size; i++)
	{
		if ( karakterlanc[i] == "^" && i < karakterlanc.size - 1 &&
		(karakterlanc[i + 1] == "0" || karakterlanc[i + 1] == "1" || karakterlanc[i + 1] == "2" || karakterlanc[i + 1] == "3" || karakterlanc[i + 1] == "4" || karakterlanc[i + 1] == "5" || karakterlanc[i + 1] == "6" || karakterlanc[i + 1] == "7" || karakterlanc[i + 1] == "8" || karakterlanc[i + 1] == "9"))
		{
			i++;
			continue;
		}
		szintelen += karakterlanc[i];
	}
	return szintelen;
}

HUDTisztito(jatekos, csakvalamelyiket)
{
	for (i = 0; i < 10; i++)
	{
		if (csakvalamelyiket == "both")
		{
//AUTO 			jatekos IPrintLnBold(" ");
//AUTO 			jatekos IPrintLn(" ");
		}
//AUTO 		else if (csakvalamelyiket == "bold") jatekos IPrintLnBold(" ");
//AUTO 		else if (csakvalamelyiket == "ln") jatekos IPrintLn(" ");
	}
}

OdaVissza(brush, tengely, tavolsag, gyorsasag, esemeny, gyorsit, lassit)
{
	level endon(esemeny);
	
	if (!IsDefined(gyorsit)) gyorsit = 0;
	if (!IsDefined(lassit)) lassit = 0;
	while (true)
	{
		if (tengely == "X")
		{
			brush MoveX(tavolsag, gyorsasag, gyorsit, lassit);
			brush waittill("movedone");
			ujtavolsag = 0 - tavolsag;
			brush MoveX(ujtavolsag, gyorsasag, gyorsit, lassit);
			brush waittill("movedone");
		}
		else if (tengely == "Y")
		{
			brush MoveY(tavolsag, gyorsasag, gyorsit, lassit);
			brush waittill("movedone");
			ujtavolsag = 0 - tavolsag;
			brush MoveY(ujtavolsag, gyorsasag, gyorsit, lassit);
			brush waittill("movedone");
		}
		else if (tengely == "Z")
		{
			brush MoveZ(tavolsag, gyorsasag, gyorsit, lassit);
			brush waittill("movedone");
			ujtavolsag = 0 - tavolsag;
			brush MoveZ(ujtavolsag, gyorsasag, gyorsit, lassit);
			brush waittill("movedone");
		}
	}
}

ToltenyTorlo(esemeny)
{
	self endon(esemeny);
	
	while (true)
	{
		self SetWeaponAmmoStock(self GetCurrentWeapon(), 0);
		self SetWeaponAmmoClip(self GetCurrentWeapon(), 0);
		wait 1;
	}
}

TorlesIdoUtan(ido)
{
	wait ido;
	if (IsDefined(self)) self Delete();
}

Forgatas(tengely, irany, ido, esemeny, gyorsit, lassit)
{
	level endon(esemeny);
	
	if (!IsDefined(gyorsit)) gyorsit = 0;
	if (!IsDefined(lassit)) lassit = 0;
	
	szog = undefined;
	if (irany == "right") szog = -360;
	else if (irany == "left") szog = 360;
	
	if (tengely == "X")
	{
		while (true)
		{
			self RotateRoll(szog, ido, gyorsit, lassit);
			wait ido;
		}
	}
	else if (tengely == "Y")
	{
		while (true)
		{
			self RotatePitch(szog, ido, gyorsit, lassit);
			wait ido;
		}
	}
	else if (tengely == "Z")
	{
		while (true)
		{
			self RotateYaw(szog, ido, gyorsit, lassit);
			wait ido;
		}
	}
}

