 main()
{
																						

				level._effect["snow"] = loadfx ("custom/snow_quaky");
                maps\mp\_fx::loopfx("snow", (2361, 13600, -1200), 1, (2361, 13600, -1200));
				
			    level._effect["smoke"] = loadfx ("custom/dead_smoke");
                maps\mp\_fx::loopfx("smoke", (2361, 13600, -1200), 5, (2361, 13600, -1200));
				
				level._effect["glow"] = loadfx ("custom/glowing_lights_blue");
                maps\mp\_fx::loopfx("glow", (-640, 13600, -1344), 1, (-640, 13600, -1344));
				
				
}