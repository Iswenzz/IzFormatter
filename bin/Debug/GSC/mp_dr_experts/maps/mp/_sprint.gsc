main()
{
       

   
   addFunc("no_sprint", ::no_sprint);
}

addFunc(targetname, function)
{
   entArray = getEntArray("nosprint", "targetname");

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

         if(isDefined(user.no_sprint))
            continue;

         thread no_sprint(trigger, user);
      }
   }

   user endon("disconnect");

   user.no_sprint = true;

   user iPrintLn("^1No Sprint! ^7Good luck^1!");

   user allowSprint(false);

   for(;user isTouching(trigger);)
      wait 0.05;

   user allowSprint(true);

   user.no_sprint = undefined;
}

