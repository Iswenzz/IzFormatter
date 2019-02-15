main()
{
       

   
//AUTO    addFunc("no_sprint", ::no_sprint);
}

addFunc(targetname, function)
{
//AUTO    entArray = getEntArray("nosprint", "targetname");

   for(idx = 0;idx < entArray.size;idx++)
   {
      if(isDefined(entArray[idx]))
         thread [[function]](entArray[idx]);
   }
}

no_sprint(trigger, user)
{
   if(!isDefined(user))
   {
      for(;;)
      {
         trigger waittill("trigger", user);

//AUTO          if(isDefined(user.no_sprint))
            continue;

//AUTO          thread no_sprint(trigger, user);
      }
   }

   user endon("disconnect");

//AUTO    user.no_sprint = true;

//AUTO    user iPrintLn("^1No Sprint! ^7Good luck^1!");

//AUTO    user allowSprint(false);

   for(;user isTouching(trigger);)
      wait 0.05;

//AUTO    user allowSprint(true);

//AUTO    user.no_sprint = undefined;
}

