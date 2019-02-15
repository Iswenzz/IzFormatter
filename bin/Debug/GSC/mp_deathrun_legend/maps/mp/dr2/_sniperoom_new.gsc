
{

thread sniperoom();

}

sniperoom()
{
    level.snipe_trig = getEnt( "sniperoom", "targetname");
    jump = getEnt( "jumpsnipe", "targetname" );
    acti = getEnt( "actisnipe", "targetname" );

    
    while(1)
    {
        level.snipe_trig waittill( "trigger", player );
        if( !isDefined( level.snipe_trig ) )
            return;
			
		if(level.firstenter==true)
		{
                level.oldtrigger delete();
		level.jump_trig delete();
		level.knife_trig delete();
		level.firstenter=false;
		}
//AUTO         iPrintlnBold( " ^5" + player.name + " ^2 picked ^9SNIPER^4!" );
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
//AUTO         player TakeAllWeapons();
//AUTO 	level.activ TakeAllWeapons();
//AUTO 	wait 0.1;
//AUTO         player GiveWeapon( "remington700_mp" );
//AUTO         level.activ GiveWeapon( "remington700_mp" );
//AUTO 	wait 0.1;
//AUTO 	player GiveWeapon( "M40A3_mp" );
//AUTO 	level.activ GiveWeapon( "M40A3_mp" );
//AUTO 	wait 0.1;;
//AUTO 	player switchToWeapon( "remington700_mp" );
//AUTO         level.activ SwitchToWeapon( "remington700_mp" );
        while( isAlive( player ) && isDefined( player ) )
//AUTO             wait 1;
    }
}

