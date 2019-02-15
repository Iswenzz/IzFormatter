main()
{
	maps\mp\_load::main();
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
    maps\mp\sanctuary\_others::main();
    maps\mp\sanctuary\_mystic::main();

//AUTO     ambientplay("sanctuary");
	
	game["allies"] = "marines";
    game["axis"] = "opfor";
    game["attackers"] = "axis";
    game["defenders"] = "allies";
    game["allies_soldiertype"] = "desert";
    game["axis_soldiertype"] = "desert";

    level.sanctuaryglow=(randomint(50)/50,randomint(50)/50,randomint(50)/50);
    level.dust_1=loadfx("vistic/vc_dust");
    level.torches=loadfx("vistic/torch_fire");
    level.magic_eplo=loadfx("vistic/light_explosion");
    level.gateeffect=loadfx("vistic/triangle");
    level.trap2_expl=loadfx("explosions/grenadeExp_concrete");
    level.first=false;
    precacheshellshock("frag_grenade_mp");

    thread topcredits();

    thread trap1();
    thread trap2();
    thread trap3();
    thread trap4();
    thread trap5();
    thread trap6();
    thread trap7();
    thread trap8();
    thread trap9();

    thread toggleearthquakemode();
    thread topcredits();
    thread finalstage();
    thread rope1();
    thread rope2();
    thread rope3();
    thread mplat1();
    thread endmap_p();

//AUTO     thread bounce_r();
//AUTO     thread bounce_fail();
//AUTO     thread sniper_r();
//AUTO     thread knife_r();
    thread mystic_r();
    thread mystic_fail();

    addTriggerToList( "trig_trap1" );
    addTriggerToList( "trig_trap2" );
    addTriggerToList( "trig_trap3" );
    addTriggerToList( "trig_trap4" );
    addTriggerToList( "trig_trap5" );
    addTriggerToList( "trig_trap6" );
    addTriggerToList( "trig_trap7" );
    addTriggerToList( "trig_trap8" );
    addTriggerToList( "trig_trap9" );
}

addTriggerToList(name)
{
    if(!isDefined(level.trapTriggers))
        level.trapTriggers=[];
    level.trapTriggers[level.trapTriggers.size]=getEnt(name,"targetname");
}

toggleearthquakemode()
{
    trig=getent("earthquakezor","targetname");
    vc=randomint(15);
    if(vc==1||vc==6||vc==9||vc==13)
    {
        trig sethintstring("Call ^1Earthquake^7 Mode");
        trig waittill("trigger");
        thread earthquakemode();
        trig delete();
    }
    else
        trig delete();
}

earthquakemode()
{
    players=getallplayers();
    for(i=0;i<players.size;i++)
        players[i] thread userEarthquake();
}

userEarthquake()
{
    if(isalive(self) && isdefined(self))
    {
        while(1)
        {
            earthquake(1+randomint(3),1+randomint(3),self.origin,700+randomint(300));
            wait 8+randomint(10);
        }
    }
}

trap1()
{
    trig=getent("trig_trap1","targetname");
    trapa=getent("trap_1a","targetname");
    trapb=getent("trap_1b","targetname");
    trapc=getent("trap_1c","targetname");
    trapd=getent("trap_1d","targetname");

    trig sethintstring("Press ^1[USE]^7 to activate");
/* AUTO     trig waittill("trigger");
    trig delete();

    while(1)
    {
        trapa rotateroll(360,2);
        wait 2;
        trapb rotateroll(360,2);
        wait 2;
        trapc rotateroll(360,2);
        wait 2;
        trapd rotateroll(360,2);
        wait 4+randomint(3);
    }
*/}

trap2()
{
    trig=getent("trig_trap2","targetname");
    trapa=getent("trap_2a","targetname");
    trapb=getent("trap_2b","targetname");

    // Repair
    level.repair_trig=getent("trap2_repair","targetname");
    level.repair_b0=getent("trap_2r_0","targetname");
    level.repair_b1=getent("trap_2r_1","targetname");
    level.repair_b2=getent("trap_2r_2","targetname");
    level.repair_b3=getent("trap_2r_3","targetname");
    level.repair_b4=getent("trap_2r_4","targetname");

    trapa hide();
    level.repair_b0 hide();
    level.repair_b1 hide();
    level.repair_b2 hide();
    level.repair_b3 hide();
    level.repair_b4 hide();
    trapa notsolid();
    level.repair_b0 notsolid();
    level.repair_b1 notsolid();
    level.repair_b2 notsolid();
    level.repair_b3 notsolid();
    level.repair_b4 notsolid();

    trig sethintstring("Press ^1[USE]^7 to activate");
/* AUTO     trig waittill("trigger");
    trig delete();
    trapa show();
    trapa solid();
    trapa movez(-720,2);
    wait 1.5;
    playfx(level.trap2_expl,(-680,-1016,40));
    wait 0.5;
    trapb delete();
    trapa rotatepitch(90,0.3);
    trapa movez(-660,1.5);

    thread trap2_repair();
*/}

