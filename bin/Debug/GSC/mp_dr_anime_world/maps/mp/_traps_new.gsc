main()
{
	thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap6();
	thread trap7();
	thread trap8();
	thread trap9();
	thread trap10();
	thread trap11();
	thread trap12();
	thread trap13();
	thread trap14();
	thread trap15();
	thread trap16();
	thread trap17();
	thread trap18();
	thread trap19();
	thread trap20();

	addTriggerToList( "trap1trig" );
	addTriggerToList( "trap2trig" );
	addTriggerToList( "trap3trig" );
	addTriggerToList( "trap4trig" );
	addTriggerToList( "trap5trig" );
	addTriggerToList( "trap6trig" );
	addTriggerToList( "trap7trig" );
	addTriggerToList( "trap8trig" );
	addTriggerToList( "trap9trig" );
	addTriggerToList( "trap10trig" );
	addTriggerToList( "trap11trig" );
	addTriggerToList( "trap12trig" );
	addTriggerToList( "trap13trig" );
	addTriggerToList( "trap14trig" );
	addTriggerToList( "trap15trig" );
	addTriggerToList( "trap16trig" );
	addTriggerToList( "trap17trig" );
	addTriggerToList( "trap18trig" );
	addTriggerToList( "trap19trig" );
	addTriggerToList( "trap20trig" );

}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

trap1()
{
	gnjeci1 = getent("gnjeci1","targetname");
	level endon("trigger");
	gnjeci2 = getent("gnjeci2","targetname");
	killtrig1 = getent("killtrig1","targetname");
	killtrig2 = getent("killtrig2","targetname");
	trig = getent("trap1trig","targetname");
	trig sethintstring("Press [F] To Activate!");
	trig waittill("trigger", player );
	{

		trig delete();
		killtrig1 enablelinkto();
		killtrig1 linkto( gnjeci1 );
		killtrig2 enablelinkto();
		killtrig2 linkto( gnjeci2 );
		wait .1;

		gnjeci1 moveX(-528, 0.5, 0.25);
		gnjeci2 moveX(528, 0.5, 0.25);
		wait .5;
		Earthquake( 1, 3, gnjeci1.origin, 550 );
		wait 3;
		gnjeci1 moveX(528,2,1);
		gnjeci2 moveX(-528,2,1);
	}
}

trap2()
{
	object1 = getent("object1", "targetname");
	level endon("trigger");
	object2 = getent("object2", "targetname");
	object3 = getent("object3", "targetname");
	object4 = getent("object4", "targetname");
	object5 = getent("object5", "targetname");
	object6 = getent("object6", "targetname");
	object7 = getent("object7", "targetname");
	object8 = getent("object8", "targetname");
	object9 = getent("object9", "targetname");
	object10 = getent("object10", "targetname");
	object11 = getent("object11", "targetname");
	object12 = getent("object12", "targetname");
	object13 = getent("object13", "targetname");
	object14 = getent("object14", "targetname");
	object15 = getent("object15", "targetname");
	object16 = getent("object16", "targetname");

	actitrig = getent("trap2trig","targetname");
	actitrig sethintstring("Press [F] to Activate");
	actitrig waittill("trigger", player );
	{
		actitrig delete();
		object1 moveZ(-32,1);
		wait .1;
		object2 moveZ(-32,1);
		wait .1;
		object3 moveZ(-32,1);
		wait .1;
		object4 moveZ(-32,1);
		wait .1;
		object5 moveZ(-32,1);
		wait .1;
		object6 moveZ(-32,1);
		wait .1;
		object7 moveZ(-32,1);
		wait .1;
		object8 moveZ(-32,1);
		wait .1;
		object9 moveZ(-32,1);
		wait .1;
		object10 moveZ(-32,1);
		wait .1;
		object11 moveZ(-32,1);
		wait .1;
		object12 moveZ(-32,1);
		wait .1;
		object13 moveZ(-32,1);
		wait .1;
		object14 moveZ(-32,1);
		wait .1;
		object15 moveZ(-32,1);
		wait .1;
		object16 moveZ(-32,1);
		wait 1;

		object1 thread moves();
		object2 thread moves();
		object3 thread moves();
		object4 thread moves();
		object5 thread moves();
		object6 thread moves();
		object7 thread moves();
		object8 thread moves();
		object9 thread moves();
		object10 thread moves();
		object11 thread moves();
		object12 thread moves();
		object13 thread moves();
		object14 thread moves();
		object15 thread moves();
		object16 thread moves();
	}
}

