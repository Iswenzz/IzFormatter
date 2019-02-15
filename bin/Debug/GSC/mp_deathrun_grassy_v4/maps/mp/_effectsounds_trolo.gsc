main()
{
 
sound_fx_trig_trolo = getentarray ("sound_fx_trig_trolo","targetname");
 
    for(i=0;i<sound_fx_trig_trolo.size;i++)
        {
        sound_fx_trig_trolo[i] thread sound_fx_trig_trolo();
        }
 
}
 
sound_fx_trig_trolo()
{
 
 
sound = "trolo";
 
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
 
ambientplay ( sound );
 
 
 
while(i)
{
 
PlayFx ( fx[i], origin[i].origin );
 
i--;
}
 
}