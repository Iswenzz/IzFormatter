main()
{

	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
maps\mp\_load::main();

//AUTO //maps\mp\_compass::setupMiniMap("compass_map_mp_dr_bananaphone");

//setExpFog(500, 3500, .5, 0.5, 0.45, 0);
//AUTO ambientPlay("ambient_middleeast_ext");
//VisionSetNaked( "mp_vacant" );

game["allies"] = "marines"; 
game["axis"] = "opfor"; 

game["attackers"] = "axis";
game["allies_soldiertype"] = "desert"; 
game["defenders"] = "allies";
game["axis_soldiertype"] = "desert"; 
setdvar( "r_specularcolorscale", "1" );

setdvar("r_glowbloomintensity0",".1");
setdvar("r_glowbloomintensity1",".1");
setdvar("r_glowskybleedintensity0",".1");
//setdvar("compassmaxrange","1500");
level.begindoor = true;
level.liftwait = false;
level.floor = 1;
level.liftstand = true;
level.sex = false;
level.lift = false;
level.secret = false;
level.roep1 = false;
level.roep2 = false;
level.roep3 = false;
level.busy = false;
deur1 = getEnt("liftdeur1", "targetname");
deur2 = getEnt("liftdeur2", "targetname");
deur3 = getEnt("liftdeur3", "targetname");
deur4 = getEnt("liftdeur4", "targetname");
deur5 = getEnt("liftdeur5", "targetname");
deur6 = getEnt("liftdeur6", "targetname");
deur7 = getEnt("liftdeur7", "targetname");
deur8 = getEnt("liftdeur8", "targetname");
liftdood1 = getEnt("doodlift1", "targetname");
liftdood2 = getEnt("doodlift2", "targetname");
liftdood1 enableLinkTo();
liftdood2 enableLinkTo();
liftdood1 linkTo(deur1);
liftdood2 linkTo(deur2);
liftdood3 = getEnt("doodlift3", "targetname");
liftdood4 = getEnt("doodlift4", "targetname");
liftdood3 enableLinkTo();
liftdood4 enableLinkTo();
liftdood3 linkTo(deur5);
liftdood4 linkTo(deur6);
liftdood5 = getEnt("doodlift5", "targetname");
liftdood6 = getEnt("doodlift6", "targetname");
liftdood5 enableLinkTo();
liftdood6 enableLinkTo();
liftdood5 linkTo(deur7);
liftdood6 linkTo(deur8);
level.elevatorDown = false; // elevator start op de bodem. true/false
level.elevatorMoving = false; // elevator beweegd constant. true/false
thread begindoor();
thread trap1aan();
roep1 = getEnt("roep1", "targetname");
roep2 = getEnt("roep2", "targetname");
roep3 = getEnt("roep3", "targetname");
sex1 = getEnt("roep1", "targetname");
sex1 = getEnt("roep2", "targetname");
knoptrigger = getEnt("liftknoptrigger", "targetname");
knoptrigger setHintString("Press [Use] to move the elevator");
thread liftactivator();
thread secret();
thread roep1();
thread roep2();
thread roep3();
thread trap2();
thread lift();
thread trap3();
thread trap4();
thread begin1();
thread begin2();
thread zwaai1();
thread zwaai2();
thread zwaai3();
thread trap5();
thread trap6bewegen();
thread trap6();
thread trap7();
thread trap8();
thread trap9();
thread trap10();
thread einddeur();
addTriggerToList( "use1" );
addTriggerToList( "use2" );
addTriggerToList( "use3" );
addTriggerToList( "use4" );
addTriggerToList( "use5" );
addTriggerToList( "use6" );
addTriggerToList( "use7" );
addTriggerToList( "use8" );
addTriggerToList( "use9" );
addTriggerToList( "use10" );
}