trap2_repair()
{
    repairs=0;
    level.repair_trig sethintstring("Press ^1[USE]^7 to repair the Slap");
    for(;;)
    {
/* AUTO         level.repair_trig waittill("trigger",p);
        if(repairs==0)
        {
            repairs++;
//AUTO             iprintln("^1"+p.name+"^7 repaired "+repairs+"/5");
            level.repair_b0 show();
        }
        else if(repairs==1)
        {
            repairs++;
//AUTO             iprintln("^1"+p.name+"^7 repaired "+repairs+"/5");
            level.repair_b1 show();
        }
        else if(repairs==2)
        {
            repairs++;
//AUTO             iprintln("^1"+p.name+"^7 repaired "+repairs+"/5");
            level.repair_b2 show();
        }
        else if(repairs==3)
        {
            repairs++;
//AUTO             iprintln("^1"+p.name+"^7 repaired "+repairs+"/5");
            level.repair_b3 show();
        }
        else if(repairs==4)
        {
            repairs++;
//AUTO             iprintln("^1"+p.name+"^7 repaired "+repairs+"/5");
            level.repair_b4 show();
            level.repair_b0 solid();
            level.repair_b1 solid();
            level.repair_b2 solid();
            level.repair_b3 solid();
            level.repair_b4 solid();
            level.repair_trig delete();
        }
        wait 1; 
    }
*/}

trap3()
{
    trig=getent("trig_trap3","targetname");
    trig sethintstring("Press ^1[USE]^7 to activate");
/* AUTO     trig waittill("trigger");
    trig delete();  

    if(isdefined(level.ropetim1))
        level.ropetim1 unlink();
    if(isdefined(level.ropetim2))
        level.ropetim2 unlink();
    if(isdefined(level.ropetim3))
        level.ropetim3 unlink();
*/}

trap4()
{
    trig=getent("trig_trap4","targetname");
    trap=getent("trap_4","targetname");
    trig sethintstring("Press ^1[USE]^7 to activate");
/* AUTO     trig waittill("trigger");
    trig delete(); 
    trap notsolid();
    wait 5+randomint(4);
    trap solid();
*/}

trap5()
{
    trig=getent("trig_trap5","targetname");
    trap=getent("trap_5","targetname");
    trig sethintstring("Press ^1[USE]^7 to activate");
/* AUTO     trig waittill("trigger");
    trig delete(); 

    while(1)
    {
        trap movey(60,1);
        wait 3;
        trap movey(-60,1);
        wait 6+randomint(4);
    }
*/}

trap6()
{
    trig=getent("trig_trap6","targetname");
    trapa=getent("trap_6a","targetname");
    trapb=getent("trap_6b","targetname");
    trapc=getent("trap_6c","targetname");
    trapd=getent("trap_6d","targetname");
    trig sethintstring("Press ^1[USE]^7 to activate");
/* AUTO     trig waittill("trigger");
    trig delete(); 

    while(1)
    {
        trapc movey(168,2);
        wait 4+randomint(2);
        trapc movey(-168,2);
        trapb movey(-168,2);
        wait 4+randomint(2);
        trapb movey(168,2);
    }
*/}

trap7()
{
    trig=getent("trig_trap7","targetname");
    fire=getentarray("trap_7fx","targetname");
    trapa=getent("trap_7","targetname");
    trapb=getent("trap_7b","targetname");
    trig sethintstring("Press ^1[USE]^7 to activate");
    hfx=undefined;
    trapa maps\mp\_utility::triggerOff();
    trapb maps\mp\_utility::triggerOff();
/* AUTO     trig waittill("trigger");
    trig delete(); 
    trapa maps\mp\_utility::triggerOn();
    trapb maps\mp\_utility::triggerOn();
    for(i=0;i<fire.size;i++)
    {
        hfx[i]=spawnfx(level.torches,fire[i].origin); 
        triggerfx(hfx[i]);
    }
    wait 3+randomint(5);
    trapa maps\mp\_utility::triggerOff();
    trapb maps\mp\_utility::triggerOff();
    for(i=0;i<fire.size;i++)
        hfx[i] delete();
    trapa delete();
    trapb delete();
*/}

trap8()
{
    trig=getent("trig_trap8","targetname");
    trapa=getent("trap_8a","targetname");
    trapb=getent("trap_8b","targetname");
    trig sethintstring("Press ^1[USE]^7 to activate");
/* AUTO     trig waittill("trigger");
    trig delete();

    while(1)
    {
        trapa rotateroll(360,2.5);
        trapb rotateroll(-360,2.5);
        wait .1;
    }
*/}

trap9()
{
    trig=getent("trig_trap9","targetname");
    fire=getentarray("trap_9fx","targetname");
    trapa=getent("trap_9a","targetname");
    trapb=getent("trap_9b","targetname");
    hfx=undefined;
    trig sethintstring("Press ^1[USE]^7 to activate");
    trapa maps\mp\_utility::triggerOff();
    trapb maps\mp\_utility::triggerOff();
/* AUTO     trig waittill("trigger");
    trig delete(); 
    fireball1=spawn("script_model",(4136,-2464,136));
    fireball1 setmodel("tag_origin");
    fireball2=spawn("script_model",(4136,-1996,136));
    fireball2 setmodel("tag_origin");
    wait 0.05;
    fireball1 moveto((4472,-2200,40),2,0.5,1.5);
    fireball2 moveto((3784,-2312,40),2,0.5,1.5);
    wait 2.2;
    playfx(level.magic_eplo,fireball1.origin);
    playfx(level.magic_eplo,fireball2.origin);
    earthquake(1,1,fireball1.origin,500);
    earthquake(1,1,fireball2.origin,500);
    fireball1 delete();
    fireball2 delete();
    trapa maps\mp\_utility::triggerOn();
    trapb maps\mp\_utility::triggerOn();
    for(i=0;i<fire.size;i++)
    {
        hfx[i]=spawnfx(level.torches,fire[i].origin); 
        triggerfx(hfx[i]);
    }
    wait 5+randomint(5);
    trapa maps\mp\_utility::triggerOff();
    trapb maps\mp\_utility::triggerOff();
    for(i=0;i<fire.size;i++)
        hfx[i] delete();
    trapa delete();
    trapb delete();
*/}

rope1()
{
    trig = getEnt ("rope1_trig", "targetname");
    rop1 = getEnt ("rope1_targ1", "targetname");
    rop2 = getEnt ("rope1_targ2", "targetname");
    rop3 = getEnt ("rope1_targ3", "targetname");

    for(;;)
    {
        trig sethintstring("Press ^1[USE]^7 to move over");
        trig waittill ("trigger",user);
        level.ropetim1=user;
        if(user istouching(trig) && isdefined(level.ropetim1))
        {
            rope1=spawn("script_model",(5,7,1));
            rope1.origin=user.origin;
            rope1.angles=user.angles;
            user disableweapons();
            wait 0.5;
            user linkto(rope1);
            rope1 moveto(rop1.origin, 1, 0.5, 0.5);
            wait 1.2;
            user ShellShock("frag_grenade_mp", 5 );
            rope1 moveto(rop2.origin, 2.5, 1, 1 );
            wait 1;
            rope1 moveto(rop3.origin, 2.5, 1, 1 );
            wait 2.7;
            user unlink();
            wait 0.2;
            user EnableWeapons();
            wait 0.1;
            level.ropetim1=undefined;
        }
    }
}

rope2()
{
    trig = getEnt ("rope2_trig", "targetname");
    rop1 = getEnt ("rope2_targ1", "targetname");
    rop2 = getEnt ("rope2_targ2", "targetname");
    rop3 = getEnt ("rope2_targ3", "targetname");

    for(;;)
    {
        trig sethintstring("Press ^1[USE]^7 to move over");
        trig waittill ("trigger",user);
        level.ropetim2=user;
        if(user istouching(trig) && isdefined(level.ropetim2))
        {
            rope2=spawn("script_model",(5,7,1));
            rope2.origin=user.origin;
            rope2.angles=user.angles;
            user disableweapons();
            wait 0.5;
            user linkto(rope2);
            rope2 moveto(rop1.origin, 1, 0.5, 0.5);
            wait 1.2;
            user ShellShock("frag_grenade_mp", 5 );
            rope2 moveto(rop2.origin, 2.5, 1, 1 );
            wait 1;
            rope2 moveto(rop3.origin, 2.5, 1, 1 );
            wait 2.7;
            user unlink();
            wait 0.2;
            user EnableWeapons();
            wait 0.1;
            level.ropetim2=undefined;
        }
    }
}

rope3()
{
    trig = getEnt ("rope3_trig", "targetname");
    rop1 = getEnt ("rope3_targ1", "targetname");
    rop2 = getEnt ("rope3_targ2", "targetname");
    rop3 = getEnt ("rope3_targ3", "targetname");

    for(;;)
    {
        trig sethintstring("Press ^1[USE]^7 to move over");
        trig waittill ("trigger",user);
        level.ropetim3=user;
        if(user istouching(trig) && isdefined(level.ropetim3))
        {
            rope3=spawn("script_model",(5,7,1));
            rope3.origin=user.origin;
            rope3.angles=user.angles;
            user disableweapons();
            wait 0.5;
            user linkto(rope3);
            rope3 moveto(rop1.origin, 1, 0.5, 0.5);
            wait 1.2;
            user ShellShock("frag_grenade_mp", 5 );
            rope3 moveto(rop2.origin, 2.5, 1, 1 );
            wait 1;
            rope3 moveto(rop3.origin, 2.5, 1, 1 );
            wait 2.7;
            user unlink();
            wait 0.2;
            user EnableWeapons();
            wait 0.1;          
            level.ropetim3=undefined;
        }
    }
}

mplat1()
{
    plat=getent("mplat1","targetname");

    while(1)
    {
        plat movex(528,3,1,2);
        wait 4+randomint(2);
        plat movex(-528,3,1,2);
        wait 4+randomint(2);
    }
}

topcredits()
{
    level endon("intermission");

    if(isDefined(level.topcredits))
        level.topcredits destroy();
 
    level.topcredits = newHudElem();
    level.topcredits.foreground = true;
    level.topcredits.alignX = "center";
    level.topcredits.alignY = "top";
    level.topcredits.horzAlign = "center";
    level.topcredits.vertAlign = "top";
    level.topcredits.x = 4;
    level.topcredits.y = 0;
    level.topcredits.sort = 0;
    level.topcredits.fontScale = 1.8;
    level.topcredits.color = (1,1,1);
    level.topcredits.glowColor = level.sanctuaryglow;
    level.topcredits.glowAlpha = 1;
    level.topcredits.hidewheninmenu = true;
    level.topcredits setText("Deathrun Sanctuary");
    wait 5;
    level.topcredits setText("Made by VC' Blade");
    wait 5;
    level.topcredits setText("Special Thanks to JWofles");
    wait 5;
    level.topcredits setText("visit: vistic-clan.com");
    wait 5;
    level.topcredits.alpha=0;
}

finalstage()
{
    trig=getent("finalstage","targetname");
    trig waittill("trigger",p);
    trig delete();
//AUTO     p braxi\_rank::giverankxp(undefined,5);
    thread announces(p.name+" has reached the Final Stage",220);
}

announces(msg,pos)
{
    announce=addTextHud(level,320,pos,0,"center","middle",2.4);
    announce settext(msg);
    announce.glowcolor=level.sanctuaryglow;
    announce.glowalpha=1;
    announce.alpha = 1;
    announce setpulsefx(30,100000,700);
    wait 4;
    announce destroy();
}

addTextHud( who, x, y, alpha, alignX, alignY, fontScale )
{
    if( isPlayer( who ) )
        hud = newClientHudElem( who );
    else
        hud = newHudElem();

    hud.x = x;
    hud.y = y;
    hud.alpha = alpha;
    hud.alignX = alignX;
    hud.alignY = alignY;
    hud.fontScale = fontScale;
    return hud;
}

endmap_p()
{
    trig=getent("end_c","targetname");
    targ=getent("end_o","targetname");
    for(;;)
    {
        trig waittill("trigger",p);

        if(!level.first)
        {
            level.first=true;
//AUTO             p iprintln("You are able to choose the Room");
            p setorigin(targ.origin);
            p setplayerangles(targ.angles);
//AUTO             p braxi\_rank::giverankxp(undefined,5);
            p thread endroom_choice();
            first=addTextHud(level,320,240,0,"center","middle",2.4);
            first settext(p.name+" has finished First",240);
            first.glowcolor=level.sanctuaryglow;
            first.glowalpha=1;
            first.alpha = 1;
            first setpulsefx(30,100000,700);
//AUTO             wait 4;
            first destroy();
        }
        else
        {
            p setorigin(targ.origin);
            p setplayerangles(targ.angles);
        }
    }
}

