main()
{
	thread door();
	thread rp1();
	thread rp2();
	thread rp3();
	thread rpd1();
	thread rpd2();
	thread rpd3();
	thread rope();
}





door()
{
	dl=getent("doorleft","targetname");
	dr=getent("doorright","targetname");
	
	wait 10;
	iPrintlnBold("Mp_dr_sand");
	iPrintlnBold("^0Door opening in 10s");
	wait 10;
	dl rotateyaw(-75,2,.5,.5);
	dr rotateyaw(75,2,.5,.5);
	iPrintlnBold("^0Door opened");
	
}


rp1()
{
	o1=getent("rp1_ori1","targetname");
	p1=getent("rp1_plat1","targetname");
	b1=getent("rp1_brush1","targetname");
	trig=getent("rp1_trig", "targetname");
	X=0;
	
	o1 linkto(b1);
	
	
	trig waittill("trigger");
	trig delete();
	
	while (1)
	{
		b1 RotateRoll(45,4,1,1);
		
		
		while (X<40)
		{
			p1 moveto(o1.origin,0.1);
			X=X+1;
			wait 0.1;
		}
		X=0;
		
		b1 RotateYaw(180,7,1,1);
	
		
		while (X<70)
		{
			p1 moveto(o1.origin,0.1);
			X=X+1;
			wait 0.1;
		}
		X=0;
		
		
		
		b1 RotateRoll(-45,4,1,1);
	
		
		while (X<40)
		{
			p1 moveto(o1.origin,0.1);
			X=X+1;
			wait 0.1;
		}
		X=0;
		
		
		
		b1 RotateRoll(45,4,1,1);
	
		
		while (X<40)
		{
			p1 moveto(o1.origin,0.1);
			X=X+1;
			wait 0.1;
		}
		X=0;
		
		
		b1 RotateYaw(180,7,1,1);

		
		while (X<70)
		{
			p1 moveto(o1.origin,0.1);
			X=X+1;
			wait 0.1;
		}
		X=0;
		
		
		b1 RotateRoll(-45,4,1,1);

		
		while (X<40)
		{
			p1 moveto(o1.origin,0.1);
			X=X+1;
			wait 0.1;
		}
		X=0;
		
		
		
	}
	
	
}

rp2()
{
eau=getent("rp2_eau", "targetname");
trig=getent("rp2_trig", "targetname");
glitch=getent("rp2_glitch", "targetname");
trig waittill("trigger");
trig delete();
eau moveZ(-800,5,2,2);
wait 5;
glitch moveX(-500,3,1,0);
eau delete();


}


rpd1()
{
leftd=getent("rpd1_doorleft", "targetname");
leftc=getent("rpd1_doorleftc", "targetname");
rightd=getent("rpd1_doorright", "targetname");
rightc=getent("rpd1_doorrightc", "targetname");
trig=getent("rpd1_trig", "targetname");

trig waittill("trigger", player);
trig delete();
iPrintlnBold(player.name + " Entered the Underground");
leftd rotateyaw(-75,2,.5,.5);
leftc rotateyaw(-75,2,.5,.5);
rightd rotateyaw(75,2,.5,.5);
rightc rotateyaw(75,2,.5,.5);
}


rpd2()
{
leftd=getent("rpd2_doorleft", "targetname");
leftc=getent("rpd2_doorleftc", "targetname");
rightd=getent("rpd2_doorright", "targetname");
rightc=getent("rpd2_doorrightc", "targetname");
trig=getent("rpd2_trig", "targetname");

trig waittill("trigger", player);
trig delete();
leftd rotateyaw(75,2,.5,.5);
leftc rotateyaw(75,2,.5,.5);
rightd rotateyaw(-75,2,.5,.5);
rightc rotateyaw(-75,2,.5,.5);
}



rp3()
{
	trig=getent("rp3_trig", "targetname");
	plat1=getent("rp3_1", "targetname");
	plat2=getent("rp3_2", "targetname");
	plat3=getent("rp3_3", "targetname");
	plat4=getent("rp3_4", "targetname");
	
	trig waittill("trigger", player);
	trig delete();
	while(1)
	{
	plat1 movex(-704,4,1,1);
	plat2 movey(-704,4,1,1);
	plat3 movey(704,4,1,1);
	plat4 movex(704,4,1,1);
	wait 5;
	plat1 movex(704,4,1,1);
	plat2 movey(704,4,1,1);
	plat3 movey(-704,4,1,1);
	plat4 movex(-704,4,1,1);
	wait 5;
}
}


rope()
{
 trig = getent ("rope_trig","targetname"); 
 start = getent ("rope_start","targetname"); 
 stop = getent ("rope_end","targetname"); 

 while(true)
 {
  trig waittill ("trigger", player);
  
   link = spawn ("script_model",player.origin);
   player linkTo (link);
   link moveTo (start.origin, 1);
   wait 1;
   link moveTo (stop.origin, 6);
   wait 6;
   player unlink();
 }
/* Created by [PF]JeffSkye */
}



rpd3()
{
door=getent("rpd3_d", "targetname");
clip=getent("rpd3_c", "targetname");
trig=getent("rpd3_t", "targetname");

trig waittill("trigger", player);
trig delete();
door rotateyaw(-75,2,.5,.5);
clip rotateyaw(-75,2,.5,.5);
}



