init()
{
	level.scoreInfo = [];
	level.rankTable = [];

	precacheShader("white");

	precacheString( &"RANK_PLAYER_WAS_PROMOTED_N" );
	precacheString( &"RANK_PLAYER_WAS_PROMOTED" );
	precacheString( &"RANK_PROMOTED" );
	precacheString( &"MP_PLUS" );
	precacheString( &"BRAXI_CHARACTER_NEW" );
	precacheString( &"BRAXI_SPRAY_NEW" );

	// score info
	registerScoreInfo( "kill", 50 );
	registerScoreInfo( "headshot", 100 );
	registerScoreInfo( "melee", 75 );
	registerScoreInfo( "activator", 25 );
	registerScoreInfo( "trap_activation", 5 );
	registerScoreInfo( "jumper_died", 10 );

	registerScoreInfo( "win", 20 );
	registerScoreInfo( "loss", 10 );
	registerScoreInfo( "tie", 25 );

	level.maxRank = int(tableLookup( "mp/rankTable.csv", 0, "maxrank", 1 ));
	level.maxPrestige = int(tableLookup( "mp/rankIconTable.csv", 0, "maxprestige", 1 ));
	
	pId = 0;
	rId = 0;
	for ( pId = 0; pId <= level.maxPrestige; pId++ )
	{
		for ( rId = 0; rId <= level.maxRank; rId++ )
			precacheShader( tableLookup( "mp/rankIconTable.csv", 0, rId, pId+1 ) );
	}

	rankId = 0;
	rankName = tableLookup( "mp/ranktable.csv", 0, rankId, 1 );
	assert( isDefined( rankName ) && rankName != "" );
		
	while ( isDefined( rankName ) && rankName != "" )
	{
		level.rankTable[rankId][1] = tableLookup( "mp/ranktable.csv", 0, rankId, 1 );
		level.rankTable[rankId][2] = tableLookup( "mp/ranktable.csv", 0, rankId, 2 );
		level.rankTable[rankId][3] = tableLookup( "mp/ranktable.csv", 0, rankId, 3 );
		level.rankTable[rankId][7] = tableLookup( "mp/ranktable.csv", 0, rankId, 7 );

		precacheString( tableLookupIString( "mp/ranktable.csv", 0, rankId, 16 ) );

		rankId++;
		rankName = tableLookup( "mp/ranktable.csv", 0, rankId, 1 );		
	}

	level thread onPlayerConnect();
}

isRegisteredEvent( type )
{
	if ( isDefined( level.scoreInfo[type] ) )
		return true;
	else
		return false;
}

registerScoreInfo( type, value )
{
	level.scoreInfo[type]["value"] = value;
}

getScoreInfoValue( type )
{
	return ( level.scoreInfo[type]["value"] );
}

getScoreInfoLabel( type )
{
	return ( level.scoreInfo[type]["label"] );
}

getRankInfoMinXP( rankId )
{
	return int(level.rankTable[rankId][2]);
}

getRankInfoXPAmt( rankId )
{
	return int(level.rankTable[rankId][3]);
}

getRankInfoMaxXp( rankId )
{
	return int(level.rankTable[rankId][7]);
}

getRankInfoFull( rankId )
{
	return tableLookupIString( "mp/ranktable.csv", 0, rankId, 16 );
}

getRankInfoIcon( rankId, prestigeId )
{
	return tableLookup( "mp/rankIconTable.csv", 0, rankId, prestigeId+1 );
}

getRankInfoUnlockWeapon( rankId )
{
	return tableLookup( "mp/ranktable.csv", 0, rankId, 8 );
}

getRankInfoUnlockPerk( rankId )
{
	return tableLookup( "mp/ranktable.csv", 0, rankId, 9 );
}

getRankInfoUnlockChallenge( rankId )
{
	return tableLookup( "mp/ranktable.csv", 0, rankId, 10 );
}

getRankInfoUnlockFeature( rankId )
{
	return tableLookup( "mp/ranktable.csv", 0, rankId, 15 );
}

getRankInfoUnlockCamo( rankId )
{
	return tableLookup( "mp/ranktable.csv", 0, rankId, 11 );
}

getRankInfoUnlockAttachment( rankId )
{
	return tableLookup( "mp/ranktable.csv", 0, rankId, 12 );
}

getRankInfoLevel( rankId )
{
	return int( tableLookup( "mp/ranktable.csv", 0, rankId, 13 ) );
}

