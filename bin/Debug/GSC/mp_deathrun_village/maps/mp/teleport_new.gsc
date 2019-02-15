main()
{

  entTransporter = getentarray("enter","targetname");
  if(isdefined(entTransporter))
  {
    for(lp=0;lp<entTransporter.size;lp=lp+1)
      entTransporter[lp] thread Transporter();
  }


}

transporter()
{
  while(true)
  {
   self waittill("trigger",other);
   entTarget = getent(self.target, "targetname");
//AUTO    wait(0.10);
   other setorigin(entTarget.origin);
   other setplayerangles(entTarget.angles);
   self playsound("mp_enemy_obj_captured");
//AUTO    iprintlnbold ("^1**moving**");
//AUTO    wait(0.10);
  }
}

