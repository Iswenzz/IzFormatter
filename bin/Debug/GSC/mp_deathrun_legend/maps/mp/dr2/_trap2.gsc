main()

{

thread rotate();

}

rotate()
{     
          trig = getEnt("trigger_rotate","targetname");
          brush = getEnt("rotate","targetname");

          trig waittill("trigger");
          trig delete();

          while(true)
          {
                 brush rotatePitch(360,3);
                 wait 1;
          }
}