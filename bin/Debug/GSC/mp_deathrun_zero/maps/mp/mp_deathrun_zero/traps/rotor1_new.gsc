main()
{
thread rotateCylinder1();
}

rotateCylinder1()
{
rotate = getent( "rotor1" , "targetname" );
rotate_trig = getent( "trotor1" , "targetname" );

rotate_trig waittill ("trigger");

while (1)
  {
  rotate RotateYaw( 360, 2, 0.5, 0.5 );
  wait 5;
  }
}

