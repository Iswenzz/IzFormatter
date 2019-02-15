main()
{
    maps\mp\_load::main();
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
 
    game["allies"] = "sas";
    game["axis"] = "opfor";
    game["attackers"] = "axis";
    game["defenders"] = "allies";
    game["allies_soldiertype"] = "woodland";
    game["axis_soldiertype"] = "woodland";

	//Dvars//
	setDvar("bg_falldamagemaxheight", 20000 );
	setDvar("bg_falldamageminheight", 10000 );
	
	//Pre-Cache//
	precacheItem("rpg_mp");
	
//AUTO 	//Music//
//AUTO 	if(!isdefined(level.music))
//AUTO     level.music=[];
//AUTO     level.music[0]["song"]    ="Minephuck - Zombie Juice";
//AUTO     level.music[0]["alias"]    ="song1";
//AUTO     level.music[1]["song"]    ="The Best - Giggs";
//AUTO     level.music[1]["alias"]    ="song2";
//AUTO     level.music[2]["song"]    ="Domo 23 - Tyler the Creator";
//AUTO     level.music[2]["alias"]    ="song3";
//AUTO     level.music[3]["song"]    ="Pattern Up Properly - Wiley";
//AUTO     level.music[3]["alias"]    ="song4";
//AUTO     level.music[4]["song"]    ="Bounce Back - Big Sean";
//AUTO     level.music[4]["alias"]    ="song5";
	
	//Fx//
	level._effect["Fire"] = loadfx("fire/ground_fire_small_oneshot");
	level._effect["explo"] = loadfx("explosions/small_vehicle_explosion");
	level._effect["casing"] = loadfx("shellejects/20mm_mp");
	level._effect["gunsmoke"] = loadfx("smoke/cigarsmoke_puff_far");
//AUTO 	level._effect["gunfire"] = loadfx("muzzleflashes/ak47_flash_view");
	level._effect["bullet"] = loadfx("impacts/20mm_concrete_impact");
	level._effect["VC"] = loadfx("custom/spawnfx");
	level._effect["Fire2"] = loadfx("fire/tank_fire_turret_small");
	
	//Fx Threads//
	thread Trap4fx();
	thread Trap9fx();
	thread Trap12fx();
	
	//Globals//
	level.trig11a = getEnt("triga_trap11", "targetname");
	level.trig11b = getEnt("trigb_trap11", "targetname");
	level.brush11 = getEnt("brush_trap11", "targetname");
	level.trig11a enableLinkTo();
	level.trig11b enableLinkTo();
	level.trig11a linkTo(level.brush11);
	level.trig11b linkTo(level.brush11);
	level.trap12_speed = 1;
	
	//General Threads//
	thread Logo();
	thread FirstTele();
	thread SecondTele();
	thread StartDoor();
	thread FirstTeleActi();
	thread SecondTeleActi();
//AUTO 	thread SecretBounce();
	thread SecretRpg();
	thread SecretXp();
//AUTO 	thread Bouncer();
	thread SecondFloorText();
	thread ThirdFloorText();
	thread EndText();
//AUTO 	thread musicBox();
	
	//Traps//
	thread Trap1();
	thread Trap2();
	thread Trap3();
	thread Trap4();
	thread Trap5();
	thread Trap6();
	thread Trap7();
	thread Trap8();
	thread Trap9();
	thread Trap10();
	thread Trap11();
//AUTO 	thread Trap11Bounce1();
//AUTO 	thread Trap11Bounce2();
	thread Trap12();
	thread Trap12b();
	thread OtherTraps();
	thread GapFall();
	
//AUTO 	//Endrooms//
//AUTO 	thread Endrooms();
//AUTO 	thread EndroomLetters();
//AUTO 	thread SniperRoom();
//AUTO 	thread KnifeRoom();
//AUTO 	thread JumpRoom();
//AUTO 	thread JumpRoomFall1();
//AUTO 	thread JumpRoomFall2();
//AUTO 	thread JumpRoomWeapon();
	
	//Trigger-list//
	addTriggerToList("trig_trap1");
	addTriggerToList("trig_trap2");
	addTriggerToList("trig_trap3");
	addTriggerToList("trig_trap4");
	addTriggerToList("trig_trap5");
	addTriggerToList("trig_trap6");
	addTriggerToList("trig_trap7");
	addTriggerToList("trig_trap8");
	addTriggerToList("trig_trap9");
	addTriggerToList("trig_trap10");
	addTriggerToList("trig_trap11");
	addTriggerToList("trig_trap12");
	}

 addTriggerToList(name)
{
    if(!isDefined(level.trapTriggers))
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt(name,"targetname");
}

 Trap1()
 {
	level.button_trap1 = getEnt("button_trap1","targetname");
	level endon("trigger");
	level.fx_trap1 = getEnt("origin_trap1", "targetname");
	trig = getEnt("trig_trap1","targetname");
	trig setHintString("^1 Press &&1 to Remove Plat!");
	level.trig_trap1 = getEnt("trigb_trap1", "targetname");
	brush = getEnt("brush_trap1", "targetname");
	
	trig waittill("trigger", player);
	
	playfx(level._effect["Fire"],level.fx_trap1.origin);
	brush delete();
	level.button_trap1 moveZ(-12, 0.5);
	
	for(i=3;i>0;i--)
	{
		trig setHintString("^1Wait: ^7" + i + "^1!");
		wait 1; 
	}
	trig delete();
	level.button_trap1 moveZ(12, 0.5);
	thread Trap1b();
 }

