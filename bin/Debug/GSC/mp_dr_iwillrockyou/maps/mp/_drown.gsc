/*
+-------------------------------------------------------------------+
|                                                                   |
|   +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++   |
|   +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++   |
|   ++++|   \++++|  |++++|  |___________|+++++++/        \+++++++   |
|   ++++|    \+++|  |++++|  |++++++++++++++++++/    __    \++++++   |
|   ++++|  \  \++|  |++++|  |+++++++++++++++++/    /++\    \+++++   |
|   ++++|  |\  \+|  |++++|  |___________|++++|    |++++|    |++++   |
|   ++++|  |+\  \|  |++++|  |++++++++++++++++|    |++++|    |++++   |
|   ++++|  |++\  \  |++++|  |+++++++++++++++++\    \++/    /+++++   |
|   ++++|  |+++\    |++++|  |++++++++++++++++++\          /++++++   |
|   ++++|__|++++\___|++++|__|___________|+++++++\________/+++++++   |
|   +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++   |
|   +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++   |
|                                                                   |
+-------------------------------------------------------------------+


IWillRockYou Deathrun Map Script by club27|Neo
mp_dr_iwillrockyou


	 Supported mods: Deathrun
	 Traps: 9
	 Secrets: 4
	 Difficulty: Medium
	 Included songs:
			Papa Roach - Last Resort
			AC/DC - Highway to Hell
			Metallica - For Whom the Bell Tolls
			Manowar - Die for Metal
			Queen - We Will Rock You
	 Author: Neo (club27|Neo)
	 Additional help: AoD'Rycoon (Phaedrean)
	 Closed-beta testers: Dr. Uzi, HunDonTaki, Bhuba, osko, lots of other deathrunners on club27 Deathrun Server
	 Phase: RELEASE (ready playable version, suited for public worldwide usage)
	 [Phase is either: PRE-ALPHA | ALPHA | CLOSED-BETA | OPEN-BETA | RELEASE CANDIDATE | RELEASE]


Copyright (c) club27|Neo | All rights reserved.

PLEASE DO NOT COPY WITHOUT PERMISSION (if you have already extracted it from the .ff),
instead add me on XFire (name: gribmate) and we can talk about it
*/



init(viz, felszin)
{
	level.barsize = 288;
	level.drowntime = 6.5;
	level.hurttime = 4.5;
	
	while (true)
	{
		viz waittill("trigger", other);
		
		if (IsPlayer(other) && other IsTouching(viz)) other thread Drown(viz, felszin);
	}
}


Drown(trigger, felszin)
{
	water_vision = undefined;
	while (self IsTouching(trigger) && !self IsTouching(felszin))
	{
		wait 0.125;
		if (IsDefined(self.drowning)) return;		
		self.drowning = true;

		if (!IsDefined(water_vision))
		{
			water_vision = NewClientHudElem(self);
			water_vision.x = 0;
			water_vision.y = 0;
			water_vision SetShader ("white", 640, 480);
			water_vision.alignX = "left";
			water_vision.alignY = "top";
			water_vision.horzAlign = "fullscreen";
			water_vision.vertAlign = "fullscreen";
			water_vision.color = (0.2, 0.4, 0.8);
			water_vision.alpha = 0.5;
		}


		level.barincrement = (level.barsize / (20 * level.drowntime));
		if (!IsDefined(self.progressbackground))
		{
			self.progressbackground = NewClientHudElem(self);				
			self.progressbackground.alignX = "center";
			self.progressbackground.alignY = "middle";
			self.progressbackground.x = 320;
			self.progressbackground.y = 385;
			self.progressbackground.alpha = 0.5;
		}
		self.progressbackground SetShader("black", (level.barsize + 4), 14);		

		if(!IsDefined(self.progressbar))
		{
			self.progressbar = NewClientHudElem(self);				
			self.progressbar.alignX = "left";
			self.progressbar.alignY = "middle";
			self.progressbar.x = (320 - (level.barsize / 2));
			self.progressbar.y = 385;
		}
		self.progressbar SetShader("white", 0, 8);			
		self.progressbar ScaleOverTime(level.drowntime, level.barsize, 8);

		self.progresstime = 0;
		f = 0;
	
		while (IsAlive(self) && self IsTouching(trigger) && !self IsTouching(felszin) && (self.progresstime < level.drowntime))
		{		
			f++;
			wait 0.05;
			self.progresstime += 0.05;
			if (self.progresstime >= level.hurttime)					
			{
				if (f >= 4)
				{
					RadiusDamage(self.origin,9, 1, 1);
					f = 0;
				}
			}
		}

		if (IsAlive(self) && self IsTouching(trigger) && !self IsTouching(felszin) && (self.progresstime >= level.drowntime))
		{
			self.progressbackground Destroy();
			self.progressbar Destroy();
			wait 0.025;
			RadiusDamage(self.origin,22, 3000, 3000);
			self.drowning = undefined;
			self.sounder = undefined;
			wait 0.05;
			water_vision Destroy();
		}
		else
		{
			water_vision.alpha = .5;
			water_vision.alpha = 0;
			wait 0.05;
			self.progressbackground Destroy();
			self.progressbar Destroy();
			self.drowning = undefined;
			self.sounder = undefined;
		}			
		wait 0.05;
	}
}