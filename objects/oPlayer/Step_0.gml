key_left=keyboard_check(ord("A")) || keyboard_check(vk_left);
key_right=keyboard_check(ord("D"))|| keyboard_check(vk_right);
key_jump=keyboard_check_pressed(vk_space);
key_jump_held=keyboard_check(vk_space);
key_fallThrough_held=keyboard_check(ord("C"));
key_pick=keyboard_check_pressed(ord("E"));
key_drop=keyboard_check_pressed(ord("F"));

if (keyboard_check_pressed(vk_enter)) { show_debug_message(instance_count); }
//Calculate movement
var move =key_right-key_left;
hsp=move*wsp;


//Gravity
vsp=vsp+grv;


if (ishit==true)
{
	direction=hitfromdirection;
	hsp=lengthdir_x(10,direction);
	vsp=lengthdir_x(10,direction);
	ishit=false;
}






if(hascontrol)
{
	//Jump
	if(place_meeting(x,y+1,oWall)) && (key_jump)
	{
		vsp=-15;
	}

	if(vsp<0)&&(!key_jump_held) vsp=max(vsp,0);

	// Horizontal collision
	var hcollision_obj = instance_place(x + hsp, y, oWall);
	if (hcollision_obj != noone)
	{
	    while (!place_meeting(x + sign(hsp), y, oWall))
	    {
	        x = x + sign(hsp);
	    }

    

	    if (hcollision_obj.canFall==false)
	    {
			hsp = 0;
	    }
	}
	x = x + hsp;
}
else{
}

// Vertical collision
var vcollision_obj = instance_place(x, y + vsp, oWall);
if (vcollision_obj != noone)
{
    while (!place_meeting(x, y + sign(vsp), oWall))
    {
        y = y + sign(vsp);
    }

   
    if (vcollision_obj.canFall==false)
    {
		vsp=0;
    }
}
y = y + vsp;


//Pick up/drop weapons
if(key_pick)
{
	var pickupList=ds_list_create();
	var pickupCount=collision_circle_list(x,y,pickupRadius,bItem,false,true,pickupList,true)
	
	if (pickupCount>0)
	{
		if(holding==noone)
		{
			holding = pickupList[| 0];
			holding.isBeingCarried=true;
			
		}
		else
		{
			show_debug_message("holding something");
			for (var index=0;index <pickupCount;index++)
			{
				holding.target=noone;
				holding.isBeingCarried=false;
				
				
				holding = pickupList[|index]
				holding.target=id;
				holding.isBeingCarried=true;
				break;

			}
			
		}
		
	} else {
			show_debug_message("pickup count is 0");		
	}
	
	
	ds_list_destroy(pickupList)
	
	
}



if(key_drop){
	if (holding!=noone)
	{
						holding.target=noone;
				holding.isBeingCarried=false;
	}
	
}

//Animation
if(!place_meeting(x,y+1,oWall))
{
	//if in air 
	sprite_index=sPlayerJ;
	image_speed=0;
	if(sign(vsp)>0){
		//moving up
		image_index=1
	}else{
		//moving down
		image_index=7
	}
	
}
else
{
	//if on ground
	image_speed=1;
	if(hsp==0){
		//not moving
		sprite_index=sPlayer;
	
	}
	else{
		//is moving
		image_speed=2;
		sprite_index=sPlayerR;
	}
	
}
if (hsp!=0) image_xscale=sign(hsp);



