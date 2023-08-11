key_left=keyboard_check(ord("A")) || keyboard_check(vk_left);
key_right=keyboard_check(ord("D"))|| keyboard_check(vk_right);
key_jump=keyboard_check_pressed(vk_space);
key_jump_held=keyboard_check(vk_space);
key_fallThrough_held=keyboard_check(ord("C"));
key_pickdrop=keyboard_check_pressed(ord("E"));

if (keyboard_check_pressed(vk_enter)) { show_debug_message(instance_count); }
//Calculate movement
var move =key_right-key_left;
hsp=move*wsp;


//Gravity
vsp=vsp+grv;



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
	key_right=0;
	key_left=0;
	keyjump=0;
	
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
if(key_pickup)
{
	var pickupList=ds_list_create();
	var pickupCount=collision_circle_list(x,y,pickupRadius,oItem,false,true,pickupList,true)
	
	if (pickupCount>0)
	{
		if(holding==noone)
		{
			holding = pickupList[| 0];
			holding.isBeingCarried=true;
			
		}
		
	}
	
	
	ds_list_destroy(pickupList)
	
	
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



