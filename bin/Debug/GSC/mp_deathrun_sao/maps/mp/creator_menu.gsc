#include maps\mp\mp_deathrun_sao;
#include braxi\_common;

creatormenu()
{
	//game["menu_creator"] = "sao_dr_creator";
	//precacheMenu(game["menu_creator"]);
	precacheMenu("sao_dr_creator");

	//thread onPlayerConnect();
	thread creator_menu_trig();
}

creator_menu_trig()
{
	trig = getent("creator_menu_trig","targetname");
	for(;;)
	{
		trig waittill("trigger", player );
		//if (player == player.pers["legend"])
		//{
			//player openmenu(game["menu_creator"]);
			player openMenu("sao_dr_creator");
		//}
	}
}

/*onPlayerConnect()
{
	for(;;)
	{
		level waittill("connected", player);
		
		if (player == player.pers["legend"])
		{
			//player thread onMenuResponse();
			//player braxi\_common::clientCmd("bind O scriptmenuresponse -1 sao_dr_creator");
		}
	}
}

onMenuResponse()
{
	self endon("disconnect");
	for(;;)
	{
		self waittill("menuresponse", menu, response);

		if ( response == "creator_guns" )
		{
			//self closeMenu();
			//self closeInGameMenu();
			self giveweapon("deserteagle_mp");
		}
	}
}*/