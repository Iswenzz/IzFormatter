// __/\\\________/\\\_______________________________________________________________________/\\\\\\\\\__/\\\\\\_________________________________        
//  _\/\\\_______\/\\\____________________________________________________________________/\\\////////__\////\\\_________________________________       
//   _\//\\\______/\\\___/\\\__________________/\\\_______/\\\___________________________/\\\/______________\/\\\_________________________________      
//   __\//\\\____/\\\___\///___/\\\\\\\\\\__/\\\\\\\\\\\_\///______/\\\\\\\\____________/\\\________________\/\\\_____/\\\\\\\\\_____/\\/\\\\\\___     
//    ___\//\\\__/\\\_____/\\\_\/\\\//////__\////\\\////___/\\\___/\\\//////____________\/\\\________________\/\\\____\////////\\\___\/\\\////\\\__    
//     ____\//\\\/\\\_____\/\\\_\/\\\\\\\\\\____\/\\\______\/\\\__/\\\___________________\//\\\_______________\/\\\______/\\\\\\\\\\__\/\\\__\//\\\_   
//      _____\//\\\\\______\/\\\_\////////\\\____\/\\\_/\\__\/\\\_\//\\\___________________\///\\\_____________\/\\\_____/\\\/////\\\__\/\\\___\/\\\_  
//       ______\//\\\_______\/\\\__/\\\\\\\\\\____\//\\\\\___\/\\\__\///\\\\\\\\______________\////\\\\\\\\\__/\\\\\\\\\_\//\\\\\\\\/\\_\/\\\___\/\\\_ 
//        _______\///________\///__\//////////______\/////____\///_____\////////__________________\/////////__\/////////___\////////\//__\///____\///__

/*
  _   ________   ___  __        __   
 | | / / ___( ) / _ )/ /__ ____/ /__ 
 | |/ / /__ |/ / _  / / _ `/ _  / -_)
 |___/\___/   /____/_/\_,_/\_,_/\__/ 

 © VC' Blade


	Credits to Rycoon for the battlecast script of ruin2
*/
main()
{
	level.battlecast["fireball_idle"] = LoadFX("fire/firelp_med_pm");
	level.battlecast["fireball_expl"] = LoadFX("vistic/fire_explosion");
	level.battlecast["black_idle"] = LoadFX("vistic/light_up");
}

magicweapon()
{
    weap=getent("magic_weap","targetname");
    weap sethintstring("Receive Power from ^1Blade");
    level.unusedMagic=true;
    while(1)
    {
        weap waittill("trigger",player);
        weap sethintstring("Power is charging");
        if(level.unusedMagic)
        {
            level.unusedMagic=false;
            player setupMagic();
        }
    }
}

setupmagic()
{
	self setgun("knife_mp");
	self thread magicalUpgrade();
	self thread magichud();
}

setgun(weap)
{
	self takeallweapons();
    self giveweapon(weap);
    self givemaxammo(weap);
    self switchtoweapon(weap);
}

magicalUpgrade() // Rycoons Ruin2 Final Fight
{
	self endon("disconnect");
	self endon("death");
	level endon("game over");
	
	delay = 0;
	self.cur_spell = 1;
	while(1)
	{
		if( self AttackButtonPressed() && delay < 1 )
		{
			if( self.cur_spell == 1 )
				self thread CastBlack();
			else if( self.cur_spell == 2 )
				self thread CastFire();
			delay = 30;
		}
		if( self FragButtonPressed() )
		{
			self.cur_spell++;
			if( self.cur_spell > 2 )
				self.cur_spell = 1;
			self.magic settext(yourPower(self.cur_spell));
		}
		if( delay > 0 )
			delay --;
		while( self AttackButtonPressed() || self FragButtonPressed() )
			wait 0.1;
		wait 0.1;
	}
}

yourPower(num)
{
	if( num == 1 )
		return "Black Magic";
	else if( num == 2 )
		return "Fire Magic";
}

CastBlack()
{
	Obj = Spawn("script_model", self GetEye()+AnglesToForward( self GetPlayerAngles() )*30 );
	Obj setModel("tag_origin");
	Obj.angles = self GetPlayerAngles();
	wait 0.05;
	PlayFXOnTag( level.battlecast["black_idle"], Obj, "tag_origin" );
	
	while(1)
	{
		target = obj.origin+AnglesToForward( obj.angles )*80;
		obj MoveTo( target, 0.1, 0, 0 );
		if( !BulletTracePassed( obj.origin, target, true, self ) )
			break;
		wait 0.1;
	}
	PlayFX( level.magic_eplo, obj.origin );
	EarthQuake( 1, 1, obj.origin, 600 );
	RadiusDamage( obj.origin, 400, 100, 30, self );
	obj delete();
}

CastFire()
{
	Obj = Spawn("script_model", self GetEye()+AnglesToForward( self GetPlayerAngles() )*30 );
	Obj setModel("tag_origin");
	Obj.angles = self GetPlayerAngles();
	wait 0.05;
	PlayFXOnTag( level.battlecast["fireball_idle"], Obj, "tag_origin" );
	
	while(1)
	{
		target = obj.origin+AnglesToForward( obj.angles )*80;
		obj MoveTo( target, 0.1, 0, 0 );
		if( !BulletTracePassed( obj.origin, target, true, self ) )
			break;
		wait 0.1;
	}
	PlayFX( level.battlecast["fireball_expl"], obj.origin );
	EarthQuake( 1, 1, obj.origin, 600 );
	RadiusDamage( obj.origin, 400, 100, 30, self );
	obj delete();
}

magichud() 
{
	self thread destroyondeath();

    self.info = newClienthudElem(self);	
	self.info.x = 25;	
	self.info.y = -144;	
	self.info.horzAlign = "left";	
	self.info.vertAlign = "middle";
	self.info.alignX = "left";
	self.info.alignY = "middle";
	self.info.font = "objective";
	self.info.sort = 102;	
	self.info.alpha = 1;	
	self.info.fontScale = 1.4;
	self.info.glowColor = (0.3, 0.6, 0.3);
	self.info.glowAlpha = 1;
	self.info settext("Use Magic: ^1[{+attack}]\n^7Switch Magic: ^1[{+frag}]");

	self.magic = newClienthudElem(self);	
	self.magic.x = 25;	
	self.magic.y = -112;	
	self.magic.horzAlign = "left";	
	self.magic.vertAlign = "middle";
	self.magic.alignX = "left";
	self.magic.alignY = "middle";
	self.magic.font = "objective";
	self.magic.sort = 102;
	self.magic.alpha = 1;	
	self.magic.fontScale = 1.4;	
	self.magic.glowColor = (0.3, 0.6, 0.3);
	self.magic.glowAlpha = 1;
	self.magic.label=&"Your Magic: ^1";
	self.magic settext(yourPower(self.cur_spell));
}

destroyondeath()
{
	self waittill("death");
	self.magic.alpha=0;
	self.info.alpha=0;
}