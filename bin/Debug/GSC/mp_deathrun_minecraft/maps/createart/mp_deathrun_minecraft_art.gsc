main()
{
	level.tweakfile = true;
 
	setdvar( "scr_fog_disable", "0" );
	setExpFog( 250, 1000, 0.501961, 0.501961, 0.45098, 0 );
	VisionSetNaked( "mp_deathrun_minecraft", 0 );
}

