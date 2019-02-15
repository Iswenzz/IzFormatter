#include common_scripts\utility;
/*

If you use this Script please give Credits to Luk and TwiYo
www.puffyforum.com
www.ix-treme.com


*/
removeFromArray(array, item)
{
	for (i=0; i<array.size; i++)
	{
		if (array[i] == item)
		{
			for (; i<array.size - 1; i++)
			{
				array[i] = array[i+1];
			}
			array[array.size-1] = undefined;
			return array;
		}
	}
	return array;
}

resetPlayerModel() // For some reason braxi's "setViewModel" call fucks up everything, so we removed that here
{
	if( self.pers["team"] == "allies" )
	{
		id = self getStat( 980 );
		self setModel( level.characterInfo[id]["model"] );
	}
	else
	{
		self setModel( "body_mp_usmc_cqb" );
	}
}

updateDamageFeedback()
{
	if ( !isPlayer( self ) )
		return;
	self playlocalsound("MP_hit_alert");
}

playSoundOnSpot(sound, origin){

	spot = spawn( "script_origin", origin);
	wait 0.05;
	spot playsound(sound);
	spot delete();

}

initHud(){
	self endon("disconnect");
	
	self destroyHUD();
	
	wait 0.05;
	
	if( !isDefined( self.ownhealthbar ) )
		self thread healthbar_self(120);
		
	if( !isDefined( self.enemyhealthbar ) )
		self thread healthbar_enemy(-180);
		
	if( !isDefined( self.controltext ) )
		self thread showControls();
	
	self updateHealthBars();
}

checkQueue(){

	level.playerQueue = removeFromArray(level.playerQueue, self);
	
	if(level.playerQueue.size > 0)
		level notify("start_endroom_fight", level.playerQueue[0]);
}


cleanupOnKill(){
	
	self notify("stop_tank");
	
	self.tank.body rotateTo(self.tank.body.angles, 0.05);
	
	self.tank.turret notify("death");
	self.tank.turret delete();
	self.tank.hitbox moveTo( (self.tank.hitbox.origin[0], self.tank.hitbox.origin[1], self.tank.hitbox.origin[2] - 300), 0.05);
	wait 3;
	
	if( isDefined( self.tank ) ){
		
		if( isDefined( self.tank.body ) ){
			self.tank.body notify("death");
			self.tank.body delete();
		}
		
		self.tank = undefined; // In case the jumper had a life
		
	}
	self checkQueue();
}

cleanupOnDisconnectOrSpectator(){
	self endon("death");
	self notify("tank_cleanup_waittill");
	self endon("tank_cleanup_waittill");
	
	self waittill_any("disconnect", "joined_spectators");
	
	self notify("stop_tank");
	self.tank.turret notify("death");
	self.tank.turret delete();
	self.tank.hitbox.origin = (self.tank.hitbox.origin[0], self.tank.hitbox.origin[1], -500);
	
	if( isDefined( self.tank ) ){
		if( isDefined( self.tank.body ) ){
			self.tank.body notify("death");
			self.tank.body delete();
		}
		
		self.tank = undefined; // In case the jumper had a life
	}
	
	self checkQueue();
	
}

killPlayer(target){
	target resetPlayerModel();
	target.health = target.maxhealth;
	wait 0.05;
	// target thread [[level.callbackPlayerDamage]](self, attacker, int(damage * visibility), 0, "MOD_RIFLE_BULLET", "turret_mp", self.origin, vectornormalize(self.origin - selectedBot.origin), "none", 0);
	target FinishPlayerDamage( self, self, target.maxhealth, 0, "MOD_RIFLE_BULLET", "rpg_mp", self.origin, vectornormalize(self.origin - target.origin), "none", 0 );
	
	playFX( level.tankDeathFX, target.tank.body.origin );
	target.tank.body playsound("tank_death");
	
	target cleanupOnKill();
}

