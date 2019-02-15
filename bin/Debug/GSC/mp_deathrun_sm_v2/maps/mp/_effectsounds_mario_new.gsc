main()
{
 
sound_fx_trig = getentarray ("sound_fx_trig","targetname");
 
    for(i=0;i<sound_fx_trig.size;i++)
        {
        sound_fx_trig[i] thread sound_fx_trig();
        }
 
}

sound_fx_trig()
{
 
 
sound = "clear";
 
standard_fx = loadfx ("smoke/steam_large_vent");
 
 
 
targets = true;
i = 1;
 
origin[i] = getent (self.target ,"targetname");
if( IsDefined( origin[i].script_fxid ) )
fx[i] = loadfx (origin[i].script_fxid);
else
fx[i] = standard_fx;
 
while(targets)
{i++;

 
origin[i] = getent (origin[i - 1].target ,"targetname");
if( IsDefined( origin[i].script_fxid ) )
fx[i] = loadfx (origin[i].script_fxid);
else
fx[i] = standard_fx;
 
 
if( !IsDefined( origin[i].target ) )
targets = false;
}
 
 
 
 
 
self waittill( "trigger" );
 
//AUTO ambientplay ( sound );
 
 
 
while(i)
{
 
PlayFx ( fx[i], origin[i].origin );
 
i--;
}
 
}

