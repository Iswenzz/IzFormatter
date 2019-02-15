init()
{
	
	precachemodel ("vehicle_t72_tank_d_woodland_body_static");
	precachemodel ("vehicle_t72_tankturret");
		
	level.tank = [];
	
	level.tank[0] = spawnstruct();
	level.tank[1] = spawnstruct();
	
	level.tankShotBlueFX = loadFX("deathrun/tank_shot_blue");
	level.tankShotRedFX = loadFX("deathrun/tank_shot_red");
	
	level.tankTrigger = getEnt("tank_trigger", "targetname");
	level.tankShotFX = loadfx("muzzleflashes/abrams_flash_wv");
	level.impactFX = loadfx("impacts/20mm_wood_impact");
	level.tankDeathFX = loadfx("explosions/vehicle_explosion_t72");
	// thread onPlayerSpawn();
}


startTank(){
		
	if( !isDefined( level.activ ) || !isAlive( level.activ ) || self == level.activ || isDefined(self.tank) )
		return;
	
	level.activ thread	giveTankModel();
	self 		thread 	giveTankModel();
	
	thread maps\mp\mp_dr_brainfuck::createSelectedRoom(self.name + " ^3 HAS ENTERED THE TANK ROOM^7!"); // change the massage if you want
	
	self notify("kill afk monitor");
	
}


giveTankModel(){

	self endon("disconnect");
	self endon("death");
	self endon("joined_spectators");
	
	if( self getStance() == "prone" )
		self clientCmd("+gostand; -gostand;");
	
	wait 0.05;
	
	if( isDefined(self.tank) ){
		self moveTankToStart();
		return;
	}

	if( isDefined(level.activ) && self == level.activ ){
		level.tank[0].body 		= spawn("script_model", self.origin );
		level.tank[0].turret 	= spawn("script_model", self.origin );
		level.tank[0].collider 	= spawn("script_model", self.origin );
		level.tank[0].fx 		= level.tankShotRedFX;
		level.tank[0].owner 	= self;
		level.tank[0].maxhealth	= 250;
		if( !isDefined( level.tank[0].health ) )
			level.tank[0].health = level.tank[0].maxhealth;
		level.tank[0].enemy 	= level.tank[1];
		level.tank[0].hitbox	= getEnt("hitbox_tank_0", "targetname");
		
		self.tank = level.tank[0];
	
	}
	else{
		level.tank[1].body 		= spawn("script_model", self.origin );
		level.tank[1].turret 	= spawn("script_model", self.origin );
		level.tank[1].collider 	= spawn("script_model", self.origin );
		level.tank[1].fx 		= level.tankShotBlueFX;
		level.tank[1].owner 	= self;
		level.tank[1].maxhealth	= 250;
		if( !isDefined( level.tank[1].health ) )
			level.tank[1].health = level.tank[1].maxhealth;
		level.tank[1].enemy 	= level.tank[0];
		level.tank[1].hitbox 	= getEnt("hitbox_tank_1", "targetname");
		
		self.tank = level.tank[1];
	}
	
	body 			= self.tank.body;
	turret 			= self.tank.turret;
	collider 		= self.tank.collider;
	hitbox 			= self.tank.hitbox;
	
	body.owner 		= self;
	body.collider	= collider;
	body.turret		= turret;
	
	turret.owner	= self;
	turret.body 	= body;
	
	wait 0.05;

	body setmodel("vehicle_t72_tank_d_woodland_body_static");
	turret setmodel("vehicle_t72_tankturret");
	
	self thread setupTank();	
	
}


setupTank(){
	self endon("disconnect");
	self endon("death");
	self endon("joined_spectators");
	
	self setclientdvars("cg_thirdperson", 1,
						"cg_thirdpersonrange", 300);

	self disableweapons();
	self detachall();
	self setmodel("");
	
	self moveTankToStart();
	
	self.tank.body.origin = self.origin;
	self.tank.turret.origin = self.origin;

	yaw = self getPlayerAngles();
	yaw = yaw[1];
	
	self.tank.body.angles = (self.tank.body.angles[0], yaw, self.tank.body.angles[2]);
	self.tank.turret.angles = (self.tank.turret.angles[0], yaw, self.tank.turret.angles[2]);
	
	self linkto(self.tank.body);
	
	self thread watchFire();
	
	self thread setupTankMovement();

}


moveTankToStart(){

	self endon("disconnect");
	self endon("death");
	self endon("joined_spectators");
	
	if( level.activ == self ){
		spot = getEnt("tank_activator_start", "targetname");
		self setOrigin(spot.origin);
		self setPlayerAngles(spot.angles);
		self.tank.health = self.tank.maxhealth;
		self.tank.body.origin = spot.origin;
		self.tank.body.angles = spot.angles;
		self.tank.turret.origin = spot.origin;
		self.tank.turret.angles = spot.angles;
	}
	else{
		spot = getEnt("tank_jumper_start", "targetname");
		self setOrigin(spot.origin);
		self setPlayerAngles(spot.angles);
		self.tank.health = self.tank.maxhealth;
		self.tank.body.origin = spot.origin;
		self.tank.body.angles = spot.angles;
		self.tank.turret.origin = spot.origin;
		self.tank.turret.angles = spot.angles;
	}
	self thread cleanupOnDisconnectOrSpectator();
	wait 0.05;
	self thread initHud();
}