destroyHUD(){

	// if( isDefined( self.hud_damagefeedback_normal ) )
		// self.hud_damagefeedback_normal destroy();
		
	if( isDefined( self.controltext ) )
		self.controltext destroy();
	
	if( isDefined( self.ownhealthbar ) ){
			
		if( isDefined( self.ownhealthbar["bg"] ) )
			self.ownhealthbar["bg"] destroy();
			
		if( isDefined( self.ownhealthbar["fg_red"] ) )
			self.ownhealthbar["fg_red"] destroy();
			
		if( isDefined( self.ownhealthbar["fg_green"] ) )
			self.ownhealthbar["fg_green"] destroy();
			
		self.ownhealthbar = undefined;
	}
	
	if( isDefined( self.enemyhealthbar ) ){
		
		if( isDefined( self.enemyhealthbar["bg"] ) )
			self.enemyhealthbar["bg"] destroy();
			
		if( isDefined( self.enemyhealthbar["fg_red"] ) )
			self.enemyhealthbar["fg_red"] destroy();
			
		if( isDefined( self.enemyhealthbar["fg_green"] ) )
			self.enemyhealthbar["fg_green"] destroy();
		
		self.enemyhealthbar = undefined;
	}

}

updateHealthBars(remove){
	
	if( !isDefined( self.ownhealthbar ) || !isDefined( self.enemyhealthbar ) || !isDefined( self.tank ) || !isDefined( self.tank.enemy ) )
		return;
	
	if( isDefined(remove) && remove ){
		destroyHud();
		return;
	}
		
	oldwidth_self = self.ownhealthbar["fg_green"].oldwidth;
	newwidth_self = int(400 * (self.tank.health/self.tank.maxhealth));
	
	if( oldwidth_self != newwidth_self ){
		self.ownhealthbar["fg_green"].oldwidth = newwidth_self;

		self.ownhealthbar["fg_green"] setShader( "white", self.ownhealthbar["fg_green"].oldwidth, 7 );
		self.ownhealthbar["fg_red"] setShader( "white", self.ownhealthbar["fg_green"].oldwidth, 7 );
		self.ownhealthbar["fg_red"].alpha = 1 - (self.tank.health/self.tank.maxhealth);
		
		damageX = self.ownhealthbar["fg_green"].x + newwidth_self;
		width = oldwidth_self - newwidth_self;
		self thread animateDamageBar(damageX, self.ownhealthbar["fg_green"].y, width); 
	}
	
	
	oldwidth_enemy = self.enemyhealthbar["fg_green"].oldwidth;
	newwidth_enemy = int(250 * (self.tank.enemy.health/self.tank.enemy.maxhealth));
	
	if( oldwidth_enemy != newwidth_enemy ){
		self.enemyhealthbar["fg_green"].oldwidth = newwidth_enemy;
		
		self.enemyhealthbar["fg_green"] setShader( "white", self.enemyhealthbar["fg_green"].oldwidth, 7 );
		self.enemyhealthbar["fg_red"] setShader( "white", self.enemyhealthbar["fg_green"].oldwidth, 7 );
		self.enemyhealthbar["fg_red"].alpha = 1 - (self.tank.enemy.health/self.tank.enemy.maxhealth);
		
		damageX = self.enemyhealthbar["fg_green"].x + newwidth_enemy;
		width = oldwidth_enemy - newwidth_enemy;
		self thread animateDamageBar(damageX, self.enemyhealthbar["fg_green"].y, width); 
	}

	
}

