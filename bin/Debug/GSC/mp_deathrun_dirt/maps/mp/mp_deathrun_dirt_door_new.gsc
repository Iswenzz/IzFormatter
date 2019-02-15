main()
{
thread door_a();
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
thread door_b();
thread door_c();
}

door_a()
{
door_a = getentarray ("door_a" ,"targetname");

wait 15;

door_a[randomInt(door_a.size)] movez(-481, 2 );

}

door_b()
{
	trig = getent ("door_b_trig" , "targetname");
	trig waittill ("trigger",player);
	trig delete ();
//AUTO 	iprintlnbold ("^3---^1" + player.name + "^3--- ^2in second part!!");
//AUTO 	ambientPlay("doorb_dirt");
}

door_c()
{
	trig = getent ("door_c_trig" , "targetname");
	door_b = getent ("door_c" ,"targetname" );
	trig waittill ("trigger",player);
	trig delete ();
//AUTO 	iprintlnbold ("^3---^1" + player.name + "^3--- ^2open FINAL door!");
//AUTO 	ambientPlay("doorc_dirt");
	door_b movez (129 , 2);
}

