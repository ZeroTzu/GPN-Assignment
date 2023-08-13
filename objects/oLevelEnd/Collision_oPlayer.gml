/// @description Move to next room


with(oPlayer)
{
	x=other.xPos;
	y=other.yPos;
	
	if(hascontrol)
	{
		hascontrol=false;
		SlideTransition(TRANS_MODE.GOTO,other.target);
		hascontrol=true;
	}
}