animateDamageBar(damageX, y, width){
	if( !isDefined( self.damageDisplay ) )
		self.damageDisplay = [];
		
	currElement = self.damageDisplay.size;
	
	height = 7;
		
	self.damageDisplay[currElement] = newClientHudElem( self );
		
	self.damageDisplay[currElement].x = damageX;
	self.damageDisplay[currElement].y = y;
	self.damageDisplay[currElement].sort = -1;
	self.damageDisplay[currElement].width = width;
	self.damageDisplay[currElement].height = height;
	self.damageDisplay[currElement].shader = "white";
	self.damageDisplay[currElement] setShader( "white", width, height );
	self.damageDisplay[currElement].alignX = "left";
	self.damageDisplay[currElement].alignY = "middle";
	self.damageDisplay[currElement].horzAlign = "center";
	self.damageDisplay[currElement].vertAlign = "middle";
	self.damageDisplay[currElement].color = (1,0,0);
	self.damageDisplay[currElement].alpha = 1;
	self.damageDisplay[currElement].hidden = false;
	
	step = 0;
	
	while( isDefined( self ) && isAlive( self ) && isDefined( self.ownhealthbar ) && ( width - step ) > 0 ){
		self.damageDisplay[currElement] setShader( "white", width - step, height );
		step += 5;
		wait 0.1;
	}
	
	self.damageDisplay[currElement] destroy();
	
	
}

showControls(){

	self.controltext = newClientHudElem(self);
	self.controltext.elemType = "font";
	self.controltext.font = "default";
	self.controltext.fontscale = 1.4;
	self.controltext.x = 0;
	self.controltext.y = 200;
	self.controltext.glowAlpha = 1;
	self.controltext.hideWhenInMenu = false;
	self.controltext.archived = true;
	self.controltext.alignX = "center";
	self.controltext.alignY = "middle";
	self.controltext.horzAlign = "center";
	self.controltext.vertAlign = "middle";
	self.controltext.alpha = 1;
	self.controltext.glowAlpha = 0;
	self.controltext.glowColor = (1,1,0);
	self.controltext setText("^3[{+activate}]^7 = forward  ^3[{+frag}]^7 = backward  ^3[{+attack}]^7 = FIRE");
	
}

healthbar_self(y)
{
	self endon("disconnect");
	
	self.ownhealthbar = [];

	self.ownhealthbar["bg"] = newClientHudElem( self );
	self.ownhealthbar["fg_red"] = newClientHudElem( self );
	self.ownhealthbar["fg_green"] = newClientHudElem( self );
	
	width = 400;
	height = 7;
	
	if (!isdefined(y))
		y = 0;
	
	self.ownhealthbar["bg"].x = -0.5 * width - 2;
	self.ownhealthbar["bg"].y = y;
	self.ownhealthbar["bg"].sort = -2;
	self.ownhealthbar["bg"].width = width;
	self.ownhealthbar["bg"].height = height;
	self.ownhealthbar["bg"].shader = "black";
	self.ownhealthbar["bg"] setShader( "black", width + 4, height + 4 );
	self.ownhealthbar["bg"].alignX = "left";
	self.ownhealthbar["bg"].alignY = "middle";
	self.ownhealthbar["bg"].horzAlign = "center";
	self.ownhealthbar["bg"].vertAlign = "middle";
	self.ownhealthbar["bg"].color = (1,1,1);
	self.ownhealthbar["bg"].alpha = 1;
	self.ownhealthbar["bg"].hidden = false;
	
	self.ownhealthbar["fg_green"].x = -.5*width;
	self.ownhealthbar["fg_green"].y = y;
	self.ownhealthbar["fg_green"].sort = -1;
	self.ownhealthbar["fg_green"].width = width;
	self.ownhealthbar["fg_green"].oldwidth = width;
	self.ownhealthbar["fg_green"].height = height;
	self.ownhealthbar["fg_green"].shader = "white";
	self.ownhealthbar["fg_green"] setShader( "white", width, height );
	self.ownhealthbar["fg_green"].alignX = "left";
	self.ownhealthbar["fg_green"].alignY = "middle";
	self.ownhealthbar["fg_green"].horzAlign = "center";
	self.ownhealthbar["fg_green"].vertAlign = "middle";
	self.ownhealthbar["fg_green"].color = (0,1,0);
	self.ownhealthbar["fg_green"].alpha = 1;
	self.ownhealthbar["fg_green"].hidden = false;

	self.ownhealthbar["fg_red"].x = -.5*width;
	self.ownhealthbar["fg_red"].y = y;
	self.ownhealthbar["fg_red"].sort = 0;
	self.ownhealthbar["fg_red"].width = width;
	self.ownhealthbar["fg_red"].height = height;
	self.ownhealthbar["fg_red"].shader = "white";
	self.ownhealthbar["fg_red"] setShader( "white", width, height );
	self.ownhealthbar["fg_red"].alignX = "left";
	self.ownhealthbar["fg_red"].alignY = "middle";
	self.ownhealthbar["fg_red"].horzAlign = "center";
	self.ownhealthbar["fg_red"].vertAlign = "middle";
	self.ownhealthbar["fg_red"].color = (1,0,0);
	self.ownhealthbar["fg_red"].alpha = 1 - (self.tank.health/self.tank.maxhealth);
	self.ownhealthbar["fg_red"].hidden = false;
}