onPlayerConnect()
{
	for(;;)
	{
		level waittill( "connected", player );

		player.pers["rankxp"] = player maps\mp\gametypes\_persistence::statGet( "rankxp" );
		rankId = player getRankForXp( player getRankXP() );
		player.pers["rank"] = rankId;
		player.pers["participation"] = 0;
		player.doingNotify = false;

		player.rankUpdateTotal = 0;
		
		// for keeping track of rank through stat#251 used by menu script
		// attempt to move logic out of menus as much as possible
		player.cur_rankNum = rankId;
		assertex( isdefined(player.cur_rankNum), "rank: "+ rankId + " does not have an index, check mp/ranktable.csv" );
		player setStat( 251, player.cur_rankNum );
		
		prestige = 0;
//AUTO 		player setRank( rankId, prestige );
		player.pers["prestige"] = prestige;

		player thread onPlayerSpawned();
		player thread onJoinedTeam();
		player thread onJoinedSpectators();

		
		if ( rankId > 1 && rankId != player getstat(253) )
		{
//AUTO 			iPrintlnBold( "^1" + player.name + " ^1tried to hack rank >:(" );
			rankId = player getRankForXp( 1 );
//AUTO 			player setRank( rankId, 0 );
			player.pers["rank"] = rankId;
			player.pers["rankxp"] = 1;
			player maps\mp\gametypes\_persistence::statSet( "rankxp", 1 );
			player updateRank( rankId );

			player setClientDvars( "ui_dr_info", "^1It appears you didn't earn your rank.", "ui_dr_info2", "^1Your rank was reseted." );
			player braxi\_common::clientCmd( "wait 100;disconnect" );
		}
		updateRankStats( player, rankId );
	}
}

onJoinedTeam()
{
	self endon("disconnect");

	for(;;)
	{
		self waittill("joined_team");
		self thread removeRankHUD();
	}
}

onJoinedSpectators()
{
	self endon("disconnect");

	for(;;)
	{
		self waittill("joined_spectators");
		self thread removeRankHUD();
	}
}

onPlayerSpawned()
{
	self endon("disconnect");

	for(;;)
	{
		self waittill("spawned_player");

		if(!isdefined(self.hud_rankscroreupdate))
		{
			self.hud_rankscroreupdate = newClientHudElem(self);
			self.hud_rankscroreupdate.horzAlign = "center";
			self.hud_rankscroreupdate.vertAlign = "middle";
			self.hud_rankscroreupdate.alignX = "center";
			self.hud_rankscroreupdate.alignY = "middle";
	 		self.hud_rankscroreupdate.x = 0;
			self.hud_rankscroreupdate.y = -60;
			self.hud_rankscroreupdate.font = "default";
			self.hud_rankscroreupdate.fontscale = 2.0;
			self.hud_rankscroreupdate.archived = false;
			self.hud_rankscroreupdate.color = (0.5,0.5,0.5);
			self.hud_rankscroreupdate maps\mp\gametypes\_hud::fontPulseInit();
		}
	}
}

roundUp( floatVal )
{
	if ( int( floatVal ) != floatVal )
		return int( floatVal+1 );
	else
		return int( floatVal );
}

giveRankXP( type, value )
{
	self endon("disconnect");

	if ( !isDefined( value ) )
		value = getScoreInfoValue( type );

	self.score += value;
	self.pers["score"] = self.score;

	score = self maps\mp\gametypes\_persistence::statGet( "score" );
	self maps\mp\gametypes\_persistence::statSet( "score", score+value );

	self incRankXP( value );
	self thread updateRankScoreHUD( value );
}

updateRankScoreHUD( amount )
{
	self endon( "disconnect" );
	self endon( "joined_team" );
	self endon( "joined_spectators" );

	if ( amount == 0 )
		return;

	self notify( "update_score" );
	self endon( "update_score" );

	self.rankUpdateTotal += amount;

	wait ( 0.05 );

	if( isDefined( self.hud_rankscroreupdate ) )
	{			
		if ( self.rankUpdateTotal < 0 )
		{
			self.hud_rankscroreupdate.label = &"";
			self.hud_rankscroreupdate.color = (1,0,0);
		}
		else
		{
			self.hud_rankscroreupdate.label = &"MP_PLUS";
			self.hud_rankscroreupdate.color = (1,1,0.5);
		}

		self.hud_rankscroreupdate setValue(self.rankUpdateTotal);
		self.hud_rankscroreupdate.alpha = 0.85;
		self.hud_rankscroreupdate thread maps\mp\gametypes\_hud::fontPulse( self );

		wait 1;
		self.hud_rankscroreupdate fadeOverTime( 0.75 );
		self.hud_rankscroreupdate.alpha = 0;
		
		self.rankUpdateTotal = 0;
	}
}

