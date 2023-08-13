/// @description Insert description here
// You can write your code in this editor





with (oDoor)
{
	var foundkey=false
	for (var i=0; i<array_length(other.inventory)-1;i++)
	{
		if(string(other.inventory[i])==string(keyneeded)) 
		{
			foundkey=true;
			break
		}
		
	}
	if (foundkey)
	{
		show_debug_message("found the key")
		SlideTransition(TRANS_MODE.GOTO,target)
	}
	else{
	}
}
