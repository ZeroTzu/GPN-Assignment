/// @description Insert description here
// You can write your code in this editor






if(mode!=TRANS_MODE.OFF)
{
	if(mode==TRANS_MODE.INTRO || mode==TRANS_MODE.MOVIE_OFF)
	{
		percent = max(0,percent-max(percent/10,0.005))
	}
		
	else if(mode!=TRANS_MODE.MOVIE_PROGRESS)
	{
		percent=min(1,percent+max(((1-percent)/10),0.05));
	}else if (mode==TRANS_MODE.MOVIE_PROGRESS)
	{
		percent=1;	
		
	}
	if(percent==1)||(percent==0)
	{
		//if the transition ends
		switch(mode)
		{
			case TRANS_MODE.INTRO:
			{
				mode=TRANS_MODE.OFF
				break;
			}
			case TRANS_MODE.NEXT:
			{
				mode=TRANS_MODE.INTRO;
				room_goto_next();
				break;
			}
			case TRANS_MODE.GOTO:
			{
				mode=TRANS_MODE.INTRO
				room_goto(target);
				break;
			}
			case TRANS_MODE.RESTART:
			{
				room_restart();
				break;
			}
			case TRANS_MODE.MOVIE:
			{
				show_debug_message("changing to MOVIE PROGRESS")
				mode=TRANS_MODE.MOVIE_PROGRESS;
				break;
			}
			case TRANS_MODE.MOVIE_PROGRESS:
			{
				break;
			}
			case TRANS_MODE.MOVIE_OFF:
			{
				mode=TRANS_MODE.OFF
				break;
				
			}

		}
	}
	
}




























