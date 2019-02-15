 /*

	Map by NitroFire
	[If you plan to use these scripts, make sure to give credit where it is due.]

*/

main()
{
	thread initmusic();
	thread musictrig();
	thread wehz();
	thread nitro();
	thread voidix();
	thread liserd();
    thread sniper();
    thread jump();
}

initMusic()
{

		level.music = [];

        i = 0;
		level.music[i]["artist"] = "Ollie James & LoaX";
		level.music[i]["title"] = "Wait for Me";
		level.music[i]["alias"] = "music1";

		i++;
		level.music[i]["artist"] = "Fox Stevenson";
		level.music[i]["title"] = "Sandblast";
		level.music[i]["alias"] = "music2";

		i++;
		level.music[i]["artist"] = "T-Mass & WOLFE";
		level.music[i]["title"] = "Say Please";
		level.music[i]["alias"] = "music3";

		i++;
		level.music[i]["artist"] = "Martin Garrix & Bebe Rexha";
		level.music[i]["title"] = "In The Name Of Love";
		level.music[i]["alias"] = "music4";

		i++;
		level.music[i]["artist"] = "Bebe Rexha";
		level.music[i]["title"] = "Gateway Drug";
		level.music[i]["alias"] = "music5";

		precacheShader( "black" );
		precacheShader( "white" );
}

musicMenu()
{

    self endon( "death" );

    self thread onDeath();
    self thread onDisconnect();

    self.hud_music = [];
    self.selection = 0;

    i = 0;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 160, 200, 0.35, "left", "top", 2 );
    self.hud_music[i].sort = 880;
    self.hud_music[i] setShader( "black", 320, 160 );

    i++;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 270, 180, 1, "left", "top", 1.8 );
    self.hud_music[i].sort = 883;
    self.hud_music[i] setText( ">^5>^7> Music ^5Menu ^7<^5<^7<" );

    i++;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 270, 204, 0.93, "left", "top", 1.8 );
    self.hud_music[i].sort = 884;
    self.hud_music[i] setText( ">^5>^7> ^7Select ^7a ^7Song ^5<^7<^5<" );

    i++;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 288, 360, 1, "center", "top", 1.4 );
    self.hud_music[i].sort = 885;
    self.hud_music[i] setText( "Press ^5[^7USE^5]^7: ^5Play ^7Song" );

    i++;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 235, 360, 1, "center", "bottom", 1.4 );
    self.hud_music[i].sort = 886;

    for( j = 0; j < level.music.size; j++ )
    {
        i++;
        self.hud_music[i] = braxi\_mod::addTextHud( self, 172, 230+(j*16), 0.93, "left", "top", 1.4 );
        self.hud_music[i].sort = 882;
        self.hud_music[i].font = "objective";

        entry = level.music[j];
        self.hud_music[i] setText( entry["artist"] + " ^2-^7 " + entry["title"] );
    }

    i++;
    self.hud_music[self.hud_music.size] = braxi\_mod::addTextHud( self, 167, 230, 0.4, "left", "top", 1.4 );
    self.hud_music[i].sort = 881;
    indicator = self.hud_music[self.hud_music.size-1];
    indicator setShader( "white", 306, 17 );

    while( self.sessionstate == "playing" )
    {
        wait 0.1;

        if( self attackButtonPressed() )
        {
            self.hud_music[5+self.selection].alpha = 0.93;

            self.selection++;
            if( self.selection >= level.music.size )
                self.selection = 0;

            item = self.hud_music[5+self.selection];
            item.alpha = 1;
            indicator.y = item.y;
        }
        else if( self useButtonPressed() )
        {
            iPrintln( "^5Now playing: ^7" + level.music[self.selection]["artist"]+" - ^2" +level.music[self.selection]["title"] );

            ambientPlay( level.music[self.selection]["alias"], 3 );
            self freezeControls(0);
            level notify ( "song_picked" );
            self braxi\_rank::giveRankXp( "trap_activation" );
            break;
        }
        else if( self meleeButtonPressed() )
        {
            self freezeControls(0);
            break;
        }
    }

    self cleanUp();
}

musictrig()
{
    level.trigger = getEnt ( "musicmenu", "targetname" ); //musicmenu is the trigger to pick songs
    level.trigger setHintString( "Press ^5[^7USE^5]^7to ^5Choose ^7Music" );

   level.trigger waittill( "trigger", player );
    level.triggerr delete();
    level endon ( "song_picked" );
    player thread musicMenu();
    player freezeControls(1);
}

onDeath()
{
    self endon( "disconnect" );
    self endon( "music thread terminated" );
    self waittill( "death" );
    self cleanUp();
}

onDisconnect()
{
    self endon( "music thread terminated" );
    self waittill( "disconnect" );
    self cleanUp();
}

cleanUp()
{
    if( !isDefined( self ) )
        return;

    if( isDefined( self.hud_music ) )
    {
        for( i = 0; i < self.hud_music.size; i++ )
        {
            if( isDefined( self.hud_music[i] ) )
                self.hud_music[i] destroy();
        }
    }
    self notify( "music thread terminated" );
}

wehz()
{
	self cleanup();
	level.wehztrig = getEnt("wehz","targetname");
	level.wehztrig setHintString("^0FAM^9OUS Wehz's ^3V.I.P. Secret!");
	level.wehztrig waittill("trigger", player );
	ambientPlay("wehz");
	iPrintlnBold( player.name + "^5Turned on ^0FAM^9OUS Wehz's Secret Song!");

    level.trigger delete();
    level.nitrotrig delete();
    level.voidtrig delete();
    level.listrig delete();
    level.wehztrig delete();
}

nitro()
{
	self cleanup();
	level.nitrotrig = getEnt("nitro","targetname");
	level.nitrotrig waittill("trigger", player );
	ambientPlay("nitro");
	iPrintlnBold( player.name + "^5Turned on ^0FAM^9OUS NitroFire's Secret Song!");

    level.trigger delete();
    level.wehztrig delete();
    level.voidtrig delete();
    level.listrig delete();
    level.nitrotrig delete();
}

voidix()
{
	self cleanup();
	level.voidtrig = getEnt("voidix","targetname");
	level.voidtrig waittill("trigger", player );
	ambientPlay("voidix");
	iPrintLnBold( player.name + "^5Turned on ^6Voidix's ^5Boner Arising Song!");

    level.trigger delete();
    level.wehztrig delete();
    level.nitrotrig delete();
    level.listrig delete();
    level.voidtrig delete();
}

liserd()
{
	self cleanup();
	level.listrig = getEnt("liserd","targetname");
	level.listrig waittill("trigger", player );
	ambientPlay("liserd");
	iPrintLnBold( player.name + "^5Turned on ^0FAM^9OUS Liserd's Secret Song!");

    level.trigger delete();
    level.wehztrig delete();
    level.nitrotrig delete();
    level.voidtrig delete();
    level.listrig delete();
}

sniper()
{
    self cleanup();
    level.listrig = getEnt("enter5","targetname");
    level.listrig waittill("trigger", player );
    ambientPlay("music7");
}

jump()
{
    self cleanup();
    level.listrig = getEnt("enter6","targetname");
    level.listrig waittill("trigger", player );
    ambientPlay("music6");
}
