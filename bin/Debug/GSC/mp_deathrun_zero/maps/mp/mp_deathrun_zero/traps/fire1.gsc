///////////////////////////////////////////////////////////////////////////////////
// scripted: mnaauuu@4gf.cz
///////////////////////////////////////////////////////////////////////////////////
#include common_scripts\utility;

main()
{
	level.dr_zero_player_burn_time = 8; // dlzka horenia

	thread fire_init();
	thread onPlayerConnect();
}
//tfire1  aktivacni triger
//fired_11  fired_12  zabijeci trigery
//fire11 fire12  script_struct pro efekty efekt: fire21 fire22
//aktivace po 5 sec off zapaleni hracu

onPlayerConnect()
{
	while(true) {
		level waittill("connecting", player);
		player thread onPlayerSpawned();
	}
}

onPlayerSpawned() 
{
	self endon("disconnect");
	
	while(true) {
		self waittill("spawned");
		self.burn = undefined;
	}
}

fire_init() {

	trig = getent( "tfire1" , "targetname" ) ;
	trig waittill("trigger", player );
	
	// spusti obsluzne  vlakna pre jednotlive plamene
	thread fire(1);
	thread fire(2);
}

fire(index) {

	b = getstructarray ( "fire1"  + index, "targetname" );
	t = getent ( "fired_1" + index , "targetname" );
	
	playFx(level._effect[ "fire2" + index ], b[0].origin); // urob efekt
	t thread fire_killtrigger(); // spusti kill trigger
		
	wait 2; // cakaj X sekund

	t notify("done"); // ukonci kill trigger
}

// kill trigger
fire_killtrigger() {
	self endon("done");
	
	// kill trigger
	while(true) {
		self waittill( "trigger", player ); // kill trigger 
		
		if ( isPlayer(player) && isAlive(player) ) {
			player thread burn();  // zapal hraca :-)
		}
		
	}
}

// burn :-)
burn() {
	self endon("disconnect");
	self endon("death");
	level endon ( "game_ended" );
	self endon("spawn");
	
	if (isDefined(self.burn) || !isalive(self) || !isPlayer(self) || self.pers["team"] == "spectator")
		return;
	
	// debug - pohlad tretej osoby
	//self setClientDvars( "cg_thirdPerson", "1");
	
	self.burn = true;
	
	// schovaj zbrane
	self disableWeapons();
	
	self playsound("pain_1"); // vreskot 
	lastSound = gettime(); 
	
	killPlayerTime = gettime() + level.dr_zero_player_burn_time * 1000;
	
	// cyklus horenia
	while ( isDefined( self ) && killPlayerTime > gettime() ) {
		wait (0.2);
		
		playfx( level._effect[ "playerfire" ]	, self.origin ); // efekt horenia hraca
		if ( gettime() - lastSound > 1000 ) {
			lastSound = gettime();
			self playsound("pain_1"); // vreskot
		}
	}
	
	wait 0.1;
	self.burn = undefined;
	self thread smrt();  // smrt
}
smrt() {
	iprintln(self.name + " ^3burned.");
	self suicide(); // smrt
}