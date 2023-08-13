/// @description Insert description here
// You can write your code in this editor

if(image_speed==1)
{
	exit;
}
image_speed=1;

ini_open("checkpoint.ini")

ini_write_real("player","x",other.x)
ini_write_real("player","y",other.y)
ini_write_real("player","hp",other.hp)

ini_close();

show_debug_message("checkpoint should be created")