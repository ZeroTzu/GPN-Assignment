/// @description Insert description here
// You can write your code in this editor





//Horizontal collision
if(place_meeting(x+hsp,y,oWall))
{
	//if this enemy is moving horizontally, and is about to hit a wall,
	while(!place_meeting(x+sign(hsp),y,oWall))
	{
				//while it does not hit the wall change its hsp until it does
		x=x+sign(hsp)
	}

	hsp=-hsp;
}
x=x+hsp;

//Vertical collision
if(place_meeting(x,y+vsp,oWall))
{
	//if this enemy is moving vertically, and is about to hit a wall,
	while(!place_meeting(x,y+sign(vsp),oWall))
	{
		//while it does not hit the wall change its vsp until it does
		y=y+sign(vsp)
	}
	
	vsp=0;
}
y=y+vsp



//Animation
if(!place_meeting(x,y+1,oWall))
{// if this enemy is not on the ground,
	sprite_index=sZombie;
	image_speed=0;
	if(sign(vsp)>0){
		//if this enemy is moving upwards,
		image_index=1
	}else{
		//if this enemy is moving downwards
		image_index=7
	}
	
}
else
{
	image_speed=1;
	if(hsp==0)
	{
		sprite_index=sZombie;
	}
	else
	{
		image_speed=1;
		sprite_index=sZombieR;
	}
}
if (hsp!=0) image_xscale=sign(hsp);




if(attackcdCurrent!=0)
{
	attackcdCurrent--;	
}



// Inherit the parent event
event_inherited();

