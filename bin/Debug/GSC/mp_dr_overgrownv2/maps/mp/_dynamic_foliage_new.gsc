initdfs()
{
//AUTO 	println("^1Initializing Zweimann's Dynamic Foliage System");

	// There should be three different script_models: trees, foliage and grass, because they're
	// treated in a different way.
	// Consider Grass to grass (obviously) and to very small foliage elements
	// Consider Foliage to midsize foliage
	// classname: script_model
	// targetname: <name>
	// These names were used in Burma 1.1. Change them to whatever you want
	level.dfs_tree_sm_name = "dyn_trees";
	level.dfs_foliage_sm_name = "dyn_foliage";
	level.dfs_grass_sm_name = "dyn_grass";

	// You must set up here Strength of Wind, to simulate higher or lower sway
	// on foliage and trees.
	// 0 means no wind @ all
	// 10 means A HURRICANE : )
	// Recommended values: 0.3 to 0.6. Optimal value: 0.5;
	// Obviously you can setup a dvar or whatever for this

	level.dfs_wind_strength = 0.5;
	// Let's start

	foliage_animation();
	grass_animation();
	tree_animation();
}

tree_animation()
{
	level endon("game_ended");
	// Sway animation for Trees
	// Slower, softer

	entities = getentarray( level.dfs_tree_sm_name, "targetname" );

	vpoint = level.dfs_wind_strength / 1.4;
	vangles = level.dfs_wind_strength / 1.5;
	vtime = ( 6 * ( 1 - level.dfs_wind_strength ) );

	for( i = 0; i < entities.size; i++ )
		{
			factor = randomIntRange( 0, 10 );

			if ( factor >= 5 )
			mmfactor = 1;
			else
			mmfactor = -1;

			vibvector = entities[i].origin + ( ( vpoint * mmfactor ), 0, 0 );
			entities[i] vibrate( vibvector, vangles * mmfactor , vtime, ( ( level.timelimit * 1.2 ) * 60 ) );
			// Tree is damageable now
			entities[i] setcandamage(true);
			// Trees are destroyable, so let's start their threads
			entities[i] thread treethreads();
			wait 0.005;
		}
	}

foliage_animation()
{
	level endon("game_ended");

	// Sway animation for Foliage
	// Stronger
	entities = getentarray( level.dfs_foliage_sm_name, "targetname" );
	vpoint = level.dfs_wind_strength * 1.5;
	vangles = level.dfs_wind_strength * 2;
	vtime = ( ( 1 - level.dfs_wind_strength ) ) * 5;

	mmfactor = 1;

	for( i = 0; i < entities.size; i++ )
	{
		mmfactor *= -1;
		vibvector = entities[i].origin + ( randomFloatRange( 0,90 ) * mmfactor , 0, 0 );
		entities[i] vibrate( vibvector, ( vangles * mmfactor ) , vtime, ( ( level.timelimit * 1.2 ) * 60 ) );
		wait 0.005;
	}
}

grass_animation()
{
	level endon("game_ended");

	// Sway animation for Grass
	// Strongest
	entities = getentarray( level.dfs_grass_sm_name, "targetname" );

	vpoint = level.dfs_wind_strength * 2;
	vangles = level.dfs_wind_strength * 4;
	vtime = ( ( 1 - level.dfs_wind_strength ) ) * 2.5;

	mmfactor = 1;

	for( i = 0; i < entities.size; i++ )
	{
		mmfactor *= -1;
		vibvector = entities[i].origin + ( ( vpoint * mmfactor ), 0, 0 );
		entities[i] vibrate( vibvector, ( vangles * mmfactor ) , vtime, ( ( level.timelimit * 1.2 ) * 60 ) );
		wait 0.005;
	}
}

treethreads()
{
	level endon("game_ended");
	self endon("broken");

	while( !isDefined(self.broken) )
	{
		// You can even play with tagName if you place Trees/Palms with more than one tag
		// Trees could be burned, broken and more.
		// By the moment, they're destroyed and sunk down

		self waittill("damage", damage, attacker, direction_vec, point, mod, modelName, tagName);

		if ( mod != "MOD_RIFLE_BULLET" && mod != "MOD_PISTOL_BULLET" && mod != "MOD_MELEE" )
			if ( damage > 50 )
				self treefall();
	}
}

treefall()
{
	yaw = randomint(360);

	break_angles = (self.angles[0], yaw, self.angles[2]);
	break_vector = anglesToForward(break_angles);
	break_vector = vectorScale(break_vector, 100);
	start = (self.origin + break_vector) + (0, 0, 512);
	end = start + (0, 0, -1024);
	trace = bulletTrace(start, end, false, self);
	dist_vector = ((self.origin + break_vector) - trace["position"]);
	dist = dist_vector[2];
	velocity = 0;
	travelled = 0;
	lasttravelled = travelled;
	count = 0;
	lastcount = count;

	while(travelled < dist)
	{
		velocity = velocity + 340;
		lasttravelled = travelled;
		travelled = travelled + velocity;
		lastcount = count;
		count++;
	}
	remainder = lasttravelled - dist;
	if(remainder < 0)
	remainder = remainder * -1;

	if ( velocity != 0 )
	time = lastcount + (remainder / velocity);
	else
	time = lastcount;
	self moveGravity(break_vector, time);
	self waittill("movedone");
	vec = vectorNormalize(break_vector);
	vec = vectorScale(vec, 320);
	start = (self.origin + vec) + (0, 0, 1024);
	end = start + (0, 0, -1024);
	trace = bulletTrace(start, end, false, self);
	ground = trace["position"];
	treeup_vector = anglesToUp(self.angles);
	treeup_angles = vectortoangles(treeup_vector);
	rest_vector = ground - self.origin;
	rest_angles = vectorToAngles(rest_vector);
	treeorg = spawn("script_origin", self.origin);
	treeorg.origin = self.origin;
	treeorg.angles = (treeup_angles[0], rest_angles[1], rest_angles[2]);

	self linkto(treeorg);

	treeorg rotateTo(rest_angles, 1.15, .5, 0);
	treeorg waittill("rotatedone");
	treeorg rotatepitch(-2.5,.21,.05,.15);
	treeorg waittill("rotatedone");
	treeorg rotatepitch(2.5,.26,.15,.1);
	treeorg waittill("rotatedone");
	self unlink();

	self.broken = 1;
	self notify("broken");
	self setcandamage(false);

}

