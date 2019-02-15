/*
+-------------------------------------------------------------------+
|                                                                   |
|   +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++   |
|   +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++   |
|   ++++|   \++++|  |++++|  |___________|+++++++/        \+++++++   |
|   ++++|    \+++|  |++++|  |++++++++++++++++++/    __    \++++++   |
|   ++++|  \  \++|  |++++|  |+++++++++++++++++/    /++\    \+++++   |
|   ++++|  |\  \+|  |++++|  |___________|++++|    |++++|    |++++   |
|   ++++|  |+\  \|  |++++|  |++++++++++++++++|    |++++|    |++++   |
|   ++++|  |++\  \  |++++|  |+++++++++++++++++\    \++/    /+++++   |
|   ++++|  |+++\    |++++|  |++++++++++++++++++\          /++++++   |
|   ++++|__|++++\___|++++|__|___________|+++++++\________/+++++++   |
|   +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++   |
|   +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++   |
|                                                                   |
+-------------------------------------------------------------------+


Common script's GSC, written by Neo
Included in all of my maps, holding multifunction scripts which tend to be commonly used
Each method's documentation is Hungarian

The version and functionality will vary as I release new maps!
Version: 1.0 (mp_dr_buggedlikehell)


Copyright (c) club27|Neo | All rights reserved.

PLEASE DO NOT COPY WITHOUT PERMISSION (if you have already extracted it from the .ff),
instead add me on XFire (name: gribmate) and we can talk about it
*/



//Funkció: több hasonló célú trigger külön-külön figyelése (ciklusból célszerû threadelni)
//Paraméterek:
	//trigger [entity] = a figyelendõ trigger
	//uzenet [string] = a triggeléskor kiváltódó esemény neve
	//melyik [int] = a trigger egyedi azonosítója a csoportból, a kiváltódó eseményben használható azonosításra
//Meghívás: -
//Threadelés: MUSZÁJ
TobbTriggerFigyeles(trigger, uzenet, melyik)
{
	while (true)
	{
		trigger waittill("trigger", kivalto);
		level notify(uzenet, melyik, kivalto);
	}
}



//Funkció: Egy paraméterben megadott számtól különbözõ véletlent ad vissza
//Paraméterek:
	//min [int] = a véletlen alsó határa (inkluzív)
	//max [int] = a véletlen felsõ határa (exkluzív)
	//alapveletlen [int] = a szám, amitõl a visszaadott véletlen különbözõ lesz
//Meghívás: -
//Threadelés: NEM
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


//Funkció: Lebegtet és közben forgat egy megadott dolgot
//Paraméterek:
	//lebego [entity] = a lebegtetendõ dolog
	//magassag [int] = a lebegés magassága
	//irany [string] = "jobb" vagy "bal" a forgás irányát adja meg
//Meghívás: -
//Threadelés: MUSZÁJ
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



//Funkció: A pályakészítõ nevét spammeli félpercenként
//Paraméterek:
	//uzenet [string] = a spammelendõ üzenet
//Meghívás: -
//Threadelés: MUSZÁJ
NeoSpam(uzenet)
{
	while (true)
	{
		IPrintLn(uzenet);
		wait 30;
	}
}



//Funkció: A pályakészítõ csatlakozásakor kiír egy üzenetet és kickeli a játékost, ha szerepel "neo" a nevében a megfelelõ UID nélkül
//Paraméterek: -
//Meghívás: -
//Threadelés: MUSZÁJ
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



//Funkció: A Neo név lopását figyeli
//Paraméterek: -
//Meghívás: egy játékoson
//Threadelés: MUSZÁJ
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
		else if (!IsSubStr(SzinEltavolito(ToLower(self.name)), "neo"))
		{
			self.namesteal = false;
			wait 10;
			self NamestealCleaner();
		}
		wait 1;
	}
}



//Funkció: A Neo név elloját bünteti
	// - Szerver tájékoztatása a névlopóról
	// - Mozgási sebesség lefelezése, ugrás és sprint letiltása
	// - Zavaró színesen villogó HUDElem
	// - Zavaró spammelõdõ figyelmeztetés
//Paraméterek: -
//Meghívás: egy játékoson
//Threadelés: MUSZÁJ
NamestealAnnoy()
{
	IPrintLnBold("^1" + self.name + " ^2tried to steal the map maker's name...");
	wait 2;
	IPrintLnBold("^9Now he will suffer...");
	wait 1;
	self SayAll("^3I am a dumbass namestealer...");
	wait 2;
	self.stealhud = NewClientHudElem(self);
    self.stealhud.horzalign = "fullscreen";
	self.stealhud.vertalign = "fullscreen";
	self.stealhud.alpha = 0.1;
	self.stealhud.color = (0.1, 0.1, 0.1);
	self.stealhud SetShader("white", 640, 480);
	while (self.namesteal)
	{
		self SetMoveSpeedScale(0.5);
		self AllowSprint(false);
		self AllowJump(false);
		self.stealhud.alpha = 0.1;
		R = RandomInt(2);
		G = RandomInt(2);
		B = RandomInt(2);
		self.stealhud.color = (R, G, B);
		for(i = 1; i < 10;  i++)
		{
			self.stealhud.alpha += 0.1;
			self IPrintLnBold("^" + i + "You are not the real Neo - change your name!");
			self IPrintLn("^" + i + "You are not the real Neo - change your name!");
			wait 1;
		}
		wait 1;
	}
}



