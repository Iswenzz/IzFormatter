
{

thread endoor();

}

endoor()
{
level.oldtrigger = getent("trigger_endoor","targetname");
object  = getent("endoor","targetname");
level.oldtrigger waittill ("trigger" , player );
level.oldtrigger delete();
level.knife_trig delete();
level.jump_trig delete();
level.snipe_trig delete();
{
//AUTO iprintlnbold (" ^7" + player.name + " ^4Open ^3Finall ^4Door!");
object movex(192, 1);
object waittill("movedone");
wait(1);
}
}

