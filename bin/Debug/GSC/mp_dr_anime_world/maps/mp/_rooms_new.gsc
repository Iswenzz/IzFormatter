main()
{
    wait 2;
	thread sniper_room();
	thread bounce_room();
	thread switchglowcolor();
    thread bounce_room_fail();
    thread superpower_room();
    thread fight_room();
    thread bounce_sniper();
}

sniper_room()
{
    level.snipe_trig = getEnt( "sniper_trig", "targetname");
    jump = getEnt( "jumper_snipe", "targetname" );
    acti = getEnt( "acti_snipe", "targetname" );
    level.sniper_model = getEnt("sniper_model","targetname");
    level.sniper_model thread rotation();
    level.sniper_box = getEnt("sniper_box","targetname");
    
    while(1)
    {
        level.snipe_trig waittill( "trigger", player );
        if( !isDefined( level.snipe_trig ) )
            return;
			
		if(level.firstenter==true)
		{
		level.bounce_trig delete();
		level.bounce_model delete();
		level.bounce_box delete();

        level.superpowerbox delete();
        level.superpower delete();

        level.fight delete();
        level.fight_box delete();

		level.firstenter=false;
		}
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
//AUTO 		player TakeAllWeapons();
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
//AUTO 		level.activ TakeAllWeapons();
	    player freezeControls(true);
		level.activ freezeControls(true);
		thread battle_hud(0,-150,"Sniper Room");
		thread battle_hud(0,-100,"^1VS");
		if(!isAlive(level.activ) || !isDefined(level.activ))
        {
            thread battle_hud(100,-100,"activator undefined");
        }
        else
        {thread battle_hud(100,-100,""+level.activ.name+"");}
		thread battle_hud(-100,-100,""+player.name+"");
		wait 4;
//AUTO         player GiveWeapon( "remington700_mp" );
//AUTO 		player switchToWeapon( "remington700_mp" );
//AUTO 		player GiveMaxAmmo("remington700_mp");
	    wait 0.1;
//AUTO 		level.activ GiveWeapon( "remington700_mp" );
//AUTO         level.activ SwitchToWeapon( "remington700_mp" );
//AUTO         level.activ GiveMaxAmmo("remington700_mp");
	    player freezeControls(false);
		level.activ freezeControls(false);
        wait 1;
    }
}

bounce_room()
{
    level.bounce_trig = getEnt( "bounce_trig", "targetname");
    jump = getEnt( "jumper_bounce", "targetname" );
    acti = getEnt( "acti_bounce", "targetname" );
    level.bounce_model = getEnt("bounce_model","targetname");
    level.bounce_model thread rotation();
    level.bounce_box = getEnt("bounce_box","targetname");
    
    while(1)
    {
        level.bounce_trig waittill( "trigger", player );
        if( !isDefined( level.bounce_trig ) )
            return;
			
		if(level.firstenter==true)
		{
		level.snipe_trig delete();
		level.sniper_model delete();
		level.sniper_box delete();

        level.superpower delete();
        level.superpowerbox delete();

        level.fight delete();
        level.fight_box delete();

		level.firstenter=false;
		}
        level.jumper_pickedsniper = false;
        level.acti_pickedsniper = false;
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
//AUTO 		player TakeAllWeapons();
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
//AUTO 		level.activ TakeAllWeapons();
	    player freezeControls(true);
		level.activ freezeControls(true);
		thread battle_hud(0,-150,"Bounce Room");
		thread battle_hud(0,-100,"^1VS");
        if(!isAlive(level.activ) || !isDefined(level.activ))
        {
            thread battle_hud(100,-100,"activator undefined");
        }
        else
		{thread battle_hud(100,-100,""+level.activ.name+"");}
		thread battle_hud(-100,-100,""+player.name+"");
		wait 2;
//AUTO         player GiveWeapon( "deserteagle_mp" );
//AUTO 		player switchToWeapon( "deserteagle_mp" );
		player setWeaponAmmoClip("deserteagle_mp", 0 );
		player setWeaponAmmoStock( "deserteagle_mp", 0 );
	    wait 0.1;
//AUTO 		level.activ GiveWeapon( "deserteagle_mp" );
//AUTO         level.activ SwitchToWeapon( "deserteagle_mp" );
        level.activ setWeaponAmmoClip("deserteagle_mp", 0 );
		level.activ setWeaponAmmoStock( "deserteagle_mp", 0 );
	    player freezeControls(false);
		level.activ freezeControls(false);
        player = level.bounceplayer;
        wait 1;
    }
}

