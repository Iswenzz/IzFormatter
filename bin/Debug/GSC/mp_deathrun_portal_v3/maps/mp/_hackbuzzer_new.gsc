main() 
{
	thread onPlayerConnect();
}

onPlayerConnect()
{
	while(1)
	{
		level waittill("connected", player);
		player thread onDeath();
	}
}

onDeath()
{
	self endon("disconnect");
	
	while(1)
	{
		self waittill("death");
		players = getentarray("player", "classname");
		for(i=0;i<players.size;i++)
//AUTO 			players[i] PlayLocalSound("hackbuzzer");
	}
}

