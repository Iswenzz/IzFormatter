main()
{
        EndInitializer();
       
}
     
////////////////////////////////////////////////////////////////////////////
 
//End-chooser script by club27|Neo (made it possible to run IELITEMODZX's script as an end-chooser on club27|Dr.Uzi's map)
//Dedicated to club27|Dr.Uzi
//v2.1 [FIXED] + [WORKING]
 
 
EndInitializer()
{
        level.ajtotrig = GetEnt("enddor", "targetname");
    level.endtrig = GetEnt("triggerout", "targetname");
               
        level.elsoEndMegvolt = false;
        level.eppenEndelo = undefined;
        level.egyAzEgyEllen = undefined;
        level.valasztottEnd = undefined;
               
    level.ajtotrig setHintString("Press ^3[USE] ^7to teleport");
        thread AjtoEnd();
}
 
 
AjtoEnd()
{
    while (true)
    {
        level.ajtotrig waittill("trigger", who);
                level.eppenEndelo = who;
        if(level.elsoEndMegvolt == false)
        {
            level.eppenEndelo setOrigin(level.endtrig.origin);
            level waittill("end_kiválasztva", melyik, egyVegy);
                        level.valasztottEnd = melyik;
                        level.egyAzEgyEllen = egyVegy;
            if(level.egyAzEgyEllen == true)
            {
                                level.elsoEndMegvolt = true;
                                switch(level.valasztottEnd)
                                {                              
                                        case "The Don&Challangers get rifles, for the eliminate":
                                                level.eppenEndelo thread End5();
                                        break;
         
                                        case "No weapons, no hopes, only fist":
                                                level.eppenEndelo thread End6();
                                        break;
         
                                        case "2 Men 1 roll":
                                                level.eppenEndelo thread End8();
                                        break;
         
                                        default:
                                        break;
                                }
                                level.eppenEndelo waittill("death");
            }
                        else
                        {
                                switch(level.valasztottEnd)
                                {
                                        case "The Old way":
                                                level.eppenEndelo thread End1();
                                        break;
         
                                        case "Activator need to escape to the safecar":
                                                level.eppenEndelo thread End2();
                                        break;
               
                                        case "It's time to rush that house!":
                                                level.eppenEndelo thread End3();
                                        break;
         
                                        case "Only need perfect jumps...":
                                                level.eppenEndelo thread End7();
                                        break;
         
                                        default:
                                        break;
                                }
                                wait 0.1;
                                level.elsoEndMegvolt = true;
                        }
        }
        else if(level.egyAzEgyEllen == true)
        {
                        switch(level.valasztottEnd)
            {                              
                case "The Don&Challangers get rifles, for the eliminate":
                                        level.eppenEndelo thread End5();
                break;
         
                case "No weapons, no hopes, only fist":
					level.eppenEndelo thread End6();
                break;
         
                case "2 Men 1 roll":
                                        level.eppenEndelo thread End8();
                break;

                case "Activator need to escape to the safecar":
                                        level.eppenEndelo thread End2();
                break;
         
                default:
                break;
            }
                        	level.eppenEndelo waittill("death");
        }
        else
        {
                        switch(level.valasztottEnd)
                        {
                case "The Old way":
                                        level.eppenEndelo thread End1();
                break;
               
                case "It's time to rush that house!":
                                        level.eppenEndelo thread End3();
                break;
         
                case "Only need perfect jumps...":
                                        level.eppenEndelo thread End7();
                break;
         
                default:
                break;
                        }
        }
    }
}
 
 
setend(endname)
{
//Ehhez ne nyúlj, csak a notify a funkciója!
    switch(endname)
    {
        case "The Old way":
            level notify("end_kiválasztva", "The Old way", false);
        break;
 
        case "Activator need to escape to the safecar":
            level notify("end_kiválasztva", "Activator need to escape to the safecar", true);
        break;
 
        case "It's time to rush that house!":
            level notify("end_kiválasztva", "It's time to rush that house!", false);
        break;
 
        case "The Don&Challangers get rifles, for the eliminate":
            level notify("end_kiválasztva", "The Don&Challangers get rifles, for the eliminate", true);
        break;
         
        case "No weapons, no hopes, only fist":
            level notify("end_kiválasztva", "No weapons, no hopes, only fist", true);
        break;
 
        case "Only need perfect jumps...":
        level notify("end_kiválasztva", "Only need perfect jumps...", false);
        break;

        case "2 Men 1 roll":
        level notify("end_kiválasztva", "2 Men 1 roll", true);
        break;

        default:
        break;
    }
}