Trap1b()
{
	brush = getEnt("brushb_trap1","targetname");
	level endon("trigger");
	level.trig_trap1 setHintString("^1 Press &&1 to Move the Platforms!");
	level.trig_trap1 enableLinkTo();
	level.trig_trap1 linkTo(brush);
	brush notSolid();
	brush2 = getEnt("brush2_trap1","targetname");
	brush3 = getEnt("brush3_trap1","targetname");
	brush moveZ(64,0.1);
	
	level.trig_trap1 waittill("trigger", player);
	
	level.button_trap1 moveZ(-12, 0.5);
	playfx(level._effect["Fire"],level.fx_trap1.origin);
	
	while(1)
	{
		brush2 moveZ(50,1);
		brush3 moveZ(-50,1);
		wait 1;
		brush2 moveZ(-100,2);
		brush3 moveZ(100,2);
		wait 2;
		brush2 moveZ(50,1);
		brush3 moveZ(-50,1);
		wait 1;
	}

}

 Trap2()
 {
	button = getEnt("button_trap2","targetname");
	level endon("trigger");
	fx = getEnt("origin_trap2", "targetname");
	trig = getEnt("trig_trap2","targetname");
	trig setHintString("^1 Press &&1 to Crush Jumpers!");
	brush = getEnt("brush_trap2", "targetname");
	hurt = getEnt("hurt_trap2a","targetname");
	hurt2 = getEnt("hurt_trap2b","targetname");
 
	hurt enableLinkTo();
	hurt2 enableLinkTo();
	hurt linkTo(brush);
	hurt2 linkTo(brush);
	
	trig waittill("trigger", player);
	trig delete();
	
	playfx(level._effect["Fire"],fx.origin);
	button moveZ(-12, 0.5);
	
	brush rotateYaw(-90, 2);
	wait 5;
	brush rotateYaw(90, 2);
	wait 2;
 
 }

 Trap3()
 {
	button = getEnt("button_trap3","targetname");
	level endon("trigger");
	fx = getEnt("origin_trap3", "targetname");
	trig = getEnt("trig_trap3","targetname");
	trig setHintString("^1 Press &&1 to Spin Plat!");
	brush = getEnt("brush_trap3", "targetname");

	trig waittill("trigger", player);
	trig delete();
 
	playfx(level._effect["Fire"],fx.origin);
	button moveZ(-12, 0.5);
 
	while(1)
	{
	brush rotateRoll(360, 5);
	wait 5;
	}
 }

 Trap4()
 {
	button = getEnt("button_trap4","targetname");
	level endon("trigger");
	fx = getEnt("origin_trap4", "targetname");
	trig = getEnt("trig_trap4","targetname");
	trig setHintString("^1 Press &&1 to Remove Ladder and Bounce Section!");
	brush = getEnt("brush_trap4", "targetname");
	brush2 = getEnt("brush_trap4a", "targetname");
	brush3 = getEnt("brush_trap4b", "targetname");

	trig waittill("trigger", player);
	trig delete();
	
	rand = randomInt(2); 
	
	if (rand == 1){
		brush2 delete();
		}
	else if(rand == 0){
		brush3 delete();
		}
	
	
	playfx(level._effect["Fire"],fx.origin);
	button moveZ(-12, 0.5);
	brush delete();
 }

 Trap4fx()
 {
	fx1 = getEnt("fx_trap4a", "targetname");
	fx2 = getEnt("fx_trap4b", "targetname");
	fx3 = getEnt("fx_trap4c", "targetname");
	fx4 = getEnt("fx_trap4d", "targetname");
	fx5 = getEnt("fx_trap4e", "targetname");
	fx6 = getEnt("fx_trap4f", "targetname");
	fx7 = getEnt("fx_trap4g", "targetname");
	fx8 = getEnt("fx_trap4h", "targetname");
 
	while(1)
	{
		playfx(level._effect["Fire2"],fx1.origin);
		wait 1;
		playfx(level._effect["Fire2"],fx2.origin);
		wait 1;
		playfx(level._effect["Fire2"],fx3.origin);
		wait 1;
		playfx(level._effect["Fire2"],fx4.origin);
		wait 1;
		playfx(level._effect["Fire2"],fx5.origin);
		wait 1;
		playfx(level._effect["Fire2"],fx6.origin);
		wait 1;
		playfx(level._effect["Fire2"],fx7.origin);
		wait 1;
		playfx(level._effect["Fire2"],fx8.origin);
		wait 1;
	}
 
 }

  Trap5()
 {
	button = getEnt("button_trap5","targetname");
	level endon("trigger");
	fx = getEnt("origin_trap5", "targetname");
	trig = getEnt("trig_trap5","targetname");
	trig setHintString("^1 Press &&1 to Go BOOM!");
	
	brush1 = getEnt("brush_trap5a", "targetname");
	brush2 = getEnt("brush_trap5b", "targetname");
	brush3 = getEnt("brush_trap5c", "targetname");
	brush4 = getEnt("brush_trap5d", "targetname");
	brush5 = getEnt("brush_trap5e", "targetname");
	
	fx_point1 = getEnt ("origin_trap5a", "targetname"); 
	fx_point2 = getEnt ("origin_trap5b", "targetname");
	fx_point3 = getEnt ("origin_trap5c", "targetname");
	fx_point4 = getEnt ("origin_trap5d", "targetname");
	fx_point5 = getEnt ("origin_trap5e", "targetname");

	trig waittill("trigger", player);
	trig delete();
	
	playfx(level._effect["Fire"],fx.origin);
	button moveZ(-12, 0.5);
	brush1 delete();
	brush2 delete();
	brush3 delete();
	brush4 delete();
	brush5 delete();
	
	playfx(level._effect["explo"],fx_point1.origin);
	playfx(level._effect["explo"],fx_point2.origin);
	playfx(level._effect["explo"],fx_point3.origin);
	playfx(level._effect["explo"],fx_point4.origin);
	playfx(level._effect["explo"],fx_point5.origin);
	
	earthquake(1,1,fx_point1.origin,50);
	earthquake(1,1,fx_point2.origin,50);
	earthquake(1,1,fx_point3.origin,50);
	earthquake(1,1,fx_point4.origin,50);
	earthquake(1,1,fx_point5.origin,50);
	
	p = getEntArray("player","classname");
	for(i=0;i<p.size;i++)
	{
		dist1 = distance(p[i].origin,fx_point1.origin);
		dist2 = distance(p[i].origin,fx_point2.origin);
		dist3 = distance(p[i].origin,fx_point3.origin);
		dist4 = distance(p[i].origin,fx_point4.origin);
		dist5 = distance(p[i].origin,fx_point5.origin);
		
		if ((dist1<100) || (dist2<100) || (dist3<100) || (dist4<100) || (dist5<100) )
			p[i] suicide();
		else if ((dist1<150) || (dist2<150) || (dist3<150) || (dist4<150) || (dist5<150))
			radiusDamage(p[i].origin,10,40,20);
		else if ((dist1<200) || (dist2<200) || (dist3<200) || (dist4<200) || (dist5<200))
			radiusDamage(p[i].origin,10,20,10);
	}
	
 }

 Trap6() 
{
	trig = getEnt("trig_trap6","targetname");
	level endon("trigger");
	trig setHintString("^1 Press &&1 to Block One of the Doorways!");
	fx = getEnt("origin_trap6", "targetname");
	button = getEnt("button_trap6","targetname");
	death1 = getEnt("trig_trap6a","targetname");
	death2 = getEnt("trig_trap6b","targetname");
	
	brush1 = getEnt("brush_trap6a","targetname");
	brush2 = getEnt("brush_trap6b","targetname");
	
	brush1 notSolid();
	brush2 notSolid();
	
	death1 enableLinkTo();
	death2 enableLinkTo();
	death1 linkTo(brush2);
	death2 linkTo(brush1);
	
	rand = randomInt(2);;
	
	trig waittill("trigger", player);
	trig delete();
	
	playfx(level._effect["Fire"],fx.origin);
	button moveZ(-12, 0.5);
	
	if(rand == 0){
		brush1 moveZ(-160,0.1);
		wait 0.1;}
	else if(rand ==1){
		brush2 moveZ(-160,0.1);
		wait 0.1;}
 }

 Trap7()
 {
 
	level endon("trigger");
	button = getEnt("button_trap7","targetname");
	fx = getEnt("origin_trap7", "targetname");
	trig = getEnt("trig_trap7","targetname");
	trig setHintString("^1 Press &&1 to Spin!");
	brush = getEnt("brush_trap7","targetname");
 
	hurt1 = getEnt("hurt_trap7a","targetname");
	hurt2 = getEnt("hurt_trap7b","targetname");

	hurt1 enableLinkTo();
	hurt2 enableLinkTo();
	hurt1 linkTo(brush);
	hurt2 linkTo(brush);
 
	trig waittill("trigger", player);
	trig delete();
	
	playfx(level._effect["Fire"],fx.origin);
	button moveZ(-12, 0.5);
	
	while(1){
	brush rotateYaw(360, 3);
	wait 3;
	}
 }

 Trap8()
 {
	fx1 = getEnt("fx1_trap8", "targetname");
	level endon("trigger");
	fx2 = getEnt("fx2_trap8", "targetname");
	fx3 = getEnt("fx3_trap8", "targetname");
	fx4 = getEnt("fx4_trap8", "targetname");
	fx5 = getEnt("fx5_trap8", "targetname");
	fx6 = getEnt("fx6_trap8", "targetname");
	fx7 = getEnt("fx7_trap8", "targetname");
	fx8 = getEnt("fx8_trap8", "targetname");
	fx9 = getEnt("fx9_trap8", "targetname");
	fx10 = getEnt("fx10_trap8", "targetname");
	fx11 = getEnt("fx11_trap8", "targetname");
	fx12 = getEnt("fx12_trap8", "targetname");
	fx13 = getEnt("fx13_trap8", "targetname");
	fx14 = getEnt("fx14_trap8", "targetname");
	fx15 = getEnt("fx15_trap8", "targetname");
	fx16 = getEnt("fx16_trap8", "targetname");
	fx17 = getEnt("fx17_trap8", "targetname");
	fx18 = getEnt("fx18_trap8", "targetname");
	fx19 = getEnt("fx19_trap8", "targetname");
	fx20 = getEnt("fx20_trap8", "targetname");
	fx21 = getEnt("fx21_trap8", "targetname");
	fx22 = getEnt("fx22_trap8", "targetname");
	//fx23 = getEnt("fx23_trap8", "targetname");
	fx24 = getEnt("fx24_trap8", "targetname");
	//fx25 = getEnt("fx25_trap8", "targetname");
	fx26 = getEnt("fx26_trap8", "targetname");
	//fx27 = getEnt("fx27_trap8", "targetname");
	fx28 = getEnt("fx28_trap8", "targetname");
	
	button = getEnt("button_trap8","targetname");
	fx = getEnt("origin_trap8", "targetname");
	trig = getEnt("trig_trap8","targetname");
	trig setHintString("^1 Press &&1 to Shoot!");
	brush = getEnt("brush_trap8","targetname");
	hurt = getEnt("hurt_trap8", "targetname");
 
	brush notSolid();
	hurt enableLinkTo();
	hurt linkTo(brush);
 
	trig waittill("trigger", player);
	trig delete();
	
	playfx(level._effect["Fire"],fx.origin);
	button moveZ(-12, 0.5);	
	brush moveZ(-84,0.1);
	
	for(i=0;i<35;i++){
		playfx(level._effect["casing"],fx1.origin);
		playfx(level._effect["gunsmoke"],fx2.origin);
		playfx(level._effect["gunfire"],fx3.origin);
		playfx(level._effect["bullet"],fx22.origin);
		playfx(level._effect["casing"],fx4.origin);
		playfx(level._effect["gunsmoke"],fx5.origin);
		playfx(level._effect["gunfire"],fx6.origin);
	//	playfx(level._effect["bullet"],fx23.origin);
		playfx(level._effect["casing"],fx7.origin);
		playfx(level._effect["gunsmoke"],fx8.origin);
		playfx(level._effect["gunfire"],fx9.origin);
		playfx(level._effect["bullet"],fx24.origin);
		playfx(level._effect["casing"],fx10.origin);
		playfx(level._effect["gunsmoke"],fx11.origin);
		playfx(level._effect["gunfire"],fx12.origin);
	//	playfx(level._effect["bullet"],fx25.origin);
		playfx(level._effect["casing"],fx13.origin);
		playfx(level._effect["gunsmoke"],fx14.origin);
		playfx(level._effect["gunfire"],fx15.origin);
		playfx(level._effect["bullet"],fx26.origin);
		playfx(level._effect["casing"],fx16.origin);
		playfx(level._effect["gunsmoke"],fx17.origin);
		playfx(level._effect["gunfire"],fx18.origin);
	//	playfx(level._effect["bullet"],fx27.origin);
		playfx(level._effect["casing"],fx19.origin);
		playfx(level._effect["gunsmoke"],fx20.origin);
		playfx(level._effect["gunfire"],fx21.origin);
		playfx(level._effect["bullet"],fx28.origin);
		wait 0.1;
	}
	
	brush moveZ(84,0.1);
 
 }

 Trap9()
 {
	button = getEnt("button_trap9","targetname");
	level endon("trigger");
	fx = getEnt("origin_trap9", "targetname");
	trig = getEnt("trig_trap9","targetname");
	trig setHintString("^1 Press &&1 to Spin!");
	brush = getEnt("brush_trap9","targetname");
 
	trig waittill("trigger", player);
	trig delete();
	
	playfx(level._effect["Fire"],fx.origin);
	button moveZ(-12, 0.5);	
 
	while(1)
	{
		brush rotatePitch(180,1);
		wait 1.5;
		brush rotatePitch(180,1);
		wait 1.5;
	}
 }

  Trap9fx()
 {
	fx1 = getEnt("fx_trap9a", "targetname");
	fx2 = getEnt("fx_trap9b", "targetname");
	fx3 = getEnt("fx_trap9c", "targetname");
	fx4 = getEnt("fx_trap9d", "targetname");
	fx5 = getEnt("fx_trap9e", "targetname");
	fx6 = getEnt("fx_trap9f", "targetname");
 
	while(1)
	{
		playfx(level._effect["Fire2"],fx1.origin);
		wait 1;
		playfx(level._effect["Fire2"],fx2.origin);
		wait 1;
		playfx(level._effect["Fire2"],fx3.origin);
		wait 1;
		playfx(level._effect["Fire2"],fx4.origin);
		wait 1;
		playfx(level._effect["Fire2"],fx5.origin);
		wait 1;
		playfx(level._effect["Fire2"],fx6.origin);
		wait 1;
	}
 }

 Trap10()
 {
	button = getEnt("button_trap10","targetname");
	level endon("trigger");
	fx = getEnt("origin_trap10", "targetname");
	trig = getEnt("trig_trap10","targetname");
	trig setHintString("^1 Press &&1 to Switch Exit!");
	brusha = getEnt("brusha_trap10","targetname");
	brushb = getEnt("brushb_trap10","targetname");
	
	triga = getEnt("triga_trap10","targetname");
	trigb = getEnt("trigb_trap10","targetname");
	trigc = getEnt("trigc_trap10","targetname");
	triga setHintString("^1 Door locked! Find the other exit!");
	trigb setHintString("^1 Door locked! Find the other exit!");
	trigc setHintString("^1Find the exit!");
	
	triga enableLinkTo();
	trigb enableLinkTo();
	triga linkTo(brusha);
	trigb linkTo(brushb);
 
	trig waittill("trigger", player);
	trig delete();
	
	playfx(level._effect["Fire"],fx.origin);
	button moveZ(-12, 0.5);	
	
	brusha moveZ(112,0.5);
	brushb moveZ(-112,0.5);
	wait 0.5;
 }

  Trap11()
 {
	button = getEnt("button_trap11","targetname");
	level endon("trigger");
	fx = getEnt("origin_trap11", "targetname");
	trig = getEnt("trig_trap11","targetname");
	trig setHintString("^1 Press &&1 to Bounce Jumpers!");
	thread Trap11hint();
	
	redlight = getEnt("brush_redlight_trap11", "targetname");
	greenlight = getEnt("brush_greenlight_trap11", "targetname");
	
	trig waittill("trigger", player);
	trig delete();
	
	playfx(level._effect["Fire"],fx.origin);
	button moveZ(-12, 0.5);	
	
	while(1)
	{
		redlight moveX(1,0.1);
		greenlight moveX(-1,0.1);
		level.brush11 moveZ(13,0.1);
		wait 2;
		redlight moveX(-1,0.1);
		greenlight moveX(1,0.1);
		level.brush11 moveZ(-13,0.1);
		wait 3;
	}
 }

 Trap11Hint()
 {
	hint = getEnt("hint_trap11","targetname");
	
	while(1)
	{
		hint setHintString("^1Red light = death");
		wait 1;
		hint setHintString("^2Greed light = survival");
		wait 1;
	}
 
 }

