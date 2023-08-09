/// @description DRAW BLACK BARS

if(mode!=TRANS_MODE.OFF)
{
	if(mode==TRANS_MODE.MOVIE)
	{
		draw_set_color(c_black);
		draw_rectangle(0,0,w,percent*h_quarter,false);
		draw_rectangle(0,h,w,h-(percent*h_quarter),false);
	}
	else
	{
		draw_set_color(c_black);
		draw_rectangle(0,0,w,percent*h_half,false);
		draw_rectangle(0,h,w,h-(percent*h_half),false);
	}

}
draw_set_alpha(c_white);
draw_text_color(50,50,string(percent), c_lime, c_lime, c_green, c_green, 1);




