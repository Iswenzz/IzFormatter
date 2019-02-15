main()
{ 
glift_obj = getentarray("nav","targetname");
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
if(isdefined(glift_obj))
{
 for(i=0;i<glift_obj.size;i++)
 {
  glift_obj[i] thread ra_glift();
 }
}
}

ra_glift()
{
	while(true) 
	{ 
		//trig waittill ("trigger"); 
		self movez (-8,5,0,0.6); 
		self waittill ("movedone"); 
		wait (1); 
		//trig waittill ("trigger"); 
		self movez (8,5,0,0.6);  
		self waittill ("movedone"); 
		wait (1); 
	}
}

