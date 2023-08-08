key_left=keyboard_check(ord("A")) || keyboard_check(vk_left);
key_right=keyboard_check(ord("D"))|| keyboard_check(vk_right);
key_jump=keyboard_check_pressed(vk_space);
key_jump_held=keyboard_check(vk_space);
//Calculate movement
var move =key_right-key_left;
hsp=move*wsp;


//Gravity
vsp=vsp+grv;

//Jump
if(place_meeting(x,y+1,oWall)) && (key_jump)
{
	vsp=-10;
}

if(vsp<0)&&(!key_jump_held) vsp=max(vsp,0);

//Horizontal collision
if(place_meeting(x+hsp,y,oWall))
{
	while(!place_meeting(x+sign(hsp),y,oWall))
	{
		
		x=x+sign(hsp)
	}

	hsp=0;
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
y=y+vsp




//Animation
if(!place_meeting(x,y+1,oWall))
{
	sprite_index=sPlayerJ;
	image_speed=0;
	if(sign(vsp)>0){
		image_index=1
	}else{
		image_index=7
	}
	
}
else
{
	image_speed=1;
	if(hsp==0){
	sprite_index=sPlayer;
	
	}
	else{
		image_speed=2;
		sprite_index=sPlayerR;
	}
	
}
if (hsp!=0) image_xscale=sign(hsp);



