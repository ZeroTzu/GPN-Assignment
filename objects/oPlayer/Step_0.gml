key_left=keyboard_check(ord("A")) || keyboard_check(vk_left);
key_right=keyboard_check(ord("D"))|| keyboard_check(vk_right);
key_jump=keyboard_check_pressed(vk_space);
key_jump_held=keyboard_check(vk_space);
key_fallThrough_held=keyboard_check(ord("C"));
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






////Animation
//if(!place_meeting(x,y+1,oWall))
//{
//	sprite_index=sPlayerJ;
//	image_speed=0;
//	if(sign(vsp)>0){
//		image_index=1
//	}else{
//		image_index=7
//	}	

	
//}
//else
//{

//	if(hcollision_obj.canFall==true||vcollision_obj==true){
			
//		sprite_index=sPlayerJ;
//		image_speed=0;
//		if(sign(vsp)>0){
//			image_index=1
//		}else{
//			image_index=7
//		}	
			
//	}else
	

//		//if on ground
//		image_speed=1;
//		if(hsp==0){
//			//not moving
//			sprite_index=sPlayer;
	
//		}
//		else{
//			//is moving
//			image_speed=2;
//			sprite_index=sPlayerR;
//		}
	
//}



//ANimation
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



