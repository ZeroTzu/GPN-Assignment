image_speed = 0.5;
event_inherited()

if(canMove==false)
{
	hsp=0;
}
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
		hsp=currentDirection*walksp
	}
}

ds_list_destroy(inSight)







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









