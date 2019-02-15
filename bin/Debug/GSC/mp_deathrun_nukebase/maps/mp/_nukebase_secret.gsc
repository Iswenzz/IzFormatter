/*
_______________________________________________
  /   /  ___/    __ /   ___/ \ \     / /  ___  \
 /   /  /__     /___   /__  / \ \   / /  /  /  /
/   /  ___/  __    /  ___/ /   \ \ / /  /  /  /
  _/  /__   /_/   /	 /__  /     \ \ /  /__/  /
___\____/\_______/\____/_/	     \_/________/

Credit to VC'Blade for creating the music menu and the scripting part of it c;

[PERMISSION]
Ask for what you want to use(via steam), or at least give me or Blade credit for it, ty.

*/
main()
{
	thread secret();
	thread secret2();
	thread exitsecret();
}

secret()
{
	trig = getent("secrettrig","targetname");
	secretdoor = getent("secretdoor","targetname");
	trig waittill("trigger",player);
	trig delete();
	secretdoor movey(-8,1);
	wait 2;
	secretdoor movex(112,2);
	tptosectrig = getent("tptosectrig","targetname");
	tporigin = getent("tporigin","targetname");
	for(;;)
	{
		tptosectrig waittill("trigger",player);
		player setorigin(tporigin.origin);
		player setplayerangles(tporigin.angles);
		if(!player.insecret)
		{
			player.insecret = true;
			player thread secret_timer();
			player thread ifdead();
		}
		wait .1;
	}
}

ifdead()
{
	self endon("disconnect");

	self waittill("death");
	self.insecret = false;
}

secret_timer()
{
	self endon("disconnect");

	self.timer = NewClientHudElem(self);
	self.timer.alignX = "left";
	self.timer.alignY = "middle";
	self.timer.horzalign = "left";
	self.timer.vertalign = "middle";
	self.timer.alpha = 0;
	self.timer.x = 0;
	self.timer.y = 0;
	self.timer.font = "default";
	self.timer.fontscale = 2;
	self.timer.glowalpha = 1;
	self.timer.glowcolor = (1, 0.5, 0);
	self.timer.label = &"Secret Timer: ^1&&1";
	self.timer fadeovertime(1);
	self.timer.alpha = 1;
    time = 60;
	while(self.sessionstat == "playing" && self.insecret == true)
	{
		if(time == 0)
		{
			self.insecret = false;
			self suicide();
		}

		self.timer setvalue(time);
		time--;
		wait 1;
	}
	self.timer fadeovertime(.5);
	self.timer.alpha = 0;
	wait .5;
	self.timer destroy();
}

exitsecret()
{
	trig = getent("exitsecret_trig","targetname");
	exitorigin = getent("exitsecret_origin","targetname");
	for(;;)
	{
		trig waittill("trigger",player);
		player setorigin(exitorigin.origin);
		player setplayerangles(exitorigin.angles);
		player setmodel("playermodel_terminator");
		player.insecret = false;
		player braxi\_rank::giveRankXp( undefined, 100 );
		wait .1;
	}
}

secret2()
{
	trig = getent("xpsec","targetname");
	trig waittill("trigger",player);
	player iprintlnbold("You Got 100 XP");
	player setmodel("playermodel_terminator");
	player braxi\_rank::giveRankXp( undefined, 100 );
	trig delete();
}