main()
{

	portals = getentarray("teleport2", "targetname");
	
	for(inx = 0; inx < portals.size; inx++)
	{
		thread Transporter2Random(portals, inx);
	}
	
}

Transporter2Random(portals, inx)
{
	i = 0;
	
	while( isdefined( level.teleport_teleport2 ) || !i )
	{
		level waittill( "picking activator" );
	
		i++;
		level.teleport_teleport2 = undefined;
		trigger = spawn( "trigger_radius", portals[inx].origin, 0, 40, 40);
		portals[inx].fx = PlayLoopedFX( level._effect[ "teleport_fx" ], 60, portals[inx].origin );
		
		while(true)
		{
			trigger waittill("trigger",player);

			if( isdefined(level.teleport_teleport2) )
				break;
			
			if (getdvarint("scr_teleport_disabled") == 1)
			{
//AUTO 				wait(0.10);
				continue;
			}

			if(!isDefined(player) || isDefined(player.mp_deathrun_zero_teleport_time) && player.mp_deathrun_zero_teleport_time + 3000 > GetTime())
				continue;

			endInx = randomint(portals.size);
			while(endInx == inx)
				endInx = randomint(portals.size);

			player linkTo(portals[endInx]);
			player setorigin(portals[endInx].origin);
			player SetPlayerAngles(portals[endInx].angles);
			player unlink();
			player.mp_deathrun_zero_teleport_time = GetTime();
//AUTO 			wait(0.10);
			
			if( player.pers["team"] == "axis" )
			{
				trigger delete();
				
				portals thread DeleteFX();
				
				level.teleport_teleport2 = true;
				break;
			}
			
		}
	}
}

DeleteFX()
{
	wait 0.01;
	
	for(i = 0;i < self.size;i++)
		self[i].fx delete();
}

