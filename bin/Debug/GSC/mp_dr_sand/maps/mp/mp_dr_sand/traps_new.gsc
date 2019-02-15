main()
{
	thread trap1();
		level.sand_trap1 = loadFX("mp_dr_sand/sand_trap1");
		level.smoke_trap1 = loadFX("mp_dr_sand/smoke_trap1");
		level.fire_trap1 = loadFX("mp_dr_sand/fire_trap1");
		level.water_trap1 = loadFX("mp_dr_sand/water_trap1");
	thread trap2();
		level.fire_trap2 = loadFX("mp_dr_sand/fire_trap2");
		level.fire2_trap2 = loadFX("mp_dr_sand/fire2_trap2");
		level.fire3_trap2 = loadFX("mp_dr_sand/fire3_trap2");
		level.fire4_trap2 = loadFX("mp_dr_sand/fire4_trap2");
	thread trap3();
		level.explo_trap3 = loadFX("mp_dr_sand/explo_trap3");
	thread trap4();
	thread trap5();
	
	addTriggerToList("trap1_trig");
	addTriggerToList("trap1_but_trig");
	addTriggerToList("trap2_trig");
	addTriggerToList("trap3_trig");
	addTriggerToList("trap4_trig");
	addTriggerToList("trap5_trig");
}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

flote(objet)
{
	while(1)
	{
		objet moveZ(-10,4,.5,.5);
		wait 4;
		objet moveZ(10,4,.5,.5);
		wait 4;
	}
}

trap1()
{
	pelle1=getent("trap1_brush1","targetname");
	pelle2=getent("trap1_brush2","targetname");
	sable=getent("trap1_brush4","targetname");
	trig=getent("trap1_trig","targetname");
	ori=getent("trap1_ori","targetname");
	ori2=getent("trap1_ori2","targetname");
	brush=getent("trap1_dmg1","targetname");
	dmg=getent("trap1_dmg2","targetname");
	brush2=getent("trap1_button","targetname");
	trig2=getent("trap1_but_trig","targetname");
	
	dmg enablelinkto();
	dmg linkto(brush);
	trig2 enablelinkto();
	trig2 linkto(brush2);
	

	
	trig SetHintString("^3[USE]");
	trig2 SetHintString("^3[USE]");
	
	wait 1;
	
	sable hide();
	sable MoveZ(-96, 1);
	brush hide();
	brush2 moveZ(-70,1);
	
/* AUTO 	trig waittill("trigger", player);
	trig delete();
	
	pelle1 Rotateroll(45, 2, 0.5, 0.5);
	pelle2 Rotateroll(-45, 2, 0.5, 0.5);
	wait .5;
	
	fx = playfx(level.sand_trap1, ori.origin);
	wait .5;
	
	brush moveZ(-448,2);
	wait 1.5;
	
	fx = playfx(level.smoke_trap1, ori2.origin);
	wait .5;
	fire = spawnfx(level.fire_trap1, ori2.origin);
	triggerfx(fire);
	sable show();
	sable moveZ(96,2,0,1.5);
	wait 5;
	
	brush2 moveZ(70,2,0,.5);
	
	trig2 waittill("trigger", player);
		trig2 delete();
		fx = playfx(level.water_trap1, ori.origin);
		wait 2.5;
		
		fx = playfx(level.smoke_trap1, ori2.origin);
		dmg delete();
		
		wait .5;
		fire delete();
		
	
*/}

