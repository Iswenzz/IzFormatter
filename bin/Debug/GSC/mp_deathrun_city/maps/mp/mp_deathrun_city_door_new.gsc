main()
{
thread door_a();
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
thread door_b();
}

door_a()
{
	trig = getent ("door_a_trig" , "targetname");
	door_a = getent ("door_a" ,"targetname" );
	trig waittill ("trigger",player);
	trig delete ();
//AUTO 	iprintlnbold ("^1" + player.name + " open door!");
//AUTO 	ambientPlay("doora");
	door_a movez (193 , 5);
}

door_b()
{
	trig = getent ("door_b_trig" , "targetname");
	door_b = getent ("door_b" ,"targetname" );
	trig waittill ("trigger",player);
	trig delete ();
//AUTO 	iprintlnbold ("^1" + player.name + " open FINAL door!");
//AUTO 	ambientPlay("doorb");
	door_b movez (257 , 5);
}

