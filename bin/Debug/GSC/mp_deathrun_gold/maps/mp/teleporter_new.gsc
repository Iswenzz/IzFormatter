teleporter()
{

entTransporter = getentarray("enter","targetname");
if(isdefined(entTransporter))
{
for(lp=0;lp<entTransporter.size;lp++)
entTransporter[lp] thread Transporter();
}


}

Transporter()
{
while(true)
{
self waittill("trigger",other);
entTarget = getent(self.target, "targetname");

//AUTO wait(0.10);
other setorigin(entTarget.origin);
other setplayerangles(entTarget.angles);
//AUTO //iprintlnbold ("You have been teleported !!!");
//AUTO wait(0.10);
}
}

