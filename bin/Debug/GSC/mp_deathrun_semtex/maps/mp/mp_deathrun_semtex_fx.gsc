#include maps\mp\_utility;
main()
{
	precacheFX();
	spawnFX();
}
precacheFX()
{
	level._effect["c4"] = loadfx("explosions/grenadeexp_default");
	level._effect["barrel"] = loadfx("fire/firelp_barrel_pm");
}
spawnFX()
{
	playLoopedFx(level._effect["barrel"], 4, (2944,112,60), 0, anglestoforward ((0,0,0)), anglestoup((0,0,0)));
	playLoopedFx(level._effect["barrel"], 4, (2944,-560,60), 0, anglestoforward ((0,0,0)), anglestoup((0,0,0)));
	playLoopedFx(level._effect["barrel"], 4, (-2176,5824,216), 0, anglestoforward ((0,0,0)), anglestoup((0,0,0)));
	playLoopedFx(level._effect["barrel"], 4, (-1920,5504,216), 0, anglestoforward ((0,0,0)), anglestoup((0,0,0)));
}