Trap11Bounce1()
{	
   while(1)
	level endon("trigger");
     {
		level.trig11a waittill ("trigger", player);
		 strength = 3;
		 for(i=0;i<strength;i++)
         {
           player.health += 160;
           player finishPlayerDamage(player, level.jumpattacker, 160, 0, "MOD_FALLING", "jump_mp", player.origin, AnglesToForward((-90,0,0)), "none", 0); //(210,0,0)
         }
    }
}

Trap11Bounce2()
{
   while(1)
	level endon("trigger");
     {
		level.trig11b waittill ("trigger", player);
		 strength = 3;
		 for(i=0;i<strength;i++)
         {
           player.health += 160;
           player finishPlayerDamage(player, level.jumpattacker, 160, 0, "MOD_FALLING", "jump_mp", player.origin, AnglesToForward((-90,0,0)), "none", 0); //(210,0,0)
         }
    }
}

Trap12()
 {
	button = getEnt("button_trap12","targetname");
	level endon("trigger");
	fx = getEnt("origin_trap12", "targetname");
	trig = getEnt("trig_trap12","targetname");
	trig setHintString("^1 Press &&1 to Increase Difficulty!");
	
	trig waittill("trigger", player);
	trig delete();

	playfx(level._effect["Fire"],fx.origin);
	button moveZ(-12, 0.5);	
	
	level.trap12_speed = 0.5;
	thread trap12c();
 }

