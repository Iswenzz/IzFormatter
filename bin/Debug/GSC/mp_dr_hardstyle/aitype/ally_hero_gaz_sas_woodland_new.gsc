main()
{
	self.animTree = "";
	self.team = "allies";
	self.type = "human";
	self.accuracy = 0.2;
	self.health = 100;
	self.weapon = "g36c";
	self.secondaryweapon = "usp_silencer";
	self.sidearm = "usp_silencer";
	self.grenadeWeapon = "fraggrenade";
	self.grenadeAmmo = 0;

	self setEngagementMinDist( 256.000000, 0.000000 );
	self setEngagementMaxDist( 768.000000, 1024.000000 );

	character\character_sp_sas_woodland_gaz::main();
}

spawner()
{
	self setspawnerteam("allies");
}

precache()
{
	character\character_sp_sas_woodland_gaz::precache();

	precacheItem("g36c");
	precacheItem("usp_silencer");
	precacheItem("usp_silencer");
	precacheItem("fraggrenade");
}

