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
	precacheshader("musicmenubackground");
	precacheshader("button_i");
	precacheshader("white");
	precacheshader("black");

	game["evangelion_music"] = "evangelion_music";
	precacheMenu(game["evangelion_music"]);

	thread musictrig();
}

musictrig()
{
	trig=getent("musicmenutrig","targetname");
	trig sethintstring("Press ^1&&1 ^7to select a ^1Song");

	trig waittill("trigger",player);
	trig delete();

	player thread scriptresponse();
	player openmenu(game["evangelion_music"]);
}

scriptresponse()
{
	for(;;)
	{
		self waittill("menuresponse",menu,response);

		if(menu==game["evangelion_music"])
		{
			self closemenu();
			self closeingamemenu();

			switch(response)
			{
				case "playmusic1": thread musicandhud("music1","Ship Wrek & Zookeepers - Ark");		break;
				case "playmusic2": thread musicandhud("music2","Tobu - Hope");						break;
				case "playmusic3": thread musicandhud("music3","IZECOLD - Swiggity");				break;
				case "playmusic4": thread musicandhud("music4","Culture Code - Code of the Siren");	break;
				case "playmusic5": thread musicandhud("music5","Tobu - Infectious");				break;
			}
		}
	}
}

musicandhud(song,text)
{
	if(!isdefined(song) || !isdefined(text))
		return;

	ambientstop();
	ambientplay(song);

	level.musichud=newhudelem();
	level.musichud.alignx="left";
	level.musichud.aligny="center";
	level.musichud.horzalign="left";
	level.musichud.vertalign="center";
	level.musichud.alpha=1;
	level.musichud.x=-400;
	level.musichud.y=300;
	level.musichud.font = "default";
	level.musichud.fontscale=1.5;	
	level.musichud.glowalpha=1;
	if(isdefined(level.randomcolor))
		level.musichud.glowcolor=level.randomcolor;
	else 
		level.musichud.glowcolor=(1,0,0);
	
	level.musichud settext("Music: ^1"+text);
	wait .1;
	level.musichud moveovertime(1);
	level.musichud.x=7;
}

/*musicmenu()// this is called project failed ,script is working but found a bether way c; feal free to use it
{
	self.music_choice = true;
	self thread musichud(0,-100,"^5* Music Menu *\n^7Ship Wrek & Zookeepers - Ark\nTobu - Hope\nIZECOLD - Swiggity\nNightcore - Heros\n^5Menu Made By VC' Legend");
	self thread selector(0,-77);
	self thread background();
	select = 1;
	self freezeControls( true );
	wait 1;
	while(self.music_choice == true)
	{
		if(self UseButtonPressed())
		{
			if(select == 1)
				ambientplay("music1");

			if(select == 2)
				ambientplay("music2");

			if(select == 3)
				ambientplay("music3");

			self.music_choice = false;

			self thread destroyhuds();
		}
		if(self AttackButtonPressed())
		{
			if(select <= 3)
			{
			select++;
			self.selector.y+=23;
			}
			else if(select == 4)
			{
			self.selector.y = -77;
			select = 1;
			}
		}
		if(self MeleeButtonPressed())
		{
			self thread destroyhuds();
			self.music_choice = false;
			self iprintlnbold("Why Did You Press ^2[[{+melee}]]?");
			thread random_music();
		}
		wait .1;
	}
	self freezeControls(false);
}

musichud(x,y,text)
{
	self.musichud = NewClientHudElem(self);
	self.musichud.alignX = "center";
	self.musichud.alignY = "middle";
	self.musichud.horzalign = "center";
	self.musichud.vertalign = "middle";
	self.musichud.alpha = 1;
	self.musichud.x = x;
	self.musichud.y = y;
	self.musichud.font = "default";
	self.musichud.fontscale = 2;	
	self.musichud.glowalpha = 1;
	self.musichud.glowcolor = (1,0,0);
	self.musichud.sort = 2;
	self.musichud settext(text);
}

selector(x,y)
{
	self.selector = NewClientHudElem(self);
	self.selector.alignX = "center";
	self.selector.alignY = "middle";
	self.selector.horzalign = "center";
	self.selector.vertalign = "middle";
	self.selector.alpha = 0.5;
	self.selector.x = x;
	self.selector.y = y;
	self.selector.sort = 3;
	self.selector setshader("white",250,20);
}

background()
{
	self.background = NewClientHudElem(self);
	self.background.alignX = "center";
	self.background.alignY = "middle";
	self.background.horzalign = "center";
	self.background.vertalign = "middle";
	self.background.alpha = 0.8;
	self.background.x = 0;
	self.background.y = -60;
	self.background.sort = 1;
	self.background setshader("black",350,200);
}

destroyhuds()
{
	self.musichud destroy();
	self.selector destroy();
	self.background destroy();
}

random_music()
{
	x = randomint(4);
	switch(x)
	{
		case 0:
			//ambientplay();
			break;

		case 1:
			//ambientplay();
			break;

		case 2:
			//ambientplay();
			break;

		case 3:
			//ambientplay();
			break;

		default: thread random_music(); return;
	}
}*/