/// @description Insert description here
// You can write your code in this editor



show_debug_message("running game end form oPersistentManager")
if(file_exists("checkpoint.ini"))
{
	show_debug_message("file exists in game end event deleting...")
	file_delete("checkpoint.ini");
}