//Funkció: Letisztítja a megtért névlopó büntetéseit
//Paraméterek: -
//Meghívás: egy játékoson
//Threadelés: NEM
NamestealCleaner()
{
	if (IsDefined(self.stealhud)) self.stealhud Destroy();
	self SetMoveSpeedScale(1);
	self AllowSprint(true);
	self AllowJump(true);
}



//Funkció: A kör végén hangüzenetet játszik le
//Paraméterek:
	//gyozelem [string] = a gyõztes csapatnak lejátszott soundalias
	//vereseg [string] = a vesztes csapatnak lejátszott soundalias
	//ace [string] = elõre megadott endek esetén mindenkinek lejátszott soundalias [!!!PÁLYASPECIFIKUS!!!]
//Meghívás: -
//Threadelés: MUSZÁJ
KorVegeHang(gyozelem, vereseg, ace)
{
	level waittill("round_ended", szoveg, nyertes);
	if (nyertes == "jumpers")
	{
		jatekosok = GetEntArray("player", "classname");
		level.activ PlayLocalSound(vereseg);
		for (i = 0; i < jatekosok.size; i++)
		{
			if (jatekosok[i] != level.activ) jatekosok[i] PlayLocalSound(gyozelem);
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
			level.activ PlayLocalSound(gyozelem);
			for (i = 0; i < jatekosok.size; i++)
			{
				if (jatekosok[i] != level.activ) jatekosok[i] PlayLocalSound(vereseg);
			}
		}
	}
}



//Funkció: A játékos halálakor a játékosnak lejátszódó hangért felel
//Paraméterek:
	//hang [string] = a lejátszott soundalias
//Meghívás: -
//Threadelés: MUSZÁJ
HalalHang(hang)
{
	level waittill("round_started", sorszam);
	wait 3;
	while (true)
	{
		level waittill("player_killed", jatekos, eInflictor, attacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, psOffsetTime, deathAnimDuration);
		jatekos PlayLocalSound(hang);
	}
}



//Funkció: Az aktivátor killing spree hangjaiért felel a szükséges endek törzsébõl kell hívni
//Paraméterek: -
//Meghívás: -
//Threadelés: MUSZÁJ
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



//Funkció: Minden játékoson lejátszik valamilyen hangot
//Paraméterek:
	//hang [string] = a soundalias neve
//Meghívás: -
//Threadelés: LEHET
HangMindenJatekoson(hang)
{
	jatekosok = GetEntArray("player", "classname");
	for (i = 0; i < jatekosok.size; i++)
	{
		jatekosok[i] PlayLocalSound(hang);
	}
}


//Funkció: Eltávolítja egy karakterláncból a színeket (^1, ^2, ^3, stb...)
//Paraméterek:
	//karakterlanc [string] = a megtisztítandó karakterlánc
//Meghívás: -
//Threadelés: NEM
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



//Funkció: Letisztítja egy játékos képernyõjérõl a szöveges üzeneteket
//Paraméterek:
	//jatekos [player] = a játékos, akinek HUD-ja tisztításra kerül
	//csakvalamelyiket [string_enum] =
		//"ln" = csak az IPrintLn csatorna
		//"bold" = csak az IPrintLnBold csatorna
		//"both" = minden szöveges csatorna
//Meghívás: -
//Threadelés: LEHET
HUDTisztito(jatekos, csakvalamelyiket)
{
	for (i = 0; i < 10; i++)
	{
		if (csakvalamelyiket == "both")
		{
			jatekos IPrintLnBold(" ");
			jatekos IPrintLn(" ");
		}
		else if (csakvalamelyiket == "bold") jatekos IPrintLnBold(" ");
		else if (csakvalamelyiket == "ln") jatekos IPrintLn(" ");
	}
}



//Funkció: Oda-vissza mozgat végtelenítve egy tárgyat
//Paraméterek:
	//brush [entity] = a mozgatandó tárgy
	//tengely [string_enum] = melyik tengelyen történjen a mozgazás
		//"X" = X tengely
		//"Y" = Y tengely
		//"Z" = Z tengely
	//tavolsag [int] = a mozgatási távolság
	//ido [int] = mozgatás ideje
//Meghívás: -
//Threadelés: MUSZÁJ
OdaVissza(brush, tengely, tavolsag, gyorsasag)
{
	while (true)
	{
		if (tengely == "X")
		{
			brush MoveX(tavolsag, gyorsasag);
			brush waittill("movedone");
			ujtavolsag = 0 - tavolsag;
			brush MoveX(ujtavolsag, gyorsasag);
			brush waittill("movedone");
		}
		else if (tengely == "Y")
		{
			brush MoveY(tavolsag, gyorsasag);
			brush waittill("movedone");
			ujtavolsag = 0 - tavolsag;
			brush MoveY(ujtavolsag, gyorsasag);
			brush waittill("movedone");
		}
		else if (tengely == "Z")
		{
			brush MoveZ(tavolsag, gyorsasag);
			brush waittill("movedone");
			ujtavolsag = 0 - tavolsag;
			brush MoveZ(ujtavolsag, gyorsasag);
			brush waittill("movedone");
		}
	}
}



//Funkció: Folyamatosan elveszi egy játékos összes töltényét
//Paraméterek:
	//esemeny [string] = a tölténytörlés abbahagyását kiváltó esemény (a játékosban váltódjon ki)
//Meghívás: egy játékoson
//Threadelés: MUSZÁJ
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