addTriggerToList( name )
{
   if( !isDefined( level.trapTriggers ) )
      level.trapTriggers = [];
   level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

}
trap10(){
trap101 = getEnt("trap101", "targetname");
trap102 = getEnt("trap102", "targetname");
trap103 = getEnt("trap103", "targetname");
trap104 = getEnt("trap104", "targetname");
use10 = getEnt("use10", "targetname");
use10 setHintString("Press [Use] to activate the trap");
use10 waittill("trigger", player);
use10 setHintString("");
weggaan = randomIntRange(0,2);
if(weggaan == 0){
trap101 hide();
trap101 notSolid();
trap103 hide();
trap103 notSolid();
}
if(weggaan == 1){
trap102 hide();
trap102 notSolid();
trap104 hide();
trap104 notSolid();
}
}

trap9()
{
trap9 = getEnt("trap9", "targetname");
	level endon("trigger");
use9 = getEnt("use9", "targetname");
use9 setHintString("Press [Use] to activate the trap");
use9 waittill("trigger", player);
trap9 rotateYaw(3600,5);
use9 setHintString("");
}

}
trap8(){
trap8 = getEnt("trap8", "targetname");
use8 = getEnt("use8", "targetname");
use8 setHintString("Press [Use] to activate the trap");
use8 waittill("trigger", player);
use8 setHintString("");
trap8 moveZ(352,0.5);
trap8 waittill("movedone");
wait(1);
trap8 moveZ(-352,1);
}

}
trap7(){
trap71 = getEnt("trap71", "targetname");
trap72 = getEnt("trap72", "targetname");
use7 = getEnt("use7", "targetname");
use7 setHintString("Press [Use] to activate the trap");
use7 waittill("trigger", player);
trap71 moveX(-136,1);
trap72 moveX(136,1);
wait(2);
use7 waittill("trigger", player);
use7 setHintString("");
trap71 moveX(136,1);
trap72 moveX(-136,1);
}

}
einddeur(){
edeur = getEnt("edeur", "targetname");
einduse = getEnt("einduse", "targetname");
einduse setHintString("Press [Use] to open the door");
einduse waittill("trigger", player);
//AUTO iPrintLnBold("^3The ^1bananaphone ^3got picked up by ^1"+player.name+" ^3WOOT:D");
einduse setHintString("");
edeur moveZ(264, 1);
AmbientStop(1);
wait(1);
//AUTO ambientPlay("eindlied");
}

}
trap6(){
trap61 = getEnt("trap61", "targetname");
trap62 = getEnt("trap62", "targetname");
trap63 = getEnt("trap63", "targetname");
use6 = getEnt("use6", "targetname");
use6 setHintString("Press [Use] to activate the trap");
trap62 enableLinkTo();
trap62 linkTo(trap61);
trap63 linkTo(trap61);
use6 waittill("trigger", player);
use6 setHintString("");
trap61 moveX(-160, 1);
trap61 waittill("movedone");
wait(2);
trap61 moveX(160, 1);
}

}
trap6bewegen(){
trap6 = getEnt("trap6", "targetname");
while(1){
trap6 moveY(336, 2);
trap6 waittill("movedone");
wait(2);
trap6 moveY(-336, 2);
trap6 waittill("movedone");
wait(2);
}
}

}
roep1(){
lifta = getEnt("liftactivator", "targetname");
deur1 = getEnt("liftdeur1", "targetname");
deur2 = getEnt("liftdeur2", "targetname");
deur3 = getEnt("liftdeur3", "targetname");
deur4 = getEnt("liftdeur4", "targetname");
deur5 = getEnt("liftdeur5", "targetname");
deur6 = getEnt("liftdeur6", "targetname");
deur7 = getEnt("liftdeur7", "targetname");
deur8 = getEnt("liftdeur8", "targetname");
roep1 = getEnt("roep1", "targetname");
roep2 = getEnt("roep2", "targetname");
roep3 = getEnt("roep3", "targetname");
sex1 = getEnt("sex1", "targetname");
sex2 = getEnt("sex2", "targetname");
roep1 setHintString("Press [Use] to call the elevator");
knop = getEnt("liftknop", "targetname");
knoptrigger = getEnt("liftknoptrigger", "targetname");
while(1){
roep1 waittill ("trigger", player);
if(level.floor != 1){
if(level.busy){
//AUTO //iPrintLnBold("Lift is busy");
wait 0.1;
continue;
}
level.busy = true;
level.roep1 = true;
if(level.floor == 2){
deur5 moveY(-78,0.5);
deur3 moveY(-78,0.5);
deur6 moveY(85,0.5);
deur4 moveY(85,0.5);
deur5 waittill("movedone");
lifta moveZ(-272, 0.1);
knop moveZ(-272, 0.1);
deur3 moveZ(-272, 0.1);
deur4 moveZ(-272, 0.1);
deur3 waittill("movedone");
deur1 moveY(78,0.5);
deur3 moveY(78,0.5);
deur2 moveY(-85,0.5);
deur4 moveY(-85,0.5);
deur1 waittill("movedone");
level.liftstand = true;
level.sex = false;
level.roep1 = false;
level.floor = 1;
} else if(level.floor == 3) {
deur7 moveY(-78,0.5);
deur3 moveY(-78,0.5);
deur8 moveY(85,0.5);
deur4 moveY(85,0.5);
deur7 waittill("movedone");

lifta moveZ(-272-148, 0.1);
knop moveZ(-272-148, 0.1);
deur3 moveZ(-272-148, 0.1);
deur4 moveZ(-272-148, 0.1);
deur3 waittill("movedone");

deur1 moveY(78,0.5);
deur3 moveY(78,0.5);
deur2 moveY(-85,0.5);
deur4 moveY(-85,0.5);
deur1 waittill("movedone");
level.liftstand = true;
level.sex = false;
level.roep1 = false;
level.floor = 1;
}
level.busy = false;
} else { 
//AUTO //iPrintLnBold("The elevator is already on floor 1");
}
wait(0.01);
} 
}


