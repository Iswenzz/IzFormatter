main()
{
while(1)
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
{
thread obrazy();
wait 20;
}
}

obrazy()
{
 rightbut=RandomIntRange(0,4);
 for(i=0; i<4; i++) 
 {
  thread WaitforInput(i,rightbut);
 }

}

WaitforInput(i,rightbut)
{
 trig=getent ("obraz_"+i,"targetname");

 if (i==rightbut)
    {
     trig thread OpenGate();
    }

}

OpenGate()
{
self movey(121,5);
wait 10;
self movey(-121,5);
}

