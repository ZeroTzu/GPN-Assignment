key_left=keyboard_check(ord("A"));
key_right=keyboard_check(ord("D"));
key_jump=keyboard_check(vk_space);

//Calculate movement
var move =key_right-key_left;
hsp=move*wsp;


//Gravity
vsp=vsp+grv;

//Jump
if(place_meeting(x,y+1,oWall)) && (key_jump)
{
	vsp=-10
}


//Horizontal movement
if(place_meeting(x+hsp,y,oWall))
{
	while(!place_meeting(x+sign(hsp),y,oWall))
	{
		
		x=x+sign(hsp)
	}

	hsp=0;
}
x=x+hsp;

//Vertical movement
if(place_meeting(x,y+vsp,oWall))
{
	while(!place_meeting(x,y+sign(vsp),oWall))
	{
		
		y=y+sign(vsp)
	}

	vsp=0;
}
y=y+vsp