moves()
{
	origin = self GetOrigin();
	wait .1;
	range = RandomIntRange( 32, 64 );
	for(;;)
	{
		waiter = randomint(5);
		wait .1;
		self movez(range, (waiter)/2);
		wait waiter+1;
		self moveto(origin, (waiter)/2);
		wait 2;
	}
}

trap3()
{
	trig = getent("trap3trig","targetname");
	level endon("trigger");
	spiner1 = getent("spiner1","targetname");
	spiner2 = getent("spiner2","targetname");
	spiner1kill = getent("spiner1kill","targetname");
	spiner2kill = getent("spiner2kill","targetname");
	trig sethintstring("Press [F] To Activate!");
	trig waittill("trigger", player );
	{
		spiner1kill enablelinkto();
		spiner1kill linkto( spiner1 );
		spiner2kill enablelinkto();
		spiner2kill linkto( spiner2 );

		trig delete();
		completed = randomint(10);
		counter = 0;
		spiner1 thread trap3spin();
		spiner2 thread trap3spin();
		for(;;)
		{
			if (counter == completed)
			{
				wait randomint(2);
				spiner1.angles = (0,0,0);
				spiner2.angles = (0,0,0);
				dead1 = spawn("script_model",(spiner1.origin));
				dead2 = spawn("script_model",(spiner2.origin));
				PlayFX( level._effect["spiner_xpl"], spiner1.origin );
				PlayFX( level._effect["spiner_xpl"], spiner2.origin );
				RadiusDamage( dead1.origin, 200, 300, 500);
				RadiusDamage( dead2.origin, 200, 300, 500);
				Earthquake( 1, 3, spiner1.origin, 550 );
				Earthquake( 1, 3, spiner2.origin, 550 );
				spiner1 delete();
				spiner2 delete();
				spiner1kill delete();
				spiner2kill delete();
				return;
			}
			spiner1 movex( 832, 1);
			spiner2 movex( -832, 1);
			wait 1;
			spiner1 movex( -832, 1);
			spiner2 movex( 832, 1);
			wait 1;
			counter++;
		}
	}
}

trap3spin()
{
	for(;;)
	{
	self rotatepitch(360, 1);
	wait 1;
	}
}

trap4()
{
	flor = getent("flor","targetname");
	level endon("trigger");
	stairs = getent("stairs","targetname");
	trig = getent("trap4trig","targetname");
	trig sethintstring("Press [F] To Activate!");
	trig waittill("trigger", player );
	{
		trig delete();
		x = randomint(3);
		switch(x)
		{
			case 0:
			stairs hide();
			stairs notsolid();
			wait randomint(10);
			stairs show();
			stairs solid();
			break;

			case 1:
			flor hide();
			flor notsolid();
			wait randomint(10);
			flor show();
			flor solid();
			break;

			case 2:
			stairs hide();
			stairs notsolid();
			flor hide();
			flor notsolid();
			wait randomint(10);
			stairs show();
			stairs solid();
			flor show();
			flor solid();
			break;
		}
	}
}

trap5()
{
	rockball = getent("rockball","targetname");
	level endon("trigger");
	jail = getent("jail","targetname");
	trig = getent("trap5trig","targetname");
	killertrig = getent("killertrig","targetname");
	mov1 = getent("mov1","targetname");
	mov2 = getent("mov2","targetname");
	trig sethintstring("Press [F] To Activate!");
	trig waittill("trigger", player );
	{
		trig delete();
		killertrig enablelinkto();
		killertrig linkto(rockball);
		jail moveZ(-240, 1);
		wait 1;
		rockball rotateRoll(-360, 11);
		wait .1;
		rockball thread movezor(1,mov1.origin);
		wait 1;
		Earthquake( 1, 10, rockball.origin, 1000 );
		wait .1;
		rockball thread movezor(10,mov2.origin);
	}
}

movezor(time1, location)
{
	self moveto( location, time1 );
}

