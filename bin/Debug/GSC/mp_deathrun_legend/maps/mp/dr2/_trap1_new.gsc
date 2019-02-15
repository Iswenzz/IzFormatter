
{

thread trap1();

}

trap1()
{
trigger = getent("trigger_trap1","targetname");
	level endon("trigger");
object = getent("trap1","targetname");
trigger waittill ("trigger" , player );
trigger delete();
{
object moveY(-560, 0.1);
object waittill("movedone");
wait(3);
object moveY(560, 1);
object waittill("movedone");
wait(0.1);
}
}