Trap12b()
{

	brush1 = getEnt("brusha_trap12","targetname");
	brush2 = getEnt("brushb_trap12","targetname");
	brush3 = getEnt("brushc_trap12","targetname");
	hurt1 = getEnt("hurta_trap12","targetname");
	hurt2 = getEnt("hurtb_trap12","targetname");
	hurt3 = getEnt("hurtc_trap12","targetname");
	
	hurt1 enableLinkTo();
	hurt2 enableLinkTo();
	hurt3 enableLinkTo();
	hurt1 linkTo(brush1);
	hurt2 linkTo(brush2);
	hurt3 linkTo(brush3);
	
	while(1)
	{
		brush1 moveY(120,level.trap12_speed);
		wait 0.3;
		brush2 moveY(120,level.trap12_speed);
		wait 0.3;
		brush3 moveY(120,level.trap12_speed);
		wait 0.5;
		wait level.trap12_speeed;
		brush1 moveY(-120,level.trap12_speed);
		wait 0.3;
		brush2 moveY(-120,level.trap12_speed);
		wait 0.3;
		brush3 moveY(-120,level.trap12_speed);
		wait 0.5;
		wait level.trap12_speeed;
	}
}

Trap12c()
{
	brush1 = getEnt("brushd_trap12","targetname");
	brush2 = getEnt("brushe_trap12","targetname"); 
	
	while(1)
	{
		brush1 rotateYaw(360,1, 0.3, 0.3);
		brush2 rotateYaw(360,1, 0.3, 0.3);
		wait 2;
		brush1 rotateYaw(-360,1, 0.3, 0.3);
		brush2 rotateYaw(-360,1, 0.3, 0.3);
		wait 2;
		
	}
}