trap6()
{
	pillar1 = getent("pillar1","targetname");
	level endon("trigger");
	pillar2 = getent("pillar2","targetname");
	pillar3 = getent("pillar3","targetname");
	pillar4 = getent("pillar4","targetname");
	bounce_t6 = getent("bounce_t6","targetname");
	trig = getent("trap6trig","targetname");
	trig sethintstring("Press [F] To Activate!");
	trig waittill("trigger", player );
	{
		trig delete();
		x = randomint(2);
		if (x == 1)
		{
			pillar1 thread pillar_moves();
			pillar2 thread pillar_moves();
			pillar3 thread pillar_moves();
			pillar4 thread pillar_moves();
		}
		else
			bounce_t6 notsolid();
			bounce_t6 hide();
			wait randomint(10);
			pillar1 thread pillar_moves();
			pillar2 thread pillar_moves();
			pillar3 thread pillar_moves();
			pillar4 thread pillar_moves();

	}
}

pillar_moves()
{
	origin = self GetOrigin();
	wait .1;
	range = RandomIntRange( -64, 48 );
	for(;;)
	{
		waiter = randomint(5);
		wait .1;
		self movez(range, (waiter)/2);
		wait waiter+1;
		self moveto(origin, (waiter)/2);
		wait 2;
	}
}

trap7()
{
	lavaflor1 = getent("lavaflor1","targetname");
	level endon("trigger");
	lavaflor2 = getent("lavaflor2","targetname");
	trig = getent("trap7trig","targetname");
	trig sethintstring("Press [F] To Activate!");
	trig waittill("trigger", player );
	{
		trig delete();
		done = 0;
		while(done<=5)
		{
			lavaflor1 notsolid();
			lavaflor1 hide();
			wait randomint(5);
			lavaflor2 notsolid();
			lavaflor2 hide();
			lavaflor1 solid();
			lavaflor1 show();
			wait randomint(5);
			lavaflor2 solid();
			lavaflor2 show();
			lavaflor1 notsolid();
			lavaflor1 hide();
			wait randomint(3);
			lavaflor1 solid();
			lavaflor1 show();
			done++;
		}
	}
}

trap8()
{
	way = getent("trap8way","targetname");
	level endon("trigger");
	pusher1 = getent("pusher1","targetname");
	pusher2 = getent("pusher2","targetname");
	bounce = getent("trap8bounce","targetname");
	trig = getent("trap8trig","targetname");
	trig sethintstring("Press [F] To Activate!");
	trig waittill("trigger", player );
	{
		trig delete();
		x = randomint(3);

			if (x == 1)
			{
				bounce delete();
				for(;;)
				{
					pusher1 moveX(-472, 1,0.5);
					pusher2 moveX(472, 1,0.5);
					wait 1.5;
					pusher1 moveX(472, 1,0.5);
					pusher2 moveX(-472, 1,0.5);
					wait 1.5;
				}
			}

			if (x == 2)
			{
				way delete();
				for(;;)
				{
					pusher1 moveX(-472, 1,0.5);
					pusher2 moveX(472, 1,0.5);
					wait 2;
					pusher1 moveX(472, 1,0.5);
					pusher2 moveX(-472, 1,0.5);
					wait 2;
				}
			}

			if (x == 3)
			{
				for(;;)
				{
					pusher1 moveX(-472, 1,0.5);
					pusher2 moveX(472, 1,0.5);
					wait 2;
					pusher1 moveX(472, 1,0.5);
					pusher2 moveX(-472, 1,0.5);
					wait 2;
				}
			}
			
	}

}

trap9()
{
	level.trap9used = false;
	level endon("trigger");

	sword1 = getent("sword_1","targetname");
	sword2 = getent("sword_2","targetname");
	sword3 = getent("sword_3","targetname");
	sword4 = getent("sword_4","targetname");
	sword5 = getent("sword_5","targetname");
	sword6 = getent("sword_6","targetname");
	sword7 = getent("sword_7","targetname");
	sword8 = getent("sword_8","targetname");
	sword9 = getent("sword_9","targetname");
	sword10 = getent("sword_10","targetname");

	colidcentero = getent("colidcenter","targetname");
	trig = getent("trap9trig","targetname");
	trig sethintstring("Press [F] To Activate!");
	wait .1;

	sword1 thread randomrotation();
	sword2 thread randomrotation();
	sword3 thread randomrotation();
	sword4 thread randomrotation();
	sword5 thread randomrotation();
	sword6 thread randomrotation();
	sword7 thread randomrotation();
	sword8 thread randomrotation();
	sword9 thread randomrotation();
	sword10 thread randomrotation();

	trig waittill("trigger", player );
	{
		level.trap9used = true;
		trig delete();
		sword1 thread killthing();
		sword2 thread killthing();
		sword3 thread killthing();
		sword4 thread killthing();
		sword5 thread killthing();
		sword6 thread killthing();
		sword7 thread killthing();
		sword8 thread killthing();
		sword9 thread killthing();
		sword10 thread killthing();
	}
}

