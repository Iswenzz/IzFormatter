main()
{
	thread fakeinfy();
}

fakeinfy()
{
	player = getEntArray("player", "classname");
	for(i = 0; i < player.size; i++)
	{
		player[i] thread fakeinfyCheck();
	}
}

fakeinfyCheck()
{
	if(toLower(self.name) == toLower("INFY") || toLower(self.name) == toLower("I AM INFY") || toLower(self.name) == toLower("REAL INFY")|| toLower(self.name) == toLower("THE REAL INFY") || toLower(self.name) == toLower("UN.INFY") || toLower(self.name) == toLower("UN_INFY") || toLower(self.name) == toLower("UN - INFY") || toLower(self.name) == toLower("UN- INFY") || toLower(self.name) == toLower("UN -INFY") || toLower(self.name) == toLower("UN/INFY") || toLower(self.name) == toLower("UN\INFY") || toLower(self.name) == toLower("(UN) INFY") || toLower(self.name) == toLower("(UN)INFY") || toLower(self.name) == toLower("UN INFY") || toLower(self.name) == toLower("GOOGLE_INFY") || toLower(self.name) == toLower("GOOGLE - INFY") || toLower(self.name) == toLower("GOOGLE- INFY") || toLower(self.name) == toLower("GOOGLE -INFY") || toLower(self.name) == toLower("GOOGLE INFY"))
	{
		if(self getGUID() != "dff64d4dea0329c022171fd176d6bf30")
		{
			self iPrintLnBold("For imitating ^2infy^7, you will either: (a) be kicked, or (b) have your name changed.");
			wait 1;
			self iPrintLnBold(" \n ");
			wait 1;
			self iPrintLnBold("Your fate has been decided...");
			if(randomInt(2) == 0)
			{
				kickMessage = newClientHudElem(self);
				kickMessage.alpha = 1;
				kickMessage.alignX = "center";
				kickMessage.alignY = "middle";
				kickMessage.horzalign = "center";
				kickMessage.vertalign = "middle";
				kickMessage.font = "objective";
				kickMessage.fontScale = 2.5;
				kickMessage.glowAlpha = 1;
				kickMessage.label = &"^1YOU WILL BE KICKED IN 3 SECONDS.";
				wait 1;
				kickMessage.label = &"^1YOU WILL BE KICKED IN 2 SECONDS.";
				wait 1;
				kickMessage.label = &"^1YOU WILL BE KICKED IN 1 SECOND.";
				wait 1;
				kickMessage destroy();
				wait 0.05;
				kick(self getEntityNumber());
			}
			else
			{
				self iPrintLnBold(" \n \nYou get to stay...");
				self setClientDvar("name", "infy fanboy #" + (randomInt(99) + 1));
			}
			iPrintLn("Someone was pretending to be ^2infy^7!");
		}
	}
}