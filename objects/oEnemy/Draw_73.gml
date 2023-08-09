/// @description Insert description here
// You can write your code in this editor

//if (sign(hsp)<0)
//{
//	draw_line_color(x+sightRange_x,y,x,y,c_teal,c_teal )
//}
//else
//{
//	draw_line_color(x,y,x-sightRange_x,y,c_teal,c_teal )
//}


if(sign(hsp)>0){
	
	draw_line_color(x,y-40,x+sightRange_x,y-40,c_teal,c_black)
}
else
{
	draw_line_color(x-sightRange_x,y-40,x,y-40,c_teal,c_teal)
}





draw_rectangle_color(x+point_x-2,y-2,x+point_x+2,y+2,c_red,c_red,c_red,c_red,false)