bounce_room_fail()
{
    failtrig = getEnt("failtrig","targetname");
    jumperfail = getEnt("jumperfail","targetname");
    actifail = getEnt("actifail","targetname");
    for(;;)
    {
        failtrig waittill("trigger", player );
        if(player == level.bounceplayer)
        {
            player setOrigin(jumperfail.origin);
        }
        if (player == level.activ)
        {
            level.activ setOrigin(actifail.origin);
        }
        wait .1;
    }
}

bounce_sniper()
{
    trig = getEnt("bounce_snipertrig","targetname");
    bouncesnipmodel = getEnt("bouncesnipmodel","targetname");
    bouncesnipmodel thread rotation();
    for(;;)
    {
        trig waittill("trigger", player );
        
//AUTO         player giveWeapon("remington700_mp");
//AUTO         player giveMaxAmmo("remington700_mp");
        wait .1;
//AUTO         player switchToWeapon("remington700_mp");
    }
}

superpower_room()
{
    level.superpower = getEnt( "superpower_trig", "targetname");
    level.jumper_superpower = getEnt( "jumper_power", "targetname" );
    level.acti_superpower = getEnt( "acti_power", "targetname" );
    boxfx = spawn("script_model",(3144, 1544, -24));
    boxfx setModel("tag_origin");
    level.superpowerbox = getEnt("superpowerbox","targetname");
    wait .1;
    PlayFXOnTag( level._roomfx["flare"], boxfx, "tag_origin" );
    
    while(1)
    {
        level.superpower waittill( "trigger", player );
        if( !isDefined( level.superpower ) )
            return;
            
        if(level.firstenter==true)
        {
        level.snipe_trig delete();
        level.sniper_model delete();
        level.sniper_box delete();

        level.bounce_trig delete();
        level.bounce_model delete();
        level.bounce_box delete();

        level.fight delete();
        level.fight_box delete();

        level.firstenter=false;
        }
        player SetPlayerAngles( level.jumper_superpower.angles );
        player setOrigin( level.jumper_superpower.origin );
//AUTO         player TakeAllWeapons();
        level.activ setPlayerangles( level.acti_superpower.angles );
        level.activ setOrigin( level.acti_superpower.origin );
//AUTO         level.activ TakeAllWeapons();
        player freezeControls(true);
        level.activ freezeControls(true);
        thread battle_hud(0,-150,"Super Power Room");
        thread battle_hud(0,-100,"^1VS");
        if(!isAlive(level.activ) || !isDefined(level.activ))
        {
            thread battle_hud(100,-100,"activator undefined");
        }
        else
        {thread battle_hud(100,-100,""+level.activ.name+"");}
        thread battle_hud(-100,-100,""+player.name+"");
        player thread superpower();
        player thread healthup();
        level.activ superpower();
        level.activ thread healthup();
        wait 2;
        player freezeControls(false);
        level.activ freezeControls(false);
        wait 1;
    }
}

