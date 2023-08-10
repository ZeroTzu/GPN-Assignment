/// @description Progress the transition

if(mode!=TRANS_MODE.OFF)
{
	if(mode==TRANS_MODE.INTRO || mode==TRANS_MODE.MOVIE_OFF)
	{
		percent = max(0,percent-max(percent/10,0.005))
	}
	else if(mode==TRANS_MODE.MOVIE){
		percent=min(0.5,percent+max(((1-percent)/10),0.05));
	}
	else 
	{
		percent=min(1,percent+max(((1-percent)/10),0.05));

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
				game_restart();
				break;
			}
			case TRANS_MODE.MOVIE:
			{
				mode=TRANS_MODE.MOVIE_PROGRESS;
				break;
			}
			case TRANS_MODE.MOVIE_PROGRESS:
			{
				break;
			}

		}
	}
	
}