roep2(){
lifta = getEnt("liftactivator", "targetname");
deur1 = getEnt("liftdeur1", "targetname");
deur2 = getEnt("liftdeur2", "targetname");
deur3 = getEnt("liftdeur3", "targetname");
deur4 = getEnt("liftdeur4", "targetname");
deur5 = getEnt("liftdeur5", "targetname");
deur6 = getEnt("liftdeur6", "targetname");
deur7 = getEnt("liftdeur7", "targetname");
deur8 = getEnt("liftdeur8", "targetname");
roep1 = getEnt("roep1", "targetname");
roep2 = getEnt("roep2", "targetname");
roep3 = getEnt("roep3", "targetname");
sex1 = getEnt("sex1", "targetname");
sex2 = getEnt("sex2", "targetname");
knop = getEnt("liftknop", "targetname");
knoptrigger = getEnt("liftknoptrigger", "targetname");
knoptrigger linkTo(knop);
roep2 setHintString("Press [Use] to call the elevator");
while(1){
roep2 waittill("trigger", player);
if(level.floor != 2){
if(level.busy){
//AUTO //iPrintLnBold("Lift is busy");
wait 0.1;
continue;
}
level.busy = true;
if(level.floor == 1){
level.liftwait = true;
deur1 moveY(-78,0.5);
deur3 moveY(-78,0.5);
deur2 moveY(85,0.5);
deur4 moveY(85,0.5);
deur1 waittill("movedone");
lifta moveZ(272, 0.1);
knop moveZ(272, 0.1);
deur3 moveZ(272, 0.1);
deur4 moveZ(272, 0.1);
deur3 waittill("movedone");
deur5 moveY(78,0.5);
deur3 moveY(78,0.5);
deur6 moveY(-85,0.5);
deur4 moveY(-85,0.5);
deur5 waittill("movedone");
level.liftstand = false;
level.sex = false;
level.roep2 = false;
level.floor = 2;
}
if(level.floor == 3){
level.liftwait = true;
deur7 moveY(-78,0.5);
deur3 moveY(-78,0.5);
deur8 moveY(85,0.5);
deur4 moveY(85,0.5);
deur7 waittill("movedone");
lifta moveZ(-148, 0.1);
knop moveZ(-148, 0.1);
deur3 moveZ(-148, 0.1);
deur4 moveZ(-148, 0.1);
deur3 waittill("movedone");
deur3 moveY(78,0.5);
deur5 moveY(78,0.5);
deur6 moveY(-85,0.5);
deur4 moveY(-85,0.5);
deur5 waittill("movedone");
level.liftstand = false;
level.sex = false;
level.roep2 = false;
level.floor = 2;
}
level.busy = false;
} else { 
//AUTO //iPrintLnBold("The elevator is already on floor 2");
}
wait(0.01);
}
}

}
roep3(){
lifta = getEnt("liftactivator", "targetname");
deur1 = getEnt("liftdeur1", "targetname");
deur2 = getEnt("liftdeur2", "targetname");
deur3 = getEnt("liftdeur3", "targetname");
deur4 = getEnt("liftdeur4", "targetname");
deur5 = getEnt("liftdeur5", "targetname");
deur6 = getEnt("liftdeur6", "targetname");
deur7 = getEnt("liftdeur7", "targetname");
deur8 = getEnt("liftdeur8", "targetname");
roep2 = getEnt("roep2", "targetname");
roep3 = getEnt("roep3", "targetname");
roep3 setHintString("Press [Use] to call the elevator");
roep1 = getEnt("roep1", "targetname");
sex1 = getEnt("sex1", "targetname");
sex2 = getEnt("sex2", "targetname");
knop = getEnt("liftknop", "targetname");
knoptrigger = getEnt("liftknoptrigger", "targetname");
knoptrigger linkTo(knop);
while(1){
roep3 waittill("trigger", player);
if(level.floor != 3){
if(level.busy){
//AUTO //iPrintLnBold("Lift is busy");
wait 0.1;
continue;
}
level.busy = true;
level.roep3 = true;
if(level.floor == 1){
level.liftwait = true;
level.liftstand = false;
level.sex = true;
deur1 moveY(-78,0.5);
deur3 moveY(-78,0.5);
deur2 moveY(85,0.5);
deur4 moveY(85,0.5);
deur1 waittill("movedone");
lifta moveZ(272+148, 0.1);
knop moveZ(272+148, 0.1);
deur3 moveZ(272+148, 0.1);
deur4 moveZ(272+148, 0.1);
deur3 waittill("movedone");
deur7 moveY(78,0.5);
deur3 moveY(78,0.5);
deur8 moveY(-85,0.5);
deur4 moveY(-85,0.5);
deur7 waittill("movedone");
level.roep3 = false;
level.floor = 3;
} else if(level.floor == 2){
level.liftwait = true;
level.liftstand = false;
level.sex = true;
deur5 moveY(-78,0.5);
deur3 moveY(-78,0.5);
deur6 moveY(85,0.5);
deur4 moveY(85,0.5);
wait(1);
lifta moveZ(148, 0.5);
knop moveZ(148, 0.5);
deur3 moveZ(148, 0.5);
deur4 moveZ(148, 0.5);
deur3 waittill("movedone");
wait(0.5);
deur7 moveY(78,0.5);
deur3 moveY(78,0.5);
deur8 moveY(-85,0.5);
deur4 moveY(-85,0.5);
level.roep3 = false;
level.floor = 3;
}
level.busy = false;
} else { 
//AUTO //iPrintLnBold("The elevator is already on floor 3");
}
wait(0.01);
}
}

}
secret(){
sex1 = getEnt("sex1", "targetname");
sex2 = getEnt("sex2", "targetname");
sex3 = getEnt("sex3", "targetname");
sex4 = getEnt("sex4", "targetname");
lifta = getEnt("liftactivator", "targetname");
deur1 = getEnt("liftdeur1", "targetname");
deur2 = getEnt("liftdeur2", "targetname");
deur3 = getEnt("liftdeur3", "targetname");
deur4 = getEnt("liftdeur4", "targetname");
deur5 = getEnt("liftdeur5", "targetname");
deur6 = getEnt("liftdeur6", "targetname");
deur7 = getEnt("liftdeur7", "targetname");
deur8 = getEnt("liftdeur8", "targetname");
knop = getEnt("liftknop", "targetname");
roep1 = getEnt("roep1", "targetname");
roep2 = getEnt("roep2", "targetname");
roep3 = getEnt("roep3", "targetname");
knoptrigger = getEnt("liftknoptrigger", "targetname");
knoptrigger linkTo(knop);
while(1){
if(level.floor != 3){
sex1 waittill("trigger", player);
sex2 waittill("trigger", player);
if(level.busy){
//AUTO //iPrintLnBold("Lift is busy");
return;
}
level.busy = true;
//AUTO iPrintLnBold("^1"+player.name+" ^3entered the magical ^1banana ^3room");
level.secret = true;
if(level.floor == 1){
deur1 moveY(-78,0.5);
deur3 moveY(-78,0.5);
deur2 moveY(85,0.5);
deur4 moveY(85,0.5);
level.sex = true;
deur3 waittill("movedone");
lifta moveZ((272+148), 0.1);
knop moveZ((272+148), 0.1);
deur3 moveZ((272+148), 0.1);
deur4 moveZ((272+148), 0.1);
deur3 waittill("movedone");
deur7 moveY(78,0.5);
deur3 moveY(78,0.5);
deur8 moveY(-85,0.5);
deur4 moveY(-85,0.5);
deur3 waittill("movedone");
level.secret = false;
level.floor = 3;
} else if(level.floor == 2){
deur5 moveY(-78,0.5);
deur3 moveY(-78,0.5);
deur6 moveY(85,0.5);
deur4 moveY(85,0.5);
deur3 waittill("movedone");
lifta moveZ(148, 0.1);
knop moveZ(148, 0.1);
deur3 moveZ(148, 0.1);
deur4 moveZ(148, 0.1);
deur3 waittill("movedone");
deur7 moveY(78,0.5);
deur3 moveY(78,0.5);
deur8 moveY(-85,0.5);
deur4 moveY(-85,0.5);
deur3 waittill("movedone");
level.sex = true;
level.secret = false;
level.floor = 3;
}
level.busy = false;
}
wait(0.05);
} 
}

}
trap5(){
use5 = getent ("use5", "targetname");
trap51 = getent ("trap51", "targetname");
trap52 = getent ("trap52", "targetname");
trap53 = getent ("trap53", "targetname");
trap54 = getent ("trap54", "targetname");
trap55 = getent ("trap55", "targetname");
trap56 = getent ("trap56", "targetname");
trap57 = getent ("trap57", "targetname");
trap58 = getent ("trap58", "targetname");
trap59 = getent ("trap59", "targetname");
trap60 = getent ("trap60", "targetname");
use5 setHintString("Press [Use] to activate the trap");
use5 waittill("trigger", player);
use5 setHintString("");
trap51 hide();
trap51 notSolid();
getal1 = randomIntRange(0,2);
getal2 = randomIntRange(0,2);
getal3 = randomIntRange(0,2);
if(getal1 == 0){
trap53 hide();
trap53 notSolid();
}
if(getal1 == 1){
trap52 hide();
trap52 notSolid();
trap54 hide();
trap54 notSolid();
}
if(getal2 == 0){
trap56 hide();
trap56 notSolid();
}
if(getal2 == 1){
trap55 hide();
trap55 notSolid();
trap57 hide();
trap57 notSolid();
}
if(getal3 == 0){
trap59 hide();
trap59 notSolid();
}
if(getal3 == 1){
trap58 hide();
trap58 notSolid();
trap60 hide();
trap60 notSolid();
}
}

}
zwaai1(){
zwaai1 = getent ("zwaai1", "targetname");
zwaai1 rotateRoll(90, 0.5);
zwaai1 waittill("rotatedone");
while(1){
zwaai1 rotateRoll(-180, 1);
zwaai1 waittill("rotatedone");
zwaai1 rotateRoll(180, 1);
zwaai1 waittill("rotatedone");
}
}

}
zwaai2(){
zwaai2 = getent ("zwaai2", "targetname");
zwaai2 rotateRoll(-90, 0.5);
zwaai2 waittill("rotatedone");
while(1){
zwaai2 rotateRoll(180, 1);
zwaai2 waittill("rotatedone");
zwaai2 rotateRoll(-180, 1);
zwaai2 waittill("rotatedone");
}
}

}
zwaai3(){
zwaai3 = getent ("zwaai3", "targetname");
zwaai3 rotateRoll(90, 0.5);
zwaai3 waittill("rotatedone");
while(1){
zwaai3 rotateRoll(-180, 1);
zwaai3 waittill("rotatedone");
zwaai3 rotateRoll(180, 1);
zwaai3 waittill("rotatedone");
}
}

}
begin1(){
begin1 = getent ("begin1", "targetname");
while(1){
begin1 moveY(-144,1);
begin1 waittill("movedone");
begin1 moveY(144,1);
begin1 waittill("movedone");
}
}


