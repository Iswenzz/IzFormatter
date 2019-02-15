main()
{
	thread toshiptele();
	thread ship();
	thread mover1();
	thread mover2();
	thread mover3();
	thread mover4();
	thread mover5();
	thread mover6();
	thread mover7();
	thread mover8();
	thread spec_endroom();
}

toshiptele()
{
	trig = getent("toshiptele","targetname");
	spot = getent("toshiptele_origin","targetname");
	trig waittill("trigger", player );
	{
		trig delete();
		player setorigin(spot.origin);
	}
}

ship()
{
	level.ship = getent("ship","targetname");
	trig = getent("startship","targetname");
	spot = getent("ship_spot1","targetname");
	wall = getent("triggerwall","targetname");
	trig waittill("trigger", player );
	{
		trig delete();
		wall notsolid();
		level.ship moveto(spot.origin, 1.5);
		level.ship rotateto(spot.angles, 1.5);
		wait 1.5;
		wall solid();
	}
}

mover1()
{
	trig = getent("mover1trig","targetname");
	spot = getent("mover1origin","targetname");
	trig sethintstring("Press [F] To Move!");
	trig waittill("trigger", player );
	{
		trig delete();
		player freezecontrols(true);
		level.ship moveto(spot.origin, 1.5);
		level.ship rotateto(spot.angles, 1.5);
		wait 1.5;
		player freezecontrols(false);
	}
}

mover2()
{
	trig = getent("mover2trig","targetname");
	spot = getent("mover2origin","targetname");
	trig sethintstring("Press [F] To Move!");
	trig waittill("trigger", player );
	{
		trig delete();
		player freezecontrols(true);
		level.ship moveto(spot.origin, 1.5);
		level.ship rotateto(spot.angles, 1.5);
		wait 1.5;
		player freezecontrols(false);
	}
}

mover3()
{
	trig = getent("mover3trig","targetname");
	spot = getent("mover3origin","targetname");
	trig sethintstring("Press [F] To Move!");
	trig waittill("trigger", player );
	{
		trig delete();
		player freezecontrols(true);
		level.ship moveto(spot.origin, 1.5);
		level.ship rotateto(spot.angles, 1.5);
		wait 1.5;
		player freezecontrols(false);
	}
}

mover4()
{
	trig = getent("mover4trig","targetname");
	spot = getent("mover4origin","targetname");
	trig sethintstring("Press [F] To Move!");
	trig waittill("trigger", player );
	{
		trig delete();
		player freezecontrols(true);
		level.ship moveto(spot.origin, 1.5);
		level.ship rotateto(spot.angles, 1.5);
		wait 1.5;
		player freezecontrols(false);
	}
}

mover5()
{
	trig = getent("mover5trig","targetname");
	spot = getent("mover5origin","targetname");
	trig sethintstring("Press [F] To Move!");
	trig waittill("trigger", player );
	{
		trig delete();
		player freezecontrols(true);
		level.ship moveto(spot.origin, 1.5);
		level.ship rotateto(spot.angles, 1.5);
		wait 1.5;
		player freezecontrols(false);
	}
}

mover6()
{
	trig = getent("mover6trig","targetname");
	spot = getent("mover6origin","targetname");
	trig sethintstring("Press [F] To Move!");
	trig waittill("trigger", player );
	{
		trig delete();
		player freezecontrols(true);
		level.ship moveto(spot.origin, 1.5);
		level.ship rotateto(spot.angles, 1.5);
		wait 1.5;
		player freezecontrols(false);
	}
}

mover7()
{
	trig = getent("mover7trig","targetname");
	spot = getent("mover7origin","targetname");
	trig sethintstring("Press [F] To Move!");
	trig waittill("trigger", player );
	{
		trig delete();
		player freezecontrols(true);
		level.ship moveto(spot.origin, 1.5);
		level.ship rotateto(spot.angles, 1.5);
		wait 1.5;
		player freezecontrols(false);
	}
}

mover8()
{
	trig = getent("mover8trig","targetname");
	spot = getent("mover8origin","targetname");
	trig sethintstring("Press [F] To Move!");
	trig waittill("trigger", player );
	{
		trig delete();
		player freezecontrols(true);
		level.ship moveto(spot.origin, 1.5);
		level.ship rotateto(spot.angles, 1.5);
		wait 1.5;
		player freezecontrols(false);
	}
}

spec_endroom()
{
	trig = getent("spec_endroom_trig","targetname");
	spot = getent("spec_endroom_origin","targetname");
	trig sethintstring("Press [F] To Teleport!");
	trig waittill("trigger", player );
	{
		trig delete();
		player setorigin(spot.origin);
		wait 1;
		level.ship delete();
	}
}

