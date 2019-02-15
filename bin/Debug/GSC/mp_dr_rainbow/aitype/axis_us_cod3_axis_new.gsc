main()
{
	self.animTree = "";
	self.team = "axis";
	self.type = "human";
	self.accuracy = 0.2;
	self.health = 150;
	self.weapon = "ak47";
	self.secondaryweapon = "beretta";
	self.sidearm = "usp";
	self.grenadeWeapon = "fraggrenade";
	self.grenadeAmmo = 0;

	self setEngagementMinDist( 256.000000, 0.000000 );
	self setEngagementMaxDist( 768.000000, 1024.000000 );

	character\character_sp_arab_regular_asad::main();
}

spawner()
{
	self setspawnerteam("axis");
}

precache()
{
	character\character_sp_arab_regular_asad::precache();

	precacheItem("ak47");
	precacheItem("beretta");
	precacheItem("usp");
	precacheItem("fraggrenade");
}

