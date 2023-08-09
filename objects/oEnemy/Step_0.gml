
	

//Gravit
vsp=vsp+grv;

//Jump

if(canMove==false)
{
	hsp=0;
}



//Line of sight code
ds_list_clear(inSight)
currentDirection=sign(hsp);
var __num=0;
if(currentDirection>0)
{
	_num=collision_line_list(x,y,x+sightRange_x,y,bActor,false,true,inSight,true);
	if (_num>0){
		point_x=(ds_list_find_value(inSight,0).x-x)<sightRange_x?(ds_list_find_value(inSight,0).x-x):sightRange_x;
	}
}
else
{
	_num=collision_line_list(x,y,x-sightRange_x,y,bActor,false,true,inSight,true);
	if (_num>0){
		point_x=(ds_list_find_value(inSight,0).x-x)<sightRange_x?(ds_list_find_value(inSight,0).x-x):sightRange_x;
	}
}

if(_num==0){
	hsp=4
	
}
else if(ds_list_find_index(inSight,0)==oPlayer.id)
{
		hsp=9;
}


//if(ds_list_empty(inSight)==false)
//{
	
//	point_x=(ds_list_find_value(inSight,0).x-x)<sightRange_x?(_hit.x-x):sightRange_x;
//}
//var _realHit=collision_point(x+point_x,y,bActor,false,true);
//if(_realHit==oPlayer.id)
//{
//	hsp=8
//}





////if see player
//if (_hit)
//{
//	point_x=(_hit.x-x)<sightRange_x?(_hit.x-x):sightRange_x;
//}else{
//	hsp=0;
//}
//var _realHit=collision_point(x+point_x,y,bActor,false,true);

//if(_realHit==oPlayer.id)
//{
//	hsp=8;
//}






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
y=y+vsp



//Animation
if(!place_meeting(x,y+1,oWall))
{
	sprite_index=sZombie;
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






