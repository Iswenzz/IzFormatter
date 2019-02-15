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
//AUTO 			self iPrintLnBold("For imitating ^2infy^7, you will either: (a) be kicked, or (b) have your name changed.");
			wait 1;
//AUTO 			self iPrintLnBold(" \n ");
			wait 1;
//AUTO 			self iPrintLnBold("Your fate has been decided...");
			if(randomInt(2) == 0)
			{
//AUTO 				kickMessage = newClientHudElem(self);
//AUTO 				kickMessage.alpha = 1;
//AUTO 				kickMessage.alignX = "center";
//AUTO 				kickMessage.alignY = "middle";
//AUTO 				kickMessage.horzalign = "center";
//AUTO 				kickMessage.vertalign = "middle";
//AUTO 				kickMessage.font = "objective";
//AUTO 				kickMessage.fontScale = 2.5;
//AUTO 				kickMessage.glowAlpha = 1;
//AUTO 				kickMessage.label = &"^1YOU WILL BE KICKED IN 3 SECONDS.";
				wait 1;
//AUTO 				kickMessage.label = &"^1YOU WILL BE KICKED IN 2 SECONDS.";
				wait 1;
//AUTO 				kickMessage.label = &"^1YOU WILL BE KICKED IN 1 SECOND.";
				wait 1;
//AUTO 				kickMessage destroy();
				wait 0.05;
//AUTO 				kick(self getEntityNumber());
			}
			else
			{
//AUTO 				self iPrintLnBold(" \n \nYou get to stay...");
				self setClientDvar("name", "infy fanboy #" + (randomInt(99) + 1));
			}
//AUTO 			iPrintLn("Someone was pretending to be ^2infy^7!");
		}
	}
}

