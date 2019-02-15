
{

thread trap4();

}

trap4()
{
trigger = getent("trigger_trap4","targetname");
	level endon("trigger");
object = getent("trap4","targetname");
killtrigger = getent ("killtrig1" , "targetname");
trigger waittill ("trigger" , player );
trigger delete();
{
killtrigger enablelinkto ();
killtrigger linkto (object);
object moveY(-304, 1);
object waittill("movedone");
wait(2);
object moveY(304, 3);
object waittill("movedone");
wait(0.1);
}
}

