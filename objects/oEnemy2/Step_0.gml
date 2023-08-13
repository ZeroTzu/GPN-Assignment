
//calculate when to look left/right, on idle
if (actioncdCurrent!=0 && hspCurrent==0)
{
	actioncdCurrent--;
}
else if (actioncdCurrent==0 && hspCurrent==0)
{
	show_debug_message("changed direction");
	currentDirection=-currentDirection
	actioncdCurrent=actioncd
}

if( isAggroing==false)
{
	hspCurrent=0;
}

vspCurrent=vsp




#region Line of sight and targeting
//line of sight code
inSight=ds_list_create();

var __num=0;
if(currentDirection>0)
{
	__num=collision_line_list(x,y-40,x+sightRange_x,y-40,bActor,false,true,inSight,true);
	if (__num>0){

		point_x=(ds_list_find_value(inSight,0).x-x)<sightRange_x?(ds_list_find_value(inSight,0).x-x):sightRange_x;
	}
}
else
{
	__num=collision_line_list(x,y-40,x-sightRange_x,y-40,bActor,false,true,inSight,true);
	if (__num>0){
		point_x=(ds_list_find_value(inSight,0).x-x)<sightRange_x?(ds_list_find_value(inSight,0).x-x):sightRange_x;
	}
}

if(__num>0)
{
	if(ds_list_find_value(inSight, 0).object_index == oPlayer)
	{
		currentState="running";
		hspCurrent=currentDirection*runsp;
	}
	else if(currentState=="running"){
		aggroDura=max(0,aggroDura-1);
		if(aggroDura==0)
		{
			currentState="walking";
			aggroDura=60;
		}
	}
	else
	{
		hspCurrent=0
	}
}
else{
	
}

ds_list_destroy(inSight)

#endregion








#region horizontal and vertical collision and movement
//Horizontal collision
if(place_meeting(x+hspCurrent,y,oWall))
{
	//if this enemy is moving horizontally, and is about to hit a wall,
	while(!place_meeting(x+sign(hspCurrent),y,oWall))
	{
	//while it does not hit the wall change its hsp until it does
		x=x+sign(hspCurrent)
	}

	hspCurrent=-hspCurrent;
	currentDirection=sign(hspCurrent)
}
x=x+hspCurrent;	

//Vertical collision
if(place_meeting(x,y+vspCurrent,oWall))
{
	//if this enemy is moving vertically, and is about to hit a wall,
	while(!place_meeting(x,y+sign(vspCurrent),oWall))
	{
		//while it does not hit the wall change its vsp until it does
		y=y+sign(vspCurrent)
	}
	
	vspCurrent=0;
}
y=y+vspCurrent
#endregion





#region animation for mid air/ on the ground, left right movement
//Animation
if(!place_meeting(x,y+1,oWall))
{// if this enemy is not on the ground,
	sprite_index=sZombie2;
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
	if(hspCurrent==0)
	{
		sprite_index=sZombie2;
	}
	else
	{
		image_speed=1;
		sprite_index=sZombie2R;
	}
}
if (hsp!=0) image_xscale=currentDirection;

#endregion



//cool down attack
if(attackcdCurrent!=0)
{
	attackcdCurrent--;	
}