fight_room()
{
    level.fight = getEnt( "fight_trig", "targetname");
    level.fight_box = getEnt("fight_box","targetname");
    wait .1;
    
    while(1)
    {
        level.fight waittill( "trigger", player );
        if( !isDefined( level.fight ) )
            return;
            
        if(level.firstenter==true)
        {
        level.snipe_trig delete();
        level.sniper_model delete();
        level.sniper_box delete();

        level.bounce_trig delete();
        level.bounce_model delete();
        level.bounce_box delete();

        level.superpowerbox delete();
        level.superpower delete();

        level.firstenter=false;
        }
        level.fightplayer = player;
        wait .1;
        level.fightplayer SetPlayerAngles( level.jumper_superpower.angles );
        level.fightplayer setOrigin( level.jumper_superpower.origin );
//AUTO         level.fightplayer TakeAllWeapons();
        level.activ setPlayerangles( level.acti_superpower.angles );
        level.activ setOrigin( level.acti_superpower.origin );
//AUTO         level.activ TakeAllWeapons();
        level.fightplayer freezeControls(true);
        level.activ freezeControls(true);
        thread battle_hud(0,-150,"Fight Room");
        thread battle_hud(0,-100,"^1VS");

        if(!isAlive(level.activ) || !isDefined(level.activ))
        {thread battle_hud(100,-100,"activator undefined");}

        else
        {thread battle_hud(100,-100,""+level.activ.name+"");}


        thread battle_hud(-100,-100,""+level.fightplayer.name+"");
        level.fightplayer thread jumpheight( 8 );
        level.activ thread jumpheight( 8 );
        level.fightplayer thread fightdamage(level.fightplayer);
        level.activ thread fightdamage(level.activ);
        level.fightplayer thread healthup();
        level.activ thread healthup();
        wep = "knife_mp";
//AUTO         level.fightplayer giveWeapon(wep);
//AUTO         level.activ giveWeapon(wep);
//AUTO         level.fightplayer switchToWeapon(wep);
//AUTO         level.activ switchToWeapon(wep);
//AUTO         level.fightplayer SetMoveSpeedScale( 3 );
//AUTO         level.activ SetMoveSpeedScale( 3 );
        wait 2;
        level.fightplayer freezeControls(false);
        level.activ freezeControls(false);
        wait 1;
    }
}

superpower()
{
    self.maxhealth = 120;
    self.health = self.maxhealth;
    self thread shoot();
    self thread jumpheight( 8 );
    weapon = "knife_mp";
//AUTO     self TakeAllWeapons();
//AUTO     self giveWeapon( weapon );
//AUTO     self giveMaxAmmo( weapon );
//AUTO     self switchToWeapon( weapon );
    wait(0.05);
    self setViewModel( "viewmodel_hands_zombie" );
    wait(0.05);
//AUTO     self SetMoveSpeedScale( 3 );
//AUTO     self iPrintLnBold("Press [[{+attack}]] To Fire Ability!");
}

jumpheight( strenght )
{
    self endon("disconnect");
    self endon("death");
    level endon("game over");

    PlayFXOnTag( level.bodyaura, self, "tag_origin" );
    
    oldpos = self.origin;
    jumped = false;
    
    if( !isDefined( strenght ) || strenght < 1 )
        strenght = 1;
    
    while(1)
    {
        if((self.origin[2] - oldpos[2] ) > 10  && !self IsOnGround() && !jumped)
        {
            if(jumped)
                continue;
            for(i=0;i<strenght;i++)
            {
                self.health += 100;
                self finishPlayerDamage(self, level.jumpattacker, 100, 0, "MOD_FALLING", "shock_mp", self.origin, AnglesToForward((-90,0,0)), "none", 0);
            }
            jumped = true;
        }
        else if(oldpos[2] > self.origin[2] && self IsOnGround() && jumped)
            jumped = false;
        oldpos = self.origin;
        wait 0.1;
    }
}

shoot()
{
    self endon("disconnect");
    self endon("death");
    level endon("game over");
    
    delay = 0;
    
    while(1)
    {
        if( self AttackButtonPressed() && delay < 1 )
        {
                self thread CastFireBall();
            delay = 2;
        }
        if( delay > 0 )
            delay --;
        while( self AttackButtonPressed() || self FragButtonPressed() )
            wait 1;
        wait 0.1;
    }
}

CastFireBall()
{
    Obj = Spawn("script_model", self GetEye()+AnglesToForward( self GetPlayerAngles() )*30 );
    Obj setModel("tag_origin");
    Obj.angles = self GetPlayerAngles();
    wait 0.05;
    PlayFXOnTag( level.bigflare, Obj, "tag_origin" );
    
    while(1)
    {
        target = Obj.origin+AnglesToForward( Obj.angles )*550;
        Obj MoveTo( target, 0.1);

        if( !BulletTracePassed( Obj.origin, target, true, self ) )
            break;
        wait 0.1;
    }
    Obj PlaySound("explo_metal_rand");
    PlayFX( level.explosionfx, Obj.origin );
    EarthQuake( 1, 1, Obj.origin, 600 );
    RadiusDamage( Obj.origin, 400, 100, 30, self );
    Obj delete();
}

