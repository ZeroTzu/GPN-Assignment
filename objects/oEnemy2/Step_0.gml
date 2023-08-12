

inSight=ds_list_create();

currentDirection=sign(hsp);
var __num=0;
if(currentDirection>0)
{
	_num=collision_line_list(x,y-40,x+sightRange_x,y-40,bActor,false,true,inSight,true);
	if (_num>0){
		point_x=(ds_list_find_value(inSight,0).x-x)<sightRange_x?(ds_list_find_value(inSight,0).x-x):sightRange_x;
	}
}
else
{
	_num=collision_line_list(x,y-40,x-sightRange_x,y-40,bActor,false,true,inSight,true);
	if (_num>0){
		point_x=(ds_list_find_value(inSight,0).x-x)<sightRange_x?(ds_list_find_value(inSight,0).x-x):sightRange_x;
	}
}

if(_num<=0)
{
	hsp=4;
}
else
{
	//show_debug_message("more than 0"+string(_num));
	//show_debug_message(string(ds_list_find_value(inSight,0))+" is "+string(oPlayer.id))
	
	
	if(ds_list_find_value(inSight, 0) == oPlayer.id)
	{
		currentState="running"
		hsp=currentDirection*runsp;
	}
	else if(currentState=="running"){
		aggroDura=max(0,aggroDura-1)
		
		if(aggroDura==0)
		{
			currentState="walking"
			aggroDura=60;
		}
	}
	else
	{
		hsp=currentDirection*0
	}
}

ds_list_destroy(inSight)










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
	if(hsp==0)
	{
		sprite_index=sZombie2;
	}
	else
	{
		image_speed=1;
		sprite_index=sZombie2R;
	}
}
if (hsp!=0) image_xscale=sign(hsp);




if(attackcdCurrent!=0)
{
	attackcdCurrent--;	
}