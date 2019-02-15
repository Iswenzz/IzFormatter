
{

thread trap7();

}

trap7()
{     
          trigger = getEnt("trigger_trap7","targetname");
	level endon("trigger");
          brush = getEnt("trap7","targetname");

          trigger waittill("trigger");
          trigger delete();

          while(true)
          {
                 brush rotateYaw(360,1);
                 wait 1;
          }
}

