x=oPlayer.x+10;
y=oPlayer.y;
image_angle=point_direction(x,y,mouse_x,mouse_y);
firingdelay=firingdelay-1;

recoil=max(0,recoil-1);
if(mouse_check_button(mb_left))&& (firingdelay<0)
{
	recoil=4;
	firingdelay=5;
	with(instance_create_layer(x,y,"Bullets",oBullet))
	{
		speed=25;
		direction=other.image_angle
		image_angle=direction;

	}
}
x=x-lengthdir_x(recoil,image_speed);
y=y-lengthdir_x(recoil,image_speed);

if(image_angle>90)&&(image_angle<270)
{
	image_yscale=-1;
}
else{
	image_yscale=1;
}

	

