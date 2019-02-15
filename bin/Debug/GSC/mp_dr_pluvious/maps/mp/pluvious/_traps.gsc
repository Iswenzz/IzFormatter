main()
{	
	thread trap1();
	thread trap2();
	thread trap3();
	thread trap3Help();
	thread trap4();
	thread trap5();
	thread trap6();
	thread trap7();
	
	addTriggerToList("trig_trap_one");
	addTriggerToList("trig_trap_two");
	addTriggerToList("trig_trap_three");
	addTriggerToList("trig_trap_four");
	addTriggerToList("trig_trap_five");
	addTriggerToList("trig_trap_six");
	addTriggerToList("trig_trap_seven");
}

trap1()
{
	brush = getEnt("trap_one", "targetname");
	trigger = getEnt("trig_trap_one", "targetname");
	trigger setHintString("Press ^3&&1^7 to activate Trap #1.");
	trigger waittill("trigger");
	trigger delete();
	iPrintLn("^9Trap #1 has been activated.");
	for(;;)
	{
		brush rotateRoll(-360, 5);
		wait 5;
	}
}

trap2()
{
	brush = getEnt("trap_two", "targetname");
	trigger = getEnt("trig_trap_two", "targetname");
	trigger setHintString("Press ^3&&1^7 to activate Trap #2.");
	brush hide();
	trigger waittill("trigger");
	trigger delete();
	iPrintLn("^9Trap #2 has been activated.");
	brush show();
	for(;;)
	{
		brush rotateYaw(360, 1.5);
		_moveX(brush, 1056, 1.5);
		brush rotateYaw(360, 1.5);
		_moveX(brush, -1056, 1.5);
	}
}

trap3()
{
	brush = getEnt("trap_three", "targetname");
	trigger = getEnt("trig_trap_three", "targetname");
	trigger setHintString("Press ^3&&1^7 to activate Trap #3.");
	trigger waittill("trigger");
	trigger delete();
	iPrintLn("^9Trap #3 has been activated.");
	for(i = 1; i < 6; i++)
	{
		_moveX(brush, 511, 0.75);
		_moveX(brush, -511, 0.75);
		if(i == 5)
		{
			wait 0.5;
			_moveY(brush, 384, 0.5);
			wait 0.5;
			_moveY(brush, -384, 0.5);
			wait 0.5;
			i = 0;
		}
	}
}

trap3Help()
{
	for(;;)
	{
		brush = getEnt("trap_three_help", "targetname");
		trigger = getEnt("trig_trap_three_help", "targetname");
		trigger setHintString("Press ^3&&1^7 if you have difficulty with the bounce.");
		brush hide();
		brush notSolid();
		trigger waittill("trigger", user);
		user linkTo(brush);
		brush moveTo((512, 5440, 288), 7.5);
		brush waittill("movedone");
		user unlink();
		brush moveTo((968, 4360, 288), 0.005);
	}
}

trap4()
{
	brush = getEnt("trap_four", "targetname");
	hurt = getEnt("trap_four_hurt", "targetname");
	trigger = getEnt("trig_trap_four", "targetname");
	trigger setHintString("Press ^3&&1^7 to activate Trap #4.");
	brush hide();
	brush notSolid();
	hurt thread maps\mp\_utility::triggerOff();
	trigger waittill("trigger");
	trigger delete();
	iPrintLn("^9Trap #4 has been activated.");
	hurt thread maps\mp\_utility::triggerOn();
	hurt enableLinkTo(); 
	hurt linkTo(brush);
	for(i = 0; i < 5; i++)
	{
		brush show();
		brush solid();
		_moveZ(brush, -224, 0.5);
		brush hide();
		brush notSolid();
		_moveZ(brush, 224, 0.001);
		wait 0.5;
	}
	brush delete();
	hurt delete();
}

trap5()
{
	brush1 = getEnt("trap_five_1", "targetname");
	brush2 = getEnt("trap_five_2", "targetname");
	brush3 = getEnt("trap_five_3", "targetname");
	hurt1 = getEnt("trap_five_hurt_1", "targetname");
	hurt2 = getEnt("trap_five_hurt_2", "targetname");
	trigger = getEnt("trig_trap_five", "targetname");
	trigger setHintString("Press ^3&&1^7 to activate Trap #5.");
	hurt1 thread maps\mp\_utility::triggerOff();
	hurt2 thread maps\mp\_utility::triggerOff();
	brush2 hide();
	brush2 notSolid();
	brush3 hide();
	brush3 notSolid();
	trigger waittill("trigger");
	trigger delete();
	iPrintLn("^9Trap #5 has been activated.");
	hurt1 thread maps\mp\_utility::triggerOn();
	hurt2 thread maps\mp\_utility::triggerOn();
	hurt1 enableLinkTo();
	hurt1 linkTo(brush2);
	hurt2 enableLinkTo();
	hurt2 linkTo(brush3);
	_moveZ(brush1, 288, 0.5);
	brush2 show();
	brush2 solid();
	_moveX(brush2, 1072, 1.75);
	_moveX(brush2, -1072, 1.75);
	brush2 delete();
	hurt1 delete();
	brush3 show();
	brush3 solid();
	_moveZ(brush3, -320, 1);
	wait 0.25;
	_moveZ(brush3, 320, 1);
	brush3 delete();
	hurt2 delete();
	wait 0.5;
	_moveZ(brush1, -288, 0.5);
	brush1 delete();
}

trap6()
{
	brush1 = getEnt("trap_six_1", "targetname");
	brush2 = getEnt("trap_six_2", "targetname");
	trigger = getEnt("trig_trap_six", "targetname");
	trigger setHintString("Press ^3&&1^7 to activate Trap #6.");
	trigger waittill("trigger");
	trigger delete();
	iPrintLn("^9Trap #6 has been activated.");
	brush1 rotatePitch(90, 1);
	brush2 rotatePitch(-90, 1);
	wait 2;
	brush1 rotatePitch(-90, 1);
	brush2 rotatePitch(90, 1);
	wait 2;
	for(;;)
	{
		brush1 rotatePitch(90, 1);
		wait 2;
		brush1 rotatePitch(-90, 1);
		brush2 rotatePitch(-90, 1);
		wait 2;
		brush2 rotatePitch(90, 1);
	}
}

trap7()
{
	brush = getEntArray("trap_seven", "targetname");
	trigger = getEnt("trig_trap_seven", "targetname");
	trigger setHintString("Press ^3&&1^7 to activate Trap #7.");
	trigger waittill("trigger");
	trigger delete();
	iPrintLn("^9Trap #7 has been activated.");
	for(i = 0; i < brush.size; i++)
	{
		brush[i] thread trap7Rotate();
	}
}

trap7Rotate()
{
	for(;;)
	{
		self rotateYaw(540, 1.5);
		wait 2;
		self rotateyaw(-540, 1.5);
		wait 2;
	}
}

addTriggerToList(name)
{
	if(!isDefined(level.trapTriggers))
	level.trapTriggers = [];
	level.trapTriggers[level.trapTriggers.size] = getEnt(name, "targetname");
}

_moveX(entity, distance, time)
{
	entity moveX(distance, time); entity waittill("movedone");
}

_moveY(entity, distance, time)
{
	entity moveY(distance, time); entity waittill("movedone");
}

_moveZ(entity, distance, time)
{
	entity moveZ(distance, time); entity waittill("movedone");
}