removeRankHUD()
{
	if(isDefined(self.hud_rankscroreupdate))
		self.hud_rankscroreupdate.alpha = 0;
}

getRank()
{	
	rankXp = self.pers["rankxp"];
	rankId = self.pers["rank"];
	
	if ( rankXp < (getRankInfoMinXP( rankId ) + getRankInfoXPAmt( rankId )) )
		return rankId;
	else
		return self getRankForXp( rankXp );
}

getRankForXp( xpVal )
{
	rankId = 0;
	rankName = level.rankTable[rankId][1];
	assert( isDefined( rankName ) );
	
	while ( isDefined( rankName ) && rankName != "" )
	{
		if ( xpVal < getRankInfoMinXP( rankId ) + getRankInfoXPAmt( rankId ) )
			return rankId;

		rankId++;
		if ( isDefined( level.rankTable[rankId] ) )
			rankName = level.rankTable[rankId][1];
		else
			rankName = undefined;
	}
	
	rankId--;
	return rankId;
}

getSPM()
{
	rankLevel = (self getRank() % 61) + 1;
	return 3 + (rankLevel * 0.5);
}

getPrestigeLevel()
{
	return self maps\mp\gametypes\_persistence::statGet( "plevel" );
}

getRankXP()
{
	return self.pers["rankxp"];
}

incRankXP( amount )
{	
	xp = self getRankXP();
	newXp = (xp + amount);
	
	if( level.dvar["dev"] )
	{
//AUTO 		iprintln( "getRankXP() : " + xp );
//AUTO 		iprintln( "newXp : " + newXp );
	}

	if ( self.pers["rank"] == level.maxRank && newXp >= getRankInfoMaxXP( level.maxRank ) )
		newXp = getRankInfoMaxXP( level.maxRank );

	self.pers["rankxp"] = newXp;
	self maps\mp\gametypes\_persistence::statSet( "rankxp", newXp );

	rankId = self getRankForXp( self getRankXP() );
	self updateRank( rankId );
}

updateRank( rankId )
{
	if( getRankInfoMaxXP( self.pers["rank"] ) <= self getRankXP() && self.pers["rank"] < level.maxRank )
	{
		rankId = self getRankForXp( self getRankXP() );
//AUTO 		self setRank( rankId, 0 );
		self.pers["rank"] = rankId;
		self updateRankAnnounceHUD();
		// comming in 1.1
		//unlockedChallenge = self getRankInfoUnlockChallenge( rankId );
		//if ( isDefined( unlockedChallenge ) && unlockedChallenge != "" )
		//	self braxi\_missions::unlockChallenge( unlockedChallenge );
	}
	updateRankStats( self, rankId );
}

updateRankStats( player, rankId )
{
	player setStat( 253, rankId );
	player maps\mp\gametypes\_persistence::statSet( "rank", rankId );
	player maps\mp\gametypes\_persistence::statSet( "minxp", getRankInfoMinXp( rankId ) );
	player maps\mp\gametypes\_persistence::statSet( "maxxp", getRankInfoMaxXp( rankId ) );
	//player maps\mp\gametypes\_persistence::statSet( "lastxp", player.pers["rankxp"] );
	
	if( rankId > level.maxRank )
		player setStat( 252, level.maxRank );
	else
		player setStat( 252, rankId );
}

updateRankAnnounceHUD()
{
	self endon("disconnect");

	self notify("update_rank");
	self endon("update_rank");

	team = self.pers["team"];
	if ( !isdefined( team ) )
		return;	
	
	self notify("reset_outcome");
	newRankName = self getRankInfoFull( self.pers["rank"] );
	
	notifyData = spawnStruct();
	notifyData.titleText = &"RANK_PROMOTED";
	notifyData.iconName = self getRankInfoIcon( self.pers["rank"], self.pers["prestige"] );
	notifyData.sound = "mp_level_up";
	notifyData.duration = 4.0;
	
	rank_char = level.rankTable[self.pers["rank"]][1];
	subRank = int(rank_char[rank_char.size-1]);	

	/*if ( subRank == 2 )
	{
		notifyData.textLabel = newRankName;
		notifyData.notifyText = &"RANK_ROMANI";
		notifyData.textIsString = true;
	}
	else if ( subRank == 3 )
	{
		notifyData.textLabel = newRankName;
		notifyData.notifyText = &"RANK_ROMANII";
		notifyData.textIsString = true;
	}*/
	//else
	//{
		notifyData.notifyText = newRankName;
	//}

	thread maps\mp\gametypes\_hud_message::notifyMessage( notifyData );
	self thread unlockSpray();
	self thread unlockCharacter();
	self thread unlockItem();

/*	

	if ( subRank > 1 )
		return;
*/	
	for ( i = 0; i < level.players.size; i++ )
	{
		player = level.players[i];
		playerteam = player.pers["team"];
		if ( isdefined( playerteam ) && player != self )
		{
			if ( playerteam == team )
//AUTO 				player iprintln( &"RANK_PLAYER_WAS_PROMOTED", self, newRankName );
		}
	}
}