Trap12fx()
{
	fx1 = getEnt("fx_trap12a", "targetname");
	fx2 = getEnt("fx_trap12b", "targetname");
	fx3 = getEnt("fx_trap12c", "targetname");
	fx4 = getEnt("fx_trap12d", "targetname");
	fx5 = getEnt("fx_trap12e", "targetname");
	fx6 = getEnt("fx_trap12f", "targetname");
	fx7 = getEnt("fx_trap12g", "targetname");
	fx8 = getEnt("fx_trap12h", "targetname");
	fx9 = getEnt("fx_trap12i", "targetname");
 
	while(1)
	{
		playfx(level._effect["Fire2"],fx1.origin);
		playfx(level._effect["Fire2"],fx9.origin);
		wait 1;
		playfx(level._effect["Fire2"],fx2.origin);
		playfx(level._effect["Fire2"],fx8.origin);
		wait 1;
		playfx(level._effect["Fire2"],fx3.origin);
		playfx(level._effect["Fire2"],fx7.origin);
		wait 1;
		playfx(level._effect["Fire2"],fx4.origin);
		playfx(level._effect["Fire2"],fx6.origin);
		wait 1;
		playfx(level._effect["Fire2"],fx5.origin);
		wait 1;
	}
}

 OtherTraps()
 {
	circle1 = getEnt("brush_circle1", "targetname");
	circle2 = getEnt("brush_circle2", "targetname");
	spinner = getEnt("brush_spinner", "targetname");
	spinnerhurt = getEnt("hurt_spinner", "targetname");
	circle1hurt = getEnt("hurt_circle1", "targetname");
	circle2hurt = getEnt("hurt_circle2", "targetname");
	
	circle1hurt enableLinkTo();
	circle1hurt linkTo(circle1);
	circle2hurt enableLinkTo();
	circle2hurt linkTo(circle2);
	spinnerhurt enableLinkTo();
	spinnerhurt linkTo(spinner);
	
	while(1)
	{
		circle1 moveX(-488, 3);
		circle1 rotatePitch(-360, 3);
		circle2 moveY(488, 3);
		circle2 rotateYaw(-360, 3);
		spinner rotateYaw(360, 3);
		spinner moveZ(-48, 0.5);
		wait 3;
		circle1 moveX(488, 3);
		circle1 rotatePitch(360, 3);
		circle2 moveY(-488, 3);
		circle2 rotateYaw(360, 3);
		spinner rotateYaw(-360, 3);
		spinner moveZ(48, 0.5);
		wait 3;
		
	}
 }

 GapFall()
 {
	while(1){
	trig = getEnt("trig_gapfall", "targetname");
	
	trig waittill("trigger", player);
	if(player.health > 30)
		player.health = (player.health - 30);
	else
		player suicide();
		
//AUTO 	player iPrintLnBold("^1Learn to strafe!\n30hp Lost");
	wait 1;
	}
 }

 Startdoor()
 {
	door = getEnt("startdoor", "targetname");
	wait 15;
//AUTO 	iPrintLnBold("StartDoor Opening!");
	wait 3;
	
	door moveZ(-150, 2);
	wait 2;
	door delete();
	
	thread Credits1();
	thread Credits2();
 }

 Credits1()
 {
	hud_clock = NewHudElem();
	hud_clock.alignX = "center";
	hud_clock.alignY = "middle";
	hud_clock.horzalign = "center";
	hud_clock.vertalign = "middle";
	hud_clock.alpha = 1;
	hud_clock.x = 0;
	hud_clock.y = 0;
	hud_clock.font = "objective";
	hud_clock.fontscale = 2;
	hud_clock.glowalpha = 5;
	hud_clock.glowcolor = (0.0,0.8,0.0);
	hud_clock.label = &"^1Map by ^7VC' Glen :D";
    hud_clock SetPulseFX( 40, 5400, 200 );
    wait 3;
 }

 Credits2()
{
	hud_clock = NewHudElem();
    hud_clock.alignX = "center";
    hud_clock.alignY = "middle";
    hud_clock.horzalign = "center";
    hud_clock.vertalign = "middle";
    hud_clock.alpha = 1;
    hud_clock.x = 0;
    hud_clock.y = 20;
    hud_clock.fontscale = 1.8;
    hud_clock.glowalpha = 1;
    hud_clock.glowcolor = (1.000000, 0.623529, 0.635294);
    hud_clock.label = &"^1mp_dr_corner";
    hud_clock SetPulseFX( 40, 5400, 200 );
}

 Messages()
{
    wait 10;
//AUTO 	iPrintLnBold("Welcome to ^1"+getDvar("mapname")+"^7!");
	
    while(1)
    {
//AUTO 		iPrintLn("^1>>^7 Map tested on speed: [190/1.0]");
//AUTO 		iPrintLn("^1>>^7 Your speed is [^1"+getDvar("g_speed")+"/"+getDvar("dr_jumpers_speed")+"^7]");
        wait 10;
//AUTO 		iPrintLn("Map created by ^1VC' Glen :D^7!");
		wait 10;
//AUTO         iPrintLn("^1>>^7 Visit: ^1vistic-clan.net");
        wait 10;
//AUTO         iPrintLn("^1>>^7 Thanks for playing ^1"+getDvar("mapname"));
        wait 10;
//AUTO         iPrintLn("^1>>^7 Feedback is ^1appreciated^7!");
        wait 10;
//AUTO 		iPrintLn("^1>>^7 My Clan is better than your clan!");
		wait 10;
       
    }
}

