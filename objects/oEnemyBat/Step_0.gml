
	

//Gravity


if(canMove==false)
{
	hsp=0;
}



//Horizontal collision
if(place_meeting(x+hsp,y,oWall))
{
	while(!place_meeting(x+sign(hsp),y,oWall))
	{
		
		x=x+sign(hsp)
	}

	hsp=-hsp;
}
x=x+hsp;

//Vertical collision
if(place_meeting(x,y+vsp,oWall))
{
	while(!place_meeting(x,y+sign(vsp),oWall))
	{
		
		y=y+sign(vsp)
	}

	vsp=0;
}




////Animation
//if(!place_meeting(x,y+1,oWall))
//{
//	sprite_index=sBatR;
//	image_speed=0;
//	if(sign(vsp)>0){
//		image_index=1
//	}else{
//		image_index=7
//	}
	
//}
//else
//{
	image_speed=1;
	if(hsp==0)
	{
		sprite_index=sBat;
	}
	else
	{
		image_speed=1;
		sprite_index=sBatR;
	}
//}
if (hsp!=0) image_xscale=-sign(hsp);




if(attackcdCurrent!=0)
{
	attackcdCurrent--;	
}