killthing()
{
	colidcentero = getent("colidcenter","targetname");

	self rotateto(level.orgpos, 0.5);
	wait 0.5;
	self moveto(colidcentero.origin, 0.5);
	wait 0.5;
	colidcentero PlaySound("explo_metal_rand");
	PlayFX( level._effect["spiner_xpl"], colidcentero.origin );
	RadiusDamage( colidcentero.origin, 100, 450, 500);
	Earthquake( 1, 3, colidcentero.origin, 500 );
	self delete();
}

randomrotation()
{
	level.orgpos = self.angles;
	for(;;)
	{
		if (level.trap9used == true)
		return;

		x = randomint(3);
		{
			waiter = randomint(5)+1;
			rotator = randomint(360);
			if (x == 1 && level.trap9used == false)
			{
				self rotateyaw(rotator,waiter);
			}
			if (x == 2 && level.trap9used == false)
			{
				self rotatepitch(rotator,waiter);
			}
			if (x == 3 && level.trap9used == false)
			{
				self rotateroll(rotator,waiter);
			}
		}
		wait waiter;
	}
}

trap10()
{
	for(i=1;i<=16;i++)
	{
		thread plats(i);
	}
}

plats(index)
{
	plats = getent("trap10plat_"+index,"targetname");
	trig = getent("trap10trig","targetname");
	trig sethintstring("Press [F] To Activate!");
	origin = plats GetOrigin();
	trig waittill("trigger", player );
	{
		trig delete();
		range = RandomIntRange( -64, 64 );
		waiter = randomint(3)+1;
		for(;;)
		{
			plats movez(range, (waiter)/2);
			wait waiter+1;
			plats moveto(origin, (waiter)/2);
			wait waiter+1;
			plats movez(range, (waiter)/2);
			wait waiter+1;
		}
	}
}

trap11()
{
	trig = getent("trap11trig","targetname");
	level endon("trigger");
	trig sethintstring("Press [F] To Activate!");
	trig waittill("trigger", player);
	{
		trig delete();

		for(i=1;i<=5;i++)
		{
			thread ground(i);
		}
	}
}

ground(index)
{
	ground = getent("ground_"+index,"targetname");
	trigger = getent("groundtrig_"+index,"targetname");

	for(;;)
	{
		trigger waittill("trigger", player );

		ground delete();
		trigger delete();
	}
}

trap12()
{
	plats1 = getent("plats1","targetname");
	level endon("trigger");
	plats2 = getent("plats2","targetname");
	trig = getent("trap12trig","targetname");
	trig sethintstring("Press [F] To Activate!");
	plats1 thread platmove();
	plats2 thread platmove();
	trig waittill("trigger", player );
	{
		trig delete();
		x = randomint(3);
		switch(x)
		{
			case 0:
				plats1 notsolid();
				plats1 hide();
				wait randomint(3);
				plats1 solid();
				plats1 show();
				plats2 notsolid();
				plats2 hide();
				wait randomint(3);
				plats2 show();
				plats2 solid();
				break;

			case 1:
				plats1 delete();
				break;

			case 2:
				plats2 delete();
				break;
		}
	}
}

platmove()
{
	for(;;)
	{
		self moveZ(32, 2);
		self waittill("movedone");
		self moveZ(-32, 2);
		self waittill("movedone");
		self moveZ(-32, 2);
		self waittill("movedone");
		self moveZ(32, 2);
		self waittill("movedone");
	}
}

trap13()
{
	blocks = getent("blocks","targetname");
	level endon("trigger");
	plats13 = getent("plats13","targetname");
	trig = getent("trap13trig","targetname");
	trig sethintstring("Press [F] To Activate!");
	trig waittill("trigger", player );
	{
		trig delete();
		x = randomint(2);
		if (x == 1)
		{
			blocks hide();
			blocks notsolid();
			wait randomint(10);
			blocks show();
			blocks solid();
		}
		else
			plats13 hide();
			plats13 notsolid();
			wait randomint(10);
			plats13 show();
			plats13 solid();
	}
}

