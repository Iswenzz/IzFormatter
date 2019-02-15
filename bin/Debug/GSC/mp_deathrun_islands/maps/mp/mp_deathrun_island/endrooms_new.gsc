main()
{

thread sniper();
thread knife();
thread bounce();
thread catcatcat();
thread old();
thread fool();
thread bumpercar();

}

sniper()
{
     level.sniper_trig = getEnt( "sniper", "targetname");
     sjump = getEnt( "jumps", "targetname" );
     sacti = getEnt( "actis", "targetname" );
     
     if( !isDefined( level.sniper_trig ) )
         return;
         
     while(1)
     {
        level.sniper_trig waittill( "trigger", player );
        
        if(!isdefined(level.firstenter))
            level.firstenter=false;
            
        if(level.firstenter==false)
        {
		 level.knife_trig delete();
		 level.bounce_trig delete();
		 level.old_trig delete();
		 level.invisableman_trig delete();
         level.firstenter=true;
        }
            level.activ freezeControls(1);
            player FreezeControls(1);
            
            player SetPlayerAngles( sjump.angles );
            player setOrigin( sjump.origin );
            level.activ setPlayerangles( sacti.angles );
            level.activ setOrigin( sacti.origin );
//AUTO             level.activ TakeAllWeapons();
//AUTO             player TakeAllWeapons();
			level.activ.health = 100;
            
//AUTO             level.activ giveweapon( "m40a3_mp");
//AUTO             player giveweapon( "m40a3_mp");
//AUTO             player switchToWeapon( "m40a3_mp" );
//AUTO             level.activ SwitchToWeapon( "m40a3_mp" );
//AUTO             player giveMaxAmmo( "m40a3_mp" );
//AUTO             level.activ giveMaxAmmo( "m40a3_mp" );
            
            level.activ freezeControls(1);
            player FreezeControls(1);
            
                    noti = SpawnStruct();
                    noti.titleText = "Sniper Fight";
                    noti.notifyText = level.activ.name + " ^1VS^7 " + player.name;
                    noti.duration = 6;
                    noti.glowcolor = (0.5, 0.0, 0.8);
                    
                    players = getEntArray("player", "classname");
                    for(i=0;i<players.size;i++)
                        players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
                    
            wait 2;
            
            level.activ FreezeControls(0);
            player FreezeControls(0);
            
            wait 0.1;
                     
            while(isAlive(player))
                wait 1;

        }
}

knife()
{
     level.knife_trig = getEnt( "knife", "targetname");
     level.kjump = getEnt( "jumpk", "targetname" );
     level.kacti = getEnt( "actik", "targetname" );
     
    if( !isDefined( level.knife_trig ) )
         return;
         
     while(1)
     {
        level.knife_trig waittill( "trigger", player );
        
        if(!isdefined(level.firstenter))
            level.firstenter=false;
            
        if(level.firstenter==false)
        {
         level.sniper_trig delete();
		 level.bounce_trig delete();
		 level.old_trig delete();
		 level.invisableman_trig delete();
         level.firstenter=true;
        }
            level.activ freezeControls(1);
            player FreezeControls(1);
            
            player SetPlayerAngles( level.kjump.angles );
            player setOrigin( level.kjump.origin );
            level.activ setPlayerangles( level.kacti.angles );
            level.activ setOrigin( level.kacti.origin );
//AUTO             level.activ TakeAllWeapons();
//AUTO             player TakeAllWeapons();
            
//AUTO             level.activ giveweapon( "tomahawk_mp");
//AUTO             player giveweapon( "tomahawk_mp");
//AUTO             player switchToWeapon( "tomahawk_mp" );
//AUTO             level.activ SwitchToWeapon( "tomahawk_mp" );
			level.activ.health = 100;
            
            level.activ freezeControls(1);
            player FreezeControls(1);
            
                    noti = SpawnStruct();
                    noti.titleText = "Knife Fight";
                    noti.notifyText = level.activ.name + " ^1VS^7 " + player.name;
                    noti.duration = 6;
                    noti.glowcolor = (0.5, 0.0, 0.8);
                    
                    players = getEntArray("player", "classname");
                    for(i=0;i<players.size;i++)
                        players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
                    
            wait 2;
            
            level.activ FreezeControls(0);
            player FreezeControls(0);
            
            wait 0.1;
                     
            while(isAlive(player))
                wait 1;

        }
}