processXpReward( sMeansOfDeath, attacker, victim )
{
	if( attacker.pers["team"] == victim.pers["team"] )
		return;

	kills = attacker maps\mp\gametypes\_persistence::statGet( "kills" );
	attacker maps\mp\gametypes\_persistence::statSet( "kills", kills+1 );

	if( victim.pers["team"] == "allies" )
	{
		kills = attacker maps\mp\gametypes\_persistence::statGet( "KILLED_JUMPERS" );
		attacker maps\mp\gametypes\_persistence::statSet( "KILLED_JUMPERS", kills+1 );
	}	
	else
	{
		kills = attacker maps\mp\gametypes\_persistence::statGet( "KILLED_ACTIVATORS" );
		attacker maps\mp\gametypes\_persistence::statSet( "KILLED_ACTIVATORS", kills+1 );
	}	

	switch( sMeansOfDeath )
	{
		case "MOD_HEAD_SHOT":
			attacker.pers["headshots"]++;
//AUTO 			attacker braxi\_rank::giveRankXP( "headshot" );
			hs = attacker maps\mp\gametypes\_persistence::statGet( "headshots" );
			attacker maps\mp\gametypes\_persistence::statSet( "headshots", hs+1 );
			break;
		case "MOD_MELEE":
			attacker.pers["knifes"]++;
//AUTO 			attacker braxi\_rank::giveRankXP( "melee" );
			knife = attacker maps\mp\gametypes\_persistence::statGet( "MELEE_KILLS" );
			attacker maps\mp\gametypes\_persistence::statSet( "MELEE_KILLS", knife+1 );
			break;
		default:
			pistol = attacker maps\mp\gametypes\_persistence::statGet( "PISTOL_KILLS" );
			attacker maps\mp\gametypes\_persistence::statSet( "PISTOL_KILLS", pistol+1 );
//AUTO 			attacker braxi\_rank::giveRankXP( "kill" );
			break;
	}
}

unlockSpray()
{
	unlock = false;
	for( i = 0; i < level.numSprays+1; i++ )
	{
		if( level.sprayInfo[i].rank >= self.pers["rank"] )
		{
			unlock = true;
			break;
		}
	}

	if( unlock )
	{
		notifyData = spawnStruct();
		notifyData.titleText = &"BRAXI_SPRAY_NEW";
		notifyData.duration = 2.2;
		self thread maps\mp\gametypes\_hud_message::notifyMessage( notifyData );
	}
}

isSprayUnlocked( num )
{
	if( num > level.numSprays || num <= -1)
		return false;
	if( self.pers["rank"] >= level.sprayInfo[num].rank )
		return true;
	return false;
}

unlockCharacter()
{
	unlock = false;
	for( i = 0; i < level.numCharacters+1; i++ )
	{
		if( level.characterInfo[i].rank >= self.pers["rank"] )
		{
			unlock = true;
			break;
		}
	}

	if( unlock )
	{
		notifyData = spawnStruct();
		notifyData.titleText = "New Character Unlocked!";
		notifyData.duration = 2.2;
		self thread maps\mp\gametypes\_hud_message::notifyMessage( notifyData );
	}
}

isCharacterUnlocked( num )
{
	if( num > level.numCharacters || num <= -1)
		return false;
	if( self.pers["rank"] >= level.characterInfo[num].rank )
		return true;
	return false;
}

unlockItem()
{
	unlock = false;
	for( i = 0; i < level.numItems+1; i++ )
	{
		if( level.itemInfo[i].rank >= self.pers["rank"] )
		{
			unlock = true;
			break;
		}
	}

	if( unlock )
	{
		notifyData = spawnStruct();
		notifyData.titleText = "New Weapon Unlocked!";
		notifyData.duration = 2.2;
		self thread maps\mp\gametypes\_hud_message::notifyMessage( notifyData );
	}
}

isItemUnlocked( num )
{
	if( num > level.numItems || num <= -1)
		return false;
	if( self.pers["rank"] >= level.itemInfo[num].rank )
		return true;
	return false;
}

rankStuff()
{
	self.special = spawnStruct();
	if( getStat(981) )
		self.pers["weapon"] = "deserteagle_mp";
}