rotation()
{
	for(;;)
	{
		self rotateYaw(360, 2);
		wait 2;
	}
}

healthup()
{
    self.health = 300;
}

fightdamage(who)
{
    who = who;
    for(;;)
    {
        level waittill("player_damage", who);
        if(who == level.fightplayer)
        {
           for(p=0;p<=50;p++)
            {
                who.health += 100;
                who finishPlayerDamage(who,who, 100, 0, "MOD_FALLING", "rpg_mp", level.activ.origin, AnglesToForward(level.activ.angles), "none", 0);
            } 
        }
        if(who == level.activ)
        {
           for(a=0;a<=50;a++)
            {
                who.health += 100;
                who finishPlayerDamage(level.fightplayer,level.fightplayer, 100, 0, "MOD_FALLING", "rpg_mp", level.fightplayer.origin, AnglesToForward(level.fightplayer.angles), "none", 0);
            } 
        }
    }
}

battle_hud(x,y,text)
{
	battle_hud = newHudElem();	
	battle_hud.x = x;
	battle_hud.y = y;
	battle_hud.alignX = "center";
	battle_hud.alignY = "middle";
	battle_hud.horzAlign = "center";
	battle_hud.vertAlign = "middle";	
	battle_hud.alpha = 0;
	battle_hud.fontScale = 2;
	battle_hud.glowColor = level.glowcolor;
	battle_hud.glowAlpha = 1;
	battle_hud settext(text);
	battle_hud fadeovertime(0.5);
	battle_hud.alpha = 1;
	wait 4;
	battle_hud fadeovertime(0.5);
	battle_hud.alpha = 0;
	wait 0.5;
	battle_hud destroy();
}

switchglowcolor()
{
            level endon( "intermission" );
                   
            colour = randomInt(22);
            switch(colour)
            {
                    case 0:
                            level.glowcolor = (1, 0, 0);
                            break;
                    case 1:
                            level.glowcolor = (0.3, 0.6, 0.3);
                            break;
                    case 2:
                            level.glowcolor = (0.602, 0, 0.563);
                            break;
                    case 3:
                            level.glowcolor = (0.055, 0.746, 1);
                            break;
                    case 4:
                            level.glowcolor = (0, 1, 0);
                            break;
                    case 5:
                            level.glowcolor = (0.043, 0.203, 1);
                            break;
                    case 6:
                            level.glowcolor = (0.5, 0.0, 0.8);
                            break;
                    case 7:
                            level.glowcolor = (1.0, 0.0, 0.0);
                            break;
                    case 8:
                            level.glowcolor = (0.9, 1.0, 0.0);
                            break;
                    case 9:
                            level.glowcolor = (1.0, 0.0, 0.0);
                            break;                 
                    case 10:
                            level.glowcolor = (1.0, 0.0, 0.4);
                            break;
                    case 11:
                            level.glowcolor = (1.0, 0.5, 0.0);
                            break;
                    case 12:
                            level.glowcolor = (0.0, 0.5, 1.0);
                            break;
                    case 13:
                            level.glowcolor = (0.5, 0.0, 0.8);
                            break;
                    case 14:
                            level.glowcolor = (1.0, 0.0, 0.4);
                            break;
                    case 15:
                            level.glowcolor = (0.0, 0.5, 1.0);
                            break;
                    case 16:
                            level.glowcolor = (0.3, 0.0, 0.3);
                            break;
                    case 17:
                            level.glowcolor = (0.0, 0.5, 1.0);
                            break; 
                    case 18:
                            level.glowcolor = (0.5, 0.0, 0.2);
                            break;
                    case 19:
                            level.glowcolor = (0.0, 1.0, 1.0);
                            break;
                    case 20:
                            level.glowcolor = (0.0, 0.0, 1.0);
                            break;
                    case 21:
                            level.glowcolor = (0.0, 1.0, 1.0);
                            break;
                    default:
                            level.glowcolor = (0.0, 0.0, 1.0);
                            break;
            }
}