setupTankMovement(){
	self.tank.body thread rotateBody();
	self.tank.body thread moveBody();
	
	self.tank.turret thread rotateTurret();
	
	self.tank.hitbox.origin = self.origin;
	self.tank.hitbox.angles = self.angles;
	self.tank.hitbox linkto(self.tank.body);
}


cleanup(){	
	self notify("stop_tank");
	self unlink();
	// self.tank.body delete();
	// self.tank.turret delete();
	destroyHud();
		
	self setclientdvar("cg_thirdperson", 0);
	self resetPlayerModel();
	self enableweapons();
}

/*
beTank(){

	self cleanup();
	
	self setclientdvars("cg_thirdperson", 1,
						"cg_thirdpersonrange", 300);

	self thread watchFire();
	self thread initHud();
	
	self disableweapons();
	self detachall();
	self setmodel("");
	
	self linkto(self.tank.body);
	
	
	yaw = self getPlayerAngles();
	yaw = yaw[1];
	
	self.tank.body.angles = (self.tank.body.angles[0], yaw, self.tank.body.angles[2]);
	self.tank.turret.angles = (self.tank.turret.angles[0], yaw, self.tank.turret.angles[2]);
	
	wait 0.05;
	
	body 		= self.tank.body;
	turret 		= self.tank.turret;
	collider 	= self.tank.collider;
	hitbox 		= self.tank.hitbox;
	
	body setmodel("vehicle_t72_tank_d_woodland_body_static");
	turret setmodel("vehicle_t72_tankturret");
	
	body.owner = self;
	body.collider = collider;
	body.turret = turret;
	
	turret.owner = self;
	turret.body = body;
	
	body thread rotateBody();
	body thread moveBody();
	
	turret thread rotateTurret();
}


rotateBody(){
	self.owner endon("disconnect");
	self.owner endon("death");
	self.owner endon("stop_tank");
	self.owner endon("joined_spectators");
	self endon("death");
	
	rate = 0.3;
	speed = 1.5;
	
	while(1){
		wait rate;
		playerangle = self.owner getPlayerAngles();
		
		playerangle = playerangle[1];
		
		myangle = self.angles[1];
		
		yaw = sin(playerangle - myangle) * 180;
		
		time = (yaw / speed) * 0.05;
		
		anglediff = anglestoright(self.owner getPlayerAngles() - self.angles);
		anglediff = anglediff[1];
		
		if( yaw < 20 && yaw > -20 && anglediff < -0.98 ){
			self rotateto( (self.angles[0], playerangle, self.angles[2]), 0.1);
			continue;
		}
		
		if( time < 0 )
			time = time * -1;
		
		
		if( time < 0.05 ){
			continue;
		}
		
		self rotateyaw( yaw/1.1, time );
	}
}


checkCollision(target, angle){

	if( !isDefined(angle) )
		angle = self.angles;
		
	if( !isDefined(target) )
		target = self.origin;
	
	radius = 285; // Barrel length = 282
	
	steps = 40;
	passed = true;
	
	self.collider.angles = self.angles;
	for(i = 0; i < 8; i++){
	
		self.collider.angles = (0,40*i,0);
		p = target + (anglestoforward(self.collider.angles) * radius);
		
		if( !bulletTracePassed(target, p, true, self.owner.tank.hitbox) )
			return false;
	}
	return true;
	
}


moveBody(){
	self.owner endon("disconnect");
	self.owner endon("death");
	self.owner endon("stop_tank");
	self.owner endon("joined_spectators");
	self endon("death");
	
	speed = 15;
	
	self.moving = false;
	self playloopsound("tank_drive_low");
	
	while(1){
	
		wait 0.1;
		
		if( self.owner usebuttonpressed() ){
			
			newpos = self.origin + (anglestoforward(self.angles) * speed);
			
			z = bulletTrace(newpos + (0,0,30), newpos + (0,0,-200), false, undefined);
			z = z["position"][2];
			
			newpos = (newpos[0], newpos[1], z);
			if( !self checkCollision(newpos) )
				continue;
			if( !self.moving ){
				self stoploopsound("tank_drive_low");
				self playloopsound("tank_drive_high");
			}
			self.moving = true;
			self moveto(newpos, 0.05);
			self.turret moveto(newpos, 0.05);		
		}
		else if( self.owner fragbuttonpressed() ){
			
			newpos = self.origin - (anglestoforward(self.angles) * speed );
			
			z = bulletTrace(newpos + (0,0,30), newpos + (0,0,-200), false, undefined);
			z = z["position"][2];
			
			newpos = (newpos[0], newpos[1], z);
			if( !self checkCollision(newpos) )
				continue;
			
			if( !self.moving ){
				self stoploopsound("tank_drive_low");
				self playloopsound("tank_drive_high");
			}
			self.moving = true;
			
			self moveto(newpos, 0.05);
			self.turret moveto(newpos, 0.05);
		}
		else if( self.moving ) {
			self stoploopsound("tank_drive_high");
			self playloopsound("tank_drive_low");
			self.moving = false;
		}
	}
	
}


watchFire(){

	self endon("disconnect");
	self endon("death");
	self endon("stop_tank");
	self endon("joined_spectators");
	
	lastShot = getTime();
	
	while( isDefined( self.tank.turret ) ){
	
		if( self attackbuttonpressed() && getTime() > ( lastShot + 1500 ) ){
		
			lastShot = getTime();
			playFX( level.tankShotFX, self.tank.turret getTagOrigin("tag_flash"), anglestoforward(self.tank.turret.angles) );
			
			thread playSoundOnSpot("tank_fire", self.tank.turret getTagOrigin("tag_flash") );
			
			// Hitpos + FX at impact
			start = self.tank.turret getTagOrigin("tag_flash");
			end = start + anglestoforward( self.tank.turret.angles ) * 5000;
			trace = bullettrace( start, end, true, self );
			
			self thread delayImpact(start, trace);
			
		}
		wait 0.05;
	
	}

}


delayImpact(start, trace){
	self endon("death");
	self endon("disconnect");
	
	position = trace["position"];
	
	if( distance(start, position) > 750 )
		wait 0.1;
		
	self thread tankshellDamage(trace, 500, 50, self);
	playFX( self.tank.fx, position );
	thread playSoundOnSpot( "tank_impact", position );	
}

tankshellDamage(trace, range, damage, attacker)
{
	players = getPlayingPlayers();
	
	for (i = 0; i < players.size; i++)
	{
		player = players[i];
		if ( isDefined( player.tank ) && isDefined( player.tank.body ) && player != attacker )
		{
			distance = distance2d(trace["position"], player.tank.body.origin);
			if ( distance <= range ){
				visibility = player sightConeTrace( trace["position"], player );
				if(visibility != 0){
					//player thread [[level.callbackPlayerDamage]](self, attacker, int(damage * visibility), 0, "MOD_RIFLE_BULLET", "turret_mp", self.origin, vectornormalize(self.origin - selectedBot.origin), "none", 0);
					multi = 1;
					if( distance >= 50 && !isDefined(trace["entity"]) )
						multi = 1 - ((distance-49)/(range-49));
						
					damage = int(damage * visibility * multi);
					attacker updateDamageFeedback();
					if( player.tank.health > 0 )
						if( player.tank.health - damage <= 0 ){
							player.tank.health = 0;
							attacker updateHealthBars(true);
							player updateHealthBars(true);
							
							attacker killPlayer(player);
							// player tankDeath();
							// return;
						}
						else{
							player.tank.health -= damage;
							attacker updateHealthBars();
							player updateHealthBars();
						}
					
				}
			}
		}
	}
}

tankshellDamage(targetSpot, range, damage, attacker)
{
	// players = getPlayingPlayers();
	otherTank = level.tank[1].model;
	player = otherTank;
	if ( player != attacker )
	{
		distance = distance2d(targetSpot, player.origin);
		if ( distance <= range ){
			visibility = player sightConeTrace( targetSpot, player );
			if(visibility != 0){
				// player thread [[level.callbackPlayerDamage]](self, attacker, int(damage * visibility), 0, "MOD_RIFLE_BULLET", "turret_mp", self.origin, vectornormalize(self.origin - selectedBot.origin), "none", 0);
				multi = 1;
				if(distance >= 50)
					multi = 1 - ((distance-49)/(range-49));
				attacker updateDamageFeedback();
//AUTO 				iprintlnbold("Would've done " + int(damage * visibility * multi) + " damage!");
			}
		}
	}
}


rotateTurret(){
	self.owner endon("disconnect");
	self.owner endon("death");
	self.owner endon("stop_tank");
	self.owner endon("joined_spectators");
	self endon("death");
	
	rate = 0.1;
	speed = 4;
	
	while(1){
		wait rate;
		playerangle = self.owner getPlayerAngles();
		
		playerangle = playerangle[1];
				
		myangle = self.angles[1];
		
		yaw = sin(playerangle - myangle) * 180;
		
		time = (yaw / speed) * 0.05;
		
		anglediff = anglestoright(self.owner getPlayerAngles() - self.angles);
		anglediff = anglediff[1];
		
		if( yaw < 20 && yaw > -20 && anglediff < -0.98 ){
			self rotateto( (self.angles[0], playerangle, self.angles[2]), 0.1);
			continue;
		}
		
		if( time < 0 )
			time = time * -1;
		
		
		if( time < 0.05 ){
			continue;
		}
		
		self rotateyaw( yaw/1.1, time );		
	}
}