bounce()
{
     level.bounce_trig = getEnt( "bounce", "targetname");
     level.bjump = getEnt( "jumpb", "targetname" );
     level.bacti = getEnt( "actib", "targetname" );
     
    if( !isDefined( level.bounce_trig ) )
         return;
         
     while(1)
     {
        level.bounce_trig waittill( "trigger", player );
        
        if(!isdefined(level.firstenter))
            level.firstenter=false;
            
        if(level.firstenter==false)
        {
         level.sniper_trig delete();
		 level.knife_trig delete();
		 level.old_trig delete();
		 level.invisableman_trig delete();
         level.firstenter=true;
        }
            
            player SetPlayerAngles( level.bjump.angles );
            player setOrigin( level.bjump.origin );
            level.activ setPlayerangles( level.bacti.angles );
            level.activ setOrigin( level.bacti.origin );
//AUTO             level.activ TakeAllWeapons();
//AUTO             player TakeAllWeapons();
			level.activ.health = 100;
            
//AUTO             level.activ giveweapon( "tomahawk_mp");
//AUTO             player giveweapon( "tomahawk_mp");
//AUTO             player switchToWeapon( "tomahawk_mp" );
//AUTO             level.activ SwitchToWeapon( "tomahawk_mp" );
            noti = SpawnStruct();
            noti.titleText = "Bounce Room";
            noti.notifyText = level.activ.name + " ^1VS^7 " + player.name;
            noti.duration = 6;              
             noti.glowcolor = (0.5, 0.0, 0.8);              
             players = getEntArray("player", "classname");
             for(i=0;i<players.size;i++)              
             players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );              
            wait 2;
            wait 0.1;
            while(isAlive(player))
             wait 1;
        }
}

catcatcat()
{
 trig = getent("yummy", "targetname");

	for(;;)
	{
		trig waittill( "trigger", player );
		if(player.pers["team"] == "axis")
		{
		    level.activ setPlayerangles( level.bacti.angles );
            level.activ setOrigin( level.bacti.origin );
		}
		if(player.pers["team"] == "allies")
		{
		    player SetPlayerAngles( level.bjump.angles );
            player setOrigin( level.bjump.origin );
		}
	}
}

old()
{
level.old = getent("oldtp", "targetname");
brush = getent("oldbrush", "targetname");
level.old_trig = getent("oldtrig", "targetname");
level.old_trig waittill("trigger", player);
level.sniper_trig delete();
level.knife_trig delete();
level.bounce_trig delete();
level.invisableman_trig delete();
level.activ SetPlayerAngles( level.old.angles );
level.activ setOrigin( level.old.origin );
level.activ.health = 100;
//AUTO wait 0.1;
noti = SpawnStruct();
noti.titleText = player.name + " picked Old";              
noti.duration = 6;                   
noti.glowcolor = (0.5, 0.0, 0.8);                    
players = getEntArray("player", "classname");                    
for(i=0;i<players.size;i++)                    
players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );                   
brush movez(200,4,1,0);
brush waittill("movedone");
brush delete();
}

fool()
{
trigga = getent("fool", "targetname");
	for(;;)
	{
		trigga waittill( "trigger", player );
		if(player.pers["team"] == "axis")
		{
		    level.activ setPlayerangles( level.kacti.angles );
            level.activ setOrigin( level.kacti.origin );
		}
		if(player.pers["team"] == "allies")
		{
		    player SetPlayerAngles( level.kjump.angles );
            player setOrigin( level.kjump.origin );
		}
	}
}

bumpercar()//ice skating*
{
     level.invisableman_trig = getEnt( "invisableman", "targetname");
     ijump = getEnt( "jumpi", "targetname" );
     iacti = getEnt( "actii", "targetname" );
     
     if( !isDefined( level.invisableman_trig ) )
         return;
         
     while(1)
     {
        level.invisableman_trig waittill( "trigger", player );
        
        if(!isdefined(level.firstenter))
            level.firstenter=false;
            
        if(level.firstenter==false)
        {
		 level.knife_trig delete();
		 level.bounce_trig delete();
		 level.old_trig delete();
		 level.sniper_trig delete();
         level.firstenter=true;
        }
            level.activ freezeControls(1);
            player FreezeControls(1);
            
            player SetPlayerAngles( ijump.angles );
            player setOrigin( ijump.origin );
            level.activ setPlayerangles( iacti.angles );
            level.activ setOrigin( iacti.origin );
//AUTO             level.activ TakeAllWeapons();
//AUTO             player TakeAllWeapons();
			level.activ.health = 100;
            
//AUTO             level.activ giveweapon( "tomahawk_mp");
//AUTO             player giveweapon( "tomahawk_mp");
//AUTO             player switchToWeapon( "tomahawk_mp" );
//AUTO             level.activ SwitchToWeapon( "tomahawk_mp" );
//AUTO             player giveMaxAmmo( "tomahawk_mp" );
//AUTO             level.activ giveMaxAmmo( "tomahawk_mp" );
            level.activ freezeControls(1);
            player FreezeControls(1);
            
             noti = SpawnStruct();
             noti.titleText = "Ice rink";       
             noti.notifyText = level.activ.name + " ^1VS^7 " + player.name;       
             noti.duration = 6;       
             noti.glowcolor = (0.5, 0.0, 0.8);       
             players = getEntArray("player", "classname");       
             for(i=0;i<players.size;i++)       
             players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );              
//AUTO              wait 2;           
             level.activ FreezeControls(0);       
             player FreezeControls(0);
			 thread ondeathice();
//AUTO              wait 0.1;
             while(isAlive(player))
//AUTO              wait 1;

        }
}

ondeathice()
{
self endon("disconnect");
self waittill("death");
thread bumpercar();
}