End1()
{
                door = getEnt("endetnyito","targetname");
                trig = getEnt("enddor","targetname");
		tp = getEnt("old_acti","targetname");
		wait 1;
		PlayFX( level.end_fx, door.origin );
		level.activ setOrigin(tp.origin);
		door delete();
		trig delete();
}

End2()
{
                snippos1 = getEnt("snippos3","targetname");
                snip_acti = getEnt("snip_acti","targetname");
                snipcartrig = getEnt("snipcartrig","targetname");
                self setOrigin(snippos1.origin);
                self takeAllWeapons();
                self GiveWeapon("m40a3_mp");
                self SwitchToWeapon("m40a3_mp");
                level.activ setOrigin(snip_acti.origin);
                level.activ takeAllWeapons();
		level.activ.health = 40;
                snipcartrig waittill( "trigger", who );
                self suicide();
}

End3()
{
	jumper = getEnt("safehousejumper","targetname");
        acti = getEnt("safehouseacti","targetname");

	if(level.elsoEndMegvolt == false)
	{
        self setOrigin(jumper.origin);
        self takeAllWeapons();
        self GiveWeapon("m16_mp");
        self SwitchToWeapon("m16_mp");
        level.activ setOrigin(acti.origin);
        level.activ GiveWeapon("colt45_mp");
        level.activ SwitchToWeapon("colt45_mp");
	level.activ.maxhealth = 600;
	level.activ.health = self.maxhealth;
	}

	if(level.elsoEndMegvolt == true)
	{
        self setOrigin(jumper.origin);
        self takeAllWeapons();
        self GiveWeapon("m16_mp");
        self SwitchToWeapon("m16_mp");
	}
}

End5()
{
                snippos1 = getEnt("dudu_jumper","targetname");
                snip_acti = getEnt("dudu_acti","targetname");
                self setOrigin(snippos1.origin);
                self takeAllWeapons();
                self GiveWeapon("m40a3_mp");
                self SwitchToWeapon("m40a3_mp");
                level.activ setOrigin(snip_acti.origin);
                level.activ takeAllWeapons();
		level.activ GiveWeapon("m40a3_mp");
                level.activ SwitchToWeapon("m40a3_mp");
}

End6()
{
                jumper = getEnt("knife_jumper","targetname");
                acti = getEnt("knife_acti","targetname");
                self setOrigin(jumper.origin);
                self takeAllWeapons();
                self GiveWeapon("knife_mp");
                self SwitchToWeapon("knife_mp");
                level.activ setOrigin(acti.origin);
                level.activ takeAllWeapons();
		level.activ GiveWeapon("knife_mp");
                level.activ SwitchToWeapon("knife_mp");
}

End7()
{
		jumper = getEnt("jumper_bounce","targetname");
                acti = getEnt("acti_bounce","targetname");

		if(level.elsoEndMegvolt == false)
		{
                self setOrigin(jumper.origin);
                self takeAllWeapons();
                self GiveWeapon("knife_mp");
                self SwitchToWeapon("knife_mp");
                level.activ setOrigin(acti.origin);
		}

		if(level.elsoEndMegvolt == true)
		{
		self setOrigin(jumper.origin);
                self takeAllWeapons();
                self GiveWeapon("knife_mp");
                self SwitchToWeapon("knife_mp");
		}
}

End8()
{
                jumper = getEnt("rtd_jumper","targetname");
                acti = getEnt("rtd_acti","targetname");
                self setOrigin(jumper.origin);
                self takeAllWeapons();
		self maps\mp\mp_deathrun_godfather::random(self);
                level.activ setOrigin(acti.origin);
                level.activ takeAllWeapons();
		level.activ maps\mp\mp_deathrun_godfather::random(level.activ);
		
}