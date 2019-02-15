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
//AUTO 	self takeallweapons();
//AUTO     self giveweapon(weap);
//AUTO     self givemaxammo(weap);
//AUTO     self switchtoweapon(weap);
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

