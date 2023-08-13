//Gravity
vsp=vsp+grv;



// Vertical collision
image_angle=0;
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

if (collision_circle(x, y, radius, oPlayer, false, true) && pressed == false) {
	popup_id.visible = true;
} else {
	popup_id.visible = false;
}


