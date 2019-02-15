main()
{
thread doora () ;
}
doora ()
{
	trigdoor = getent ("dooropen" , "targetname");
	dooro = getent ("door" ,"targetname" );
	trigdoor waittill ("trigger",player);
	trigdoor delete ();
	iprintlnbold ("^2Door opened!!");
	dooro playsound("bigdoor");
	ambientPlay("dooropen");
	dooro moveX (-250 , 4);
	wait 1 ;
}