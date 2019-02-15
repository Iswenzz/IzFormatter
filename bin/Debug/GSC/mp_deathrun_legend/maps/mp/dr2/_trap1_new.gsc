
{

thread trap1();

}

trap1()
{
trigger = getent("trigger_trap1","targetname");
object = getent("trap1","targetname");
/* AUTO trigger waittill ("trigger" , player );
trigger delete();
{
object moveY(-560, 0.1);
object waittill("movedone");
wait(3);
object moveY(560, 1);
object waittill("movedone");
wait(0.1);
}
*/}

