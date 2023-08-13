key_left=keyboard_check(ord("A")) || keyboard_check(vk_left);
key_right=keyboard_check(ord("D"))|| keyboard_check(vk_right);
key_jump=keyboard_check_pressed(vk_space);
key_jump_held=keyboard_check(vk_space);
key_fallThrough_held=keyboard_check(ord("C"));
key_pick=keyboard_check_pressed(ord("E"));
key_drop=keyboard_check_pressed(ord("F"));
key_climb_up=keyboard_check(ord("W"));
key_climb_down=keyboard_check(ord("S"));
key_enter=keyboard_check_pressed(vk_enter)


if (key_enter)
{
	show_debug_message( "hp: "+string(hp)+"isdead: "+string(isdead)+ "holding: "+string(holding))
}
//Calculate movement
var move =key_right-key_left;
hsp=move*wsp;


//Gravity
vspCurrent=vspCurrent+grv;


if (ishit==true)
{
	direction=hitfromdirection;
	hsp=lengthdir_x(10,direction);
	vspCurrent=lengthdir_x(10,direction);
	ishit=false;
}











if(hascontrol)
{
	//Jump
	if(place_meeting(x,y+1,oWall)) && (key_jump)
	{
		vspCurrent=-15;
	}

	if(vspCurrent<0)&&(!key_jump_held) vspCurrent=max(vspCurrent,0);


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
	
	if(key_climb_up||key_climb_down)&&(place_meeting(x,y+1,oLadder))
	{
		var netymovement=0;
		if(key_climb_up){
			show_debug_message("should climb up")
			netymovement=netymovement-9
		}
		if(key_climb_down)
		{
			show_debug_message("should climb down")
			netymovement=netymovement+9
		}
		vspCurrent=netymovement
		show_debug_message("vsp after climb/down "+string(vspCurrent))
	}
	
	
	
}
else{
}

// Vertical collision
var vcollision_obj = instance_place(x, y + vspCurrent, oWall);
if (vcollision_obj != noone)
{
    while (!place_meeting(x, y + sign(vspCurrent), oWall))
    {
		
        y = y + sign(vspCurrent);
    }

  
    if (vcollision_obj.canFall==false)
    {	
		 vspCurrent=0;
    }
}
y = y + vspCurrent;


//Pick up/drop weapons
if(key_pick)
{
	var pickupList=ds_list_create();
	var pickupCount=collision_circle_list(x,y,pickupRadius,bItem,false,true,pickupList,true)
	show_debug_message("Count is "+string(pickupCount))
	if (pickupCount>0)
	{
		
		if(object_get_parent( pickupList[|0].object_index) == bWeapon)
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
					show_debug_message("picked up weapon: "+string(pickupList[|0]))
					break;

				}
			}
		}
		
		 else if( pickupList[|0].object_index==oKey || pickupList[|0].object_index==oMeds )
		{
			for( var index=0;index<array_length(inventory);index++)
			{
				if(inventory[index]==-1)
				{
					show_debug_message(pickupList[|0].keyfor);
					inventory[index]=pickupList[|0].keyfor;
					show_debug_message("picked up item: "+string(pickupList[|0].keyfor))
					instance_destroy(pickupList[|0])
					break;
				}
				
			}
		}
		else if(pickupList[|0].object_index==oAmmo)
		{
			holding.ammo+=3;
			instance_destroy(pickupList[|0])
		}
		
	
	
	ds_list_destroy(pickupList)
	}
	else {
			show_debug_message("pickup count is 0");		
	}
	
}





//Animation
if(hascontrol)
	{
	if(!place_meeting(x,y+1,oWall))
	{
		//if in air 
		sprite_index=sPlayerJ;
		image_speed=0;
		if(sign(vspCurrent)>0){
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
}