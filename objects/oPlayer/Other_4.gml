/// @description Insert description here
// You can write your code in this editor

if(file_exists("checkpoint.ini"))
{
	ini_open("checkpoint.ini");
	x=ini_read_real("player","x",x);
	y=ini_read_real("player","y",y);
	hp=ini_read_real("player","hp",hp);
	holding.ammo=min(12,holding.ammo+6);
	isdead=false;
	ini_close()
}
else{
	x=oStartLocation.x;
	y=oStartLocation.y;
	hp=3;
	isdead=false;
	
	holding.ammo=min(12,holding.ammo+6);
}


