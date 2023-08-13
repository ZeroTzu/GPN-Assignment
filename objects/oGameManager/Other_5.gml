/// @description Insert description here
// You can write your code in this editor


var playerIsDead=oPlayer.isdead;

if(!playerIsDead)
{
	show_debug_message("player is not dead, checking if checkpoint exists")
	if(file_exists("checkpoint.ini"))
	{
		show_debug_message("file is deleted from room end")
		file_delete("checkpoint.ini");	
		
	}
	
	
}
else 
{
		show_debug_message("player is dead???")
}



