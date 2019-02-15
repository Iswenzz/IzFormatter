main()
{
	precachemodel("weapon_ak47");
	precachemodel("weapon_beretta");
	precachemodel("weapon_colt1911_black");
	precachemodel("weapon_desert_eagle_gold");
	precachemodel("weapon_g3");
	precachemodel("com_crate01");
	precachemodel("com_crate02");
	precachemodel("weapon_m40a3");
	precachemodel("weapon_desert_eagle_silver");
	precachemodel("weapon_colt_anaconda_44");
	precacheitem("g3_mp");
	precacheitem("colt44_mp");

	thread misterybox();
}

misterybox()
{
	box = getent("misterybox","targetname");
	trig = getent("misteryboxtrig","targetname");
	level.wepname = "";
	for(;;)
	{
		trig sethintstring("^3Press ^7[^2&&1^7]^3 To Open Crate");
		trig waittill("trigger",player);
		trig sethintstring("^1WAIT");
		box setModel("com_crate02");
		pasivmodel = spawn("script_model",box.origin);
		pasivmodel.angles = (0,270,0);
		pasivmodel movez(50,1);
		for(i=0;i<20;i++)
		{
			pasivmodel thread setamodel();
			wait .25;
		}
		trig sethintstring("^3Press ^7[^2&&1^7]^3 To Take Weapon");
		trig waittill("trigger",player);
//AUTO 		player TakeAllWeapons();
//AUTO 		player GiveWeapon(level.wepname+"_mp");
//AUTO 		player switchtoweapon(level.wepname+"_mp");
//AUTO 		player givemaxammo(level.wepname+"_mp");
		pasivmodel delete();
		box setModel("com_crate01");
		level.wepname = "";
	}
}

setamodel()
{
	x = randomint(9);
	if(x == 0)
	{
		self setModel("weapon_ak47");
		level.wepname = "ak47";
	}
	if(x == 1)
	{
		self setModel("weapon_beretta");
		level.wepname = "beretta";
	}
	if(x == 2)
	{
		self setModel("weapon_colt1911_black");
		level.wepname = "colt45";
	}
	if(x == 3)
	{	
		self setModel("weapon_desert_eagle_gold");
		level.wepname = "deserteaglegold";
	}	
	if(x == 4)
	{
		self setModel("weapon_g3");
		level.wepname = "g3";
	}
	if(x == 5)
	{
		self setModel("weapon_remington700");
		level.wepname = "remington700";
	}
	if(x == 6)
	{
		self setModel("weapon_m40a3");
		level.wepname = "m40a3";
	}
	if(x == 7)
	{
		self setModel("weapon_desert_eagle_silver");
		level.wepname = "deserteagle";
	}
	if(x == 8)
	{
		self setModel("weapon_colt_anaconda_44");
		level.wepname = "colt44";
	}
}