trap2()
{
	ori1=getent("trap2_ori1","targetname");
	ori2=getent("trap2_ori2","targetname");
	ori3=getent("trap2_ori3","targetname");
	ori4=getent("trap2_ori4","targetname");
	trig=getent("trap2_trig","targetname");
	brush=getent("trap2_dmg","targetname");
	dmg1=getent("trap2_dmg1","targetname");
	dmg2=getent("trap2_dmg2","targetname");
	dmg3=getent("trap2_dmg3","targetname");
	dmg4=getent("trap2_dmg4","targetname");
	
	brush hide();
	
	dmg1 enablelinkto();
	dmg1 linkto(brush);
	dmg2 enablelinkto();
	dmg2 linkto(brush);
	dmg3 enablelinkto();
	dmg3 linkto(brush);
	dmg4 enablelinkto();
	dmg4 linkto(brush);
	
	brush moveZ(500,1);
	
	trig SetHintString("^3[USE]");
/* AUTO 	trig waittill("trigger");
	trig delete();
	
	brush moveZ(-500,.1);
	
	fire1 = spawnfx(level.fire_trap2, ori1.origin);
	triggerfx(fire1);
	
	fire2 = spawnfx(level.fire2_trap2, ori2.origin);
	triggerfx(fire2);
	
	fire3 = spawnfx(level.fire3_trap2, ori3.origin);
	triggerfx(fire3);
	
	fire4 = spawnfx(level.fire4_trap2, ori4.origin);
	triggerfx(fire4);
	
	wait 10;
	
	fire1 delete();
	fire2 delete();
	fire3 delete();
	fire4 delete();
	
	dmg1 delete();
	dmg2 delete();
	dmg3 delete();
	dmg4 delete();
*/}

trap3()
{
	c4=getent("trap3_c4","targetname");
	c42=getent("trap3_c42","targetname");
	c43=getent("trap3_c43","targetname");
	c44=getent("trap3_c44","targetname");
	c45=getent("trap3_c45","targetname");
	c46=getent("trap3_c46","targetname");
	c47=getent("trap3_c47","targetname");
	c48=getent("trap3_c48","targetname");
	c49=getent("trap3_c49","targetname");
	c5=getent("trap3_c5","targetname");
	trig=getent("trap3_trig","targetname");
	brush1=getent("trap3_brush1","targetname");
	brush2=getent("trap3_brush2","targetname");
	brush3=getent("trap3_brush3","targetname");
	brush4=getent("trap3_brush4","targetname");
	ori=getent("trap3_ori","targetname");
	ori2=getent("trap3_ori2","targetname");
	dmg=getent("trap3_dmg","targetname");
	dmg2=getent("trap3_dmg2","targetname");
	
	dmg2 hide();
	dmg enablelinkto();
	dmg linkto(dmg2);
	dmg2 moveZ(1000,1);
	
	trig SetHintString("^3[USE]");
/* AUTO 	trig waittill("trigger");
	trig delete();
	
	dmg2 moveZ(-1000,1);
	fx = playfx(level.explo_trap3, ori.origin);
	fx = playfx(level.explo_trap3, ori2.origin);
	
	{
		c4 delete();
		c42 delete();
		c43 delete();
		c44 delete();
		c45 delete();
		c46 delete();
		c47 delete();
		c48 delete();
		c49 delete();
		c5 delete();
	}
	
	brush1 delete();
	brush2 rotatePitch(-10,2,0,.5);
	brush2 moveX(-50,5,0,2);
	brush2 moveY(-20,5,0,2);
	brush3 moveY(-20,5,0,2);
	wait 3;
	dmg2 delete();
	dmg delete();
	wait 2;
	thread flote(brush4);
	wait 1;
	thread flote(brush2);
	wait .5;
	thread flote(brush3);
*/}

trap4()
{
	trig=getent("trap4_trig","targetname");
	brush=getent("trap4_brush","targetname");
	
	trig SetHintString("^3[USE]");
/* AUTO 	trig waittill("trigger");
	trig delete();
	
	brush moveZ(-224,4,0,2);
	wait 8;
	brush moveZ(224,4,0,2);
*/}

trap5()
{
	trig=getent("trap5_trig","targetname");
	brush1=getent("trap5_brush1","targetname");
	brush2=getent("trap5_brush2","targetname");
	
	trig SetHintString("^3[USE]");
/* AUTO 	trig waittill("trigger");
	trig delete();
	
	brush1 moveY(-176,1,0,.5);
	brush1 RotateYaw(-45,1,0,.5);
	brush2 moveY(80,1,0,.5);
	brush2 RotateYaw(45,1,0,.5);
	
	wait 7;
	
	brush1 moveY(176,1,0,.5);
	brush1 RotateYaw(45,1,0,.5);
	brush2 moveY(-80,1,0,.5);
	brush2 RotateYaw(-45,1,0,.5);
*/}