healthbar_enemy(y)
{
	self endon("disconnect");
		
	self.enemyhealthbar = [];
	
	self.enemyhealthbar["bg"] = newClientHudElem( self );
	self.enemyhealthbar["fg_red"] = newClientHudElem( self );
	self.enemyhealthbar["fg_green"] = newClientHudElem( self );
	
	self.enemyhealthbar["bg"] endon("death");
	
	width = 250;
	height = 7;
	
	if (!isdefined(y))
		y = 0;
	
	self.enemyhealthbar["bg"].x = -0.5 * width - 2;
	self.enemyhealthbar["bg"].y = y;
	self.enemyhealthbar["bg"].sort = -2;
	self.enemyhealthbar["bg"].width = width;
	self.enemyhealthbar["bg"].height = height;
	self.enemyhealthbar["bg"].shader = "black";
	self.enemyhealthbar["bg"] setShader( "black", width + 4, height + 4 );
	self.enemyhealthbar["bg"].alignX = "left";
	self.enemyhealthbar["bg"].alignY = "middle";
	self.enemyhealthbar["bg"].horzAlign = "center";
	self.enemyhealthbar["bg"].vertAlign = "middle";
	self.enemyhealthbar["bg"].color = (1,1,1);
	self.enemyhealthbar["bg"].alpha = 1;
	self.enemyhealthbar["bg"].hidden = false;
	
	self.enemyhealthbar["fg_green"].x = -.5*width;
	self.enemyhealthbar["fg_green"].y = y;
	self.enemyhealthbar["fg_green"].sort = -1;
	self.enemyhealthbar["fg_green"].width = width;
	self.enemyhealthbar["fg_green"].oldwidth = width;
	self.enemyhealthbar["fg_green"].height = height;
	self.enemyhealthbar["fg_green"].shader = "white";
	self.enemyhealthbar["fg_green"] setShader( "white", width, height );
	self.enemyhealthbar["fg_green"].alignX = "left";
	self.enemyhealthbar["fg_green"].alignY = "middle";
	self.enemyhealthbar["fg_green"].horzAlign = "center";
	self.enemyhealthbar["fg_green"].vertAlign = "middle";
	self.enemyhealthbar["fg_green"].color = (0,1,0);
	self.enemyhealthbar["fg_green"].alpha = 1;
	self.enemyhealthbar["fg_green"].hidden = false;

	self.enemyhealthbar["fg_red"].x = -.5*width;
	self.enemyhealthbar["fg_red"].y = y;
	self.enemyhealthbar["fg_red"].sort = 0;
	self.enemyhealthbar["fg_red"].width = width;
	self.enemyhealthbar["fg_red"].height = height;
	self.enemyhealthbar["fg_red"].shader = "white";
	self.enemyhealthbar["fg_red"] setShader( "white", width, height );
	self.enemyhealthbar["fg_red"].alignX = "left";
	self.enemyhealthbar["fg_red"].alignY = "middle";
	self.enemyhealthbar["fg_red"].horzAlign = "center";
	self.enemyhealthbar["fg_red"].vertAlign = "middle";
	self.enemyhealthbar["fg_red"].color = (1,0,0);
	self.enemyhealthbar["fg_red"].alpha = 1 - (self.tank.enemy.health/self.tank.enemy.maxhealth);
	self.enemyhealthbar["fg_red"].hidden = false;
	

}