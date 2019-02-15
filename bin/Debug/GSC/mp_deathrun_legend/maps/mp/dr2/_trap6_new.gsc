
{

thread trap6();

}

trap6()
{
trigger = getent("trigger_trap6","targetname");
	level endon("trigger");
object = getent("trap6","targetname");
object1 = getent("door1","targetname");
object2 = getent("door2","targetname");
killtrigger = getent ("killtrig2" , "targetname");
trigger waittill ("trigger" , player );
trigger delete();
{
killtrigger enablelinkto ();
killtrigger linkto (object);
object1 moveZ(224, 1);
object2 moveZ(224, 1);
wait(1.5);
object movez(80, 1);
object waittill("movedone");
wait(0.5);
object movez(-80, 1);
object1 moveZ(-224, 1);
object2 moveZ(-224, 1);
object waittill("movedone");
object1 waittill("movedone");
object2 waittill("movedone");
wait(0.1);
}
}

