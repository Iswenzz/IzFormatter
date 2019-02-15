/*
//    +========================================================================+
//    I                    ___  _____  _____                                   I
//    I                   /   !!  __ \!  ___!                                  I
//    I                  / /! !! !  \/! !_          ___  ____                  I
//    I                 / /_! !! ! __ !  _!        / __!!_  /                  I
//    I                 \___  !! !_\ \! !      _  ! (__  / /                   I
//    I                     !_/ \____/\_!     (_)  \___!/___!                  I
//    I========================================================================I
//    I                              billboard                                 I
//    I========================================================================I
//    I                       scripted:  mnaauuu@4gf.cz                        I
//    I                         website: www.4GF.cz                            I
//    +========================================================================+
*/

init() {
	thread bboards("billboard", 4, "tag_screen_", 5, "billboard_5_1"); // (targetname, rotate_time_per_screen, screen_preffix, number_of_screens, model)
}


bboards(name, time, prefix, count, model) {
	bb = getEntArray(name, "targetname");
	
	if (!isDefined(bb) || bb.size == 0) {
		thread notFoundBB(name);
		return;
	}
	
	for(i=0;i<bb.size;i++) {
		if ( bb[i].model == model )
			bb[i] thread rotateAdvs(time, prefix, count, model);
	}
}

notFoundBB(name) {
	while(true) {
		wait 3;
		iprintln("FATAL: unable to find billboard: " + name);
	}
}


rotateAdvs(time, prefix, count, model) {
	
	for(i=0;i<count;i++) {
		self hidePart(prefix + i, model);
	}
	
	current = randomInt(count);
	while(true) {
		self showPart(prefix + current, model);
		wait time + randomFloat(1);
		self hidePart(prefix + current, model);
		current = randomInt(count);
	}
}