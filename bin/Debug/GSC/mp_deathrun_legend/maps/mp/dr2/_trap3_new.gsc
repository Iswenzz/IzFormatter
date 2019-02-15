
{

thread trap3();

}

trap3()
{
trigger = getent("trigger_trap3","targetname");
	level endon("trigger");
object = getent("trap3","targetname");
killtrigger = getent ("killtrig" , "targetname");
trigger waittill ("trigger" , player );
trigger delete();
{
killtrigger enablelinkto ();
killtrigger linkto (object);
object moveX(-208, 1);
object waittill("movedone");
wait(1.5);
object moveX(208, 3);
object waittill("movedone");
wait(0.1);
}
}

