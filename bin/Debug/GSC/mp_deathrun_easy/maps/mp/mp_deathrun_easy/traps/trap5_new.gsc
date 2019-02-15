main()
{
 thread trap1_Initialize();
}

trap1_Initialize()
{
  t1 = getent ("trap5" , "targetname");
	level endon("trigger");
  //red = getent ("trfx1" ,"targetname"); 
  t1 waittill ("trigger");//Pockame az activator zapne past
  t1 delete ();//Dovolime mu to pouze jednou
  
  maps\mp\mp_deathrun_easy\coins::AddCoin( 5, level.coinPrice );
  
  //fx = PlayLoopedFX( level._effect["trapflame"], 1, red.origin );//Zapneme majacek
  trap1_Activate();//A aktivujeme pasti ! 
}

trap1_Activate()
{
for (j = 0; j < 3; j++)//Projedeme radky
{ 
 trapFields=[];//Pole deravych dlazdic
 trapFields=trap1_getRandoms(3/level.mapmode);//3 z 5 jsou drave
 for (i = 1; i < 6; i++)//Projedeme sloupce
 {
  num = (j * 5) + i;//Vypocitame cislo dlazdice - inteligente cislovane :-)                          
  if (trap1_Contains(trapFields,i)==1)//Pokud je tato dlazdice v seznamu deravych
  {
   thread trap1_WaitForPlayer(num); //Pockame na hrace at tam hupsne :-)
  }    
 }
}
}

trap1_WaitForPlayer(i)
{
 trig = getent( "prepadliste_trig"+i , "targetname" );
	level endon("trigger");
 trig waittill ("trigger");
 field = getent("prepadliste"+i , "targetname");
 field delete (); 
 trig delete (); 
}

trap1_getRandoms(count)
{
 trapFields=[];
 for (i=0;i<count+1;i++)
 {    
   while (1)
   {
    random = RandomIntRange(0,6);//nahodne cislo v rozsahu <0;6)
    if (trap1_Contains(trapFields,random)==0)
       {
       trapFields[i]=random;
       break;
       }
   }  
 }
 return trapFields;
}

trap1_Contains (array,member)
{
  for (i=0;i<array.size;i++)
  {
   if (array[i]==member) {
       return 1;}
  }
 return 0;
}   