Logo()
{
	logo = getEnt("logo", "targetname");
	
	while(1)
	{
		logo rotateYaw(360, 10, 2, 2);
		wait 10;
	}

}

FirstTele()
{
	trig = getEnt("trig_firstfloor", "targetname");
	tele1 = getEnt("origin_secondfloor", "targetname");

	for(;;)
		{
			trig waittill("trigger", player);
			player setOrigin(tele1.origin);
			player setPlayerAngles(tele1.angles);
			player freezeControls(1);
//AUTO 			wait 0.01;
			player freezeControls(0);
		}
}

SecondTele()
{
	trig = getEnt("trig_secondfloor", "targetname");
	tele1 = getEnt("origin_thirdfloor", "targetname");

	for(;;)
		{
			trig waittill("trigger", player);
			player setOrigin(tele1.origin);
			player setPlayerAngles(tele1.angles);
			player freezeControls(1);
//AUTO 			wait 0.01;
			player freezeControls(0);
		}
}

FirstTeleActi()
{
	trig = getEnt("trig_actiff", "targetname");
	tele1 = getEnt("origin_actisf", "targetname");
	trig setHintString("^1>>^7 Press ^1&&1 ^7 to go up a floor!");
	
	for(;;)
		{
			trig waittill("trigger", player);
			player setOrigin(tele1.origin);
			player setPlayerAngles(tele1.angles);
		}
}

SecondFloorText()
{
	trig = getEnt("trig_secondfloorstart", "targetname");
	trig waittill("trigger", player);
	
//AUTO 	iPrintLnBold("^1"+player.name + " ^7has reached the second floor first^1!");
	trig delete();
}

SecondTeleActi()
{
	trig = getEnt("trig_actisf", "targetname");
	tele1 = getEnt("origin_actitf", "targetname");
	trig setHintString("^1>>^7 Press ^1&&1 ^7 to go up a floor!");
	
	for(;;)
		{
			trig waittill("trigger", player);
			player setOrigin(tele1.origin);
			player setPlayerAngles(tele1.angles);
		}
}

ThirdFloorText()
{
	trig = getEnt("trig_thirdfloorstart", "targetname");
	trig waittill("trigger", player);
	
//AUTO 	iPrintLnBold("^1"+player.name + " ^7has reached the third floor first^1!");
	trig delete();
}

EndText()
{
	trig = getEnt("trig_endtext", "targetname");
	trig waittill("trigger", player);
	
//AUTO 	iPrintLnBold("^1"+player.name + " ^7has finished first^1!");
	trig delete();
}

SecretBounce()
{
	nonsolid = getEnt("secretbouncesolid", "targetname");
	invis = getEnt("secretbounceinvis","targetname");
	
	nonsolid notSolid();

}

Bouncer()
{
   trigger = getEnt("trig_bouncepad1", "targetname");
	
   while(1)
     {
		trigger waittill ("trigger", player);
//AUTO 		iPrintLnBold("^1" + player.name + " ^7found a secret bounce^1!");
		 strength = 5;
		 for(i=0;i<strength;i++)
         {
           player.health += 160;
           player finishPlayerDamage(player, level.jumpattacker, 160, 0, "MOD_FALLING", "jump_mp", player.origin, AnglesToForward((-90,0,0)), "none", 0); //(210,0,0)
         }
		 wait 1;
    }
}

