/// @description Insert description here
// You can write your code in this editor




if(currentDirection>0){
	
	draw_line_color(x,y-40,x+sightRange_x,y-40,c_teal,c_black)
}
else
{
	draw_line_color(x-sightRange_x,y-40,x,y-40,c_teal,c_teal)
}





draw_rectangle_color(x+point_x-2,y-2,x+point_x+2,y+2,c_red,c_red,c_red,c_red,false)
