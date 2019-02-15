main()
{
thread doora () ;
}
doora ()
{
	trigdoor = getent ("door_final_t" , "targetname");
	dooro = getent ("door_final" ,"targetname" );
	trigdoor waittill ("trigger",player);
	trigdoor delete ();
	//iprintlnbold ("^2Door opened!!");
	dooro playsound("bigdoor");
	//ambientPlay("dooropen");
	dooro moveZ (-250 , 4);
	//dooro waittill ("movedone");
	
	//playFX( level._effect["rachejtle"] , (-840, -1512, 776));
	
}