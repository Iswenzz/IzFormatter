main()
{
	move_obj = getentarray("block1","targetname");
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
	if(isdefined(move_obj))
	{
 		for(i=0;i<move_obj.size;i++)
 		{
   		move_obj[i] thread ra_move();
		}
	}

}

ra_move()
{
	self.nun1 = RandomInt(2);
	self.nun2 = RandomInt(2);
	self.nun3 = RandomInt(2);
	
if (self.nun1 != 1)
	{
		if (self.nun2 != 1)
		{
		self movex (130,1,0,0.6);
		}else{
			self movex (-130,1,0,0.6);
		}
		
	}else{
		if (self.nun3 != 1)
		{
		self movey (130,1,0,0.6);	
		}else{ 
			self movey (-130,1,0,0.6);
		}
	}
			
}

