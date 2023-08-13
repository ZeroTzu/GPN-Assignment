/// @description Insert description here
// You can write your code in this editor





with (oDoor)
{
	var foundkey=false
	for (var i=0; 50;i++)
	{
		if(string(other.inventory[i])==string(keyneeded)) foundkey=true;
		break;
		
	}
	if (foundkey)
	{
		SlideTransition(TRANS_MODE.GOTO,target)
	}
}