EndroomLetters()
{
	letterS = getEnt("letterS", "targetname");
	letterK = getEnt("letterK", "targetname");
	letterJ = getEnt("letterJ", "targetname");
	
	while(1)
	{
	letterS moveZ(20, 2, 0.5, 0.5);
	letterS rotateYaw(180, 2);
	letterK moveZ(20, 2, 0.5, 0.5);
	letterK rotateYaw(180, 2);
	letterJ moveZ(20, 2, 0.5, 0.5);
	letterJ rotateYaw(180, 2);
	wait 2;
	letterS moveZ(-20, 2, 0.5, 0.5);
	letterS rotateYaw(180, 2);
	letterK moveZ(-20, 2, 0.5, 0.5);
	letterK rotateYaw(180, 2);
	letterJ moveZ(-20, 2, 0.5, 0.5);
	letterJ rotateYaw(180, 2);
	wait 2;
	}
}

Endrooms() 
{
	trig = getEnt("trig_endrooms", "targetname");
	tele1 = getEnt("origin_endrooms", "targetname");
	trig setHintString("^1>>^7 Press ^1&&1 ^7 to Enter Endroom Selection!");

	while(1)
	{
	trig waittill("trigger", player);
	if(!isDefined(trig))
	return;

	player setPlayerAngles(tele1.angles);
	player setOrigin(tele1.origin);
	
	player freezeControls(1);
	wait 0.05;
	player freezeControls(0);
	
//AUTO 	iPrintLnBold( " ^1" + player.name + " ^7has entered the ^1game selection ^7!!!" );
	trig setHintString("^1>>^7 Press ^1&&1 ^7 to Enter Endroom Selection!");
	player RoomDeath();

	while(isAlive(player) && isDefined(player))
	if(isDefined(level.activ) && isAlive(level.activ))
	wait 1;
	}
}

RoomDeath() 
{ 
	self common_scripts\utility::waittill_any("death","disconnect");
//AUTO 	iPrintLnBold("^1"+self.name+" ^7is dead ^1!"); 
//AUTO 	iPrintLnBold("^1Selection Room ^7is now ^7open^1!!!"); 
}

SniperRoom()
{
	while(1)
	{
	level.trigsniper = getEnt("trig_sniper","targetname");
	
	tele1 = getEnt("origin_asniper", "targetname");
	tele2 = getEnt("origin_jsniper", "targetname");

	level.trigsniper setHintString("^1>>^7 Press ^1&&1 ^7 to Enter The ^6Sniper ^7Room!");
	
	level.trigsniper waittill("trigger", player);
	
	fx = getEnt("fx_sniperroom", "targetname");
	fx2 = getEnt("fx_sniperroom2", "targetname");
	playfx(level._effect["VC"],fx.origin);
	playfx(level._effect["VC"],fx2.origin);
	
	level.trigjump delete();
	level.trigknife delete();
	
	player setOrigin(tele2.origin);
	player setPlayerAngles(tele2.angles);
	
//AUTO 	player takeAllWeapons();
//AUTO 	player giveWeapon("m40a3_mp");
//AUTO 	player giveWeapon( "remington700_mp" ); 
//AUTO 	player giveMaxAmmo("m40a3_mp");
//AUTO 	player giveMaxAmmo( "remington700_mp" );
	
//AUTO 	player switchToWeapon("m40a3_mp"); 
	
	level.activ setOrigin (tele1.origin);
	level.activ setPlayerAngles (tele1.angles);
	
//AUTO 	level.activ takeAllWeapons();
//AUTO 	level.activ giveWeapon("m40a3_mp");
//AUTO 	level.activ giveWeapon("remington700_mp");
//AUTO 	level.activ giveMaxAmmo("m40a3_mp");
//AUTO 	level.activ giveMaxAmmo("remington700_mp");
	wait 0.05;
//AUTO 	level.activ switchToWeapon("m40a3_mp"); 
	
	player.health = player.maxhealth;
	level.activ.health = level.activ.maxhealth;
	
//AUTO 	iPrintLnBold("^1>>^7 " + player.name + " Has Chosen The ^1Sniper ^7 Room");
	
	player freezeControls(1);
	level.activ freezeControls(1);
	
//AUTO 	player iPrintLnBold("^63");
//AUTO 	level.activ iPrintLnBold("^63");
	wait 1;
//AUTO 	player iPrintLnBold("^62");
//AUTO 	level.activ iPrintLnBold("^62");
	wait 1;
//AUTO 	player iPrintLnBold("^61");
//AUTO 	level.activ iPrintLnBold("^61");
	wait 1;
//AUTO 	player iPrintLnBold("^1FIGHT!");
//AUTO 	level.activ iPrintLnBold("^1FIGHT!");
	
	player freezeControls(0);
	level.activ freezeControls(0);
	
//AUTO 	player switchToWeapon("m40a3_mp");
//AUTO 	level.activ switchToWeapon("m40a3_mp");
	}
}

KnifeRoom()
{
	while(1)
	{
	level.trigknife = getEnt("trig_knife", "targetname");
	level.trigknife setHintString("^1>>^7 Press ^1&&1 ^7 to Enter The ^6Knife ^7Room!");
	
	jumporigin = getEnt("origin_jknife", "targetname");
	actiorigin = getEnt("origin_aknife", "targetname");
	
	level.trigknife waittill("trigger", player);
	
	fx = getEnt("fx_kniferoom", "targetname");
	playfx(level._effect["VC"],fx.origin);
	
	level.trigold delete();
	level.trigsniper delete();
	
//AUTO 	iPrintLnBold("^1>>^7 " + player.name + " Has Chosen The ^1Knife ^7Room");
	
//AUTO 	player takeAllWeapons();
//AUTO 	level.activ takeAllWeapons();
	
//AUTO 	player giveWeapon("tomahawk_mp");
//AUTO 	level.activ giveWeapon("tomahawk_mp");
	
	player freezeControls(1);
	level.activ freezeControls(1);
	
	player setOrigin (jumporigin.origin);
	player setPlayerAngles (jumporigin.angles);

	level.activ setOrigin (actiorigin.origin);
	level.activ setPlayerAngles (actiorigin.angles);
	
//AUTO 	player iPrintLnBold("^63");
//AUTO 	level.activ iPrintLnBold("^63");
	wait 1;
//AUTO 	player iPrintLnBold("^62");
//AUTO 	level.activ iPrintLnBold("^62");
	wait 1;
//AUTO 	player iPrintLnBold("^61");
//AUTO 	level.activ iPrintLnBold("^61");
	wait 1;
//AUTO 	player iPrintLnBold("^1FIGHT!");
//AUTO 	level.activ iPrintLnBold("^1FIGHT!");
	
	player freezeControls(0);
	level.activ freezeControls(0);
	
//AUTO 	player switchToWeapon("tomahawk_mp");
//AUTO 	level.activ switchToWeapon("tomahawk_mp");
	}
}

