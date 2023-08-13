/// @description DRAW BLACK BARS

if(mode!=TRANS_MODE.OFF)
{
	if(mode==TRANS_MODE.MOVIE ||mode==TRANS_MODE.MOVIE_PROGRESS)
	{
		draw_set_color(c_black);
		draw_rectangle(0,0,w,percent*h_fifth,false);
		draw_rectangle(0,h,w,h-(percent*h_fifth),false);
	}
	
	else 
	{
		draw_set_color(c_black);
		draw_rectangle(0,0,w,percent*h_half,false);
		draw_rectangle(0,h,w,h-(percent*h_half),false);
	}

}