trap14()
{
	movingwall = getent("movingwall","targetname");
	level endon("trigger");
	movingwall thread movingwall_move();
	trig = getent("trap14trig","targetname");
	trig sethintstring("Press [F] To Activate!");
	trig waittill("trigger", player );
	{
		trig sethintstring("Moving wall is not solid");
		movingwall notsolid();
		wait 10;
		movingwall solid();
		trig delete();
	}
}

movingwall_move()
{
	for(;;)
	{
	self moveY(64, 1);
	self waittill("movedone");
	self moveY(-64, 1);
	self waittill("movedone");
	self moveY(-64, 1);
	self waittill("movedone");
	self moveY(64, 1);
	self waittill("movedone");
	}
}

trap15()
{
	trig = getent("trap15trig","targetname");
	level endon("trigger");
	trig sethintstring("Press [F] To Activate!");
	trig waittill("trigger" ,player );
	for(i=1;i<=6;i++)
	{
		thread cilinders(i);
	}
	trig delete();
}

cilinders(index)
{
	ciliders = getent("cilinder_"+index,"targetname");
	for(;;)
	{
		spin = randomint(360);
		time = randomint(5);

		ciliders rotateyaw(spin, time);
		wait time+1;
	}
}

trap16()
{
	wall = getent("trap16","targetname");
	level endon("trigger");
	killtrig = getent("wallkilltrig","targetname");
	trig = getent("trap16trig","targetname");
	trig sethintstring("Press [F] To Activate!");
	trig waittill("trigger", player );
	{
		trig delete();
		killtrig enablelinkto();
		killtrig linkto(wall);
		wall moveX(256, 2, 1);
		wait 3+randomint(2);
		wall moveX(-256, 2, 1);
	}
}

trap17()
{
	objects = getent("airblocks","targetname");
	level endon("trigger");
	trig = getent("trap17trig","targetname");
	trig sethintstring("Press [F] To Activate!");
	trig waittill("trigger", player );
	{
		trig delete();
		for(;;)
		{
			time = randomint(5);
			objects rotateYaw(360, time);
			wait time+2;
		}
	}
}

trap18()
{
	trap18 = getent("trap18","targetname");
	level endon("trigger");
	trig = getent("trap18trig","targetname");
	trig sethintstring("Press [F] To Activate!");
	trig waittill("trigger", player );
	{
		trig delete();

		trap18 rotateyaw(360, 3);
		wait randomint(3)+4;
		trap18 rotateyaw(-360, 3);
		wait 3;
	}
}

trap19()
{
	spikes1 = getent("spikes1","targetname");
	level endon("trigger");
	spikes2 = getent("spikes2","targetname");
	spikekill1 = getent("spikekill1","targetname");
	spikekill2 = getent("spikekill2","targetname");
	trig = getent("trap19trig","targetname");
	trig sethintstring("Press [F] To Activate!");
	trig waittill("trigger", player);
	spikekill1 enablelinkto();
	spikekill1 linkto(spikes1);
	spikekill2 enablelinkto();
	spikekill2 linkto(spikes2);
	{
		trig delete();
		x = randomint(3);
		switch(x)
		{
			case 0:
			spikes1 moveZ(56, 0.5);
			wait 2;
			spikes1 moveZ(-56, 1,0.5);
			break;

			case 1:
			spikes2 moveZ(56, 0.5);
			wait 2;
			spikes2 moveZ(-56, 1,0.5);
			break;

			case 2:
			spikes1 moveZ(56, 0.5);
			spikes2 moveZ(56, 0.5);
			wait 2;
			spikes1 moveZ(-56, 1,0.5);
			spikes2 moveZ(-56, 1,0.5);
			break;
		}

	}
}

trap20()
{
	blocks1 = getent("trap20_1","targetname");
	level endon("trigger");
	block2 = getent("trap20_2","targetname");
	trig = getent("trap20trig","targetname");
	trig sethintstring("Press [F] To Activate!");
	trig waittill("trigger", player );
	{
		trig delete();
		x = randomint(3);
		switch(x)
		{
			case 0:
				for(;;)
				{
					blocks1 rotateyaw(360, 3);
					blocks1 waittill("movedone");
				}
				break;

			case 1:
				blocks1 notsolid();
				blocks1 hide();
				wait randomint(10);
				blocks1 solid();
				blocks1 show();
				break;
			case 2:
			block2 delete();
			break;
		}
	}
}