begin2(){
begin2 = getent ("begin2", "targetname");
while(1){
begin2 moveY(144,1);
begin2 waittill("movedone");
begin2 moveY(-144,1);
begin2 waittill("movedone");
}
}


trap4(){
trap4 = getEnt("trap4", "targetname");
trap4d = getEnt("trap4_trigger", "targetname");
use4 = getEnt("use4", "targetname");
use4 setHintString("Press [Use] to activate the trap");
use4 waittill ("trigger", player);
use4 setHintString("");
trap4d enableLinkTo();
trap4d linkTo(trap4);
trap4 moveZ(-432,2);
trap4 waittill("movedone");
wait(2);
trap4 moveZ(432,2);
}

}
trap3(){
use3 = getEnt("use3", "targetname");
trap3 = getEnt("trap3", "targetname");
use3 setHintString("Press [Use] to activate the trap");
use3 waittill("trigger", player);
use3 setHintString("");
trap3 rotateRoll(1080, 6);
}

}
lift(){
lift = getEnt ("lift", "targetname");
anti = getEnt("anti1", "targetname");
anti enableLinkTo();
anti linkTo(lift);
while(1){
lift moveZ(174, 1);
lift waittill ("movedone");
wait(2);
lift moveZ(-174, 1);
lift waittill ("movedone");
wait(2);
}
}

}
trap2(){
draai = getent ("draaitrap", "targetname");
use2 = getEnt("use2", "targetname");
use2 setHintString("Press [Use] to activate the trap");
use2 waittill ("trigger", player);
use2 setHintString("");
while(1){
draai rotateRoll(-800,8);
draai waittill("rotatedone");
}
}

}
liftactivator(){
knop = getEnt("liftknop", "targetname");
knoptrigger = getEnt("liftknoptrigger", "targetname");
lifta = getEnt("liftactivator", "targetname");
deur1 = getEnt("liftdeur1", "targetname");
deur2 = getEnt("liftdeur2", "targetname");
deur3 = getEnt("liftdeur3", "targetname");
deur4 = getEnt("liftdeur4", "targetname");
deur5 = getEnt("liftdeur5", "targetname");
deur6 = getEnt("liftdeur6", "targetname");
deur7 = getEnt("liftdeur7", "targetname");
deur8 = getEnt("liftdeur8", "targetname");
roep1 = getEnt("roep1", "targetname");
roep2 = getEnt("roep2", "targetname");
roep3 = getEnt("roep3", "targetname");
sex1 = getEnt("sex1", "targetname");
sex2 = getEnt("sex2", "targetname");
knoptrigger enableLinkTo();
knoptrigger linkTo(knop);
if(level.floor == 1){
deur1 moveY(78,0.5);
deur3 moveY(78,0.5);
deur2 moveY(-85,0.5);
deur4 moveY(-85,0.5);
}
while(1){
knoptrigger waittill("trigger", player);
if(level.busy){
//AUTO //iPrintLnBold("Lift is busy");
wait 0.1;
continue;
}
level.busy = true;
level.lift = true;
level.liftwait = true;
if(level.floor == 1){
deur1 moveY(-78,0.5);
deur3 moveY(-78,0.5);
deur2 moveY(85,0.5);
deur4 moveY(85,0.5);
deur3 waittill("movedone");

lifta moveZ(272, 0.1);
knop moveZ(272, 0.1);
deur3 moveZ(272, 0.1);
deur4 moveZ(272, 0.1);
deur3 waittill("movedone");

deur3 moveY(78,0.5);
deur5 moveY(78,0.5);
deur4 moveY(-85,0.5);
deur6 moveY(-85,0.5);
deur3 waittill("movedone");
level.liftstand = false;
level.sex = false;
level.lift = false;
level.floor = 2;
} else if(level.floor == 2){
deur3 moveY(-78,0.5);
deur5 moveY(-78,0.5);
deur4 moveY(85,0.5);
deur6 moveY(85,0.5);
deur3 waittill("movedone");

lifta moveZ(-272, 0.1);
knop moveZ(-272, 0.1);
deur3 moveZ(-272, 0.1);
deur4 moveZ(-272, 0.1);
deur3 waittill("movedone");

deur1 moveY(78,0.5);
deur3 moveY(78,0.5);
deur2 moveY(-85,0.5);
deur4 moveY(-85,0.5);
deur3 waittill("movedone");
level.liftstand = true;
level.lift = false;
level.floor = 1;
} else if(level.floor == 3){
deur3 moveY(-78,0.5);
deur7 moveY(-78,0.5);
deur4 moveY(85,0.5);
deur8 moveY(85,0.5);
deur3 waittill("movedone");

lifta moveZ(-148, 0.1);
knop moveZ(-148, 0.1);
deur3 moveZ(-148, 0.1);
deur4 moveZ(-148, 0.1);
deur3 waittill("movedone");

deur5 moveY(78,0.5);
deur3 moveY(78,0.5);
deur6 moveY(-85,0.5);
deur4 moveY(-85,0.5);
deur3 waittill("movedone");
level.liftstand = false;
level.sex = false;
level.lift = false;
level.floor = 2;
}
level.busy = false;
wait(0.01);
}
}

}
trap1aan(){
use1 = getEnt("use1", "targetname");
use1 setHintString("Press [Use] to activate the trap");
use1 waittill("trigger", player);
use1 setHintString("");
thread trap1();
}

}
trap1(){
blok1 = getent ("blok1", "targetname");
blok2 = getent ("blok2", "targetname");
blok3 = getent ("blok3", "targetname");
blok4 = getent ("blok4", "targetname");	
blokken = randomIntRange(0, 4);
if(blokken == 0){
	blok1 hide();
	blok3 hide();
blokken2 = randomIntRange(0, 2);
if(blokken2 == 0){
	blok1 notSolid();
	blok4 notSolid();
}
if(blokken2 == 1){
	blok3 notSolid();
	blok2 notSolid();
}
}
if(blokken == 1){
	blok1 hide();
	blok4 hide();
blokken2 = randomIntRange(0, 2);
if(blokken2 == 0){
	blok1 notSolid();
	blok3 notSolid();
}
if(blokken2 == 1){
	blok4 notSolid();
	blok2 notSolid();
}
}
if(blokken == 2){
	blok2 hide();
	blok3 hide();
blokken2 = randomIntRange(0, 2);
if(blokken2 == 0){
	blok2 notSolid();
	blok4 notSolid();
}
if(blokken2 == 1){
	blok3 notSolid();
	blok1 notSolid();
}
}
if(blokken == 3){
	blok2 hide();
	blok4 hide();
blokken2 = randomIntRange(0, 2);
if(blokken2 == 0){
	blok2 notSolid();
	blok3 notSolid();
}
if(blokken2 == 1){
	blok4 notSolid();
	blok1 notSolid();
}
}
}

}
begindoor() {
doortrigger = getEnt ("begindoor_trigger","targetname");
doortrigger setHintString("Press [Use] to open the door");
doortrigger waittill("trigger", player);
doortrigger setHintString("");
thread door_move();
}


door_move() {
if(level.begindoor){
door = getent ("begindoor", "targetname");
if (!level.elevatorDown) {
//AUTO ambientPlay("testliedje");
//AUTO iPrintLnBold("^3The ^1bananaphone ^3is ^1ringing! ^3Pickup the ^1phone!");
door moveZ (192, 4);
door waittill ("movedone");
level.begindoor = false;

}
}
}

