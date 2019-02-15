main() 
{ 
   windfx = loadfx ("props/car_glass_hug"); 
   windtrigs = getentarray("windtrig","targetname"); 
   for(i=0;i<windtrigs.size;i++) 
   { 
      windtrigs[i] thread dowindow(windfx); 
   } 
} 

dowindow(windfx) 
{ 
   targetdamage=80; 
   totaldamage=0; 
   WindowShattered=false; 
   WindowBroken=false; 
   self enablegrenadetouchdamage(); 
   NormalState = getent(self.target,"targetname"); 
   ShatteredState = getent(NormalState.target,"targetname");ShatteredState hide(); 
   BrokenState = getent(shatteredState.target,"targetname");BrokenState hide(); 
   while(!windowbroken) 
   { 
      self waittill ("damage", amount); 
      totaldamage+=amount;       
      if(totaldamage > targetdamage) 
      { 
         WindowBroken=true; 
      } 
      if(!WindowShattered) 
      { 
      NormalState delete(); 
      ShatteredState show(); 
      WindowShattered=true; 
      } 
   } 
   BrokenState show(); 
   self playsound("glass_break"); 
   PlayFX(windfx, BrokenState.origin ); 
   ShatteredState delete(); 
   self delete(); 
} 