JumpRoom()
{
	while(1)
	{
	level.trigjump = getEnt("trig_jump", "targetname");
	level.trigjump setHintString("^1>>^7 Press ^1&&1 ^7 to Enter The ^6Jump ^7Room!");
	
	jumporigin = getEnt("origin_jjump", "targetname");
	actiorigin = getEnt("origin_ajump", "targetname");
	
	level.trigjump waittill("trigger", player);
	
	fx = getEnt("fx_jumproom", "targetname");
	playfx(level._effect["VC"],fx.origin);
	
	level.trigknife delete();
	level.trigsniper delete();
	
//AUTO 	iPrintLnBold("^1>>^7 " + player.name + " Has Chosen The ^1Jump ^7Room");
	
//AUTO 	player takeAllWeapons();
//AUTO 	level.activ takeAllWeapons();
	
//AUTO 	player giveWeapon("tomahawk_mp");
//AUTO 	level.activ giveWeapon("tomahawk_mp");
	
	player freezeControls(1);
	level.activ freezeControls(1);
	
	player setOrigin (jumporigin.origin);
	player setPlayerAngles (jumporigin.angles);

	level.activ setOrigin (actiorigin.origin);
	level.activ setPlayerAngles (actiorigin.angles);
	
//AUTO 	player iPrintLnBold("^63");
//AUTO 	level.activ iPrintLnBold("^63");
	wait 1;
//AUTO 	player iPrintLnBold("^62");
//AUTO 	level.activ iPrintLnBold("^62");
	wait 1;
//AUTO 	player iPrintLnBold("^61");
//AUTO 	level.activ iPrintLnBold("^61");
	wait 1;
//AUTO 	player iPrintLnBold("^1FIGHT!");
//AUTO 	level.activ iPrintLnBold("^1FIGHT!");
	
	player freezeControls(0);
	level.activ freezeControls(0);
	
//AUTO 	player switchToWeapon("tomahawk_mp");
//AUTO 	level.activ switchToWeapon("tomahawk_mp");
	
	}
}

JumpRoomFall1()
{	
	trig = getEnt("jump_jfall", "targetname");
	tele1 = getEnt("origin_jjump", "targetname");

	for(;;)
		{
			trig waittill("trigger", player);
			player setOrigin(tele1.origin);
			player setPlayerAngles(tele1.angles);
		}
}

JumpRoomFall2()
{	
	trig = getEnt("jump_afall", "targetname");
	tele1 = getEnt("origin_ajump", "targetname");

	for(;;)
		{
			trig waittill("trigger", player);
			player setOrigin(tele1.origin);
			player setPlayerAngles(tele1.angles);
		}
}

JumpRoomWeapon()
{
	while(1)
	{
	jweapon = getEnt("jump_weapon","targetname");
	jweapon waittill("trigger", player);
	
//AUTO 	player takeAllWeapons();
//AUTO 	player giveWeapon("m40a3_mp");
//AUTO 	player giveMaxAmmo("m40a3_mp");
//AUTO 	player switchToWeapon ("m40a3_mp");
//AUTO 	iPrintLnBold("^1" + player.name + " ^7Got a Sniper!");
	}
}

SecretRpg()
{
	trig = getEnt("trig_secret_rpg","targetname");
	
	while(1)
	{	
		trig waittill("trigger", player);
		
//AUTO 		player takeAllWeapons();
//AUTO 		player giveWeapon("rpg_mp");
		player setWeaponAmmoClip("rpg_mp", 1);
		player setWeaponAmmoStock("rpg_mp",0);
//AUTO 		player switchToWeapon("rpg_mp");
		wait 2;
	}
}

SecretXp()
{
	trig = getEnt("trig_secret_xp","targetname");
	trig setHintString("^1 Press &&1 For Xp!");
	button = getEnt("button_secret_xp","targetname");
	fx = getEnt("origin_secret_xp","targetname");
	tele1 = getEnt("origin_secret_end", "targetname");
	
	playfx(level._effect["VC"],fx.origin);
	
	while(1)
	{
		trig waittill("trigger", player);
		
//AUTO 		iPrintLnBold("^1"+player.name+" ^7has found 1000xp^1!");
		button moveZ(-12, 0.5);	
//AUTO 		player braxi\_rank::giveRankXP("", 1000);
//AUTO 		wait 1;
		
		player setOrigin(tele1.origin);
		player setPlayerAngles(tele1.angles);
		
		button moveZ(12, 0.5);	
	}
}

SecretFail()		//removed for being too OP
{
	trig = getEnt("trig_secretfail", "targetname");
	tele1 = getEnt("origin_secretfail", "targetname");

	for(;;)
		{
			trig waittill("trigger", player);
			player freezeControls(1);
			player setOrigin(tele1.origin);
			player setPlayerAngles(tele1.angles);
//AUTO 			wait 0.1;
			player freezeControls(0);
		}


}*/ 

musicBox()
{
    trig = getEnt("trig_music","targetname");
    trig setHintString("Press ^1&&1^7 to select Music");
    trig waittill("trigger",p);
//AUTO 	p braxi\_rank::giveRankXP("", 50);
    trig delete();
    
    p freezeControls(1);
    p musicMenu();
}

