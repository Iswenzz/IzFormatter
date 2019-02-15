main()
{
	windfx = loadfx ("props/car_glass_large");
	windtrigs = getentarray("trig_window2","targetname");
	for(i=0;i<windtrigs.size;i++)
		windtrigs[i] thread dowindow(i,windfx);
}

dowindow(windnumber,windfx)
{
	window = getent(self.target,"targetname");
	totaldamage=0;
	targetdamage=50;
	windowbroken=0;
	broken = getentarray("brokenwindow"+(windnumber+1),"targetname");
	for(j=0;j<broken.size;j++)
	{
		broken[j] notsolid();
		broken[j] hide();
	}
	window show();
	while(!windowbroken)
	{
		self waittill ("damage",amount);
		totaldamage+=amount;
		if(totaldamage>targetdamage)
			windowbroken=1;
	}
        self playsound("glass_break");
	PlayFX(windfx, self.origin );
	for(j=0;j<broken.size;j++)
		broken[j] show();
	window delete();
	self delete();
}

